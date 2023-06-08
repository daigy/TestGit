using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InterviewManagement
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ROLETYPE = "", ROLE = "", LOGIN_USERNAME = "";
            if (!IsPostBack)
            {
                try
                {
                    ROLETYPE = Session["ROLETYPE"].ToString();
                    ROLE = Session["ROLE"].ToString();
                    LOGIN_USERNAME = Session["LOGIN_USERNAME"].ToString();
                    if ((ROLETYPE != "") && (ROLE != "") && (LOGIN_USERNAME != ""))
                    {
                        //Response.Redirect("Default.aspx", true);
                    }
                    else
                    {
                        Response.Redirect("https://eccdatacenter.ae/");
                    }
                }
                catch
                {
                    Response.Redirect("https://eccdatacenter.ae/");
                }

            }
        }
    }
}