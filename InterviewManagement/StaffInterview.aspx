<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffInterview.aspx.cs" Inherits="InterviewManagement.StaffInterview" %>

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
        .RadListBox .rlbTemplate {
            display: block;
            background-color: #e9f5f9;
        }
        .RadListBox_Office2010Blue .rlbHovered.rlbItem, .radLostBox_Office2010Blue .rlbHighlight {
            color: #1e395b!important;
            background-color: #76bdc9!important;
        }
        .RadListBox_Office2010Blue .rlbItem.rlbSelected {
            color: #1e395b!important;
            background-color: #4cb9cb!important;
        }
        .rbButton {
            padding: 4px 10px;
            min-width: 40px;
            border-width: 1px;
            border-style: solid;
            position: relative;
            -webkit-user-select: none;
            user-select: none;
        }
        .RadButton.rbButton span.rbIcon:before {
            box-shadow: none;
            padding: 2px;
        }
    </style>
    <link href="Resources/Custom/css/RadioButton.css" rel="stylesheet" />
    <link href="Resources/Custom/css/Radiocss.css" rel="stylesheet" />
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
               else  if (val == "3") {
                    swal.fire({
                        title: 'Attachment Deleted successfully!!!',
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
                else if (val == "4") {
                    swal.fire({

                        title: 'Your Submission saved successfully!!!',
                        text: 'Redirecting...',
                        icon: "success",
                        buttonsStyling: false,
                        confirmButtonText: "OK",
                        customClass: {
                            confirmButton: "btn btn-info"
                        }
                    }).then((result) => {
                        window.location.href = "InterviewDetails.aspx";
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

     <div id="Daigy_loader123" style="display: none;"></div>
    <div id="loader" style="display: none;"></div>
    <div class="card card-info">
        <div class="card-header">
            <h3 style="margin-bottom: -0.5rem!important; color: white;"><span>Interview Feedback Form
               <asp:LinkButton ID="LnkBtngoBack" Style="position: absolute;right: 10px;top: 5px;margin-top:-13px" 
                      CssClass="ml-6" Font-Bold="true" Font-Size="Medium" OnClick="LnkBtngoBack_Click"  CausesValidation="false" runat="server">
                    <span>
                    <img style="width:75px;height:70px" src="Resources/Images/BackButton.png" />
                   </span>
                </asp:LinkButton></span>
              </h3>
        </div>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecoratedControls="Textbox" ControlsToSkip="H4H5H6" />
     <%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
        <div class="card-body">
            <div class="row" style="margin-top: -5px; margin-left: 4px!important;">
                <div class="col-md-12">
                    <div class="card ">
                        <div class="card-header">
                            <h3 class="card-title">INTERVIEW DETAILS :<telerik:RadLabel ID="lb_RequestForMPRef" runat="server"></telerik:RadLabel> </h3>
                        </div>
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-user-tie mr-1"></i>Interviewer Name</strong>
                                        <p class="text-muted">
                                            <telerik:RadLabel ID="lb_Interviewer_Name" runat="server" Width="100%"></telerik:RadLabel>
                                        </p>
                                    </div>
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-briefcase mr-1"></i>Interviewer Position</strong>
                                        <p class="text-muted">
                                            <telerik:RadLabel ID="lb_InterviewerPosition" runat="server" Width="100%"></telerik:RadLabel>
                                        </p>
                                    </div>
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-warehouse mr-1"></i>Interviewer Division</strong>
                                        <p class="text-muted">
                                            <telerik:RadLabel ID="lb_InterviewerDept" runat="server" Width="100%"></telerik:RadLabel>
                                        </p>
                                    </div>
                                    <div class="col-md-3">
                                        <strong><i class="far fa-building mr-1"></i>Interviewer Company</strong>
                                        <p class="text-muted">
                                            <telerik:RadLabel ID="lb_Interviewer_Company" runat="server" Width="100%"></telerik:RadLabel>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <hr />
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-user-astronaut mr-1"></i>Applicant Name
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="SaveAll" Display="Dynamic" ControlToValidate="txt_ApplicantName" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </strong>
                                        <p class="text-muted">
                                            <asp:TextBox ID="txt_ApplicantName" runat="server" CssClass="minfo" Width="100%"></asp:TextBox>
                                        </p>
                                    </div>
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-briefcase mr-1"></i>Position Applied For
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="SaveAll" Display="Dynamic" ControlToValidate="Combo_WorkingAs" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </strong>
                                      <telerik:RadComboBox ID="Combo_WorkingAs" runat="server" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" Width="100%" Skin="Silk"
                                            DataSourceID="SD_WorkingAs" DataTextField="WorkingAsName" DataValueField="WorkingAsCode" CssClass="minfo" EmptyMessage="Select">
                                        </telerik:RadComboBox>
                                        <asp:SqlDataSource ID="SD_WorkingAs" runat="server" ConnectionString="<%$ ConnectionStrings:frConnectionString %>" SelectCommand="select distinct WorkingAsCode,WorkingAsName from tbl_E_PromiseMaster"></asp:SqlDataSource>
                                            <%--<asp:TextBox ID="txt_PositionAppliedFor" runat="server" CssClass="minfo" Width="100%"></asp:TextBox>--%>
                                       
                                    </div>
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-briefcase mr-1"></i>Division
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ValidationGroup="SaveAll" Display="Dynamic" ControlToValidate="Combo_Location" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </strong>
                                        <telerik:RadComboBox ID="Combo_Location" runat="server" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" Width="100%" Skin="Silk"
                                            DataSourceID="SD_Location" DataTextField="locationName" DataValueField="LocationCode" CssClass="minfo" EmptyMessage="Select">
                                        </telerik:RadComboBox>
                                        <asp:SqlDataSource ID="SD_Location" runat="server" ConnectionString="<%$ ConnectionStrings:frConnectionString %>" SelectCommand="select distinct locationName,LocationCode from tbl_E_PromiseMaster"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-briefcase mr-1"></i>Company
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" ValidationGroup="SaveAll" Display="Dynamic" ControlToValidate="Combo_Company" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </strong>
                                        <telerik:RadComboBox ID="Combo_Company" runat="server" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" Width="100%" Skin="Silk"
                                            DataSourceID="SD_Company" DataTextField="companyName" DataValueField="CompanyCode" CssClass="minfo" EmptyMessage="Select">
                                        </telerik:RadComboBox>
                                        <asp:SqlDataSource ID="SD_Company" runat="server" ConnectionString="<%$ ConnectionStrings:frConnectionString %>" SelectCommand="select distinct CompanyCode,companyName from tbl_E_PromiseMaster"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-file-alt mr-1 mt-2"></i>ERP Ref:
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="SaveAll" Display="Dynamic" ControlToValidate="txt_ErpRef" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </strong>
                                        <p class="text-muted">
                                            <asp:TextBox ID="txt_ErpRef" runat="server" CssClass="minfo" Width="100%"></asp:TextBox>
                                        </p>
                                    </div>
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-briefcase mr-1"></i>Interview Type:</strong>
                                        <div class="form-group clearfix">
                                            <input type="radio" class="option-input-radio1 radio Cck1" name="fooby1" runat="server" id="radioSuccess1" />In Person
                                                    <input type="radio" class="option-input-radio1 radio Cck1" name="fooby1" runat="server" id="radioSuccess2" />Video Conference
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <strong><i class="fas fa-calendar-alt mr-1"></i>Date Of Interview</strong>
                                        <p class="text-muted">
                                            <asp:Label runat="server" ID="lb_DateOfinterview" Width="100%"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <br />
            </div>
            <div class="col-md-12">
                <div class="card" style="background-color: #e9f5f9!important; margin-top: -20px;">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-2">
                                <strong><span class="card-title">INTERVIEW ASSESSMENT 
                                </span></strong>
                            </div>
                            <div class="col-md-9" style="margin-left: -4%">
                                <asp:TextBox ID="TxtInterviewAssessment" runat="server" CssClass="minfo" Width="100%" Text="Salary/Role budget is not to be discussed with Candidate"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin: 10px;">
                        <div class="card-body">
                            <span>Please rate between 1 and 10 for each of the criteria below:
                            </span>
                            <div class="row" style="" id="NewStaff_Div">
                                <div class="col-md-12">
                                    <table class="table "><%--table-bordered--%>
                                        <thead>
                                            <tr>
                                               <%-- <th style="width: 10px">SLNo.</th>--%>
                                                <th>Category</th>
                                                <th style="width: 150px">Score/10</th>
                                                <%--<th style="width: 10px">SLNo.</th>--%>
                                                <th>Category</th>
                                                <th style="width: 150px">Score/10</th>
                                                <%--<th style="width: 10px">SLNo.</th>--%>
                                                <th>Category</th>
                                                <th style="width: 150px">Score/10</th>
                                                <th>Category</th>
                                                <th style="width: 150px">Score/10</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                               <%-- <td>1.</td>--%>
                                                <td>Job Knowledge</td>
                                                <td>
                                                    <telerik:RadNumericTextBox ID="txt_JobKnowledge" RenderMode="Lightweight" runat="server" Width="50px" CssClass="val1 getTotal" NumberFormat-DecimalDigits="0" MaxValue="10" DisplayText="0"></telerik:RadNumericTextBox>
                                                </td>
                                               <%-- <td>3.</td>--%>
                                                <td>Communication Skills</td>
                                                <td>
                                                    <telerik:RadNumericTextBox ID="txt_CommunicationSkills" RenderMode="Lightweight" runat="server" Width="50px" CssClass="val3 getTotal" NumberFormat-DecimalDigits="0" MaxValue="10" DisplayText="0"></telerik:RadNumericTextBox>
                                                </td>
                                               <%-- <td>5.</td>--%>
                                                <td>Leadership Qualities</td>
                                                <td>
                                                    <telerik:RadNumericTextBox ID="txt_LeadershipQualities" RenderMode="Lightweight" runat="server" Width="50px" CssClass="val5 getTotal" NumberFormat-DecimalDigits="0" MaxValue="10" DisplayText="0"></telerik:RadNumericTextBox>
                                                </td>
                                                <td>Education</td>
                                                <td>
                                                    <telerik:RadNumericTextBox ID="txt_Education" RenderMode="Lightweight" runat="server" Width="50px" CssClass="val7 getTotal" NumberFormat-DecimalDigits="0" MaxValue="10" DisplayText="0"></telerik:RadNumericTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                               <%-- <td>2.</td>--%>
                                                <td>Experience</td>
                                                <td>
                                                    <telerik:RadNumericTextBox ID="txt_Experience" RenderMode="Lightweight" runat="server" Width="50px" CssClass="val2 getTotal" NumberFormat-DecimalDigits="0" MaxValue="10" DisplayText="0"></telerik:RadNumericTextBox>
                                                </td>
                                                <%--<td>4.</td>--%>
                                                <td>Confidence & Attitude</td>
                                                <td>
                                                    <telerik:RadNumericTextBox ID="txt_Confidence_Attitude" RenderMode="Lightweight" runat="server" Width="50px" CssClass="val4 getTotal" NumberFormat-DecimalDigits="0" MaxValue="10" DisplayText="0"></telerik:RadNumericTextBox>
                                                </td>
                                                <%--<td>6.</td>--%>
                                                <td>Physical Appearance</td>
                                                <td>
                                                    <telerik:RadNumericTextBox ID="txt_PhysicalAppearance" RenderMode="Lightweight" runat="server" Width="50px" CssClass="val6 getTotal" NumberFormat-DecimalDigits="0" MaxValue="10" DisplayText="0"></telerik:RadNumericTextBox>
                                                </td>
                                                <td>Other</td>
                                                <td>
                                                    <telerik:RadNumericTextBox ID="txt_other" RenderMode="Lightweight" runat="server" Width="50px" CssClass="val8 getTotal" NumberFormat-DecimalDigits="0" MaxValue="10" DisplayText="0"></telerik:RadNumericTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="9" style="text-align: center;">
                                                    <label style="color:blue;">Overall Mark :</label>
                                                    <asp:Label ID="txt_OvarAll" runat="server" CssClass="total" Text="0" ForeColor="DarkGreen" Font-Bold="true"></asp:Label>/10
                                                    <asp:HiddenField ID="hdn_OverAll" runat="server" Value="0" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">
                                                    Attachemnet if required
                                                </label>
                                                <div class="demo-container size-narrow">
                                                    <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" ID="Doc_Upload" MultipleFileSelection="Automatic" Width="500px" />
                                                    <%--<telerik:RadProgressArea RenderMode="Lightweight" runat="server" ID="RadProgressArea1" />--%>
                                                    <telerik:RadListBox BorderWidth="0" Visible="false" BackColor="#e9f5f9" BorderStyle="None" Width="100%" BorderColor="White" RenderMode="Lightweight" ID="RadListAttachment" runat="server">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LnkBtnDelete" OnClick="LnkDownload_Click" CssClass="mt-5" Text='<%#Eval("Doc_FileName")%>' Font-Bold="true" Font-Size="Medium" CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
                                                            </asp:LinkButton>
                                                            <telerik:RadPushButton ID="LinkButton1" ForeColor="Red" OnClick="LinkButton1_Click" Font-Bold="true" Font-Size="Medium" CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
                                                                <ConfirmSettings ConfirmText="Are you sure you want to Delete this Attachment ??" UseRadConfirm="true" Title="DELETE" />
                                                                <Icon CssClass="rbRemove" />
                                                            </telerik:RadPushButton>
                                                        </ItemTemplate>
                                                    </telerik:RadListBox>
                                                    <telerik:RadListBox BorderWidth="0" Visible="false" BackColor="#e9f5f9" BorderStyle="None" Width="100%" BorderColor="White" RenderMode="Lightweight" ID="RadListBoxTemp" runat="server">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LnkBtnDelete1" OnClick="LnkDownload_Click" CssClass="mt-5" Text='<%#Eval("Doc_FileName")%>' Font-Bold="true" Font-Size="Medium" CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </telerik:RadListBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">
                                                   Position Recommended
                                                </label>
                                                <asp:TextBox ID="txt_PositionRecommended" runat="server" CssClass="form-control minfo" Width="100%" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">
                                                    Please provide additional comments regarding the candidate / interview:
                                                </label>
                                                <asp:TextBox ID="txt_InterviewerComments" runat="server" CssClass="form-control" Width="100%" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="radio" class="option-input-success radio Cck" checked name="fooby" runat="server" id="Radio_Pass" />Pass
                                            <input type="radio" class="option-input-danger radio Cck" name="fooby" runat="server" id="Radio_Fail" />Fail
                                            <input type="radio" class="option-input-warning radio Cck" name="fooby" runat="server" id="Radio_Hold" />Hold Application
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:Button ID="Btn_Submit" CssClass="btn btn-block btn-success float-right" OnClick="Btn_Submit_Click" runat="server" Text="Send" OnClientClick="return loadershowNew();" ToolTip="Send To HR Manager" data-toggle="tooltip" />
                                        </div>
                                        <div class="col-md-1">
                                            <asp:Button ID="Btn_Update" CssClass="btn btn-block btn-warning float-right" OnClick="Btn_Update_Click" runat="server" Text="Update" OnClientClick="return loadershowNew();" ToolTip="Send To HR Manager " data-toggle="tooltip" />
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
      <%--      </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $(document).on('keyup', '.getTotal', function (e) {

                var total = 0;
                var val1 = $(".val1").val();
                if (val1 > 10) {
                    val1 = 10;
                }
                var val2 = $(".val2").val();
                if (val2 > 10) {
                    val2 = 10;
                }
                var val3 = $(".val3").val();
                if (val3 > 10) {
                    val3 = 10;
                }
                var val4 = $(".val4").val();
                if (val4 > 10) {
                    val4 = 10;
                }
                var val5 = $(".val5").val();
                if (val5 > 10) {
                    val5 = 10;
                }
                var val6 = $(".val6").val();
                if (val6 > 10) {
                    val6 = 10;
                }
                var val7 = $(".val7").val();
                if (val7 > 10) {
                    val7 = 10;
                }
                var val8 = $(".val8").val();
                if (val8 > 10) {
                    val8 = 10;
                }
                total = parseInt(val1) + parseInt(val2) + parseInt(val3) + parseInt(val4) + parseInt(val5) + parseInt(val6) + parseInt(val7) + parseInt(val8);
                total = parseFloat(total / 8);
                var formatted1 = Math.round(total).toFixed(1);
                $('#<%=txt_OvarAll.ClientID %>').text(formatted1);
                $('#<%=hdn_OverAll.ClientID %>').val(Math.round(total).toFixed(0));
            });

        });

    </script>
</asp:Content>
