using log4net;
using System.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SkillSwap.Global
{
    public static class Appsetting
    {
        private static readonly ILog Log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public static string ConnectionString { get; private set; }

        public static void loadAppsetting()
        {
            try
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString().Trim();
                SQLQueryCommand.loadSQLQueryCommands();
            }
            catch (Exception ex)
            {
                Log.Error("Error in loadAppSettings", ex);
            }
        }

        public static class SQLQueryCommand
        {
            #region SkillSwap
            public static string SP_GetUserDataLogin { get; private set; }
            public static string SP_UserDetailsAction { get; private set; }
            #endregion
          
            public static void loadSQLQueryCommands()
            {
                try
                {
                    #region SkillSwap
                    SP_GetUserDataLogin = ConfigurationManager.AppSettings["SP_GetUserDataLogin"].ToString().Trim();
                    SP_UserDetailsAction = ConfigurationManager.AppSettings["SP_UserDetailsAction"].ToString().Trim();
                    #endregion
                }
                catch (Exception ex)
                {
                    throw new Exception("Error in loadSQLQueryCommands" + ex.Message);
                }
            }
        }
    }
}