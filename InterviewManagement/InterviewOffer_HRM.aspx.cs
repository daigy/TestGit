using InterviewManagement.App_Code.BLL;
using InterviewManagement.App_Code.BO;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Telerik.Web.UI;
using Telerik.Web.UI.com.hisoftware.api2;
using static Telerik.Web.UI.ComboBox.ComboBoxStyles;

namespace InterviewManagement
{
    public partial class InterviewOffer_HRM : System.Web.UI.Page
    {
        General_BLL obj = new General_BLL();
        Interview_BLL objBLL = new Interview_BLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtInterview = PopulateTable();
                if(dtInterview.Rows.Count>0)
                {
                    MainCard.Style.Add("display", "block");
                    RadListHRMAction.DataSource = dtInterview;
                    RadListHRMAction.DataBind();
                }
                else
                {
                    MainCard.Style.Add("display", "none");
                }
               


            }
        }
        public DataTable PopulateTable()
        {
            //string epromise = Session["LOGIN_USERNAME"].ToString();
            DataTable dtInterview = new DataTable();
            //dtInterview.Columns.Add("tranId", typeof(int));
            //dtInterview.Columns.Add("interviewer", typeof(string));
            //dtInterview.Columns.Add("requestForMPRef", typeof(string));
            //dtInterview.Columns.Add("applicantName", typeof(int));
            //dtInterview.Columns.Add("poitionAppliedFor", typeof(string));
            //dtInterview.Columns.Add("interviewType", typeof(string));
            //dtInterview.Columns.Add("interviewAssessment", typeof(int));
            //dtInterview.Columns.Add("jobKnowledge", typeof(string));
            //dtInterview.Columns.Add("communicationSkills", typeof(string));
            //dtInterview.Columns.Add("leadershipQualities", typeof(string));
            //dtInterview.Columns.Add("experience", typeof(string));
            //dtInterview.Columns.Add("confidence_Attitude", typeof(int));
            //dtInterview.Columns.Add("physicalAppearance", typeof(string));
            //dtInterview.Columns.Add("overallMark", typeof(string));
            //dtInterview.Columns.Add("interviewerComments", typeof(int));
            //dtInterview.Columns.Add("interviewResult", typeof(string));
            //dtInterview.Columns.Add("interviewDate", typeof(string));

            dtInterview = objBLL.Get_StaffInterviewForHRM_Action();
            return dtInterview;
        }
        protected void RadListHRMAction_ItemDataBound(object sender, RadListViewItemEventArgs e)
        {
            if (e.Item is RadListViewDataItem)
            {
                RadListViewDataItem item = e.Item as RadListViewDataItem;
                Label LblInterviewResult = (Label)e.Item.FindControl("LblInterviewResult");

                if (LblInterviewResult.Text == "Pass")
                {
                    LblInterviewResult.Attributes.Add("class", "alert-pass");
                }
                else if (LblInterviewResult.Text == "Fail")
                {
                    LblInterviewResult.Attributes.Add("class", "alert-fail");
                }
                if (LblInterviewResult.Text == "Hold")
                {
                    LblInterviewResult.Attributes.Add("class", "alert-pass");
                }
                var radioBtnA = (HtmlInputRadioButton)item.FindControl("radioSuccess1");
                radioBtnA.Checked = true;
            }
        }
        public string Capitalize(string word)
        {
            return word.Substring(0, 1).ToUpper() + word.Substring(1).ToLower(); ;
        }
        #region NotUsed
        //protected void Btn_View_Click(object sender, EventArgs e)
        //{
        //    Button button = sender as Button;
        //    string commandArgs = button.CommandArgument.ToString();
        //    int TranID = Convert.ToInt32(commandArgs);
        //    ViewinterviewDetails(TranID);

        //}
        #endregion
        public void PopulateAttachment(int TranID)
        {
            DataTable dtAttachment = new DataTable();
            dtAttachment = obj.GetInterviewAttachments(TranID);
            RadListAttachment.DataSource = dtAttachment;
            RadListAttachment.DataTextFormatString = "Doc_FileName";
            RadListAttachment.DataValueField = "TranId";
            RadListAttachment.DataBind();
            RadListAttachment.Visible = true;
        }
        #region NotUsed
        //protected void BtnApprove_Click(object sender, EventArgs e)
        //{
        //    Button button = sender as Button;
        //    RadListViewDataItem row = (RadListViewDataItem)button.NamingContainer;
        //    RadNumericTextBox TxtSalaryOffered = (RadNumericTextBox)button.FindControl("TxtSalaryOffered");
        //    RadTextBox TxtComment = (RadTextBox)button.FindControl("TxtComment");

        //    var radioBtnA = (HtmlInputRadioButton)row.FindControl("radioSuccess1");
        //    var radioBtnR = (HtmlInputRadioButton)row.FindControl("radioSuccess2");

        //    InterviewHRM_Approval_Model _data = new InterviewHRM_Approval_Model();

        //    int val = Convert.ToInt32(row.GetDataKeyValue("tranId").ToString());
        //    string RequestForMPRef = row.GetDataKeyValue("RequestForMPRef").ToString();
        //    _data.interviewTranId = val;
        //    _data.hrmSalaryOffered = TxtSalaryOffered.Value.ToString(); ;
        //    if (radioBtnA.Checked)
        //    {
        //        _data.hrmAction = "Approved";
        //    }
        //    else if (radioBtnR.Checked)
        //    {
        //        _data.hrmAction = "Rejected";
        //    }

        //    _data.hrmOfferComments = TxtComment.Text.ToString();
        //    if(_data.hrmAction == "Rejected" && TxtSalaryOffered.Value==null)
        //    {
        //        _data.hrmSalaryOffered = "0";
        //    }
        //    bool Result = obj.SubmitHRMAction(_data);
        //    if (Result)
        //    {
        //        Email_BLL objmail = new Email_BLL();
        //        int result = objmail.SendEmail(RequestForMPRef, "HR_MangerAction");

        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(1);", true);
        //        DataTable dtInterview = PopulateTable();
        //        RadListHRMAction.DataSource = dtInterview;
        //        RadListHRMAction.DataBind();
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(0);", true);
        //    }
        //}
        #endregion
        protected void RadListHRMAction_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e)
        {
            DataTable dtInterview = PopulateTable();
            RadListHRMAction.DataSource = dtInterview;
            if(dtInterview.Rows.Count > 0)
            {
                RadListHRMAction.Visible = true;
                MainCard.Style.Add("display", "block");
            }
            else
            {
                RadListHRMAction.Visible = false;
                MainCard.Style.Add("display", "none");
            }
        }
        protected void LnkDownload_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            string commandArgs = button.CommandArgument.ToString();

            try
            {
                byte[] FileData = null; string FileName = null;
                DataTable Dt = obj.Get_AttachmentDocument(Convert.ToInt32(commandArgs));
                if (Dt.Rows.Count > 0)
                {
                    FileData = (byte[])Dt.Rows[0]["Doc_FileData"];
                    FileName = Dt.Rows[0]["Doc_FileName"].ToString();
                }
                //byte[] y = System.Text.Encoding.UTF8.GetBytes(FileData);
                var fileupload1 = FileData;
                HttpContext context = HttpContext.Current;
                if (fileupload1 != null)
                {
                    Response.AddHeader("Content-type", "pdf");
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + FileName);
                    byte[] dataBlock = new byte[0x1000];
                    long fileSize;
                    int bytesRead;
                    long totalsBytesRead = 0;
                    using (Stream st = new MemoryStream(fileupload1))
                    {
                        fileSize = st.Length;
                        while (totalsBytesRead < fileSize)
                        {
                            if (Response.IsClientConnected)
                            {
                                bytesRead = st.Read(dataBlock, 0, dataBlock.Length);
                                Response.OutputStream.Write(dataBlock, 0, bytesRead);
                                Response.Flush();
                                totalsBytesRead += bytesRead;
                            }
                        }
                    }
                    Response.End();
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowPopup();", true);
            }
            catch (Exception ex)
            {
            }
        }

        protected void RadListHRMAction_ItemCommand(object sender, RadListViewCommandEventArgs e)
        {
            RadListViewDataItem item = (RadListViewDataItem)e.ListViewItem;
            var tranId = item.GetDataKeyValue("tranId");
            RadNumericTextBox TxtSalaryOffered = item.FindControl("TxtSalaryOffered") as RadNumericTextBox;
            RadNumericTextBox _Salik = item.FindControl("txt_Salik") as RadNumericTextBox;
            HtmlInputRadioButton radioApprove = item.FindControl("radioSuccess1") as HtmlInputRadioButton;
            HtmlInputRadioButton radioReject = item.FindControl("radioSuccess1") as HtmlInputRadioButton;
            RadTextBox Comment = item.FindControl("TxtComment") as RadTextBox;
            string RequestForMPRef = item.GetDataKeyValue("RequestForMPRef").ToString();
            var flag = true;
            if (e.CommandName == "Action")
            {
                InterviewHRM_Approval_Model data = new InterviewHRM_Approval_Model();
                data.interviewTranId = Convert.ToInt32(tranId);
                data.hrmOfferComments = Comment.Text.ToString();
                if (radioApprove.Checked)
                {
                    data.hrmAction = "Approved";
                    if (TxtSalaryOffered.Value.ToString() != "")
                    {
                        flag = true;
                        data.hrmSalaryOffered = TxtSalaryOffered.Value.ToString();
                    }
                    else
                    {
                        flag = false;
                    }
                }
                else //if (radioReject.Checked)
                {
                    data.hrmAction = "Rejected";
                    data.hrmSalaryOffered = "0";
                }
                if (flag) 
                { 
                    bool Result = obj.SubmitHRMAction(data);
                    if (Result)
                    {
                        Email_BLL objmail = new Email_BLL();
                        int result = objmail.SendEmail(RequestForMPRef, "HR_MangerAction");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(1);", true);
                        DataTable dtInterview = PopulateTable();
                        RadListHRMAction.DataSource = dtInterview;
                        RadListHRMAction.DataBind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(0);", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(3);", true);
                }
            }
            if (e.CommandName == "View")
            {
                int TranID = Convert.ToInt32(tranId);
                ViewinterviewDetails(TranID);
            }
            
        }
        public void ViewinterviewDetails(int TranID)
        {
            DataTable dtGetData = new DataTable();
            dtGetData = objBLL.StaffInterviewbyTranId(TranID);
            if (dtGetData.Rows.Count > 0)
            {
                hdTran_ID.Value = TranID.ToString();
                lb_RequestForMPRef.Text = dtGetData.Rows[0]["RequestForMPRef"].ToString();
                RadLabelApplicantName.Text = dtGetData.Rows[0]["ApplicantName"].ToString();
                RadLabelPositionAppliedFor.Text = dtGetData.Rows[0]["PoitionAppliedFor"].ToString();
                AppliedDivision.Text = dtGetData.Rows[0]["ApplicantDivisionName"].ToString();
                AppliedComapany.Text = dtGetData.Rows[0]["ApplicantCompanyName"].ToString();
                RadLabelInterviewType.Text = dtGetData.Rows[0]["InterviewType"].ToString();
                lbl_ErpRef.Text = dtGetData.Rows[0]["ERP_Ref"].ToString();
                lbl_PositionRecommended.Text = dtGetData.Rows[0]["PositionRecommended"].ToString();
                string InterviewAssessment = dtGetData.Rows[0]["InterviewAssessment"].ToString();
                if (InterviewAssessment != null & InterviewAssessment != "")
                {
                    RadLabelInterviewAssessment.Text = "(" + dtGetData.Rows[0]["InterviewAssessment"].ToString() + ")";
                }
                else
                {
                    RadLabelInterviewAssessment.Text = "";
                }

                RadLabelJobKnowledge.Text = dtGetData.Rows[0]["JobKnowledge"].ToString();
                RadLabelCommunicationSkills.Text = dtGetData.Rows[0]["CommunicationSkills"].ToString();
                RadLabelLeadershipQualities.Text = dtGetData.Rows[0]["LeadershipQualities"].ToString();
                RadLabeltxt_Experience.Text = dtGetData.Rows[0]["Experience"].ToString();
                RadLabelConfidence_Attitude.Text = dtGetData.Rows[0]["Confidence_Attitude"].ToString();
                RadLabelPhysicalAppearance.Text = dtGetData.Rows[0]["PhysicalAppearance"].ToString();
                lbl_Education.Text = dtGetData.Rows[0]["Education"].ToString();
                lbl_other.Text = dtGetData.Rows[0]["Other_Score"].ToString();


                txt_OvarAll.Text = dtGetData.Rows[0]["OverallMark"].ToString();
                RadLabelInterviewerComments.Text = dtGetData.Rows[0]["InterviewerComments"].ToString();
                LblStatus.Text = dtGetData.Rows[0]["InterviewResult"].ToString();

                if (LblStatus.Text == "Pass")
                {
                    LblStatus.Attributes.Add("class", "alert-pass");
                }
                else if (LblStatus.Text == "Fail")
                {
                    LblStatus.Attributes.Add("class", "alert-fail");
                }
                if (LblStatus.Text == "Hold")
                {
                    LblStatus.Attributes.Add("class", "alert-pass");
                }

                lb_Interviewer_Name.Text = Capitalize(dtGetData.Rows[0]["InterviewerName"].ToString());
                lb_InterviewerPosition.Text = dtGetData.Rows[0]["InterviewerWorkingAsName"].ToString();
                lb_Interviewer_Company.Text = dtGetData.Rows[0]["InterviewerCompanyName"].ToString();
                lb_InterviewerDept.Text = dtGetData.Rows[0]["InterviewerLocationName"].ToString();
                lb_DateOfinterview.Text = dtGetData.Rows[0]["InterviewDate"].ToString();

                PopulateAttachment(TranID);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowPopup();", true);
            }
        }
    }
}