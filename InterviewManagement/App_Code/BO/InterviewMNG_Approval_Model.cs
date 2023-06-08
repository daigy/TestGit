using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InterviewManagement.App_Code.BO
{
    public class InterviewMNG_Approval_Model
    {
        public int interviewTranId { get; set; }
        public string mngmAction { get; set; }
        public string mngOfferComments { get; set; }
    }
}