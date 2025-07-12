using Dapper;
using SkillSwap.IDataAccessLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using SkillSwap.Global;
using SkillSwap.Models;

namespace SkillSwap.DataAccessLayer
{
    public class SkillSwapDAL : ISkillSwapDAL
    {
        #region SkillSwap
        public List<GetUserDetailsModel> GetUserDetails(string userEmailID, string userPassword)
        {
            using (IDbConnection db = new SqlConnection(Appsetting.ConnectionString))
            {
                db.Open();
                var _params = new DynamicParameters();
                _params.Add("@userEmailID", userEmailID);
                _params.Add("@userPassword", userPassword);
                var result = db.Query<GetUserDetailsModel, userSkills, GetUserDetailsModel>(
                    Appsetting.SQLQueryCommand.SP_GetUserDataLogin,
                    (user, skill) =>
                    {
                        user.wantedSkills = user.wantedSkills ?? new List<userSkills>();
                        user.offeredSkills = user.offeredSkills ?? new List<userSkills>();

                        if (skill != null)
                        {
                    if (skill.SkillType == "Wanted")
                            {
                                user.wantedSkills.Add(skill);
                            }
                            else if (skill.SkillType == "Offered")
                            {
                                user.offeredSkills.Add(skill);
                            }
                        }
                        return user;
                    },
                    _params,
                    commandType: CommandType.StoredProcedure,
                    splitOn: "skillID"
                ).GroupBy(u => u.userID).Select(g =>
                {
                    var user = g.First();
                    user.wantedSkills = g.Select(u => u.wantedSkills.FirstOrDefault()).Where(s => s != null).Distinct().ToList();
                    user.offeredSkills = g.Select(u => u.offeredSkills.FirstOrDefault()).Where(s => s != null).Distinct().ToList();
                    return user;
                }).ToList();

                return result;
            }
        }

        public bool CreateUserDetails(CreateUserDetailsModel model, out string message)
        {
            bool isValid = false;
            message = string.Empty;

            using (IDbConnection db = new SqlConnection(Appsetting.ConnectionString))
            {
                db.Open();

                var _params = new DynamicParameters();
                _params.Add("@ID", model.ID);
                _params.Add("@userEmail", model.userEmail);
                _params.Add("@userPassword", model.userPassword);
                _params.Add("@firstName", model.firstName);
                _params.Add("@lastName", model.lastName);
                _params.Add("@profilePhoto", model.profilePhoto);
                _params.Add("@userLocation", model.userLocation);
                _params.Add("@userAvailability", model.userAvailability);
                _params.Add("@profileStatus", model.profileStatus);
                _params.Add("@action", model.action);
                _params.Add("@status", dbType: DbType.Boolean, direction: ParameterDirection.Output);
                _params.Add("@message", dbType: DbType.String, size: 250, direction: ParameterDirection.Output);

                db.Execute(Appsetting.SQLQueryCommand.SP_UserDetailsAction, _params, commandType: CommandType.StoredProcedure);

                isValid = _params.Get<bool>("@status");
                message = _params.Get<string>("@message");

                if (isValid)
                {
                    string userID = model.ID;

                    // Cleanup previous skills (for EDIT or re-INSERT case)
                    db.Execute("DELETE FROM OfferedSkillMapping WHERE UserID = @UserID", new { UserID = userID });
                    db.Execute("DELETE FROM WantededSkillMapping WHERE UserID = @UserID", new { UserID = userID });

                    // Insert Offered Skills
                    foreach (var skill in model.offeredSkill)
                    {
                        db.Execute(@"INSERT INTO OfferedSkillMapping 
                             VALUES (NEWID(), @UserID, @SkillID, 1, GETDATE(), NULL)",
                                   new { UserID = userID, SkillID = skill.skillID });
                    }

                    // Insert Wanted Skills
                    foreach (var skill in model.wantedSkill)
                    {
                        db.Execute(@"INSERT INTO WantededSkillMapping 
                             VALUES (NEWID(), @UserID, @SkillID, 1, GETDATE(), NULL)",
                                   new { UserID = userID, SkillID = skill.skillID });
                    }
                }
            }
            return isValid;
        }
        #endregion


    }
}