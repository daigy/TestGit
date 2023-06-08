using InterviewManagement.App_Code.BLL;
using InterviewManagement.App_Code.BO;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using static Telerik.Web.UI.ComboBox.ComboBoxStyles;

namespace InterviewManagement
{
    public partial class InterviewOffer : System.Web.UI.Page
    {
        General_BLL obj = new General_BLL();
        Interview_BLL objBLL = new Interview_BLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["val"];
            if (!IsPostBack)
            {
                //radioSuccess1.Checked = true;
                if (id == null)
                {
                    GetReferenceNo();
                }
                else
                {
                    int TranID = Convert.ToInt32(id);
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

                        DataTable dt = new DataTable();

                        dt = obj.Get_HRMInterviewOffer(TranID);
                        if (dt.Rows.Count >= 1)
                        {
                            HrDivstatus.Visible = true;
                            PendingHr.Visible = false;
                            txt_SalaryOffered.Text = dt.Rows[0]["HRMSalaryOffered"].ToString();
                            TxtMinSalary.Text = dt.Rows[0]["MinSalary"].ToString();
                            TxtMidSalary.Text = dt.Rows[0]["MidSalary"].ToString();
                            TxtMaxSalary.Text = dt.Rows[0]["MaxSalary"].ToString();

                            radlblOfferAcceptedstatus.Text = dt.Rows[0]["HRMAction"].ToString();
                            lb_ActionDate.Text=Convert.ToDateTime(dt.Rows[0]["HRMDate"].ToString()).ToString("dd-MM-yyyy");
                            string reason = dt.Rows[0]["HRMOfferComments"].ToString();
                            if (reason != "" & reason != null)
                            {

                                HrComments.Style.Add("display", "block");
                                TxtOfferComments.Text = dt.Rows[0]["HRMOfferComments"].ToString();
                            }
                            else
                            {
                                HrComments.Style.Add("display", "none");
                                TxtOfferComments.Text = "";
                            }
                        }
                        else
                        {
                            HrDivstatus.Visible = false;
                            PendingHr.Visible = true;
                        }

                        //DataTable dtHRDetails = new DataTable();
                        //dtHRDetails = obj.Get_InterviewOffer(TranID);
                        //if(dtHRDetails.Rows.Count > 0)
                        //{
                        //    foreach(DataRow dr in dtHRDetails.Rows)
                        //    {
                        //        txt_PositionOffered.Text = dr["PositionOffered"].ToString();
                        //        TxtMinSalary.DisplayText = dr["GroupSalaryRangeMin"].ToString();
                        //        TxtMinSalary.Value =Convert.ToInt32(dr["GroupSalaryRangeMin"].ToString());
                        //        TxtMidSalary.DisplayText = dr["GroupSalaryRangeMid"].ToString();
                        //        TxtMidSalary.Value = Convert.ToInt32(dr["GroupSalaryRangeMid"].ToString()); 
                        //        TxtMaxSalary.DisplayText = dr["GroupSalaryRangeMax"].ToString();
                        //        TxtMaxSalary.Value = Convert.ToInt32(dr["GroupSalaryRangeMax"].ToString());
                        //        if(dr["OfferStatus"].ToString()=="Yes")
                        //        {
                        //            radioSuccess1.Checked = true;
                        //            RejReason.Attributes.Add("style", "display:none");
                        //        }
                        //        if (dr["OfferStatus"].ToString() == "No")
                        //        {
                        //            TxtRejectReason.Text = dr["OfferRejectReason"].ToString();
                        //            radioSuccess2.Checked = true;
                        //            RejReason.Attributes.Add("style", "display:block");
                        //        }

                        //        TxtOfferComments.Text = dr["OfferComments"].ToString();

                        //        if(dr["AppStatus"].ToString()=="1")
                        //        {
                        //            Btn_Submit.Visible=false;
                        //            Btn_Update.Visible=false;
                        //        }
                        //        else
                        //        {
                        //            Btn_Submit.Visible = false;
                        //            Btn_Update.Visible = true;
                        //        }
                        //    }

                        //}
                        //else
                        //{
                        //    Btn_Submit.Visible = true;
                        //    Btn_Update.Visible = false;
                        //}
                        //DataTable dtHRMDetails = new DataTable();
                        //dtHRDetails = obj.Get_HRMInterviewOffer(TranID);
                        //if (dtHRDetails.Rows.Count > 0)
                        //{
                        //    HRMStatus.Visible = true;
                        //    foreach (DataRow dr in dtHRDetails.Rows)
                        //    {
                        //        RadHRMSalryOffered.Text = dr["HRMSalaryOffered"].ToString();
                        //        HRMCOmment.Text = dr["HRMOfferComments"].ToString();
                        //        RadHRMApprovlStatus.Text = dr["HRMAction"].ToString();
                        //    }
                        //}
                        //else
                        //{
                        //    HRMStatus.Visible = false;
                        //}
                        DataTable dtMngDetails = new DataTable();
                        dtMngDetails = obj.Get_MngInterviewOffer(TranID);
                        if (dtMngDetails.Rows.Count > 0)
                        {
                            MngDivstatus.Visible = true;
                            PendingMng.Visible = false;
                            foreach (DataRow dr in dtMngDetails.Rows)
                            {
                                RadMngComment.Text = dr["MNGComments"].ToString();
                                RadMngstatus.Text = dr["MNGMAction"].ToString();
                            }
                        }
                        else
                        {
                            MngDivstatus.Visible = false;
                            PendingMng.Visible = true;
                        }
                        PopulateAttachment(TranID);
                    }
                    

                }
            }
        }
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
        public string Capitalize(string word)
        {
            return word.Substring(0, 1).ToUpper() + word.Substring(1).ToLower(); ;
        }
        public void GetReferenceNo()
        {
            DataTable dtRef = new DataTable();
            dtRef = obj.NextReferenceNoForStaffIntrw();
            if (dtRef.Rows.Count >= 1)
            {
                string NextRefNo = dtRef.Rows[0]["RequestForMPRef"].ToString();
                lb_RequestForMPRef.Text = NextRefNo;
            }
            else
            {
                lb_RequestForMPRef.Text = "REF-1"; ;
            }
        }

        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            //if(Page.IsValid)
            //{
            //    InterviewOffer_Model _data = new InterviewOffer_Model();
            //    _data.TranId = 0;
            //    _data.EntryUser = Session["LOGIN_USERNAME"].ToString();//LoginEpromis
            //    _data.PositionOffered = txt_PositionOffered.Text.ToString();
            //    _data.GroupSalaryRangeMin =Convert.ToInt32( TxtMinSalary.Value);
            //    _data.GroupSalaryRangeMid = Convert.ToInt32(TxtMidSalary.Value);
            //    _data.GroupSalaryRangeMax = Convert.ToInt32(TxtMaxSalary.Value);

             
            //    if (radioSuccess1.Checked)
            //    {
            //        _data.OfferStatus = "Yes";
            //        _data.OfferRejectReason = "";
            //    }
            //    else
            //    {
            //        _data.OfferStatus = "No";
            //        _data.OfferRejectReason = TxtRejectReason.Text;
            //    }

            //    _data.OfferComments = TxtOfferComments.Text;
            //    _data.InterviewTranId = Convert.ToInt32( hdTran_ID.Value);


            //    int OutPut = obj.SubmitInterviewOffer(_data);
            //    if (OutPut > 0)
            //    {

            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(1);", true);
                    

            //    }
            //    else
            //    {
            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(0);", true);
            //    }
            //}
        }
        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            //if (Page.IsValid)
            //{
            //    InterviewOffer_Model _data = new InterviewOffer_Model();
            //    _data.TranId = 0;
            //    _data.EntryUser = Session["LOGIN_USERNAME"].ToString();//LoginEpromis
            //    _data.PositionOffered = txt_PositionOffered.Text.ToString();
            //    _data.GroupSalaryRangeMin = Convert.ToInt32(TxtMinSalary.Value);
            //    _data.GroupSalaryRangeMid = Convert.ToInt32(TxtMidSalary.Value);
            //    _data.GroupSalaryRangeMax = Convert.ToInt32(TxtMaxSalary.Value);


            //    if (radioSuccess1.Checked)
            //    {
            //        _data.OfferStatus = "Yes";
            //        _data.OfferRejectReason = "";
            //    }
            //    else
            //    {
            //        _data.OfferStatus = "No";
            //        _data.OfferRejectReason = TxtRejectReason.Text;
            //    }

            //    _data.OfferComments = TxtOfferComments.Text;
            //    _data.InterviewTranId = Convert.ToInt32(hdTran_ID.Value);


            //    int OutPut = obj.SubmitInterviewOffer(_data);
            //    if (OutPut > 0)
            //    {

            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(1);", true);
                    

            //    }
            //    else
            //    {
            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(0);", true);
            //    }
            //}
        }
        public void ClearAllField()
        {
            //txt_PositionOffered.Text = "";
            //TxtMinSalary.Text = "";
            //TxtMidSalary.Text = "";
            //TxtMaxSalary.Text = "";
            //radioSuccess1.Checked = true;
            //RejReason.Attributes.Add("style", "display:none");
            //TxtRejectReason.Text = "";
            //TxtOfferComments.Text = "";
        }
        protected void LnkBtnDelete_Click(object sender, EventArgs e)
        {
            
        }

        protected void LnkBtngoBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("InterviewOfferDetails.aspx");
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

            }
            catch (Exception ex)
            {
            }
        }
    }
}