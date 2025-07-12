using SkillSwap.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SkillSwap.IDataAccessLayer
{
    public interface ISkillSwapDAL
    {
        #region SkillSwap
        List<GetUserDetailsModel> GetUserDetails(string userEmailID, string userPassword);
        bool CreateUserDetails(CreateUserDetailsModel createUseeDetailsModel, out string message);
        #endregion

    }
}