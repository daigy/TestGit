<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InterviewOffer_MNG.aspx.cs" Inherits="InterviewManagement.InterviewOffer_MNG" %>
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

        .frmlbNew {
            height: 30px;
            width: 190px !important;
            margin: 1px 4px !important;
            padding: 10px 0px !important;
            border-radius: 6px;
            line-height: 1.5px;
            box-shadow: 1px 2px #116564;
            color: #116564;
            font-size: 14px;
            font-weight: bolder;
            text-align: center;
            text-transform: capitalize;
            border: 2px solid #d2eae8;
            border-top-right-radius: 6px;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 10px;
        }

        .frmlbNew1 {
            height: 50px;
            width: 178px !important;
            margin: 1px 4px !important;
            padding: 10px 0px !important;
            border-radius: 6px;
            line-height: 14.5px;
            box-shadow: 1px 2px #116564;
            color: #116564;
            font-size: 14px;
            font-weight: bolder;
            text-align: center;
            text-transform: capitalize;
            border: 2px solid #d2eae8;
            border-top-right-radius: 6px;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 10px;
        }

        .custlbl span:first-letter {
            text-transform: uppercase;
        }

        .alert-fail {
            color: #f8f9fa;
            background-color: #df0a1d;
            border-color: #f5c6cb;
            text-align: center;
             border-radius: 50%;
            padding-top: 2px;
        }

        .alert-pass {
            color: #f8f9fa;
            background-color: #07a35d;
            border-color: #07a35d;
            text-align: center;
             border-radius: 50%;
            padding-top: 2px;
        }

        .alert-hold {
            color: #f8f9fa;
            background-color: #ed7917;
            border-color: #f5c6cb;
            text-align: center;
             border-radius: 50%;
            padding-top: 2px;
        }
        .modal-content {
            -webkit-box-shadow: 0 5px 15px rgb(0 0 0 / 50%);
            box-shadow: 0 5px 15px rgba(0,0,0,.5);
            margin-left: -450px;
        }
         #PopInterviewDetails .card-title{
            color:#ed8003!important;
            margin-bottom: 0!important;
            margin-top: -6px!important;
        }
       .table-bordered td, .table-bordered th {
    border: 1px solid #aeb1b4!important;
}
        .table td, .table th {
            padding: 0.3rem!important;
        }
       #PopInterviewDetails .card-body{
           padding-bottom: 0px!important;
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
                else if (val == "3") {
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
            function ShowPopup() {
                $('#PopInterviewDetails').modal({ show: true });
               /* $('#PopInterviewDetails').modal('show');*/
            }

            function loadershowNew() {
                /*if (Page_ClientValidate('SaveAll')) {*/
                    $("#loader").show();
                    return true;
                //}
                //else {
                //    return false;
                //}
            }
            function Closeloadershow() {

                $("#loader").hide();
                return true;
            }
            
            function fn_HistoryValid(sender, args) {
                var Radio1 = $("input[type='radio'].CheckS:checked").val();
                if (Radio1 == "Approve") {
                    <%--var listView = $find('<%= RadListHRMAction.ClientID %>');--%>
                    var TxtSalaryOffered = $telerik.findControl(listView.get_element().parentNode, "TxtSalaryOffered").get_value()
                    if (Radio1 == "Approve" && TxtSalaryOffered == "") {
                        args.IsValid = false;
                    }
                    else
                        args.IsValid = true;
                }
            }
            function fn_HistoryValid1(sender, args) {
                debugger;
                var Radio1 = $("input[type='radio'].CheckS:checked").val();
                if (Radio1 == "Reject") {
                    <%--var listView = $find('<%= RadListHRMAction.ClientID %>');--%>
                    var TxtComment = $("#ctl00_ContentPlaceHolder1_RadListMNGAction_ctrl0_TxtComment").val();

                    if (Radio1 == "Reject" && TxtComment == "") {
                        args.IsValid = false;
                    }
                    else
                        args.IsValid = true;
                }
            }
           
        </script>
    </telerik:RadCodeBlock>


    <div id="loader" style="display: none;"></div>
    <div class="card card-info">
        <div class="card-header">
            <h3 style="margin-bottom: -0.5rem!important; color: white;"><span>Management Approval</span></h3>
        </div>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecoratedControls="Textbox" ControlsToSkip="H4H5H6" />
        <div class="card-body">
            <div class="row" style="margin-top: -5px; margin-left: 4px!important;">
                <div class="col-md-12">
                    <div class="cardd ">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <telerik:RadListView ID="RadListMNGAction" RenderMode="Lightweight" runat="server"
                                        ItemPlaceholderID="Interview" OnNeedDataSource="RadListMNGAction_NeedDataSource" OnItemDataBound="RadListMNGAction_ItemDataBound" DataKeyNames="tranId,RequestForMPRef">
                                        <LayoutTemplate>
                                            <asp:PlaceHolder ID="Interview" runat="server"></asp:PlaceHolder>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <br />
                                            <div class="demo-container no-bg size-narrow card" style="margin: -10px 3%; margin-bottom: 4px;">
                                                <div class="card-header" style="background-color: rgba(0,0,0,.03)!important;">
                                                    <h4 class="card-title">REF No : <%# Eval("RequestForMPRef") %></h4>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row" style="margin-top: -5px; margin-left: 4px!important;">
                                                        <div class="col-md-4">
                                                            <div class="form-group row required">
                                                                <div class="col-sm-5 input-group-prepend">
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="true" CssClass="form-group  frmlbNew">
                                                                                        <span>Director : </span>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-sm-7">
                                                                    <asp:Label ID="Label3" runat="server" CssClass="form-group custlbl">
                                                                                        <span ><%# Session["LOGIN_name"] %></span>
                                                                    </asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group row required">
                                                                <div class="col-sm-5 input-group-prepend">
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="true" CssClass="form-group  frmlbNew">
                                                                                        <span>Applicant Name : </span>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-sm-7">
                                                                    <asp:Label ID="Label5" runat="server" CssClass="form-group custlbl">
                                                                                        <span > <%# Eval("ApplicantName") %></span>
                                                                    </asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group row required">
                                                                <div class="col-sm-6 input-group-prepend">
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="true" CssClass="form-group  frmlbNew">
                                                                                        <span>Position Applied For  : </span>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <asp:Label ID="Label7" runat="server" CssClass="form-group custlbl ml-0">
                                                                                        <span > <%# Eval("PoitionAppliedFor") %></span>
                                                                    </asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group row required">
                                                                <div class="col-sm-6 input-group-prepend">
                                                                    <asp:Label ID="Label1" runat="server" Font-Bold="true" CssClass="form-group  frmlbNew">
                                                                                        <span>Result: </span>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <asp:Label ID="LblInterviewResult" Font-Bold="true" Width="100px" Height="30px" runat="server" Text='<%# Eval("InterviewResult") %>'>
                                                                                <span > </span>
                                                                    </asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: -5px; margin-left: 4px!important;">
                                                        <div class="col-md-7  mt-4">
                                                            <div class="form-group row required">
                                                                <div class="col-sm-3 input-group-prepend">
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="true" CssClass="form-group col-lg-11 frmlbNew">
                                                                        <span>Comment : 
                                                                        <%--<asp:CustomValidator runat="server" ID="CustComment" ValidationGroup="SaveAll" ControlToValidate="TxtComment"
                                                                            ClientValidationFunction="fn_HistoryValid1" ErrorMessage="*" ForeColor="Red" ValidateEmptyText="true"> 
                                                                        </asp:CustomValidator>--%>
                                                                        </span>
                                                                    </asp:Label>
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <telerik:RadTextBox runat="server" RenderMode="Lightweight" CssClass="minfo col-lg-10 ml-0" ID="TxtComment" Width="100%"></telerik:RadTextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" card-footer col-md-12" style="margin-top: -5px; margin-left: 4px!important;">
                                                        <div class="row">
                                                             <div class="col-md-2"></div>
                                                            <div class="col-md-2">
                                                                <div class="form-group row required">
                                                                    <span class="text-muted">
                                                                       <input type="radio" class="option-input-radio1 radio Cck1 CheckS" name="fooby1" checked runat="server" id="radioSuccess1" value="Approve" />Approve
                                                                            <input type="radio" class="option-input-radio1 radio Cck1 CheckS" name="fooby1" runat="server" id="radioSuccess2" value="Reject" />Reject
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-1">
                                                                <asp:Button ID="BtnApprove" CssClass="btn btn-block btn-success float-right" OnClick="BtnApprove_Click" runat="server" Text="Save" OnClientClick="return loadershowNew();" ToolTip="Save" data-toggle="tooltip" />
                                                            </div>
                                                            <div class="col-md-1">
                                                                <asp:Button ID="Btn_View" CommandArgument='<%#Eval("TranId")%>' CssClass="btn btn-block btn-info float-right" OnClick="Btn_View_Click" runat="server" Text="View" ToolTip="View" data-toggle="tooltip" />
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:RadListView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="PopInterviewDetails" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="width: 1500px; align-self: center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                        <div class="card-body">
                            <asp:Panel runat="server" Font-Size="12pt" ID="Panel1">
                                <div class="card-body" style="margin-top:-49px;">
                                    <div class="card ">
                                        <div class="card-header">
                                            <h3 class="card-title">INTERVIEW DETAILS:
                                                            <telerik:RadLabel ID="lb_RequestForMPRef" runat="server"></telerik:RadLabel>
                                            </h3>
                                            <asp:HiddenField ID="hdTran_ID" runat="server" />
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
                                            <div class="col-md-12"  style="margin-top: -2%;">
                                                <hr />
                                            </div>
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <strong><i class="fas fa-user-astronaut mr-1"></i>Applicant Name
                                                        </strong>
                                                        <p class="text-muted">
                                                            <telerik:RadLabel ID="RadLabelApplicantName" runat="server" Width="100%"></telerik:RadLabel>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong><i class="fas fa-briefcase mr-1"></i>Position Applied For
                                                        </strong>
                                                        <telerik:RadLabel ID="RadLabelPositionAppliedFor" runat="server" Width="100%"></telerik:RadLabel>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong><i class="fas fa-briefcase mr-1"></i>Division
                                                        </strong>
                                                        <telerik:RadLabel ID="AppliedDivision" runat="server" Width="100%"></telerik:RadLabel>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong><i class="fas fa-briefcase mr-1"></i>Company
                                                        </strong>
                                                        <telerik:RadLabel ID="AppliedComapany" runat="server" Width="100%"></telerik:RadLabel>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <strong><i class="fas fa-file-alt mr-1 mt-2"></i>ERP Ref:</strong>
                                                        <p class="text-muted">
                                                            <telerik:RadLabel ID="lbl_ErpRef" runat="server" Width="100%"></telerik:RadLabel>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <strong><i class="fas fa-briefcase mr-1"></i>Interview Type:</strong>
                                                        <div class="form-group clearfix">
                                                            <telerik:RadLabel ID="RadLabelInterviewType" runat="server" Width="100%"></telerik:RadLabel>
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
                                    <div class="card  alert-info">
                                        <div class="card-header">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <strong><span class="card-title">INTERVIEW ASSESSMENT 
                                                    <telerik:RadLabel ID="RadLabelInterviewAssessment" runat="server" ></telerik:RadLabel>
                                                        </span></strong>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="card-body">
                                                <div class="row" style="margin: 10px;" id="NewStaff_Div">
                                                    <div class="col-md-12">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                   <%-- <th style="width: 10px">SLNo.</th>--%>
                                                                    <th>Category</th>
                                                                    <th style="width: 150px">Score/10</th>
                                                                   <%-- <th style="width: 10px">SLNo.</th>--%>
                                                                    <th>Category</th>
                                                                    <th style="width: 150px">Score/10</th>
                                                                    <%--<th style="width: 10px">SLNo.</th>--%>
                                                                    <th>Category</th>
                                                                    <th style="width: 150px">Scor/10</th>
                                                                    <th>Category</th>
                                                                    <th style="width: 150px">Score/10</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                  <%--  <td>1.</td>--%>
                                                                    <td>Job Knowledge</td>
                                                                    <td>
                                                                        <telerik:RadLabel ID="RadLabelJobKnowledge" runat="server" Width="100%"></telerik:RadLabel>
                                                                    </td>
                                                                   <%-- <td>3.</td>--%>
                                                                    <td>Communication Skills</td>
                                                                    <td>
                                                                        <telerik:RadLabel ID="RadLabelCommunicationSkills" runat="server" Width="100%"></telerik:RadLabel>
                                                                    </td>
                                                                   <%-- <td>5.</td>--%>
                                                                    <td>Leadership Qualities</td>
                                                                    <td>
                                                                        <telerik:RadLabel ID="RadLabelLeadershipQualities" runat="server" Width="100%"></telerik:RadLabel>
                                                                    </td>
                                                                    <td>Education</td>
                                                                    <td>
                                                                        <telerik:RadLabel ID="lbl_Education" runat="server" Width="100%" ></telerik:RadLabel>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                   <%-- <td>2.</td>--%>
                                                                    <td>Experience</td>
                                                                    <td>
                                                                        <telerik:RadLabel ID="RadLabeltxt_Experience" runat="server" Width="100%"></telerik:RadLabel>
                                                                    </td>
                                                                   <%-- <td>4.</td>--%>
                                                                    <td>Confidence & Attitude</td>
                                                                    <td>
                                                                        <telerik:RadLabel ID="RadLabelConfidence_Attitude" runat="server" Width="100%"></telerik:RadLabel>
                                                                    </td>
                                                                    <%--<td>6.</td>--%>
                                                                    <td>Physical Appearance</td>
                                                                    <td>
                                                                        <telerik:RadLabel ID="RadLabelPhysicalAppearance" runat="server" Width="100%"></telerik:RadLabel>
                                                                    </td>
                                                                    <td>Other</td>
                                                                    <td>
                                                                         <telerik:RadLabel ID="lbl_other" runat="server" Width="100%" ></telerik:RadLabel>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="9" style="text-align: center;">
                                                                        <label>Overall Mark :</label>
                                                                        <asp:Label ID="txt_OvarAll" runat="server" CssClass="total" Text="0" ForeColor="DarkGreen" Font-Bold="true"></asp:Label>/10
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
                                                                        <telerik:RadListBox BorderWidth="0" Visible="false" BackColor="#e9f5f9" BorderStyle="None" Width="100%" BorderColor="White" RenderMode="Lightweight" ID="RadListAttachment" runat="server">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="LnkBtnDelete" OnClick="LnkDownload_Click" CssClass="mt-5" Text='<%#Eval("Doc_FileName")%>' Font-Bold="true" Font-Size="Medium" CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
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
                                                                     <telerik:RadLabel ID="lbl_PositionRecommended" runat="server" Width="100%" ></telerik:RadLabel>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="exampleInputEmail1">
                                                                        Please provide additional comments regarding the candidate / interview:
                                                                    </label>
                                                                    <telerik:RadLabel ID="RadLabelInterviewerComments" runat="server" Width="100%"></telerik:RadLabel>
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
                                                                    <asp:Label ID="LblStatus" Height="15%" Font-Bold="true" Width="22%" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card alert-success">
                                        <div class="card-header">
                                            <h3 class="card-title">HR SECTION</h3>
                                        </div>
                                        <div class="row" style="margin: 10px;margin-top: -1%;">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12 alert-success">
                                                        <div class="row" >
                                                            <div class="col-md-3">
                                                                <strong><i class="fas fa-briefcase mr-1"></i>Salary Offered
                                                                </strong>
                                                                <p class="text-muted">
                                                                    <telerik:RadLabel ID="txt_SalaryOffered" runat="server" Width="100%"></telerik:RadLabel>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <strong><i class="fas fa-dollar-sign mr-1"></i>Group Salary Range
                                                                </strong>
                                                                <div class="row" style="border: 1px solid grey; margin-left: 2px;">
                                                                    <div class="col-md-4 ml-0" style="border-right: 1px solid grey;">
                                                                        <div style="display: flex;">
                                                                            <span style="margin-top: 6px;">Min:</span>
                                                                             <span style="margin-top:1px;padding-bottom: 3px;"><telerik:RadLabel ID="TxtMinSalary" runat="server" Width="100%"></telerik:RadLabel></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4 ml-0" style="border-right: 1px solid grey;">
                                                                        <div style="display: flex;">
                                                                            <span style="margin-top: 6px;">Mid:</span>
                                                                            <span style="margin-top: 1px; padding-bottom: 3px;"><telerik:RadLabel ID="TxtMidSalary" runat="server" Width="100%"></telerik:RadLabel></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4 ml-0">
                                                                        <div style="display: flex;">
                                                                            <span style="margin-top: 6px;">Max:</span>
                                                                            <span style="margin-top: 1px; padding-bottom: 3px;"><telerik:RadLabel ID="TxtMaxSalary" runat="server" Width="100%"></telerik:RadLabel> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-3 mt-2">
                                                                <strong><i class="fas fa-check mr-1"></i>Offer Accepted
                                                                </strong>
                                                                <telerik:RadLabel ID="radlblOfferAcceptedstatus" runat="server" Width="100%"></telerik:RadLabel>
                                                            </div>
                                                            <div class="col-md-3 mt-2">
                                                                <strong><i class="fas fa-check mr-1"></i>Action Date
                                                                </strong>
                                                                <telerik:RadLabel ID="lb_ActionDate" runat="server" Width="100%"></telerik:RadLabel>
                                                            </div>
                                                            <div class="col-md-6 mt-2" runat="server" id="HrComments" style="margin-left: -2.8%;">
                                                                <strong><i class="fas fa-list mr-1"></i>Comments
                                                                </strong>
                                                                <p class="text-muted">
                                                                    <telerik:RadLabel ID="TxtOfferComments" runat="server" Width="100%"></telerik:RadLabel>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
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
    </div>
   
    <script src="Resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="Resources/Custom/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>


