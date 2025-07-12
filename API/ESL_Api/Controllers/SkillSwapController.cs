using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Http;
using SkillSwap.IDataAccessLayer;
using SkillSwap.Models;

namespace SkillSwap.Controllers
{
    [RoutePrefix("ODOO")]
    public class SkillSwapController : ApiController
    {
        private readonly ISkillSwapDAL SkillSwapDAL;

        public SkillSwapController(ISkillSwapDAL SkillSwapDAL)
        {
            this.SkillSwapDAL = SkillSwapDAL;
        }
        #region SkillSwap
        [HttpGet, Route("GetUsersDetails")]
        public IHttpActionResult GetUserDetails(string userEmailID, string userPassword)
        {
            ResponseData responseData = new ResponseData();
            List<GetUserDetailsModel> data = null;
            try
            {
                byte[] passwordBytes = Convert.FromBase64String(userPassword);
                string decodedPassword = Encoding.UTF8.GetString(passwordBytes);
                data = SkillSwapDAL.GetUserDetails(userEmailID, decodedPassword);
                responseData.status = true;
                responseData.message = "Fethced Successfully";
                responseData.data = data;
            }
            catch (Exception ex)
            {
                responseData.status = false;
                responseData.message = ex.Message;
                responseData.data = null;
            }
            return Ok(responseData);
        }

        [HttpPost, Route("CreateUserDetails")]
        public IHttpActionResult CreateUserDetails(CreateUserDetailsModel createUseeDetailsModel)
        {
            Response responseData = new Response();

            try
            {
                string dbMessage;
                bool stat = SkillSwapDAL.CreateUserDetails(createUseeDetailsModel, out dbMessage);
                responseData.status = stat;
                responseData.message = dbMessage;
            }
            catch (Exception ex)
            {
                responseData.status = false;
                responseData.message = "Exception: " + ex.Message;
            }

            return Ok(responseData);
        }
        #endregion
    }
}