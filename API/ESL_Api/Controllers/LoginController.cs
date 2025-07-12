using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using SkillSwap.IDataAccessLayer;

namespace SkillSwap.Controllers
{
    [RoutePrefix("ODOO")]
    public class LoginController : ApiController
    {
        private readonly IDAL SkillSwapDAL;

        public LoginController(IDAL SkillSwapDAL)
        {
            this.SkillSwapDAL = SkillSwapDAL;
        }

        //[HttpGet, Route("DashboardShowData")]
        //public IHttpActionResult DashboardShowData()
        //{
        //    ResponseData responseData = new ResponseData();
        //    List<DashboardData> data = null;
        //    try
        //    {
        //        data = PSLDAL.DashboardShowData();
        //        responseData.status = true;
        //        responseData.message = "Fetched Successfully";
        //        responseData.data = data;
        //    }
        //    catch (Exception ex)
        //    {
        //        responseData.status = false;
        //        responseData.message = ex.Message;
        //        responseData.data = null;
        //    }
        //    return Ok(responseData);
        //}
    }
}