using InterviewManagement.App_Code.BLL;
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
    public partial class GroupSalaryRange : System.Web.UI.Page
    {
        Interview_BLL objBLL = new Interview_BLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void RadGrid_Salary_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            RadGrid_Salary.DataSource = SD_Salary;
        }
        protected void RadGrid_Salary_FilterCheckListItemsRequested(object sender, Telerik.Web.UI.GridFilterCheckListItemsRequestedEventArgs e)
        {
            string DataField = (e.Column as IGridDataColumn).GetActiveDataField();
            e.ListBox.DataSource = GetDataTable(DataField);
            e.ListBox.DataKeyField = DataField;
            e.ListBox.DataTextField = DataField;
            e.ListBox.DataValueField = DataField;
            e.ListBox.DataBind();
        }
        public DataTable GetDataTable(string DataField)
        {
            DataView dv = (DataView)SD_Salary.Select(DataSourceSelectArguments.Empty);
            DataTable myDataTable = new DataTable();
            myDataTable = dv.ToTable();
            DataTable distinctValues = new DataTable();
            if (myDataTable.Rows.Count > 0)
            {
                DataView view = new DataView(myDataTable);
                distinctValues = view.ToTable(true, DataField);
                return distinctValues;
            }
            else
            {
                return distinctValues;
            }
        }

        protected void RadGrid_Salary_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                GridDataItem item1 = (GridDataItem)e.Item;
                GridDataItem dataItem = e.Item as GridDataItem;
                TableCell rf = (TableCell)item1["SalaryRangeTranID"];
                var SalaryRangeTranID = rf.Text;
                TableCell WorkingCode = (TableCell)item1["WorkingAsCode"];
                var WorkingAsCode = WorkingCode.Text;
                TableCell WorkingName = (TableCell)item1["WorkingAsName"];
                var WorkingAsName = WorkingName.Text;
                TextBox MinSalary = item1.FindControl("txt_MinSalary") as TextBox;
                var txt_MinSalary = MinSalary.Text;
                TextBox MidSalary = item1.FindControl("txt_MidSalary") as TextBox;
                var txt_MidSalary = MidSalary.Text;
                TextBox MaxSalary = item1.FindControl("txt_MaxSalary") as TextBox;
                var txt_MaxSalary = MaxSalary.Text;
                int OutPut = 0;
                OutPut = objBLL.SaveSalaryRange(Convert.ToInt32(SalaryRangeTranID), WorkingAsCode,WorkingAsName, txt_MinSalary, txt_MidSalary, txt_MaxSalary, "Update");
                if (OutPut >= 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "functionUpdate();", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "functionError();", true);
                }
                DataView dv = (DataView)SD_Salary.Select(DataSourceSelectArguments.Empty);
                DataTable myDataTable = new DataTable();
                myDataTable = dv.ToTable();
              
            }
            if (e.CommandName == "Delete")
            {
                GridDataItem item1 = (GridDataItem)e.Item;
                GridDataItem dataItem = e.Item as GridDataItem;
                TableCell rf = (TableCell)item1["SalaryRangeTranID"];
                var SalaryRangeTranID = rf.Text;
                int OutPut = 0;
                OutPut = objBLL.SaveSalaryRange(Convert.ToInt32(SalaryRangeTranID), "", "", "", "", "", "Delete");
                if (OutPut >= 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "functionDelete();", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "functionError();", true);
                }
                DataView dv = (DataView)SD_Salary.Select(DataSourceSelectArguments.Empty);
                DataTable myDataTable = new DataTable();
                myDataTable = dv.ToTable();
                
            }
        }

        protected void btn_SaveNewPosition_Click(object sender, EventArgs e)
        {
            int OutPut = 0;
            OutPut = objBLL.SaveSalaryRange(0, txt_Add_WorkingAsCode.Text.ToString(), txt_Add_WorkingAsName.Text.ToString(), txt_Add_MinSalary.Text.ToString(), txt_Add_MidSalary.Text.ToString(), txt_Add_MaxSalary.Text.ToString(), "Insert");
            if (OutPut >= 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "functionSave();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "functionError();", true);
            }
            DataView dv = (DataView)SD_Salary.Select(DataSourceSelectArguments.Empty);
            DataTable myDataTable = new DataTable();
            myDataTable = dv.ToTable();
            txt_Add_WorkingAsCode.Text = ""; 
            txt_Add_WorkingAsName.Text = "";
            txt_Add_MinSalary.Text = "";
            txt_Add_MidSalary.Text = "";
            txt_Add_MaxSalary.Text = "";
        }

        protected void RadGrid_Salary_PageIndexChanged(object sender, GridPageChangedEventArgs e)
        {
            btn_UpdateAll.Text = "Update(Current Page-" + hdnCurrentPage.Value + ")";
        }

        protected void btn_UpdateAll_Click(object sender, EventArgs e)
        {
            try
            {
                int OutPut = 0;

                DataTable dtMng = new DataTable();
                dtMng.Columns.AddRange(new DataColumn[6] {
                new DataColumn("SalaryRangeTranID", typeof(int)),
                new DataColumn("WorkingAsCode", typeof(string)),
                new DataColumn("WorkingAsName", typeof(string)),
                new DataColumn("MinSalary", typeof(string)),
                new DataColumn("MidSalary", typeof(string)),
                new DataColumn("MaxSalary", typeof(string)),
                });
                int count = RadGrid_Salary.MasterTableView.PageCount;
                //for (int i = 0; i < count; i++)
                //{
                //    RadGrid_Salary.CurrentPageIndex = i;
                    foreach (GridDataItem item in RadGrid_Salary.MasterTableView.Items)
                    {
                        TableCell rf = (TableCell)item["SalaryRangeTranID"];
                        var SalaryRangeTranID = rf.Text;
                        TableCell WorkingCode = (TableCell)item["WorkingAsCode"];
                        var WorkingAsCode = WorkingCode.Text;
                        TableCell WorkingName = (TableCell)item["WorkingAsName"];
                        var WorkingAsName = WorkingName.Text;
                        TextBox MinSalary = item.FindControl("txt_MinSalary") as TextBox;
                        var txt_MinSalary = MinSalary.Text;
                        TextBox MidSalary = item.FindControl("txt_MidSalary") as TextBox;
                        var txt_MidSalary = MidSalary.Text;
                        TextBox MaxSalary = item.FindControl("txt_MaxSalary") as TextBox;
                        var txt_MaxSalary = MaxSalary.Text;
                        dtMng.Rows.Add(SalaryRangeTranID, WorkingAsCode, WorkingAsName, txt_MinSalary, txt_MidSalary, txt_MaxSalary);
                    }
                //}
                if (dtMng.Rows.Count > 0)
                {
                    var Flag = true;
                    for (int i = 0; i < count; i++)
                    {
                        OutPut = OutPut = objBLL.SaveSalaryRange(Convert.ToInt32(dtMng.Rows[i]["SalaryRangeTranID"]),
                                dtMng.Rows[i]["WorkingAsCode"].ToString(), dtMng.Rows[i]["WorkingAsName"].ToString(),
                                dtMng.Rows[i]["MinSalary"].ToString(), dtMng.Rows[i]["MidSalary"].ToString(),
                                dtMng.Rows[i]["MaxSalary"].ToString(), "Update");
                        if (OutPut >= 1)
                        {
                            Flag = true;
                        }
                        else
                        {
                            Flag = false;
                            break;
                        }
                    }
                       
                   if(Flag)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "functionSave();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "functionError();", true);
                    }
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}