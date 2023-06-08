using InterviewManagement.App_Code.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InterviewManagement
{
    public partial class Login : System.Web.UI.Page
    {
        DataTable dtlogin = new DataTable();
        General_BLL obj = new General_BLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string strReq = "";
            strReq = Request.RawUrl;
            strReq = strReq.Substring(strReq.IndexOf('?') + 1);
            string EmployeeCode = "";
            if (!strReq.Equals(""))
            {
                strReq = DecryptQueryString(strReq);
                string[] arrMsgs = strReq.Split('&');
                string[] arrIndMsg;
                if (arrMsgs.Length > 1)
                {
                    arrIndMsg = arrMsgs[0].Split('=');
                    EmployeeCode = arrIndMsg[1].ToString().Trim();

                    if (EmployeeCode != "")
                    {
                        dtlogin = obj.LoginValidate(EmployeeCode);
                        if (dtlogin.Rows.Count >= 1)
                        {
                            Session["ROLETYPE"] = "SPECIAL_USER";
                            Session["ROLE"] = dtlogin.Rows[0]["Role"].ToString();
                            Session["LOGIN_USERNAME"] = dtlogin.Rows[0]["UserName"].ToString();
                        }
                        else
                        {
                            Session["ROLETYPE"] = "SPECIAL_USER";
                            Session["ROLE"] = "DEPTHEAD";
                            Session["LOGIN_USERNAME"] = EmployeeCode;
                        }
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        Response.Redirect("frm_Access_Denied.aspx");
                    }
                }
            }
        }

        private string DecryptQueryString(string strQueryString)
        {
            EncryptDecryptQueryString objEDQueryString = new EncryptDecryptQueryString();
            return objEDQueryString.Decrypt(strQueryString, "r0b1nr0y");
        }
        public class EncryptDecryptQueryString
        {
            private byte[] key = { };
            private byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xab, 0xcd, 0xef };
            public string Decrypt(string stringToDecrypt, string sEncryptionKey)
            {
                byte[] inputByteArray = new byte[stringToDecrypt.Length + 1];
                try
                {
                    key = System.Text.Encoding.UTF8.GetBytes(sEncryptionKey);
                    DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                    inputByteArray = Convert.FromBase64String(stringToDecrypt);
                    MemoryStream ms = new MemoryStream();
                    CryptoStream cs = new CryptoStream(ms,
                    des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    System.Text.Encoding encoding = System.Text.Encoding.UTF8;
                    return encoding.GetString(ms.ToArray());
                }
                catch (Exception e)
                {
                    return e.Message;
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtLog = obj.epromiseLoginValidated(txt_UserName.Text.ToString(), txt_Password.Text.ToString());
                if (dtLog.Rows.Count >= 1)
                {
                    DataTable dt = obj.LoginValidate(txt_UserName.Text.ToString());
                    if (dt.Rows.Count >= 1)
                    {
                        Session["ROLETYPE"] = "SPECIAL_USER";
                        Session["ROLE"] = dt.Rows[0]["Role"].ToString();
                        Session["LOGIN_USERNAME"] = dt.Rows[0]["UserName"].ToString();
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {

            }


        }
    }
}