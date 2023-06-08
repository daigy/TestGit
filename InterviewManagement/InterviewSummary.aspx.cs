using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace InterviewManagement
{
    public partial class InterviewSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }
        protected void LnkBtnView_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            string commandArgs = button.CommandArgument.ToString();
            Response.Redirect("InterviewOffer.aspx?val=" + commandArgs);

        }

        protected void LnkBtnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void RadInterviewDetails_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {

                GridDataItem dataItem = (GridDataItem)e.Item;
                Label LblInterHRStatus = (Label)e.Item.FindControl("LblInterHRStatus");
                if (LblInterHRStatus.Text == "Pending")
                {
                    LblInterHRStatus.ForeColor = System.Drawing.Color.Red;

                }
                else
                {
                    LblInterHRStatus.ForeColor = System.Drawing.Color.Green;
                }
            }
        }
    }
}