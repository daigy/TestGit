using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace InterviewManagement.App_Code.BLL
{
    public class Email_BLL
    {
        public int SendEmail(string RequestForMPRef, string ActionFrom)
        {
            int Result = 0;
            General_BLL obj = new General_BLL();
            MailMessage msg = new MailMessage();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            DataTable dt_Request=obj.Get_StaffInterviewbyRequestForMPRef(RequestForMPRef);
            if (dt_Request.Rows.Count > 0)
            {
                string InterviewDate = dt_Request.Rows[0]["InterviewDate"].ToString();
                DateTime dt = Convert.ToDateTime(InterviewDate);
                InterviewDate = dt.ToString("dd/MM/yyyy");
                //string IsPM_CM = dt_Request.DefaultView[0]["PM_CM"].ToString();
                //string PM_CM_Name = "";
                switch (ActionFrom)
                {
                    case "FeedbackEntry":
                        //------------------------------------------------------------To HR Manager 
                        msg.To.Add(new MailAddress(dt_Request.DefaultView[0]["Hr_ManagerEmail"].ToString(), "Group Human Resources Manager")); //hisham.burhani@eccgroup.ae
                        //----------------------------------------------------------------CC InterviewerEmail 
                        msg.CC.Add(new MailAddress(dt_Request.DefaultView[0]["InterviewerEmail"].ToString()));
                        //----------------------------------------------------------------------------------------
                        sb.Append("<font style='font-family:Trebuchet MS;font-size:10pt;line-height:1.6;' >Dear Mr. Hisham, <br><br>");
                        sb.Append("The following candidate has been interviewed/selected and is pending your action.<br> <br>");
                        sb.Append("<table border='1' style='width:50%;padding-left: 0px;font-size: 10pt;'><tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>REFERENCE NO</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + RequestForMPRef + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>INTERVIEWER NAME</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["InterviewerName"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>APPLICANT NAME</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["ApplicantName"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>INTERVIEW DATE</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + InterviewDate + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>INTERVIEW RESULT</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["InterviewResult"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>POSITION APPLIED FOR </label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["PoitionAppliedFor"].ToString() + "</td></tr>");
                        sb.Append("</table>");
                        sb.Append("</font>");
                        msg.Subject = "Interview Feedback Form - Submission";
                        break;
                    case "HR_MangerAction":
                        string HRMAction= dt_Request.DefaultView[0]["HRMAction"].ToString();
                        string HRMOfferComments = dt_Request.DefaultView[0]["HRMOfferComments"].ToString();
                        if (HRMAction== "Approved")
                        {
                            //------------------------------------------------------------CC HR Manager & Interviewer
                            msg.CC.Add(new MailAddress(dt_Request.DefaultView[0]["Hr_ManagerEmail"].ToString(), "Group Human Resources Manager"));
                            msg.CC.Add(new MailAddress(dt_Request.DefaultView[0]["InterviewerEmail"].ToString()));
                            //----------------------------------------------------------------To Nidal/Samer
                            msg.To.Add(new MailAddress("nidal.hassoun@eccgroup.ae", "Group Director of Contracts"));
                            msg.To.Add(new MailAddress("samer.abudaqqa@eccgroup.ae", "Group Director of Cost Control"));
                            //----------------------------------------------------------------------------------------
                            sb.Append("<font style='font-family:Trebuchet MS;font-size:10pt;line-height:1.6;' >Dear Mr. Nidal/Samer, <br><br>");
                            sb.Append("The following candidate has been interviewed and is pending your approval to issue an offer of employment.<br> <br>");
                        }
                        else
                        {
                            //------------------------------------------------------------CC HR Manager 
                            msg.CC.Add(new MailAddress(dt_Request.DefaultView[0]["Hr_ManagerEmail"].ToString(), "Group Human Resources Manager"));
                            //----------------------------------------------------------------To InterviewerEmail
                            msg.To.Add(new MailAddress(dt_Request.DefaultView[0]["InterviewerEmail"].ToString()));
                            //----------------------------------------------------------------------------------------
                            sb.Append("<font style='font-family:Trebuchet MS;font-size:10pt;line-height:1.6;' >Dear Mr."+ dt_Request.DefaultView[0]["InterviewerName"].ToString() + ", <br><br>");
                            sb.Append("The following candidate interview feedback form has been rejected by HR Manager.<br> <br>");
                        }
                        sb.Append("<table  border='1' style='width:50%;padding-left: 0px;font-size: 10pt;'><tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>REFERENCE NO</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + RequestForMPRef + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>INTERVIEWER NAME</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["InterviewerName"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>APPLICANT NAME</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["ApplicantName"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>INTERVIEW DATE</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + InterviewDate + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>INTERVIEW RESULT</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["InterviewResult"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>POSITION APPLIED FOR </label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["PoitionAppliedFor"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>SALARY OFFERED </label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["HRMSalaryOffered"].ToString() + "</td></tr>");
                        if (HRMOfferComments != "")
                        {
                            sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>HR COMMENTS </label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + HRMOfferComments + "</td></tr>");
                        }
                        sb.Append("</table>");
                        sb.Append("</font>");
                        msg.Subject = "Interview Feedback Form -HR MangerAction -("+ HRMAction + ")";
                        break;
                    case "MNG_Action":
                        string MNGMAction = dt_Request.DefaultView[0]["MNGMAction"].ToString();
                        string MNGComments = dt_Request.DefaultView[0]["MNGComments"].ToString();
                        //------------------------------------------------------------To HR Manager 
                        msg.To.Add(new MailAddress(dt_Request.DefaultView[0]["Hr_ManagerEmail"].ToString(), "Group Human Resources Manager"));
                        //----------------------------------------------------------------CC Nidal/Samer
                        msg.CC.Add(new MailAddress("nidal.hassoun@eccgroup.ae", "Group Director of Contracts"));
                        msg.CC.Add(new MailAddress("samer.abudaqqa@eccgroup.ae", "Group Director of Cost Control"));
                        //----------------------------------------------------------------CC Interviewer 
                        msg.CC.Add(new MailAddress(dt_Request.DefaultView[0]["InterviewerEmail"].ToString()));
                        //----------------------------------------------------------------------------------------
                        sb.Append("<font style='font-family:Trebuchet MS;font-size:10pt;line-height:1.6;' >Dear Mr. Hisham, <br><br>");
                        if (MNGMAction == "Approved")
                        {
                            sb.Append("The appointment of the following candidate has been approved by management, please proceed with placing an offer.<br> <br>");
                        }
                        else
                        {
                            sb.Append("The following candidate has been rejected by management.<br> <br>");
                        }
                        sb.Append("<table  border='1' style='width:50%;padding-left: 0px;font-size: 10pt;'><tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>REFERENCE NO</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + RequestForMPRef + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>INTERVIEWER NAME</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["InterviewerName"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>APPLICANT NAME</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["ApplicantName"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>INTERVIEW DATE</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + InterviewDate + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>INTERVIEW RESULT</label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["InterviewResult"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>POSITION APPLIED FOR </label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["PoitionAppliedFor"].ToString() + "</td></tr>");
                        sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>SALARY OFFERED </label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + dt_Request.DefaultView[0]["HRMSalaryOffered"].ToString() + "</td></tr>");
                        if (MNGComments != "")
                        {
                            sb.Append("<tr><td style='color:#08526D;font-weight:bold;padding-left:3px;'><label>MANAGEMENT COMMENTS </label> </td><td style='padding-left:1%;'>:</td><td style='padding-left:3px;'>" + MNGComments + "</td></tr>");
                        }
                        sb.Append("</table>");
                        sb.Append("</font>");
                        msg.Subject = "Interview Feedback Form -Management Action -(" + MNGMAction + ")";
                        break;
                }

                msg.Bcc.Add(new MailAddress("malek.ghany@eccgroup.ae", "Sr.Software Engineer"));
                msg.Bcc.Add(new MailAddress("daigy.machukattudevassia@eccgroup.ae", "Software Engineer"));
                msg.CC.Add(new MailAddress("richard.pegado@eccgroup.ae", "Sr. HR Officer"));
                msg.From = new MailAddress("hr.notification@eccgroup.ae");

                sb.Append("<font style='font-family:Trebuchet MS;font-size:10pt;'>You can click in this link to open the login page direct.  https://eccdatacenter.ae/ </font><br><br>");
                sb.Append("<font style='font-family:Trebuchet MS;font-size:10pt;'>*****This is an automated message. Please do not reply to this message using the reply address.*****</font><br><br>");

                msg.Body = sb.ToString();

                msg.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("hr.notification@eccgroup.ae", "Gucu5624");
                client.Port = 587;
                //client.Port = 25;
                client.Host = "smtp.office365.com";
                client.ServicePoint.MaxIdleTime = 1;
                client.ServicePoint.ConnectionLimit = 1;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.EnableSsl = true;
                try
                {
                    client.Send(msg);
                    Result = 1;
                }
                catch (Exception ec)
                {
                    throw ec;
                }
            }
            return Result;
        }
    }
}