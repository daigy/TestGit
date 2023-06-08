<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InterviewOfferDetails.aspx.cs" Inherits="InterviewManagement.InterviewOfferDetails" %>
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
            <h3 style="margin-bottom: -0.5rem!important; color: white;"><span>Interview Log</span></h3>
        </div>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecoratedControls="Textbox" ControlsToSkip="H4H5H6" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="card-body">
                    <div class="row" style="margin-top: -5px; margin-left: 4px!important;">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-body">
                                    <telerik:RadFilter RenderMode="Lightweight" runat="server" DefaultFieldEditorFieldName="RequestForMPRef" ShowAddGroupExpressionButton="false" ID="RadFilter1" ApplyButtonText="Search" FilterContainerID="RadInterviewDetails" Skin="WebBlue" OnExpressionItemCreated="RadFilter1_ExpressionItemCreated">
                                      <FieldEditors> 
                                          <telerik:RadFilterDropDownEditor FieldName="InterviewStatus" DataTextField="InterviewStatus" DataValueField="InterviewStatus" />
                                      </FieldEditors>
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
                                                <telerik:GridBoundColumn DataField="TranId" HeaderText="TranId" ReadOnly="true" AllowFiltering="false" ForceExtractValue="Always" Display="false" />
                                                <telerik:GridBoundColumn DataField="RequestForMPRef" HeaderStyle-Width="100px"  HeaderText="Ref No" ReadOnly="false" />
                                                <telerik:GridBoundColumn DataField="IntervDate" HeaderStyle-Width="150px"  HeaderText="InterviewDate" ReadOnly="false" DataType="System.DateTime" DataFormatString="{0:dd-MMM-yyyy}" />
                                                 <telerik:GridBoundColumn DataField="InterviewerName"  HeaderText="Interviewer Name" ReadOnly="false" />
                                                <telerik:GridBoundColumn DataField="ApplicantName"  HeaderText="Applicant Name" ReadOnly="false" />
                                                <telerik:GridBoundColumn DataField="PoitionAppliedFor" HeaderText="Poition AppliedFor" ReadOnly="false" />
                                                <telerik:GridTemplateColumn  ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"  AllowFiltering="true"  UniqueName="InterviewStatus" HeaderText="Interview Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblInterHRStatus" runat="server" Text='<%#Eval("InterviewStatus")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="350px" />
                                               </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="200px"  Visible="true" HeaderText="View">
                                                     <ItemTemplate>
                                                        <asp:LinkButton ID="LnkBtnView" Visible="true"  CssClass="m-2" OnClick="LnkBtnView_Click" Text="ttt"  Font-Bold="true" Font-Size="Medium" CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
                                                                <span>
                                                                   <img style="width:25px;height:15px" src="Resources/Images/eye.gif" />
                                                                </span>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="InterviewStatus"  Visible="false" UniqueName="InterviewStatus" />
                                            </Columns>
                                        </MasterTableView>
                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                        <GroupingSettings CaseSensitive="false" />
                                    </telerik:RadGrid>
                                    
                                    <asp:SqlDataSource runat="server" ID="SD_InterviewDetailsHR" ConnectionString='<%$ ConnectionStrings:MyConnectionString %>' 
                                         SelectCommand="GetStaffInterviewList" SelectCommandType="StoredProcedure">
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