using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InterviewManagement.App_Code.BO
{
    public class StaffInterview_Model
    {
        public int TranId { get; set; }
        public string Interviewer { get; set; }
        public string RequestForMPRef { get; set; }
        public string ApplicantName { get; set; }
        public string PoitionAppliedFor { get; set; }
        public string PositionAppliedForCode { get; set; }
        public string InterviewType { get; set; }
        public string InterviewAssessment { get; set; }
        public int JobKnowledge { get; set; }
        public int CommunicationSkills { get; set; }
        public int LeadershipQualities { get; set; }
        public int Experience { get; set; }
        public int Confidence_Attitude { get; set; }
        public int PhysicalAppearance { get; set; }
        public int Education { get; set; }
        public int Other_Score { get; set; }
        public int OverallMark { get; set; }
        public string InterviewerComments { get; set; }
        public string InterviewResult { get; set; }
        public string ERP_Ref { get; set; }
        public string ApplicantDivision { get; set; }
        public string ApplicantCompany { get; set; }
        public string PositionRecommended { get; set; }
        public string EntryBy { get; set; }
    }
}