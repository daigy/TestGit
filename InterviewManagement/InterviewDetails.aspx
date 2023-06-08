<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InterviewDetails.aspx.cs" Inherits="InterviewManagement.InterviewDetails" %>
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
            <h3 style="margin-bottom: -0.5rem!important; color: white;"><span>Interview Details</span></h3>
        </div>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecoratedControls="Textbox" ControlsToSkip="H4H5H6" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="card-body">
                    <div class="row" style="margin-top: -5px; margin-left: 4px!important;">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-body">
                                    <telerik:RadGrid runat="server" ID="RadInterviewDetails"
                                        AllowPaging="true" RenderMode="Lightweight"
                                        Font-Size="10" OnNeedDataSource="RadInterviewDetails_NeedDataSource" OnItemDataBound="RadInterviewDetails_ItemDataBound" AutoGenerateColumns="false"
                                        AllowSorting="true" OnFilterCheckListItemsRequested="RadInterviewDetails_FilterCheckListItemsRequested"
                                        GroupingEnabled="true" HeaderStyle-Font-Bold="true"  CssClass="Gridmenu"
                                        EnableHeaderContextMenu="true" PageSize="15">
                                        <MasterTableView DataKeyNames="TranId" EnableHeaderContextFilterMenu="true"
                                            HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" Font-Bold="true"
                                            HeaderStyle-Font-Underline="true">
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="TranId" HeaderText="TranId" ReadOnly="true"
                                                    ForceExtractValue="Always" Display="false" />
                                                <telerik:GridBoundColumn DataField="RequestForMPRef" HeaderStyle-Width="100px"  HeaderText="Ref No" ReadOnly="false" />
                                                <telerik:GridBoundColumn DataField="IntervDate" HeaderStyle-Width="150px"  HeaderText="Interview Date" ReadOnly="false" DataType="System.DateTime" DataFormatString="{0:dd-MMM-yyyy}" />
                                                <telerik:GridBoundColumn DataField="InterviewerName"  HeaderText="Interviewer Name" ReadOnly="false" />
                                                <telerik:GridBoundColumn DataField="ApplicantName"  HeaderText="Applicant Name" ReadOnly="false" />
                                                <telerik:GridBoundColumn DataField="PoitionAppliedFor"  HeaderText="Position AppliedFor" ReadOnly="false" />
                                                <telerik:GridTemplateColumn  ItemStyle-HorizontalAlign="Center" Visible="false" HeaderText="Interview Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblInterstatus" runat="server" Text='<%#Eval("Interstatus")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="350px" />
                                               </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" EnableHeaderContextMenu="false" ShowFilterIcon="false" Visible="true" HeaderText="View/Edit">
                                                   
                                                  
                                                     <ItemTemplate>
                                                        <asp:LinkButton ID="LnkBtnView" Visible="true"  CssClass="m-2" OnClick="LnkBtnView_Click" Text="ttt"  Font-Bold="true" Font-Size="Medium" CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
                                                                <span>
                                                                   <img style="width:25px;height:15px" src="Resources/Images/eye.gif" />
                                                                </span>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                 <telerik:GridTemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" EnableHeaderContextMenu="false" ShowFilterIcon="false" Visible="true" HeaderText="Delete">
                                                      <ItemTemplate>
                                                           <telerik:RadPushButton ID="LnkBtnDelete"  ForeColor="Red"   OnClick="LnkBtnDelete_Click"  Font-Bold="true" Font-Size="Medium" CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
                                                                     <ConfirmSettings ConfirmText="Are you sure you want to Delete this Attachment ??" UseRadConfirm="true" Title="DELETE" />
                                                                  <Icon CssClass="rbRemove" />
                                                                 </telerik:RadPushButton>
                                                       <%--  <asp:LinkButton ID=""   OnClick="LnkBtnDelete_Click"   Font-Bold="true" Font-Size="Medium" CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
                                                             <span>
                                                                   <img  style="width:20px;height:20px" class="btn-block" src="Resources/Images/Del.png" />
                                                                </span>
                                                        </asp:LinkButton>--%>
                                                    </ItemTemplate>
                                                 </telerik:GridTemplateColumn>
                                            </Columns>
                                        </MasterTableView>
                                        <PagerStyle Mode="NextPrevAndNumeric" />

                                    </telerik:RadGrid>
                                     <asp:SqlDataSource runat="server" ID="SD_InterviewDetails" ConnectionString='<%$ ConnectionStrings:MyConnectionString %>' 
                                         SelectCommand="USP_StaffinterviewDataByInterviewer" SelectCommandType="StoredProcedure">
                                         <SelectParameters>
                                            <asp:SessionParameter SessionField="LOGIN_USERNAME" Name="LOGIN_USERNAME" DefaultValue=""></asp:SessionParameter>
                                        </SelectParameters>
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
