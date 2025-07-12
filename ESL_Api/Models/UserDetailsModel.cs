using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SkillSwap.Models
{
    public class GetUserDetailsModel
    {
        public Guid userID { get; set; }
        public string userMailID { get; set; }
        public string userPassword { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string profilePhoto { get; set; }
        public string userLocation { get; set; }
        public string userAvailability { get; set; }
        public string profileStatus { get; set; }
        public List<userSkills> wantedSkills { get; set; }
        public List<userSkills> offeredSkills { get; set; }
    }

    public class userSkills
    {
        public int skillID { get; set; }
        public string skillName { get; set; }
        public string SkillType { get; set; }
    }

    public class CreateUserDetailsModel
    {
        public string ID { get; set; }
        public string userEmail { get; set; }
        public string userPassword { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string profilePhoto { get; set; }
        public string userLocation { get; set; }
        public string userAvailability { get; set; }
        public string profileStatus { get; set; }
        public string action { get; set; }
        public List<SkillModel> wantedSkill { get; set; }
        public List<SkillModel> offeredSkill { get; set; }
    }

    public class SkillModel
    {
        public int skillID { get; set; }
    }
}