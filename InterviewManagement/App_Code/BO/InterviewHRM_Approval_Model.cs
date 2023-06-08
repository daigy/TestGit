using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InterviewManagement.App_Code.BO
{
    public class InterviewHRM_Approval_Model
    {
        public int interviewTranId { get; set; }
        public string hrmSalaryOffered { get; set; }
        public string hrmAction { get; set; }
        public string hrmOfferComments { get; set; }
    }
}