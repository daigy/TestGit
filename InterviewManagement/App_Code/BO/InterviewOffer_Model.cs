using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InterviewManagement.App_Code.BO
{
    public class InterviewOffer_Model
    {
        public int TranId { get; set; }
        public string EntryUser { get; set; }
        public string PositionOffered { get; set; }
        public int GroupSalaryRangeMin { get; set; }
        public int GroupSalaryRangeMid { get; set; }
        public int GroupSalaryRangeMax { get; set; }
        public string OfferStatus { get; set; }
        public string OfferRejectReason { get; set; }
        public string OfferComments { get; set; }
        public int InterviewTranId { get; set; }

    }
}