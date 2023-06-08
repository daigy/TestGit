<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InterviewSummary.aspx.cs" Inherits="InterviewManagement.InterviewSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .minfo {
            font-size: 1rem !important;
            margin-top: 2px;
        }

        .frmlb {
            width: 100% !important;
            font-size: 14px;
        }

        .RadLabel {
            margin-top: 6px !important;
        }
        .RadFilter .rfOper {
        text-transform: uppercase;
        display: none!important;
         }
         .RadFilter .rfText {
        padding: 4px 10px;
        height: 32px;
        border-width: 1px;
        border-style: solid;
        font: inherit;
        }
         .RadFilter .rfApply {
    padding: 1.6em 0 0;
    margin-top: -26px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <telerik:RadCodeBlock runat="server">
        <script>
            function SuccessAlert(val) {
                if (val == "1") {
                    swal.fire({
                        title: 'Your Submission saved successfully!!!',
                        text: 'Redirecting...',
                        timer: 5000,
                        icon: "success",
                        buttonsStyling: false,
                        confirmButtonText: "OK",
                        customClass: {
                            confirmButton: "btn btn-info"
                        }
                    });

                }
                else {
                    swal.fire({
                        title: 'Submission Failed Please try again',
                        timer: 5000,
                        icon: "warning",
                        buttonsStyling: false,
                        confirmButtonText: "OK",
                        customClass: {
                            confirmButton: "btn btn-info"
                        }
                    });
                }
                $("#loader").hide();
            }
           
           
            function loadershowNew() {
                if (Page_ClientValidate('SaveAll')) {
                    $("#loader").show();
                    return true;
                }
                else {
                    return false;
                }
            }
        </script>
    </telerik:RadCodeBlock>
     <div id="loader" style="display: none;"></div>
    <div class="card card-info">
        <div class="card-header">
            <h3 style="margin-bottom: -0.5rem!important; color: white;"><span>ECC Interview Details </span></h3>
        </div>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecoratedControls="Textbox" ControlsToSkip="H4H5H6" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="card-body">
                    <div class="row" style="margin-top: -5px; margin-left: 4px!important;">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-body">
                                    <telerik:RadFilter RenderMode="Lightweight" runat="server" DefaultFieldEditorFieldName="TranId" ShowAddGroupExpressionButton="false" ID="RadFilter1" FilterContainerID="RadInterviewDetails" Skin="WebBlue">
                                     
                                    </telerik:RadFilter><br />
                                    <telerik:RadGrid runat="server" ID="RadInterviewDetails"
                                        AllowPaging="true" RenderMode="Lightweight" 
                                        Font-Size="10" AutoGenerateColumns="false" OnItemDataBound="RadInterviewDetails_ItemDataBound"
                                        AllowSorting="true" DataSourceID="SD_InterviewDetailsHR"
                                        GroupingEnabled="true" HeaderStyle-Font-Bold="true" CssClass="Gridmenu"
                                         PageSize="15">
                                        <MasterTableView DataKeyNames="TranId" 
                                            HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" Font-Bold="true"
                                            HeaderStyle-Font-Underline="true">
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="TranId" HeaderText="TranId" ReadOnly="true"
                                                    ForceExtractValue="Always" Display="false" />
                                                <telerik:GridBoundColumn DataField="RequestForMPRef" HeaderStyle-Width="100px"  HeaderText="Ref No" ReadOnly="false" />
                                                <telerik:GridBoundColumn DataField="IntervDate" HeaderStyle-Width="150px"  HeaderText="InterviewDate" ReadOnly="false" DataType="System.DateTime" DataFormatString="{0:dd-MMM-yyyy}" />
                                                <telerik:GridBoundColumn DataField="ApplicantName"  HeaderText="Applicant Name" ReadOnly="false" />
                                                <telerik:GridBoundColumn DataField="PoitionAppliedFor" HeaderText="Poition AppliedFor" ReadOnly="false" />
                                                <telerik:GridTemplateColumn  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" EnableHeaderContextMenu="false" ItemStyle-VerticalAlign="Middle" ShowSortIcon="true" AllowSorting="true"  UniqueName="InterviewStatus" HeaderText="Interview Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblInterHRStatus" runat="server" Text='<%#Eval("InterHRStatus")%>'></asp:Label>
                                                </ItemTemplate>
                                                
                                                <HeaderStyle Width="350px" />
                                               </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="200px" EnableHeaderContextMenu="false" ShowFilterIcon="false" Visible="true" HeaderText="Action">
                                                   
                                                  
                                                     <ItemTemplate>
                                                        <asp:LinkButton ID="LnkBtnView" Visible="true"  CssClass="m-2" OnClick="LnkBtnView_Click" Text="ttt"  Font-Bold="true" Font-Size="Medium" CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
                                                                <span>
                                                                   <img style="width:25px;height:15px" src="Resources/Images/eye.gif" />
                                                                </span>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                 
                                            </Columns>
                                        </MasterTableView>
                                        <PagerStyle Mode="NextPrevAndNumeric" />

                                    </telerik:RadGrid>
                                    
                                    <asp:SqlDataSource runat="server" ID="SD_InterviewDetailsHR" ConnectionString='<%$ ConnectionStrings:MyConnectionString %>' 
                                         SelectCommand="select *,convert(datetime,InterviewDate) as IntervDate,case when InterviewTranId is null then 'Pending' else 'Submitted' end as InterHRStatus from [dbo].[tbl_StaffInterview] a left join tbl_InterviewOffer b on 
                                         a.TranId=b.InterviewTranId">
                                     </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
