<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GroupSalaryRange.aspx.cs" Inherits="InterviewManagement.GroupSalaryRange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        .blackiconcolor{
            color:#0275d8;
        }
        .RadGrid {
        border-top-left-radius: 0px !important;
        border-top-right-radius: 0px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <telerik:RadCodeBlock runat="server">
        <script>
            function pagesizeCalc(sender, args) {
                var grid = $find("<%=RadGrid_Salary.ClientID%>");
                  var mtv = grid.get_masterTableView();
                  var pageIndex = mtv.get_currentPageIndex();
                  alert(pageIndex);
            }
            function OnGridCommand(sender, args) {
                if (args.get_commandName() == "Page") {
                    var grid = $find("<%=RadGrid_Salary.ClientID%>");
                    var mtv = grid.get_masterTableView();
                    var pageIndex = mtv.get_currentPageIndex();
                    var CurrentPage = pageIndex + 1;
                    $('#<%=hdnCurrentPage.ClientID %>').val(CurrentPage);

                }
            }
        </script>
        </telerik:RadCodeBlock>
     <div id="loader" style="display: none;"></div>
    <div class="card card-info">
        <div class="card-header">
            <h3 style="margin-bottom: -0.5rem!important; color: white;"><span>Group Salary Range</span></h3>
        </div>
        <asp:HiddenField ID="hdnCurrentPage" runat="server" />
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecoratedControls="Textbox" ControlsToSkip="H4H5H6" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="card-body">
                    <div class="row" style="margin-top: -5px; margin-left: 4px!important;">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-body">
                                    <div style="border: 1px solid #9babc2;border-top-left-radius: 10px; border-top-right-radius: 10px;height: 45px;">
                                        <div class="col-md-12">
                                             <div class="row">
                                         <div class="col-md-2" style="margin-top: 0.4%;">
                                           <i class="fas fa-plus-circle fa-2x blackiconcolor"  style="cursor: pointer;" id="AddNewPosition"><span style="font-size: 11pt;text-decoration:underline;">Add New Record</span></i>
                                         </div>
                                        <div class="col-md-8">

                                        </div>
                                        <div class="col-md-2"  style="margin-top: 0.18%;">
                                            <span>
                                                <asp:Button ID="btn_UpdateAll" runat="server" Text="Update(Current Page-1)" class="btn btn-block btn-warning" OnClick="btn_UpdateAll_Click"/>  <span ></span>
                                        </div>
                                                 </div>
                                            </div>
                                    </div>
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid_Salary"  GridLines="None" runat="server" HeaderStyle-Font-Bold="true" AllowAutomaticDeletes="false" AllowAutomaticInserts="false"
                                          AllowPaging="true" PageSize="30" AutoGenerateColumns="False" AllowMultiRowSelection="true" AllowFilteringByColumn="true" AllowSorting="false" DataSourceID="SD_Salary"
                                          OnItemCommand="RadGrid_Salary_ItemCommand"  FilterType="HeaderContext" EnableHeaderContextMenu="true" EnableHeaderContextFilterMenu="true" OnFilterCheckListItemsRequested="RadGrid_Salary_FilterCheckListItemsRequested" OnPageIndexChanged="RadGrid_Salary_PageIndexChanged" >
                                          <MasterTableView CommandItemDisplay="None" DataKeyNames="SalaryRangeTranID,WorkingAsCode,WorkingAsName,MinSalary,MidSalary,MaxSalary">
                                              <Columns>
                                                <telerik:GridBoundColumn DataField="SlNo" HeaderText="No" ReadOnly="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="50"  EnableHeaderContextMenu="false"/>
                                                <telerik:GridBoundColumn DataField="SalaryRangeTranID" HeaderText="SalaryRangeTranID" ReadOnly="true" ForceExtractValue="Always" Display="false"  EnableHeaderContextMenu="false"/>
                                                <telerik:GridBoundColumn DataField="WorkingAsCode" HeaderStyle-Width="150px"  HeaderText="Working As Code" FilterCheckListEnableLoadOnDemand="true" />
                                                <telerik:GridBoundColumn DataField="WorkingAsName" HeaderStyle-Width="250px"  HeaderText="Working As Name"  FilterCheckListEnableLoadOnDemand="true"/>
                                                <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Center" HeaderText="Min Salary"  HeaderStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_MinSalary" runat="server" Text='<%#Eval("MinSalary")%>'></asp:TextBox>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Center" HeaderText="Mid Salary" HeaderStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_MidSalary" runat="server" Text='<%#Eval("MidSalary")%>'></asp:TextBox>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Center" HeaderText="Max Salary" HeaderStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_MaxSalary" runat="server" Text='<%#Eval("MaxSalary")%>'></asp:TextBox>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                  <telerik:GridTemplateColumn HeaderText="Update" EnableHeaderContextMenu="false" HeaderStyle-Width="70px">
                                                    <ItemTemplate>
                                                        <telerik:RadImageButton ID="RadImageButtonapp" runat="server" Height="30px" Width="30px" Image-Url="Resources/Images/approved.png"
                                                            CommandArgument='<%#Eval("SalaryRangeTranID")%>' CommandName="Update">
                                                        </telerik:RadImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                 <telerik:GridTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" EnableHeaderContextMenu="false" ShowFilterIcon="false" Visible="true" HeaderText="Delete">
                                                      <ItemTemplate>
                                                           <telerik:RadPushButton ID="LnkBtnDelete"  ForeColor="Red"  Font-Bold="true" Font-Size="Medium" CommandName="Delete" CommandArgument='<%#Eval("SalaryRangeTranID")%>' CausesValidation="false" runat="server">
                                                                     <ConfirmSettings ConfirmText="Are you sure you want to Delete this Salary range ??" UseRadConfirm="true" Title="DELETE" />
                                                                  <Icon CssClass="rbRemove" />
                                                                 </telerik:RadPushButton>
                                                    </ItemTemplate>
                                                 </telerik:GridTemplateColumn>
                                            </Columns>
                                        </MasterTableView>
                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                        <ClientSettings>
  <ClientEvents OnCommand="OnGridCommand"  />
</ClientSettings>
                                    </telerik:RadGrid>
                                     <asp:SqlDataSource runat="server" ID="SD_Salary" ConnectionString='<%$ ConnectionStrings:MyConnectionString %>' 
                                         SelectCommand="USP_GetSalaryRange" SelectCommandType="StoredProcedure">
                                     </asp:SqlDataSource>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
     <div id="AddNewModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="width: 600px; align-self: center">
                    <div class="modal-header">
                         <h4 class="modal-title">Add New Position</h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body">
                            <asp:Panel runat="server" Font-Size="12pt" ID="Panel1">
                                <div class="card-body" style="margin-top: -49px;">
                                    <div class="card ">
                                        <div class="card-body">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <strong><i class="fas fa-user-tie mr-1"></i>Working As Code
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="SaveNew" Display="Dynamic" ControlToValidate="txt_Add_WorkingAsCode" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                        </strong>
                                                        <p class="text-muted">
                                                            <asp:TextBox ID="txt_Add_WorkingAsCode" runat="server" Width="100%"></asp:TextBox>
                                                        </p>
                                                    </div>
                                                     </div>
                                                    <div class="row">
                                                    <div class="col-md-12">
                                                        <strong><i class="fas fa-briefcase mr-1"></i>Working As Name
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="SaveNew" Display="Dynamic" ControlToValidate="txt_Add_WorkingAsName" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                        </strong>
                                                        <p class="text-muted">
                                                            <asp:TextBox ID="txt_Add_WorkingAsName" runat="server" Width="100%"></asp:TextBox>
                                                        </p>
                                                    </div>
                                                         </div>
                                                    <div class="row">
                                                    <div class="col-md-6">
                                                        <strong><i class="fas fa-warehouse mr-1"></i>Min Salary
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="SaveNew" Display="Dynamic" ControlToValidate="txt_Add_MinSalary" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                        </strong>
                                                        <p class="text-muted">
                                                            <asp:TextBox ID="txt_Add_MinSalary" runat="server" Width="100%"></asp:TextBox>
                                                        </p>
                                                    </div>
                                                         </div>
                                                    <div class="row">
                                                    <div class="col-md-6">
                                                        <strong><i class="far fa-building mr-1"></i>Mid Salary
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="SaveNew" Display="Dynamic" ControlToValidate="txt_Add_MidSalary" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                        </strong>
                                                        <p class="text-muted">
                                                           <asp:TextBox ID="txt_Add_MidSalary" runat="server" Width="100%"></asp:TextBox>
                                                        </p>
                                                    </div>
                                                         </div>
                                                    <div class="row">
                                                    <div class="col-md-6">
                                                        <strong><i class="far fa-building mr-1"></i>Max Salary
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="SaveNew" Display="Dynamic" ControlToValidate="txt_Add_MaxSalary" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                        </strong>
                                                        <p class="text-muted">
                                                           <asp:TextBox ID="txt_Add_MaxSalary" runat="server" Width="100%"></asp:TextBox>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                               <asp:Button ID="btn_SaveNewPosition" runat="server" Text="Save" OnClick="btn_SaveNewPosition_Click" class="btn btn-block btn-success"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     <script src="Resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="Resources/Custom/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(document).on('click', '#AddNewPosition', function () {// $("#AddNewPosition").click(function(){
                debugger;
                $("#AddNewModal").modal({ backdrop: 'static', keyboard: false })  
           
            });
          
        });
      
        function functionSave() {
            swal.fire({
                title: 'Saved successfully!!!',
                text: 'Redirecting...',
                timer: 3000,
                icon: "success",
                buttonsStyling: false,
                confirmButtonText: "OK",
                customClass: {
                    confirmButton: "btn btn-info"
                }
            })
        }
        function functionUpdate() {
            swal.fire({
                title: 'Updated successfully!!!',
                text: 'Redirecting...',
                timer: 3000,
                icon: "success",
                buttonsStyling: false,
                confirmButtonText: "OK",
                customClass: {
                    confirmButton: "btn btn-warning"
                }
            })
        }
        function functionDelete() {
            swal.fire({
                title: 'Deleted successfully!!!',
                text: 'Redirecting...',
                timer: 3000,
                icon: "success",
                buttonsStyling: false,
                confirmButtonText: "OK",
                customClass: {
                    confirmButton: "btn btn-danger"
                }
            })
        }

        function functionError() {
            swal.fire({
                title: 'Oops...',
                text: 'Something went wrong!',
                type: 'error',
                footer: 'please check your data & try again',
                timer: 3000,
                buttons: false,
            })
        }

    </script>
</asp:Content>
