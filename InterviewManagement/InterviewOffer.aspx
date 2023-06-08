<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InterviewOffer.aspx.cs" Inherits="InterviewManagement.InterviewOffer" %>

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

        .alert-fail {
            color: #f8f9fa;
            background-color: #df0a1d;
            border-color: #f5c6cb;
            text-align: center;
            font-size:large;
        }

        .alert-pass {
            color: #f8f9fa;
            background-color: #07a35d;
            border-color: #07a35d;
            text-align: center;
            font-size:large;
        }

        .alert-hold {
            color: #f8f9fa;
            background-color: #ed7917;
            border-color: #f5c6cb;
            text-align: center;
            font-size:large;
        }
        .option-input-radio1:checked {
            background: #044e2d;
        }
        .custcss{
            top: 4px;
            position: absolute;
            left: 20%;
        }
        .card-title{
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
    </style>
    <link href="Resources/Custom/css/RadioButton.css" rel="stylesheet" />
    <link href="Resources/Custom/css/Radiocss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <telerik:RadCodeBlock runat="server">
        <script>
            function checktheCorrectValue() {
                swal.fire({
                    title: 'Daigy updation',
                    timer: 5000,
                    icon: "warning",
                    buttonsStyling: false,
                    confirmButtonText: "OK",
                    customClass: {
                        confirmButton: "btn btn-info"
                    }
                });
            }
            function SuccessAlert(val) {
                
                if (val == "1") {
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
                        window.location.href = "InterviewOfferDetails.aspx";
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


            function loadershowNew() {
                if (Page_ClientValidate('SaveAll')) {
                    $("#loader").show();
                    return true;
                }
                else {
                    return false;
                }
            }
            function checkStatus() {

                
            var Radio1 = $("input[type='radio'].CheckS:checked").val();
            if (Radio1 == "Yes") {
                $("#ContentPlaceHolder1_CustomValidator1").css('display', 'none');
                $("#ContentPlaceHolder1_RejReason").css('display', 'none');
            }
           
        } 
        function checkStatus1() {
          
           
                var Radio1 = $("input[type='radio'].CheckS:checked").val();
                if (Radio1 == "No") {
                    $("#ContentPlaceHolder1_CustomValidator1").css('display', 'block');
                    $("#ContentPlaceHolder1_RejReason").css('display', 'block');

                }
            } 
            function Valid(sender, args) {
               
                var Radio1 = $("input[type='radio'].CheckS:checked").val();
                var TxtRejectReason = $("#ContentPlaceHolder1_TxtRejectReason").val();
                if (Radio1 == "No") {
                    if (Radio1 == "No" && TxtRejectReason != "") {
                        args.IsValid = true;
                    }
                    else
                        args.IsValid = false;
                }
                }
                
        </script>
    </telerik:RadCodeBlock>
    <h1>Mini Changed the Heading</h1>

    <div id="loader" style="display: none;"></div>
     <div id="Daigy_loader_Css" style="display: none;"></div>
     <div id="Jean_loader" style="display: none;"></div>
     <div id="Mini_loader" style="display: none;"></div>
    <asp:Button ID="Button2" runat="server" Text="Button" />
    <div class="card card-info">
        <div class="card-header">
            <h3 style="margin-bottom: -0.5rem!important; color: white;"><span>Interview Details
               <asp:LinkButton ID="LnkBtngoBack" Style="position: absolute;right: 10px;top: 5px;margin-top:-13px" 
                      CssClass="ml-6" Font-Bold="true" Font-Size="Medium" OnClick="LnkBtngoBack_Click"  CommandArgument='<%#Eval("TranId")%>' CausesValidation="false" runat="server">
                    <span>
                    <img style="width:75px;height:70px" src="Resources/Images/BackButton.png" />
                   </span>
                </asp:LinkButton></span>
              </h3>
        </div>
        <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecoratedControls="Textbox" ControlsToSkip="H4H5H6" />
        <div class="card-body">
            <div class="card ">
                <div class="card-header">
                    <h3 class="card-title">INTERVIEW DETAILS:
                                                            <telerik:RadLabel ID="lb_RequestForMPRef" runat="server"></telerik:RadLabel>
                    </h3>
                    <asp:HiddenField ID="hdTran_ID" runat="server" />
                </div>
                <div class="card-body" style="padding-bottom: 0px!important;">
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
                    <div class="col-md-12" style="margin-top: -1%;">
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
                    <div class="col-md-12" style="margin-top: -6px;">
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
                                                    <telerik:RadLabel ID="RadLabelInterviewAssessment" runat="server"></telerik:RadLabel>
                            </span></strong>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card-body"  style="padding-bottom: 0px!important;">
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
                                                <telerik:RadLabel ID="lbl_Education" runat="server" Width="100%"></telerik:RadLabel>
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
                                                <telerik:RadLabel ID="lbl_other" runat="server" Width="100%"></telerik:RadLabel>
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
                                            <telerik:RadLabel ID="lbl_PositionRecommended" runat="server" Width="100%"></telerik:RadLabel>
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
                                            <asp:Label ID="LblStatus" Height="15%" Font-Bold="true" Width="10%" runat="server" Text="Label"></asp:Label>
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
                    <div class="card-body"  style="padding-bottom: 0px!important;">
                        <div class="row" id="HrDivstatus" visible="false" runat="server">
                            <div class="col-md-12 alert-success">
                                <div class="row">
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
                                                   <span style="margin-top:1px;padding-bottom: 3px;"> <telerik:RadLabel ID="TxtMinSalary" runat="server" Width="100%"></telerik:RadLabel> </span>
                                               </div>
                                            </div>
                                            <div class="col-md-4 ml-0" style="border-right: 1px solid grey;">
                                               <div style="display: flex;">
                                                  <span style="margin-top: 6px;">Mid:</span>
                                                  <span style="margin-top: 1px;padding-bottom: 3px;"><telerik:RadLabel ID="TxtMidSalary" runat="server" Width="100%"></telerik:RadLabel> </span>
                                               </div>
                                            </div>
                                            <div class="col-md-4 ml-0">
                                               <div style="display: flex;">
                                                 <span style="margin-top: 6px;">Max:</span>
                                                 <span style="margin-top: 1px;padding-bottom: 3px;"><telerik:RadLabel ID="TxtMaxSalary" runat="server" Width="100%"></telerik:RadLabel> </span>
                                               </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-check mr-1"></i>Offer Accepted
                                        </strong>
                                        <telerik:RadLabel ID="radlblOfferAcceptedstatus" runat="server" Width="100%"></telerik:RadLabel>
                                    </div>
                                    <div class="col-md-3">
                                        <strong><i class="fas fa-check mr-1"></i>Action Date
                                        </strong>
                                        <telerik:RadLabel ID="lb_ActionDate" runat="server" Width="100%"></telerik:RadLabel>
                                    </div>
                                    <div class="col-md-6" runat="server" id="HrComments" style="margin-left: -2.8%;">
                                        <strong><i class="fas fa-list mr-1"></i>Comments
                                        </strong>
                                        <p class="text-muted">
                                            <telerik:RadLabel ID="TxtOfferComments" runat="server" Width="100%"></telerik:RadLabel>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <telerik:RadLabel ID="PendingHr" runat="server" Width="100%" Visible="false" Font-Underline="true" Font-Bold="true" ForeColor="Blue">Pending</telerik:RadLabel>
                    </div>
                </div>
            </div>
            <div class="card" style="background-color: #ffd7b5">
                <div class="card-header">
                    <h3 class="card-title">MANEGEMENT SECTION</h3>
                </div>
                <div class="row" style="margin: 10px;">
                    <div class="card-body"  style="padding-bottom: 0px!important;">
                        <div class="row" id="MngDivstatus" visible="false" runat="server">
                            <div class="col-md-3">
                                <div class="form-group row required">
                                    <div class="col-sm-6 input-group-prepend mt-1">
                                        <asp:Label ID="Label4" runat="server" Font-Bold="true" CssClass="form-group col-lg-11 frmlbNew">
                                                    <span>Approval status </span>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <telerik:RadLabel ID="RadMngstatus" runat="server" Width="100%"></telerik:RadLabel>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row required">
                                    <div class="col-sm-3 input-group-prepend mt-1">
                                        <asp:Label ID="Label5" runat="server" Font-Bold="true" CssClass="form-group col-lg-11 frmlbNew ">
                                                    <span>Comment </span>
                                        </asp:Label>
                                    </div>
                                    <div class="col-sm-6 ">
                                        <telerik:RadLabel ID="RadMngComment" runat="server" Width="100%"></telerik:RadLabel>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <telerik:RadLabel ID="PendingMng" runat="server" Width="100%" Visible="false" Font-Underline="true" Font-Bold="true" ForeColor="Blue">Pending</telerik:RadLabel>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body " >
            <div class="row" style="margin-top: -5px; margin-left: 4px!important;">
                <div class="col-md-12">
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                   
                </div>
            </div>
        </div>
    </div>
</asp:Content>

