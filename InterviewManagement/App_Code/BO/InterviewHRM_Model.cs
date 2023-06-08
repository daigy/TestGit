using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InterviewManagement.App_Code.BO
{
    public class InterviewHRM_Model
    {
        public int tranId { get; set; }
        public string interviewer { get; set; }
        public string requestForMPRef { get; set; }
        public string applicantName { get; set; }
        public string poitionAppliedFor { get; set; }
        public string interviewType { get; set; }
        public string interviewAssessment { get; set; }
        public int jobKnowledge { get; set; }
        public int communicationSkills { get; set; }
        public int leadershipQualities { get; set; }
        public int experience { get; set; }
        public int confidence_Attitude { get; set; }
        public int physicalAppearance { get; set; }
        public int overallMark { get; set; }
        public string interviewerComments { get; set; }
        public string interviewResult { get; set; }

        public string interviewDate { get; set; }

    }
}