using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InterviewManagement
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string[] TobeDistinct = { "Colum1", "Colum2" };
            DataTable dt = new DataTable();
            dt.Columns.Add("Age", typeof(int));
            dt.Columns.Add("Name", typeof(string));
            dt.Rows.Add(1, "1fff");
            dt.Rows.Add(1, "1");
            dt.Rows.Add(1, "1fff");
            dt.Rows.Add(2, "2ggg");
            dt.Rows.Add(2, "2ggg");

            DataTable dtDistinct = GetDistinctRecords(dt, TobeDistinct);
        }
        public static DataTable GetDistinctRecords(DataTable dt, string[] Columns)
        {
            DataTable dtUniqRecords = new DataTable();
            dtUniqRecords = dt.DefaultView.ToTable(true, Columns);
            return dtUniqRecords;
        }
    }
}