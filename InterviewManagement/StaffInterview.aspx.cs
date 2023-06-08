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

namespace InterviewManagement
{
    public partial class StaffInterview : System.Web.UI.Page
    {
        General_BLL obj = new General_BLL();
        Interview_BLL objBLL = new Interview_BLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["val"];
            if (!IsPostBack)
            {
                string epromise = Session["LOGIN_USERNAME"].ToString();
                if (id == null)
                {
                    GetReferenceNo();
                    GetInterviewerDetails(epromise);
                    Btn_Submit.Visible = true;
                    Btn_Update.Visible = false;
                    LnkBtngoBack.Visible = false;
                }
                else
                {
                    LnkBtngoBack.Visible = true;
                    int TranID = Convert.ToInt32(id);
                    BindData(TranID);
                }
            }
        }
        public void GetInterviewerDetails(string epromise)
        {
            DataTable dt = new DataTable();
            dt = obj.Get_epromiseMaster(epromise);
            if (dt.Rows.Count >= 1)
            {
                string[] PreparedBy = dt.Rows[0]["EmployeeName"].ToString().Split(' ');
                string nameee = Capitalize(PreparedBy[0]);
                lb_Interviewer_Name.Text = Capitalize(dt.Rows[0]["EmployeeName"].ToString());
                lb_InterviewerPosition.Text = dt.Rows[0]["WorkingAsName"].ToString();
                lb_Interviewer_Company.Text = dt.Rows[0]["companyName"].ToString();
                lb_InterviewerDept.Text = dt.Rows[0]["locationName"].ToString();
                DateTime _date = DateTime.Now;
                _date = Convert.ToDateTime(_date);
                int _Year = _date.Year;
                int _Month = _date.Month; 
                int _day = _date.Day;
                //string joiningDate = (_Year.ToString() + "-" + _Month.ToString("00") + "-" + _day.ToString("00")).ToString();
                string joiningDate = (_day.ToString("00") + "-" + _Month.ToString("00") + "-" + _Year.ToString());
                lb_DateOfinterview.Text = joiningDate.ToString();
                radioSuccess1.Checked = true;
            }
        }
        public void BindData(int TranID)
        {
            DataTable dtGetData = new DataTable();
            dtGetData = objBLL.StaffInterviewbyTranId(TranID);
            if (dtGetData.Rows.Count>0)
            {
                Btn_Submit.Visible = false;
                Btn_Update.Visible = true;
                lb_RequestForMPRef.Text = dtGetData.Rows[0]["RequestForMPRef"].ToString();
                lb_Interviewer_Name.Text = Capitalize(dtGetData.Rows[0]["InterviewerName"].ToString());
                lb_InterviewerPosition.Text = dtGetData.Rows[0]["InterviewerWorkingAsName"].ToString();
                lb_Interviewer_Company.Text = dtGetData.Rows[0]["InterviewerCompanyName"].ToString();
                lb_InterviewerDept.Text = dtGetData.Rows[0]["InterviewerLocationName"].ToString();

                txt_ApplicantName.Text = dtGetData.Rows[0]["ApplicantName"].ToString();
                //txt_PositionAppliedFor.Text = dtGetData.Rows[0]["PoitionAppliedFor"].ToString();
                Combo_WorkingAs.SelectedValue= dtGetData.Rows[0]["PositionAppliedForCode"].ToString();
                if (dtGetData.Rows[0]["InterviewType"].ToString() == "Video Conference")
                {
                    radioSuccess2.Checked = true;
                }
                else if (dtGetData.Rows[0]["InterviewType"].ToString() == "In Person")
                {
                    radioSuccess1.Checked = true;
                }
                TxtInterviewAssessment.Text = dtGetData.Rows[0]["InterviewAssessment"].ToString();

                txt_JobKnowledge.DisplayText = dtGetData.Rows[0]["JobKnowledge"].ToString() ;
                txt_CommunicationSkills.DisplayText = dtGetData.Rows[0]["CommunicationSkills"].ToString();
                txt_LeadershipQualities.DisplayText = dtGetData.Rows[0]["LeadershipQualities"].ToString();
                txt_Experience.DisplayText = dtGetData.Rows[0]["Experience"].ToString();
                txt_Confidence_Attitude.DisplayText = dtGetData.Rows[0]["Confidence_Attitude"].ToString();
                txt_PhysicalAppearance.DisplayText = dtGetData.Rows[0]["PhysicalAppearance"].ToString();
                txt_Education.DisplayText = dtGetData.Rows[0]["Education"].ToString();
                txt_other.DisplayText = dtGetData.Rows[0]["Other_Score"].ToString();

                txt_JobKnowledge.Value = Convert.ToInt32(dtGetData.Rows[0]["JobKnowledge"].ToString());
                txt_CommunicationSkills.Value = Convert.ToInt32(dtGetData.Rows[0]["CommunicationSkills"].ToString());
                txt_LeadershipQualities.Value = Convert.ToInt32(dtGetData.Rows[0]["LeadershipQualities"].ToString());
                txt_Experience.Value = Convert.ToInt32(dtGetData.Rows[0]["Experience"].ToString());
                txt_Confidence_Attitude.Value = Convert.ToInt32(dtGetData.Rows[0]["Confidence_Attitude"].ToString());
                txt_PhysicalAppearance.Value = Convert.ToInt32(dtGetData.Rows[0]["PhysicalAppearance"].ToString());
                txt_Education.Value = Convert.ToInt32(dtGetData.Rows[0]["Education"].ToString());
                txt_other.Value = Convert.ToInt32(dtGetData.Rows[0]["Other_Score"].ToString());

                txt_OvarAll.Text = dtGetData.Rows[0]["OverallMark"].ToString();
                txt_InterviewerComments.Text = dtGetData.Rows[0]["InterviewerComments"].ToString();
                if (dtGetData.Rows[0]["InterviewResult"].ToString() == "Pass")
                {
                    Radio_Pass.Checked = true;
                }
                else if (dtGetData.Rows[0]["InterviewResult"].ToString() == "Fail")
                {
                    Radio_Fail.Checked = true;
                }
                else if (dtGetData.Rows[0]["InterviewResult"].ToString()== "Hold")
                {
                    Radio_Hold.Checked = true;
                }
                Combo_Location.SelectedValue= dtGetData.Rows[0]["ApplicantDivision"].ToString();
                Combo_Company.SelectedValue = dtGetData.Rows[0]["ApplicantCompany"].ToString();
                txt_ErpRef.Text = dtGetData.Rows[0]["ERP_Ref"].ToString();
                lb_DateOfinterview.Text = dtGetData.Rows[0]["InterviewDate"].ToString();
                txt_PositionRecommended.Text= dtGetData.Rows[0]["PositionRecommended"].ToString();
            }
            int St = 0;
            DataTable dtInter = obj.Get_InterviewOffer(TranID);
            if (dtInter.Rows.Count > 0)
            {
                Btn_Submit.Visible = false;
                Btn_Update.Visible = false;
                Doc_Upload.Visible = false;
                St = 1;
            }
            PopulateAttachment(TranID, St);
        }
        public void PopulateAttachment(int TranID,int st)
        {
            DataTable dtAttachment = new DataTable();
            dtAttachment = obj.GetInterviewAttachments(TranID);
            
            
            if (st==1)
            {
                RadListBoxTemp.DataSource = dtAttachment;
                RadListBoxTemp.DataTextFormatString = "Doc_FileName";
                RadListBoxTemp.DataValueField = "TranId";
                RadListBoxTemp.DataBind();
                RadListBoxTemp.Visible = true;
                RadListAttachment.Visible = false;
            }
            else
            {
                RadListAttachment.DataSource = dtAttachment;
                RadListAttachment.DataTextFormatString = "Doc_FileName";
                RadListAttachment.DataValueField = "TranId";
                RadListAttachment.DataBind();
                RadListAttachment.Visible = true;
                RadListBoxTemp.Visible = false;
            }
            
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
            StaffInterview_Model _data = new StaffInterview_Model();
            _data.TranId =0 ;
            _data.Interviewer = Session["LOGIN_USERNAME"].ToString();//LoginEpromis
            _data.RequestForMPRef = lb_RequestForMPRef.Text.ToString();
            _data.ApplicantName =txt_ApplicantName.Text.ToString();
            _data.PoitionAppliedFor = Combo_WorkingAs.SelectedItem.Text.ToString(); 
            _data.PositionAppliedForCode = Combo_WorkingAs.SelectedValue.ToString();
            if (radioSuccess1.Checked)
            {
                _data.InterviewType = "In Person";
            }
            else
            {
                _data.InterviewType = "Video Conference";
            }
            _data.InterviewAssessment =TxtInterviewAssessment.Text;
            _data.JobKnowledge =Convert.ToInt32(txt_JobKnowledge.Value);
            _data.CommunicationSkills = Convert.ToInt32(txt_CommunicationSkills.Value);
            _data.LeadershipQualities = Convert.ToInt32(txt_LeadershipQualities.Value);
            _data.Experience = Convert.ToInt32(txt_Experience.Value);
            _data.Confidence_Attitude = Convert.ToInt32(txt_Confidence_Attitude.Value);
            _data.PhysicalAppearance = Convert.ToInt32(txt_PhysicalAppearance.Value);
            _data.Education = Convert.ToInt32(txt_Education.Value);
            _data.Other_Score = Convert.ToInt32(txt_other.Value);
            if (hdn_OverAll.Value == "")
            {
                hdn_OverAll.Value = "0";
            }
            _data.OverallMark = Convert.ToInt32(hdn_OverAll.Value);
            _data.InterviewerComments = txt_InterviewerComments.Text.ToString();
            if(Radio_Pass.Checked)
            {
                _data.InterviewResult = "Pass";
            }
            else if (Radio_Fail.Checked)
            {
                _data.InterviewResult = "Fail";
            }
            else 
            {
                _data.InterviewResult = "Hold";
            }
            _data.ERP_Ref = txt_ErpRef.Text.ToString();
            _data.ApplicantDivision =Combo_Location.SelectedValue.ToString();
            _data.ApplicantCompany = Combo_Company.SelectedValue.ToString();
            _data.PositionRecommended = txt_PositionRecommended.Text.ToString();
            _data.EntryBy= Session["LOGIN_USERNAME"].ToString();
            int Result = 0;
            Result = objBLL.Submit_StaffInterview(_data);
            if(Result>0)
            {
                DataTable InterviewAttach = new DataTable();
                InterviewAttach.Columns.AddRange(new DataColumn[5] {
                            new DataColumn("Doc_FileName",typeof(string)),
                            new DataColumn("Doc_FileData",typeof(byte[])),
                            new DataColumn("Doc_FileType",typeof(string)),
                            new DataColumn("Doc_FileExtension",typeof(string)),
                            new DataColumn("EntryBy",typeof(string))

                    });
                foreach (UploadedFile file in Doc_Upload.UploadedFiles)
                {
                    byte[] bytes = new byte[file.ContentLength];
                    file.InputStream.Read(bytes, 0, bytes.Length);
                    InterviewAttach.Rows.Add(  file.FileName, bytes, file.ContentType,file.GetExtension(), Session["LOGIN_USERNAME"].ToString());
                }
                if (Doc_Upload.UploadedFiles.Count > 0)
                {
                    int OutPut = obj.SubmitAttachments(lb_RequestForMPRef.Text, InterviewAttach,0);
                }
                Email_BLL objmail=new Email_BLL();
                Result = objmail.SendEmail(lb_RequestForMPRef.Text,"FeedbackEntry");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(1);", true);
                ClearAllField();

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(0);", true);
            }
        }
        public void ClearAllField()
        {
            lb_RequestForMPRef.Text = "";
            TxtInterviewAssessment.Text = "Salary/Role budget is not to be discussed with Candidate";
            txt_ApplicantName.Text = "";
            radioSuccess1.Checked = true;
            txt_ApplicantName.Text.ToString();
            //txt_PositionAppliedFor.Text.ToString();
            radioSuccess1.Checked = true;
            txt_JobKnowledge.Value = 0;
            txt_CommunicationSkills.Value = 0;
            txt_LeadershipQualities.Value = 0;
            txt_Experience.Value = 0;
            txt_Confidence_Attitude.Value = 0;
            txt_PhysicalAppearance.Value = 0;
            hdn_OverAll.Value = "0";
            txt_InterviewerComments.Text = "";
            Radio_Pass.Checked = true;
            Radio_Fail.Checked = false;
            Radio_Hold.Checked = false;
            RadListAttachment.Items.Clear();
            RadListAttachment.DataSource = null;
            GetReferenceNo();
            txt_ErpRef.Text = "";
            txt_Education.Value = 0;
            txt_other.Value = 0;
            txt_PositionRecommended.Text = "";
            Combo_Company.ClearSelection();
            Combo_Location.ClearSelection();
            Combo_WorkingAs.ClearSelection();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if(Request.QueryString["val"] != null)
            {
                int TranID = Convert.ToInt32(Request.QueryString["val"]);
                DataTable InterviewAttach = new DataTable();
                InterviewAttach.Columns.AddRange(new DataColumn[5] {
                            new DataColumn("Doc_FileName",typeof(string)),
                            new DataColumn("Doc_FileData",typeof(byte[])),
                            new DataColumn("Doc_FileType",typeof(string)),
                            new DataColumn("Doc_FileExtension",typeof(string)),
                            new DataColumn("EntryBy",typeof(string))

                    });
                int OutPut = obj.SubmitAttachments("", InterviewAttach,Convert.ToInt32(Request.QueryString["val"]));

                if(OutPut>0)
                {
                    PopulateAttachment(TranID,0);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(3);", true);
                }
            }
        }

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            if(Request.QueryString["val"]!=null)
            {
                StaffInterview_Model _data = new StaffInterview_Model();
                _data.TranId = Convert.ToInt32(Request.QueryString["val"]);
                _data.Interviewer = lb_Interviewer_Name.Text.ToString();
                _data.RequestForMPRef = lb_RequestForMPRef.Text.ToString();
                _data.ApplicantName = txt_ApplicantName.Text.ToString();
                _data.PoitionAppliedFor = Combo_WorkingAs.SelectedItem.Text.ToString();
                _data.PositionAppliedForCode = Combo_WorkingAs.SelectedValue.ToString();
                if (radioSuccess1.Checked)
                {
                    _data.InterviewType = "In Person";
                }
                else
                {
                    _data.InterviewType = "Video Conference";
                }
                _data.InterviewAssessment = TxtInterviewAssessment.Text;
                _data.JobKnowledge = Convert.ToInt32(txt_JobKnowledge.Value);
                _data.CommunicationSkills = Convert.ToInt32(txt_CommunicationSkills.Value);
                _data.LeadershipQualities = Convert.ToInt32(txt_LeadershipQualities.Value);
                _data.Experience = Convert.ToInt32(txt_Experience.Value);
                _data.Confidence_Attitude = Convert.ToInt32(txt_Confidence_Attitude.Value);
                _data.PhysicalAppearance = Convert.ToInt32(txt_PhysicalAppearance.Value);
                _data.Education = Convert.ToInt32(txt_Education.Value);
                _data.Other_Score = Convert.ToInt32(txt_other.Value);
                if (hdn_OverAll.Value=="")
                {
                    _data.OverallMark = Convert.ToInt32(txt_OvarAll.Text);
                }
                else
                {
                    _data.OverallMark = Convert.ToInt32(hdn_OverAll.Value);
                }
                _data.InterviewerComments = txt_InterviewerComments.Text.ToString();
                if (Radio_Pass.Checked)
                {
                    _data.InterviewResult = "Pass";
                }
                else if (Radio_Fail.Checked)
                {
                    _data.InterviewResult = "Fail";
                }
                else
                {
                    _data.InterviewResult = "Hold";
                }
                _data.ERP_Ref = txt_ErpRef.Text.ToString();
                _data.ApplicantDivision = Combo_Location.SelectedValue.ToString();
                _data.ApplicantCompany = Combo_Company.SelectedValue.ToString();
                _data.PositionRecommended = txt_PositionRecommended.Text.ToString();
                _data.EntryBy = Session["LOGIN_USERNAME"].ToString();
                int Result = 0;
                Result = objBLL.Submit_StaffInterview(_data);//same Sp for Submit & Update
                if (Result>0)
                {
                    DataTable InterviewAttach = new DataTable();
                    InterviewAttach.Columns.AddRange(new DataColumn[5] {
                            new DataColumn("Doc_FileName",typeof(string)),
                            new DataColumn("Doc_FileData",typeof(byte[])),
                            new DataColumn("Doc_FileType",typeof(string)),
                            new DataColumn("Doc_FileExtension",typeof(string)),
                            new DataColumn("EntryBy",typeof(string))

                    });
                    foreach (UploadedFile file in Doc_Upload.UploadedFiles)
                    {
                        byte[] bytes = new byte[file.ContentLength];
                        file.InputStream.Read(bytes, 0, bytes.Length);
                        InterviewAttach.Rows.Add(file.FileName, bytes, file.ContentType, file.GetExtension(), Session["LOGIN_USERNAME"].ToString());
                    }
                    if (Doc_Upload.UploadedFiles.Count > 0)
                    {

                        int OutPut = obj.SubmitAttachments(lb_RequestForMPRef.Text, InterviewAttach, 0);
                    }
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(4);", true);
                    

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "SuccessAlert(0);", true);
                }
            }
            
        }
        protected void LnkDownload_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            string commandArgs = button.CommandArgument.ToString();

            try
            {
                byte[] FileData = null; string FileName = null;
                DataTable Dt = obj.Get_AttachmentDocument(Convert.ToInt32( commandArgs));
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

        protected void LnkBtngoBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("InterviewDetails.aspx");
        }
    }
}