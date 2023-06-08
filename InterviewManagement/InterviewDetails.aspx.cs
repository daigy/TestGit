using InterviewManagement.App_Code.BLL;
using InterviewManagement.App_Code.BO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace InterviewManagement
{
    public partial class InterviewDetails : System.Web.UI.Page
    {
        General_BLL obj = new General_BLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                RadInterviewDetails.DataSource = SD_InterviewDetails;
                RadInterviewDetails.DataBind();
            }
        }

        protected void RadInterviewDetails_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void RadInterviewDetails_FilterCheckListItemsRequested(object sender, Telerik.Web.UI.GridFilterCheckListItemsRequestedEventArgs e)
        {

        }

        protected void LnkBtnView_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            string commandArgs = button.CommandArgument.ToString();
            Response.Redirect("StaffInterview.aspx?val=" + commandArgs);
           
        }

        protected void LnkBtnDelete_Click(object sender, EventArgs e)
        {
            RadPushButton button = sender as RadPushButton;
            string commandArgs = button.CommandArgument.ToString();
            int Result = 0;
            Result = obj.DeleteTranID(Convert.ToInt32(commandArgs));
            if (Result>0)
            { 
                int OutPut = obj.DeleteAttachments(Convert.ToInt32(commandArgs));
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(1);", true);
                RadInterviewDetails.DataSource = SD_InterviewDetails;
                RadInterviewDetails.DataBind();

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(0);", true);
            }
        }

        protected void RadInterviewDetails_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {

                GridDataItem dataItem = (GridDataItem)e.Item;
                RadPushButton LnkBtnDelete = (RadPushButton)e.Item.FindControl("LnkBtnDelete");
                Label LblInterstatus = (Label)e.Item.FindControl("LblInterstatus");
                if (LblInterstatus.Text == "1")
                {
                    LnkBtnDelete.Visible = false;

                }
                else
                {
                    LnkBtnDelete.Visible = true;
                }
            }
        }

    }
}