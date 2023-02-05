﻿    <%@ Page Title="" Language="C#" MasterPageFile="~/PACS.master" AutoEventWireup="true" CodeFile="Business_Community_Details_form.aspx.cs" Inherits="RMS_BusinessCommunity_Details" EnableEventValidation="false" %>

 <%@ Register Assembly="RJS.Web.WebControl.PopCalendar.Net.2008" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    
          <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
          <fieldset>
            <legend>Business Search Criteria</legend>
            <table id="tblSearchCriteria" class="form">
                <tr>
                    <td class="right" style="width: 10%;">Card/NIC No:</td>
                    <td style="width: 22%;">
                        <input type="text"  id="txtCardNIC" />
                    </td>
                    <%--<td class="right" style="width: 10%;">Department/Unit:



                    </td>
                    <td style="width: 22%;">
                  

                        <asp:DropDownList ID="ddlDepartmentSearch" class="chzn-select" runat="server">                            
                        </asp:DropDownList>
                   
                    </td>--%>
                    <td class="right" style="width: 10%;">Designation:</td>
                    <td>
                   <input type="text" class="alpha" id="txtDesignationSearch" />
                    </td>
                    <td class="right" style="width: 10%;">Name:</td>
                    <td style="width: 22%;">
                        <input type="text" class="alpha" id="txtNameSearch" />
                    </td>

                </tr>
                <tr>
                    
                    <td class="right" style="width: 10%;">Status:</td>
                    <td style="width: 22%;">
                        <asp:DropDownList ID="ddlStatusSearch" class="chzn-select" runat="server">
                               <asp:ListItem Text="All" Value=""></asp:ListItem>
                               <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                <asp:ListItem Text="Black List" Value="BlackList"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td colspan="2" style="text-align: center">
                        <input type="button" id="btnSearch" class="btn" value="Search" onclick="getBusinessCommunityDetails();" />
                        <input type="button" id="btnClear" class="btn" value="Clear" onclick="clearSearchCriteria();" />
                    </td>
                </tr>
            </table>
        </fieldset>

        <div style="padding: 10px; text-align: center;">
            <input type="button" id="btnAddEmployee" class="btn" value="Add Business Community Details" onclick="addNewEmployee();" />
        </div>

        <fieldset id="fieldsetPersonalGrd" style="width: 97%;">
            <legend>Business Community Details</legend>

            <div style="padding-bottom: 20px; width: 100%; max-height: 440px; overflow: auto; ">
                <table id="tblBusinessDetails" class="dataTable" style="width:95%;">
                </table>
                <%--<table class="dataTable">
                    <thead>
                        <tr>
                           <th>Action &nbsp;&nbsp;</th>
                            <th>Edit</th>
                            <th>F.Members</th>
                            <th>Servants</th>
                            <th>P NO.</th>
                            <th style="display:nones;">Card #</th>
                            <th style="display:none">First Name</th>
                            <th style="display:none">Last Name</th>
                             <th > Name</th>
                            <th style="display:none">Category</th>
                            <th>Rank</th>
                            <th style="display:none;">Rank ID</th>

                            
                         
                        <th style="display:none">Designation</th>

                            <th>CNIC #</th>
                            <th style="display:none;">Date of Birth</th>
                             <th style="display:none;">Marital Status</th>
                             <th style="display:none;">Job Location</th>
                            <th style="display:none;">Near Location</th>
                             <th style="display:none;">Near Location ID</th>
                            <th>Department/Unit</th>
                             <th style="display:none;">Department ID</th>
                            <th style="display:none;">AllotmentDate</th>
                            <th style="display:none;">ReleaseDate</th>
                            <th style="display:none;">Cell #</th>
                            <th style="display:none;">Phone Office</th>
                            <th style="display:none;">Phone Home</th>
                            <th style="display:none;">Current Address</th>
                            <th style="display:none;">Permanent Address</th>
                            <th>Status</th>
                             <th>Photo</th>
                            <th>Detail</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyResidents" style="background-color:white;">
                        <tr>
                            <td colspan="19">&nbsp;</td>
                        </tr>
                    </tbody>
                </table>--%>

            </div>
        </fieldset>

        <div id="fieldsetPersonal" style="display: block;width:97%;">

               <fieldset >
            <legend>Business Community Form</legend>
            <table id="tblPersonal" class="form">

                 <tr id="trClose">
                    <td style="text-align: right; border: none">
                        <div id="close">
                            <img src='../images/btn_close02.png' style="background: none repeat scroll 0 0 transparent;
                                border: medium none; height: 32px; margin-top: -52px; position: absolute; width: 32px;
                                cursor: pointer; right: 434px; left: 98%;" alt="Close" onclick='return CloseModal();' />
                        </div>
                    </td>
                </tr>
                <tr style="line-height:12px;">
                    <%--<td class="right">Id:</td>
                    <td>
                        <input type="text" id="txtId" disabled="disabled" />
                    </td>--%>
                    <td class="right">CNIC:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtCNIC" class="req cnic" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td rowspan="4" align="left">
                     <div style="float: right; margin-right: 0px;">
                        <cc1:AsyncFileUpload OnClientUploadComplete="uploadComplete2" runat="server" ID="AsyncFileUpload1"
        Width="400px" UploaderStyle="Modern" ClientIDMode="AutoID" CompleteBackColor="White" UploadingBackColor="#CCFFFF" 
        ThrobberID="imgLoader"  OnUploadedComplete="FileUploadComplete" ToolTip="Click Here"   OnClientUploadStarted = "uploadStarted"/> <span class="btn" style="padding-left:50px;display:none;">select File</span>
                 <asp:HiddenField ID="hdnPictureId" runat="server" />
    <asp:Image ID="imgLoader" runat="server" ImageUrl="../images/loader.gif" /><br /><br />
 </div>
                        <div class="dummy" id="divdummyClass" style="float: right; margin-right: 100px;">  
                             <img id = "imgDisplay" alt="" src="" style = "display:none;height:100px;width:100px;"/>
                        </div>  
                    </td>
                </tr>
                <tr>
                    <td class="right">Name:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtName" />
                    </td>

                </tr>
                <tr>
                    

                    <td class="right" style="width: 20%;">Date of Birth:<span class="reqSpan">*</span></td>
                    <td style="width: 30%;">
                        <asp:TextBox ID="txtDob" TextMode="Date"  CssClass="date req"   runat="server" style="width:60%;float: left; margin-right: 5px;"></asp:TextBox>
                         <%--<rjs:popcalendar ID="Popcalendar2" Separator="/" Format="mm dd yyyy" Control="txtValidity" runat="server"
                                Font-Names="Tahoma" />--%>

                    </td>

                </tr>
                <tr>
                    <td class="right">Address:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtAddress" class="req" />
                    </td>
                </tr>
                <tr>
                    <td class="right">Father Name:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtFatherName" />
                    </td>
                    <td class="right">Identification Mark:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtIdentificationMark" />
                    </td>
                </tr>
                <tr>
                    <td class="right">Blood Group:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtBloodGroup" />
                    </td>
                    <td class="right">Security Clearance:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtSecurityClearance" />
                    </td>
                </tr>

                <tr>
                    <td class="right">Validity From:<span class="reqSpan">*</span></td>
                    <td>
                        
                        <asp:TextBox ID="txtValidityFrom" TextMode="Date" CssClass="date req"   runat="server" style="width:60%;float: left; margin-right: 5px;"></asp:TextBox>
                         <%--<rjs:popcalendar ID="Popcalendar4" Separator="/" Format="mm dd yyyy" Control="txtValidity" runat="server"
                                Font-Names="Tahoma" />--%>
                    </td>
                    <td class="right">Validity to:<span class="reqSpan">*</span></td>
                    <td>
                        
                        <asp:TextBox ID="txtValidity" TextMode="Date" CssClass="date req"   runat="server" style="width:60%;float: left; margin-right: 5px;"></asp:TextBox>
                         <%--<rjs:popcalendar ID="Popcalendar1" Separator="/" Format="mm dd yyyy" Control="txtValidity" runat="server"
                                Font-Names="Tahoma" />--%>
                    </td>
                    
                </tr>
                <tr>
                    
                    <td class="right">Business Community Category:</td>
                
                    <td>
                        <%--<asp:DropDownList ID="ddlBusinessCommunity" class="chzn-select" runat="server">                            
                        </asp:DropDownList>--%>
                        <asp:DropDownList ID="ddlBusinessCommunity" runat="server"></asp:DropDownList>
                    </td>
                    <td class="right">Designation:</td>
                
                    <td>
                        <input type="text" id="txtDesignation" class="req" />
                    </td>
                </tr>
            </table>

            <div class="btn-wrapper" style="padding-top: 20px;">
                <input type="button" id="btnSaveResident" class="btn" value="Save" onclick="saveBusinessCommunity();" />
                <input type="button" id="btnClearResident" class="btn" value="New" onclick="clearResidenet();" />

                <input type="hidden" id="hdnEID" runat="server" value="0" />
            </div>

        </fieldset>

        </div>
     

        <div id="divFMS" style="padding: 10px; text-align: center; display: none;">
            <input type="button" id="btnAddFamilyM" class="btn" value="Add Family Member" onclick="addFamilyM();" />
            <input type="button" id="btnAddServant" class="btn" value="Add Servant" onclick="AddServant();" />
        </div>

        <fieldset id="fieldsetFM" style="display: none;width:96%">
            <legend id="lgndFamilyMember">Family Member</legend>

            <table id="tblFamilyMember" class="form">
                <tr style="line-height:12px;" >
                    <td class="right">Id:</td>
                    <td>
                        <input type="text" id="txtIdFM" disabled="disabled"  />
                    </td>
                    
                    <td colspan="2"  rowspan="4">
                        <div style="float: right; margin-right: 0px;">
                        <cc1:AsyncFileUpload OnClientUploadComplete="uploadCompleteForFamily" runat="server" ID="AsyncFileUploadForFamily"
          Width="400px" UploaderStyle="Modern" ClientIDMode="AutoID" CompleteBackColor="White" UploadingBackColor="#CCFFFF" 
          ThrobberID="imgLoader"  OnUploadedComplete="FileUploadCompleteForFamily" ToolTip="Click Here"   OnClientUploadStarted = "uploadStartedForFamily"/> <span class="btn" style="padding-left:50px;display:none;">select File</span>
                 <asp:HiddenField ID="hdnPictureIdForFamily" runat="server" />
    <asp:Image ID="Image1" style="display:none;" runat="server" ImageUrl="../images/loader.gif" /><br /><br />
 </div>
                        <div class="dummy" id="divdummyClassForFamily" style="float: right; margin-right: 100px;">  
                             <img id = "imgDisplayForFamily" alt="" src="" style = "display:none;height:100px;width:100px;"/>

                        </div>
                    </td>

                </tr>
                <tr>
                     <td class="right">First Name:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtFirstNameFM" class="req alpha" />
                    </td>
                   

                </tr>
                <tr>
                     <td class="right">Last Name:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtLastNameFM" class="req alpha" />
                    </td>
                   

                </tr>
                <tr>
                     <td class="right">Relation:<span class="reqSpan">*</span></td>
                    <td>
                        <asp:DropDownList ID="ddlRelationFM" runat="server" class="chzn-select req">                            
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr >
                    <td  class="right" style="width: 20%;display:none;">Father/Husband:</td>
                    <td style="width: 30%;display:none;">
                        <input type="text" id="txtFatherHusbandFM" class="alpha" />
                    </td>
                    <td class="right" style="width: 20%;">NIC:</td>
                    <td style="width: 30%;">
                        <input type="text" id="txtNICFM" class="cnic" onblur="getEmployeeFamilyResultByCNIC();" />
                    </td>
                    <td class="right">Card Category:<span class="reqSpan">*</span></td>
                <td>
                    <asp:DropDownList ID="ddlFamilyCardCategory" class="chzn-select req" runat="server">
                        
                    </asp:DropDownList>
                </td>
                </tr>
                <tr>
                    <td class="right">Visit Purpose:</td>
                    <td>
                        <input type="text" id="txtVisitPurpose" />
                    </td>
                    <td class="right">Cell No:</td>
                    <td>
                        <input type="text" id="txtCellNoFM" class="cell" />
                    </td>
                </tr>
                <tr>
                    <td class="right">Card #:</td>
                    <td>
                        <input type="text" id="txtCardNoFM" disabled="disabled" />
                    </td>

                    <td class="right">Visitor Address:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtVisitorAdd" class="req" />
                    </td>
                </tr>
            </table>
            <div class="btn-wrapper" style="padding: 20px;">
                <input type="button" id="btnSaveFamilyMember" class="btn" value="Save" onclick="saveFamilyMember();" />
                <input type="button" id="btnClearFamilyMember" class="btn" value="New" onclick="clearFamilyMember();" />
                
            </div>
            <fieldset >
                <legend id="lgndFamilyMemberDetail">Family Members Detail</legend>
            
            <div style="padding-bottom: 20px; width: 98%; max-height: 300px; overflow: auto;">
                <table class="dataTable">
                    <thead>
                        <tr>
                            <th>Action</th>
                            <th>Edit</th>
                            <th>Card #</th>
                            <th>Name</th>
                            <th style="display:none;">First Name</th>
                            <th style="display:none;">Last Name</th>
                            <th>Relation</th>
                            <th>NIC</th>
                            <th>Mobile</th>
                            <th>Address</th>
                            <th>Visit Purpose</th>
                             <th>Status</th>
                            <th>Photo</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyFM" style="background-color:white;">
                    </tbody>
                </table>
            </div>
                </fieldset>
            
        </fieldset>
        
        <fieldset id="fieldsetServant" style="display: none; width:96.5%;">
            <legend id="lgndAddUpdateServant">Servant/Servant Family</legend>

           
            <div id="divServantInfo">
                 <div class="heading">Servant Info</div>
           <table id="tblServant" class="form">

                <tr id="trCloseforServant">
                    <td style="text-align: right; border: none">
                        <div id="closeforServant">
                            <img src='../images/btn_close02.png' style="background: none repeat scroll 0 0 transparent;
                                border: medium none; height: 32px; margin-top: -52px; position: absolute; width: 32px;
                                cursor: pointer; right: 434px; left: 98%;" alt="Close" onclick='return CloseModalForServant();' />
                        </div>
                    </td>
                </tr>
        <tr style="line-height:12px;" >
            <td class="right">Id:</td>
            <td>
                <input type="text" id="txtIdST" runat="server" disabled="disabled" />
            </td>
            <td>
                &nbsp;
            </td>
            <td  rowspan="4">
               <div style="float: right; margin-right: 0px;">
                   <cc1:AsyncFileUpload OnClientUploadComplete="uploadCompleteForServant" runat="server" ID="AsyncFileUploadForServant"
         Width="400px" UploaderStyle="Modern" ClientIDMode="AutoID" CompleteBackColor="White" UploadingBackColor="#CCFFFF" 
         ThrobberID="imgLoader"  OnUploadedComplete="FileUploadCompleteForServant" ToolTip="Click Here"   OnClientUploadStarted = "uploadStartedForServant"/> 
                 <asp:HiddenField ID="hdnPictureIdForServant" runat="server" />
    <asp:Image ID="Image2" style="display:none;" runat="server" ImageUrl="../../images/loader.gif" /><br /><br />
 </div>
                        <div class="dummy" id="divdummyClassForServant" style="float: right; margin-right: 100px;">  
                             <img id = "imgDisplayForServant" alt="" src="" style = "display:none;height:100px;width:100px;"/>

                        </div>
            </td>
        </tr>
        <tr>
            <td class="right">Card No:</td>
            <td>
                <input type="text" id="txtCardNoST" runat="server" disabled="disabled" />
            </td>

        </tr>
        <tr>

            <td class="right">First Name:<span class="reqSpan">*</span></td>
            <td>
                <input type="text" id="txtFirstNameST" runat="server" class="req alpha" />
            </td>

        </tr>
        <tr>
            <td class="right">Last Name:<span class="reqSpan">*</span></td>
            <td>
                <input type="text" id="txtLastNameST" runat="server" class="req alpha" />
            </td>
        </tr>
        <tr>
            <td class="right" style="width: 20%;">NIC:<span class="reqSpan">*</span></td>
            <td style="width: 30%;">
                <input type="text" id="txtNICST" runat="server" class="req cnic" onblur="getServantResultByCNIC();" />
            </td>
            <td class="right">Current Address:</td>
            <td>
                <input type="text" id="txtCurrentAddST" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="right">Date of Birth:<span class="reqSpan">*</span></td>
            <td>
         <%--       <input type="text" id="txtDOBST" runat="server" class="req" />--%>
                      <asp:TextBox ID="txtDOBST"   CssClass="req date"   runat="server" style="width:60%;float: left; margin-right: 5px;"></asp:TextBox>
                         <rjs:popcalendar ID="Popcalendar3" Separator="/" Format="mm dd yyyy" Control="txtDOBST" runat="server" To-Today="true"
                                Font-Names="Tahoma" />
            </td>
            <td class="right">Permanent Address:</td>
            <td>
                <input type="text" id="txtPermanentAddST" runat="server" />
            </td>


        </tr>
        <tr>
            <td class="right" style="width: 20%;">Father/Husband:</td>
            <td style="width: 30%;">
                <input type="text" id="txtFH" class="alpha" runat="server" />
            </td>

            <td class="right"  style="width: 20%;">Place of Work:</td>
                    <td style="width: 30%;">
                        <input type="text" id="txtPOWST"  runat="server"  />
                    </td>


        </tr>
        <tr>
            <td class="right">Religion:</td>
            <td>
                <asp:DropDownList ID="ddlReligionST" runat="server" class="chzn-select">
                    <asp:ListItem Text="Islam" Value="Islam"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="right">Phone Office:</td>
            <td>
                <input type="text" id="txtPhoneOfficeST" runat="server" class="phone" />
            </td>

        </tr>
  <%--      <tr>
            <td colspan="2"></td>

            <td class="right">Phone Home:</td>
            <td>
                <input type="text" id="txtPhoneHomeST" runat="server" class="phone"/>
            </td>
        </tr>--%>
       <tr>
              
                   
             <td class="right">Cell Phone:</td>
            <td >
                <input type="text" id="txtCellPhoneST" runat="server" class="cell" />
            </td>
                    <td class="right">Phone Home:</td>
                    <td>
                        <input type="text" id="txtPhoneHomeST" class="phone"  runat="server"  />
                    </td>
                </tr>
                 <tr>
              
                      <td class="right">Mark of Identification:</td>
                    <td>
                        <input type="text" id="txtMarkofIdentification" class="alpha"  runat="server"  />
                    </td>
                    
                </tr>
    </table>
                </div>
            <div class="btn-wrapper" style="padding-top: 20px;" id="divServantSaveClearButtons">
                <input type="button" id="btnSaveServant" class="btn" value="Save" onclick="saveServant();" />
                 <input type="button" id="btnNewServant" class="btn" value="New" onclick="ClearServantTable();" />
                
            </div>
             <fieldset style="width:96%;"  >
                <legend id="lgndServantDetail">Servant Detail</legend>
            
            <div style="padding-bottom: 20px; width: 1150px; max-height: 300px; overflow: auto;">
                <table class="dataTable">
                    <thead>
                        <tr>
                            <th>Action</th>
                            <th>Edit</th>
                            <th>Servant Family</th>
                            <th>Card #</th>
                             <th>Owner Name</th>
                            <th  style="display:none;">First Name</th>
                            <th  style="display:none;">Last Name</th>
                            <th>Name</th>
                            <th>Fahter/Husband Name</th>
                            <th style="display:none">DOB</th>
                            <th>Religion</th>
                            <th>CNIC #</th>
                            <th style="display:none">Mobile</th>
                            <th style="display:none">Office Phone #.</th>
                            <th style="display:none">Home Phone #.</th>
                            <th style="display:none">Current Address</th>
                            <th style="display:none">Permanent Address</th>
                            <th>Status</th>
                            <th>Photo</th>
                            <th>Detail</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyServant" style="background-color:white;">
                    </tbody>
                </table>
            </div>
                </fieldset>
            <div id="divServantFamily" style="display:none;">
            <div class="heading" id="lgndAddServantFamilyDetail">Servant Family Member</div>

            <div id="divFMSForm">
            <table id="tblFMSForm" class="form">
                <tr style="line-height:12px;" >
                    <td class="right">Id:</td>
                    <td>
                        <input type="text" id="txtIdFMS" disabled="disabled"  />
                    </td>
                    <td colspan="2" rowspan="3">
                        <div style="float: right; margin-right: 0px;">
                        <cc1:AsyncFileUpload OnClientUploadComplete="uploadCompleteForServantFamily" runat="server" ID="AsyncFileUploadForServantFamily"
        Width="400px" UploaderStyle="Modern" ClientIDMode="AutoID" CompleteBackColor="White" UploadingBackColor="#CCFFFF" 
        ThrobberID="imgLoader"  OnUploadedComplete="FileUploadCompleteForServantFamily" ToolTip="Click Here"   OnClientUploadStarted = "uploadStartedForServantFamily"/> 
                 <asp:HiddenField ID="hdnPictureIdForServantFamily" runat="server" />
    <asp:Image ID="Image3" style="display:none;" runat="server" ImageUrl="../../images/loader.gif" /><br /><br />
 </div>
                        <div class="dummy" id="divdummyClassForServantFamily" style="float: right; margin-right: 100px;">  
                             <img id = "imgDisplayForServantFamily" alt="" src="" style = "display:none;height:100px;width:100px;"/>

                        </div>
                    </td>

                </tr>
                <tr>
                   
                    <td class="right">First Name:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtFirstNameFMS" class="req alpha" />
                    </td>
                </tr>
                <tr>
                     <td class="right">Last Name:<span class="reqSpan">*</span></td>
                    <td>
                        <input type="text" id="txtLastNameFMS" class="req alpha" />
                    </td>                    

                </tr>
                <tr>                                        
                    <td class="right">NIC:</td>
                    <td>
                        <input type="text" id="txtNICFMS" class="cnic" onblur="getServantFamilyResultByCNIC();"/>
                    </td>
                </tr>
                <tr>
                    <td class="right" style="width:20%;">Profession:</td>
                    <td  style="width:30%;">
                        <input type="text" id="txtProfessionFMS" class="alpha" />
                    </td>
                    <td class="right"  style="width:20%;">Cell No:</td>
                    <td  style="width:30%;">
                        <input type="text" id="txtCellNoFMS" class="cell" />
                    </td>
                </tr>
                <tr>
                    <td class="right">Relation:<span class="reqSpan">*</span></td>
                     <td>
                        <asp:DropDownList ID="ddlRelationFMS" runat="server" class="chzn-select req">                            
                        </asp:DropDownList>
                    </td>                   

                    <td class="right">Place of Work:</td>
                    <td>
                        <input type="text" id="txtPOWFMS"  />
                    </td>
                </tr>
                <tr>
                     <td class="right">Card #:</td>
                    <td>
                        <input type="text" id="txtCardNoFMS" disabled="disabled" />
                    </td>
                </tr>
            </table>
                </div>
            <div class="btn-wrapper" style="padding: 20px;">
                    <input type="button" id="btnSaveFMS" class="btn" value="Save" onclick="saveServantFamilyMember();" />
                 <input type="button" id="btnClearServantFamily" class="btn" value="New" onclick="ClearServantFamilyTable();" />
                    </div>
                
            <fieldset>
                <legend id="lgndSevantFamilyDetail">Servant`s Family Detail</legend>
           
            <div style="padding-bottom: 20px; width: 98%; max-height: 300px; overflow: auto;">
                <table class="dataTable">
                    <thead>
                        <tr>
                            <th>Action</th>
                            <th>Edit</th>
                            <th>EID</th>
                            <th>Card #</th>
                            <th style="display:none;">First Name</th>
                            <th style="display:none;">Last Name</th>
                            <th>Name</th>
                            <th>Relation</th>
                            <th>NIC</th>
                            <th>Profession</th>
                            <th>Place of Work</th>
                            <th>Mobile</th>
                            <th>Status</th>
                            <th>Photo</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyFMS" style="background-color:white;">
                                        <tr>
                            <td colspan="9">&nbsp;</td>
                        </tr>
        
                    </tbody>
                </table>
            </div>
             </fieldset>
                </div>
        </fieldset>
    
        <div class="top-header" id="divBlackLisReasoning" style="display:none;">
             <fieldset>
                <legend>Reason for BlackList</legend>
                <table class="form">
                    <tr id="">
                        <td><input type="text" id="txtReason" /></td>
                         <td><input type="text" id="txtEmployeeIDS" /></td>
                </tr>
                           <%-- <div id="close">
                                <img src='../images/btn_close02.png' style="background: none repeat scroll 0 0 transparent; border: medium none; height: 32px; margin-top: -52px; position: absolute; width: 32px; cursor: pointer; right: 434px; left: 98%;"
                                    alt="Close" onclick='return CloseModal();' />
                            </div>--%>
                        
                                       
             
               </table>     
        <div class="btn-wrapper" style="padding-top: 20px;" id="">
                <input type="button" id="btnSaveReason" class="btn" value="Save " onclick="savereason();" />
              
                <input type="button" id="btnCloseReason" class="btn" value="Cancel " onclick="return CloseModalBlackList();" />
              </div>
            </fieldset>
         
               <%-- <tr>
                    <td>Reason:</td>
                    <td><input type="text" id="txtReason" /></td>
                </tr>--%>
         
           


        </div>
        <script type="text/javascript">


            var oTable;
            $(document).ready(function () {
                getBusinessDetails();
            });
            function dataTable() {
                $("#tblITProjDetails").dataTable({});
                //oTable = $("#tblITProjDetails").dataTable({
                //      bPaginate: true,
                //      bJQueryUI: true,
                //      oLanguage: { "sSearch": "Filter: " }
                //});
            }

            function getBusinessDetails() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Business_Community_Details_form.aspx/GetBusinessDetails",
                    data: "{}",
                    success: onsuccessgetBusinessDetails,
                    error: onretrievegetBusinessDetails
                });
                return false;
            }


            function onsuccessgetBusinessDetails(msg) {
                var data = msg.d;
                if (oTable != null) {
                    oTable.fnClearTable();
                    oTable.fnDestroy();
                }
                var tbl = "";
                tbl += "<thead>";
                tbl += "<tr>";
                tbl += "<th style='text-align:left; white-space:nowrap; display:none;'>Place ID</th>";
                tbl += "<th style='text-align:left; white-space:nowrap;'>Sr#</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>CNIC</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Name</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Date of Birth</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Address</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Father Name</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Identification Mark</th>";
                tbl += "<th style='text-align:center; white-space:nowrap;'>Blood Group</th>";
                tbl += "<th style='text-align:center; white-space:nowrap;'>Security Clearance</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Valid From</th>";
                
                tbl += "<th style='text-align:center; white-space:nowrap;'>Business Community</th>";
                tbl += "<th style='text-align:center; white-space:nowrap;'>Designation</th>";
                tbl += "<th style='text-align:center; white-space:nowrap;'>Photo</th>";
                tbl += "</tr>";
                tbl += "</thead>";
                tbl += "<tbody>";
                for (var i = 0; i < data.BusinessComDetails.length; i++) {
                    var j = i + 1;
                    tbl += "<tr>";
                    tbl += "<td style='text-align:right; white-space:nowrap; display:none;' id='txtProjID" + i + "'>" + data.BusinessComDetails[i].Id + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;'id='SR#" + i + "'>" + j + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBCNIC" + i + "'>" + data.BusinessComDetails[i].CNIC + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBName" + i + "'>" + data.BusinessComDetails[i].Name + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBDoB" + i + "'>" + data.BusinessComDetails[i].DOB + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBAddress" + i + "'>" + data.BusinessComDetails[i].address + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBFatherName" + i + "'>" + data.BusinessComDetails[i].FatherName + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBIdentificationMark" + i + "'>" + data.BusinessComDetails[i].IdentificationMark + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBBloodGroup" + i + "'>" + data.BusinessComDetails[i].BloodGroup + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBSecurity" + i + "'>" + data.BusinessComDetails[i].SecurityClearance + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBValidFrom" + i + "'>" + data.BusinessComDetails[i].ValidityFrom + "</td>";

                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBBusinessCom" + i + "'>" + data.BusinessComDetails[i].BusinessCommunityCategory + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBDesignation" + i + "'>" + data.BusinessComDetails[i].Designation + "</td>";
                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtBPhoto" + i + "'><img  src=<../RMS/CallBack/GetImageDatafromDB.aspx?PrimaryKeyIDValue='" + data.BusinessComDetails[i].Id + "&tableName=mctx_BusinessCommunityDetail&ImagecolumnName=NewPhoto&PrimaryKeyColumnName=Id&date=" + DateTime.Now + ")' height='50px' width='50px'/></td>";
                    tbl += "</tr>";
                }
                tbl += "</tbody>";
                tbl += "</table>";
                $("#tblBusinessDetails").html(tbl);
                dataTable();
                return false;
            }
            function onretrievegetBusinessDetails() {
                alert("Error In Loading Details!");
                return false;
            }
            //----------------------------------------------Start Get Employee Result on the basis of CNIC------------------------------------

            function getEmployeeResultByCNIC() {
                var CNIC = $("input[id$='txtNIC']").val();
                if ($("input[id$='txtId']").val() == "") {
                    if ($("input[id$='txtNIC']").val().indexOf('_') < 0) {


                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSwebmethods.aspx/GetEmpResultByCNIC",
                            data: "{'CNIC':'" + CNIC + "'}",
                            success: onsuccessGetEmployeeResult,
                            error: onErrorGetEmployeeResult
                        });
                        return false;

                    }



                    else
                        return false;

                }


            }

            function onsuccessGetEmployeeResult(msg) {

                var data = msg.d;
                var result = data.GetEmpCountTable[0].Counts;
                if (parseInt(result) > 0) {
                    alert("Resident already exist!");
                    $("input[id$='txtNIC']").val("");
                    return false;
                }
            }

            function onErrorGetEmployeeResult() {


            }



            //----------------------------------------------End Get Employee Result on the basis of CNIC------------------------------------
            //------------------------------------------------------start  get servant family result on the basis of CNIC--------------

            function getServantFamilyResultByCNIC() {
                var SFCNIC = $("input[id$='txtNICFMS']").val();
                if ($("input[id$='txtIdFMS']").val() == "") {
                    if ($("input[id$='txtNICFMS']").val().indexOf('_') < 0) {


                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSwebmethods.aspx/GetServantFamilyResultByCNIC",
                            data: "{'SFCNIC':'" + SFCNIC + "'}",
                            success: onsuccessGetServantFamilyResult,
                            error: onErrorGetservantfamilyResult
                        });
                        return false;

                    }



                    else
                        return false;

                }


            }

            function onsuccessGetServantFamilyResult(msg) {
                var data = msg.d;
                var result = data.GetServantfamilyCountTable[0].Counts;
                if (parseInt(result) > 0) {
                    alert("Servant family's member  already exist!");
                    // $("input[id$='txtNIC']").val("");
                    return false;
                }
            }

            function onErrorGetservantfamilyResult() {


            }



            //--------------------------------------------------End of servant family result-----------------
            //------------------------------------------------------start  get Employee family result on the basis of CNIC--------------

            function getEmployeeFamilyResultByCNIC() {
                var EFCNIC = $("input[id$='txtNICFM']").val();
                if ($("input[id$='txtIdFM']").val() == "") {
                    if ($("input[id$='txtNICFM']").val().indexOf('_') < 0) {


                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSwebmethods.aspx/GetEmployeeFamilyResultByCNIC",
                            data: "{'EFCNIC':'" + EFCNIC + "'}",
                            success: onsuccessGetEmployeeFamilyResult,
                            error: onErrorGetemployeefamilyResult
                        });
                        return false;

                    }



                    else
                        return false;

                }


            }

            function onsuccessGetEmployeeFamilyResult(msg) {
                var data = msg.d;
                var result = data.GetEmployeeFamilyCountTable[0].Counts;
                if (parseInt(result) > 0) {
                    alert("Employee family's member  already exist!");
                    // $("input[id$='txtNIC']").val("");
                    return false;
                }
            }

            function onErrorGetemployeefamilyResult() {


            }



            //--------------------------------------------------End of Employee family result-----------------

            //------------------------------------------------------start  get servant  result on the basis of CNIC--------------

            function getServantResultByCNIC() {
                var SCNIC = $("input[id$='txtNICST']").val();
                if ($("input[id$='txtIdST']").val() == "") {
                    if ($("input[id$='txtNICST']").val().indexOf('_') < 0) {


                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSwebmethods.aspx/GetServantResultByCNIC",
                            data: "{'SCNIC':'" + SCNIC + "'}",
                            success: onsuccessGetServantResult,
                            error: onErrorGetservantResult
                        });
                        return false;

                    }



                    else
                        return false;

                }


            }

            function onsuccessGetServantResult(msg) {
                var data = msg.d;
                var result = data.GetServantCountTable[0].Counts;
                if (parseInt(result) > 0) {
                    alert("Servant already exist!");
                    // $("input[id$='txtNIC']").val("");
                    return false;
                }
            }

            function onErrorGetservantResult() {


            }



            //--------------------------------------------------End of servant  result-----------------




            //   $(document).ready(function () { $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); });
            function readCookie(name) {
                var nameEQ = name + "=";
                var ca = document.cookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
                }
                return null;
            }
            function uploadStarted() {
                $get("imgDisplay").style.display = "none";
            }
            function uploadComplete2(sender, args) {

                //var a = $("input[id$='txtimangeName']").val();
                //alert(a+ "ha ja" )

                var name = readCookie("tabs").replace("url=", "");
                //alert(name + " Kuch nai bhai");
                var imgDisplay = $get("imgDisplay");
                imgDisplay.src = "../images/loader.gif";
                imgDisplay.style.cssText = "";
                var img = new Image();
                img.onload = function () {
                    imgDisplay.style.cssText = "height:100px;width:100px";
                    imgDisplay.src = img.src;
                };

                $("#divdummyClass").removeClass("dummy");


                img.src = "<%=ResolveUrl(UploadFolderPath) %>" + name + ".jpg";// args.get_fileName();
                    $("input[id$='hdnPictureId']").val(name);

                }


                function uploadStartedForFamily() {

                    $get("imgDisplayForFamily").style.display = "none";
                }
                function uploadCompleteForFamily(sender, args) {

                    //var a = $("input[id$='txtimangeName']").val();
                    //alert(a+ "ha ja" )

                    var name = readCookie("tabsForFamily").replace("urlForFamily=", "");

                    var imgDisplay = $get("imgDisplayForFamily");
                    imgDisplay.src = "../images/loader.gif";
                    imgDisplay.style.cssText = "";
                    var img = new Image();
                    img.onload = function () {
                        imgDisplay.style.cssText = "height:100px;width:100px";
                        imgDisplay.src = img.src;
                    };

                    $("#divdummyClassForFamily").removeClass("dummy");


                    img.src = "<%=ResolveUrl(UploadFolderPathForFamily) %>" + name + ".jpg";// args.get_fileName();

                    // alert(name + " Kuch nai bhai" +img.src);
                    $("input[id$='hdnPictureIdForFamily']").val(name);

                }

                function uploadStartedForServant() {

                    $get("imgDisplayForServant").style.display = "none";
                }
                function uploadCompleteForServant(sender, args) {

                    //var a = $("input[id$='txtimangeName']").val();
                    //alert(a+ "ha ja" )

                    var name = readCookie("tabsForServant").replace("urlForServant=", "");

                    var imgDisplay = $get("imgDisplayForServant");
                    imgDisplay.src = "../images/loader.gif";
                    imgDisplay.style.cssText = "";
                    var img = new Image();
                    img.onload = function () {
                        imgDisplay.style.cssText = "height:100px;width:100px";
                        imgDisplay.src = img.src;
                    };

                    $("#divdummyClassForServant").removeClass("dummy");


                    img.src = "<%=ResolveUrl(UploadFolderPathForServant) %>" + name + ".jpg";// args.get_fileName();

                    // alert(name + " Kuch nai bhai" +img.src);
                    $("input[id$='hdnPictureIdForServant']").val(name);

                }


                function uploadStartedForServantFamily() {

                    $get("imgDisplayForServantFamily").style.display = "none";
                }
                function uploadCompleteForServantFamily(sender, args) {

                    //var a = $("input[id$='txtimangeName']").val();
                    //alert(a+ "ha ja" )

                    var name = readCookie("tabsForServantFamily").replace("urlForServantFamily=", "");

                    var imgDisplay = $get("imgDisplayForServantFamily");
                    imgDisplay.src = "../images/loader.gif";
                    imgDisplay.style.cssText = "";
                    var img = new Image();
                    img.onload = function () {
                        imgDisplay.style.cssText = "height:100px;width:100px";
                        imgDisplay.src = img.src;
                    };

                    $("#divdummyClassForServantFamily").removeClass("dummy");


                    img.src = "<%=ResolveUrl(UploadFolderPathForServantFamily) %>" + name + ".jpg";// args.get_fileName();

                    // alert(name + " Kuch nai bhai" +img.src);
                    $("input[id$='hdnPictureIdForServantFamily']").val(name);

                }

                function hideFMS() { }

                function getBusinessCommunityDetails() {

                    //$("#fieldsetPersonalGrd").show();
                    //$("#fieldsetPersonal").hide();
                    //$("#fieldsetFM").hide();
                    //$("#fieldsetServant").hide();

                    ////var CNICResult = "";
                    ////if ($("input[id$='txtCardNIC']").val().trim() != "") {
                    ////    if ($("input[id$='txtCardNIC']").val().length > 12) {
                    ////        var str = $("input[id$='txtCardNIC']").val();
                    ////        str = str.replace(/\-/g, '');
                    ////        var string = str;
                    ////        var insert = "-";
                    ////        var position = "10";

                    ////        var result = [string.slice(0, 5), '-', string.slice(5)].join('');
                    ////        result = [result.slice(0, 13), '-', result.slice(13)].join('');
                    ////        var CNICResult = result;
                    ////    }

                    ////}


                    //$("#divFMS").hide();
                    //$.post("../RMS/CallBack/ResidentsHandler.aspx", { NIC: $("#txtCardNIC").val(), Dept: $("[id$='ddlDepartmentSearch']").val(), Desg: $("[id$='ddlDesignationSearch']").val(), Name: $("#txtNameSearch").val(), Status: $("[id$='ddlStatusSearch']").val() }).done(function (data) {
                    //    var response = data;
                    //    var start = data.indexOf("#StartResident#") + 15;
                    //    var end = data.indexOf("#EndResident#");
                    //    $("#tbodyResidents").html(response.substring(start, end));

                    //    if ($("#tbodyResidents tr").length == 0) {
                    //        $("#tbodyResidents").html("<tr><td class='noRecordFound' colspan='19'>No Record Found</td></tr>");
                    //    }

                    //    //  alert($("#tbodyVisitors tr").length);
                    //    if ($("select[id$='ddlStatusSearch']").val() == "Active") {

                    //        $(".ResidentInActive").css("display", "inline-block");
                    //        $(".ResidentActive").css("display", "none");


                    //    }
                    //    else if ($("select[id$='ddlStatusSearch']").val() == "Inactive") {

                    //        $(".ResidentInActive").css("display", "none");
                    //        $(".ResidentActive").css("display", "inline-block");
                    //    }

                    //    else {
                    //        // for (i = 0; i <= $("#tbodyVisitors tr").length; i++)
                    //        $("#tbodyResidents tr").each(function () {
                    //            // var data= $(this).find(".newImage").load("../RMS/CallBack/Handler.ashx?EID=58");
                    //            // $('.newImage').html('<img src="data:image/png;base64,' + data + '" />');
                    //            if ($(this).find('.status').html() == "Active") {
                    //                $(this).find(".ResidentInActive").css("display", "inline-block");
                    //                $(this).find(".ResidentBlackList").css("display", "inline-block");
                    //                $(this).find(".ResidentActive").css("display", "none");
                    //            }
                    //            else if ($(this).find('.status').html() == "InActive") {
                    //                $(this).find(".ResidentActive").css("display", "inline-block");
                    //                $(this).find(".ResidentBlackList").css("display", "inline-block");
                    //                $(this).find(".ResidentInActive").css("display", "none");
                    //            }

                    //            else {
                    //                $(this).find(".ResidentBlackList").css("display", "none");
                    //                $(this).find(".ResidentBlackList").parent().parent().css("color", "Red");
                    //                $(this).find(".ResidentBlackList").parent().parent().css("font-weight", "bold");
                    //                $(this).find(".ResidentActive").css("display", "inline-block");
                    //                $(this).find(".ResidentInActive").css("display", "inline-block");
                    //            }


                    //        });
                    //        // alert($("#tbodyVisitors tr").find('.status').html());
                    //    }
                    //});
                }

                function showHideImageForFamilyMembers() {

                    $("div[id*='AsyncFileUploadForFamily']").css("width", "400px");
                    $("input[id*='AsyncFileUploadForFamily']").val("");
                    $("div[id*='AsyncFileUploadForFamily']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUploadForFamily']").css("background-color", "");
                    $("input[id$='hdnPictureIdForFamily']").val("");
                    $("img[id$='imgDisplayForFamily']").hide();
                    $("#divdummyClassForFamily").addClass("dummy");
                }

                function getFamilyMembers(eid, callFrom) {
                    clearFamilyMember();
                    $("[id$='hdnEID']").val(eid);
                    $.post("../RMS/CallBack/FamilyMembersHandler.aspx", { EID: eid, Status: '' }).done(function (data) {
                        var response = data;
                        var start = data.indexOf("#StartFM#") + 9;
                        var end = data.indexOf("#EndFM#");
                        $("#tbodyFM").html(response.substring(start, end));

                        if ($("#tbodyFM tr").length == 0) {
                            $("#tbodyFM").html("<tr><td class='noRecordFound' colspan='11'>No Record Found</td></tr>");
                        }

                        $("#fieldsetFM").show();
                        $("#fieldsetPersonal").hide();
                        $("#fieldsetServant").hide();
                        if (callFrom == "Grid") {
                            $("#btnAddFM").show();
                        }
                        // for (i = 0; i <= $("#tbodyVisitors tr").length; i++)
                        $("#tbodyFM tr").each(function () {
                            //  alert($(".ownerName").html());
                            //$("#lgndFamilyMemberDetail").html($(".ownerName").html() + "`s Family Members Detail");
                            // $("#lgndFamilyMember").html("Add/Update Family Member of " + $(".ownerName").html())

                            $("#lgndFamilyMember").html("Add/Update Family Member of " + "<span style='color:blue'>" + $(".ownerName").html() + "</span>")
                            $("#lgndFamilyMemberDetail").html("Family Members Detail of " + "<span style='color:blue'>" + $(".ownerName").html() + "</span>")

                            if ($(this).find('.status').html() == "Active") {
                                $(this).find(".ResidentFamilyMemberInActive").css("display", "inline-block");
                                $(this).find(".ResidentFamilyMemberBlackList").css("display", "inline-block");
                                $(this).find(".ResidentFamilyMemberActive").css("display", "none");
                            }
                            else if ($(this).find('.status').html() == "InActive") {
                                $(this).find(".ResidentFamilyMemberActive").css("display", "inline-block");
                                $(this).find(".ResidentFamilyMemberBlackList").css("display", "inline-block");
                                $(this).find(".ResidentFamilyMemberInActive").css("display", "none");
                            }

                            else {
                                $(this).find(".ResidentFamilyMemberBlackList").css("display", "none");
                                $(this).find(".ResidentFamilyMemberBlackList").parent().parent().css("color", "Red");
                                $(this).find(".ResidentFamilyMemberBlackList").parent().parent().css("font-weight", "bold");
                                $(this).find(".ResidentFamilyMemberActive").css("display", "inline-block");
                                $(this).find(".ResidentFamilyMemberInActive").css("display", "inline-block");
                            }


                        });
                        //$(elem).closest("tr").after("<tr class='familymember'><td colspan='17'><div style='padding: 5px;color: #005978;font-weight: bold;font-style: italic;'>Family Members</div> " + response.substring(start, end) + "</td></tr>");
                    });
                    $("div[id*='AsyncFileUploadForFamily']").css("width", "400px");
                    $("div[id*='AsyncFileUploadForFamily']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUploadForFamily']").val("");
                    $("input[id*='AsyncFileUploadForFamily']").css("background-color", "");
                    $("input[id$='hdnPictureIdForFamily']").val("");
                    $("img[id$='imgDisplayForFamily']").hide();
                    $("#divdummyClassForFamily").addClass("dummy");



                    // alert($("#tbodyVisitors tr").find('.status').html());


                }

                function getServants(eid, callFrom) {

                    $("#trCloseforServant").hide();
                    $("[id$='hdnEID']").val(eid)
                    $.post("../RMS/CallBack/ServantsHandler.aspx", { EID: eid }).done(function (data) {
                        var response = data;
                        //var start = data.indexOf("#StartServant#") + 14;
                        //var end = data.indexOf("#EndServant#");
                        //$("#divServantInfo").html(response.substring(start, end));

                        var start = data.indexOf("#StartServantDet#") + 17;
                        var end = data.indexOf("#EndServantDet#");
                        $("#tbodyServant").html(response.substring(start, end));


                        $("#tbodyServant tr").each(function () {

                            // $("#lgndServantDetail").html("<span style='color:blue'>"+$(".ownerName").html() + "`s</span>"+ " Servant Detail");

                            $("#lgndAddUpdateServant").html("Add/Update Servant/Servant Family of " + "<span style='color:blue'>" + $(".ownerNameofServant").html() + "</span>")
                            $("#lgndServantDetail").html("Servant Detail of " + "<span style='color:blue'>" + $(".ownerNameofServant").html() + "</span>")

                            if ($(this).find('.status').html() == "Active") {
                                $(this).find(".tdServantInActive").css("display", "inline-block");
                                $(this).find(".tdServantBlackList").css("display", "inline-block");
                                $(this).find(".tdServantActive").css("display", "none");
                            }
                            else if ($(this).find('.status').html() == "InActive") {
                                $(this).find(".tdServantActive").css("display", "inline-block");
                                $(this).find(".tdServantBlackList").css("display", "inline-block");
                                $(this).find(".tdServantInActive").css("display", "none");
                            }

                            else {
                                $(this).find(".tdServantBlackList").css("display", "none");
                                $(this).find(".tdServantBlackList").parent().parent().css("color", "Red");
                                $(this).find(".tdServantBlackList").parent().parent().css("font-weight", "bold");
                                $(this).find(".tdServantActive").css("display", "inline-block");
                                $(this).find(".tdServantInActive").css("display", "inline-block");
                            }


                        });
                        //start = data.indexOf("#StartFMS#") + 10;
                        //end = data.indexOf("#EndFMS#");
                        //$("#tbodyFMS").html(response.substring(start, end));

                        //if ($("#tbodyFMS tr").length == 0) {
                        //    $("#tbodyFMS").html("<tr><td class='noRecordFound' colspan='9'>No Record Found</td></tr>");
                        //}

                        $("#fieldsetServant").show();
                        $("#fieldsetPersonal").hide();
                        $("#fieldsetFM").hide();
                        $("#divServantFamily").hide();
                        if (callFrom == "Grid") {
                            $("#btnAddFM").show();
                        }

                        $("div[id*='AsyncFileUploadForServant']").css("width", "400px");
                        $("input[id*='AsyncFileUploadForServant']").val("");
                        $("div[id*='AsyncFileUploadForServant']").css("margin-top", "-34px");
                        $("input[id*='AsyncFileUploadForServant']").css("background-color", "");

                        //$(elem).closest("tr").after("<tr class='familymember'><td colspan='17'><div style='padding: 5px;color: #005978;font-weight: bold;font-style: italic;'>Family Members</div> " + response.substring(start, end) + "</td></tr>");
                    });
                }
                function getServantFamily(sid, callFrom, Eid) {

                    $("[id$='hdnEID']").val(Eid);

                    $("#divServantFamily").show();
                    $("[id$='txtIdST']").val(sid);
                    $.post("../RMS/CallBack/ServantFamilyMembersHandler.aspx", { SID: sid }).done(function (data) {
                        var response = data;
                        var start = data.indexOf("#StartFMS#") + 10;
                        var end = data.indexOf("#EndFMS#");
                        $("#tbodyFMS").html(response.substring(start, end));


                        $("#tbodyFMS tr").each(function () {

                            $("#lgndAddServantFamilyDetail").html("Add/Update Servant Family Member of " + "<span style='color:blue'>" + $(".ownerNameofServantFamily").html() + "</span>")
                            $("#lgndSevantFamilyDetail").html("Servant`s Family Detail of " + "<span style='color:blue'>" + $(".ownerNameofServantFamily").html() + "</span>")


                            if ($(this).find('.status').html() == "Active") {
                                $(this).find(".tdServantFamilyInActive").css("display", "inline-block");
                                $(this).find(".tdServantFamilyBlackList").css("display", "inline-block");
                                $(this).find(".tdServantFamilyActive").css("display", "none");
                            }
                            else if ($(this).find('.status').html() == "InActive") {
                                $(this).find(".tdServantFamilyActive").css("display", "inline-block");
                                $(this).find(".tdServantFamilyBlackList").css("display", "inline-block");
                                $(this).find(".tdServantFamilyInActive").css("display", "none");
                            }

                            else {
                                $(this).find(".tdServantFamilyBlackList").css("display", "none");
                                $(this).find(".tdServantFamilyBlackList").parent().parent().css("color", "Red");
                                $(this).find(".tdServantFamilyBlackList").parent().parent().css("font-weight", "bold");
                                $(this).find(".tdServantFamilyActive").css("display", "inline-block");
                                $(this).find(".tdServantFamilyInActive").css("display", "inline-block");
                            }


                        });



                    });




                }


                function saveBusinessCommunity() {
                    $("#divMsg").hide();
                    if ($("input[id$='hdnPictureId']").val().indexOf(":") >= 0) {
                        $("input[id$='hdnPictureId']").val("");

                    }

                    //if (!validate("tblPersonal")) {
                    var request = "{"
                        + "'CNIC':'" + $.trim($("[id$='txtCNIC']").val()) + "',"
                        + "'Name':'" + $.trim($("[id$='txtName']").val()) + "',"
                        + "'Dob':'" + $.trim($("[id$='txtDob']").val()) + "',"
                        + "'Address':'" + $.trim($("[id$='txtAddress']").val()) + "',"
                        + "'FatherName':'" + $.trim($("[id$='txtFatherName']").val()) + "',"
                         + "'IdentificationMark':'" + $.trim($("[id$='txtIdentificationMark']").val()) + "',"
                         + "'BloodGroup':'" + $.trim($("[id$='txtBloodGroup']").val()) + "',"
                         + "'SecurityClearance':'" + $.trim($("[id$='txtSecurityClearance']").val()) + "',"
                        + "'validityForm':'" + $.trim($("[id$='txtValidityFrom']").val()) + "',"
                        + "'ValidityTO':'" + $.trim($("[id$='txtValidity']").val()) + "',"
                        + "'BusinessCategory':'" + $.trim($("[id$='ddlBusinessCommunity']").val()) + "',"
                        + "'Designation':'" + $.trim($("[id$='txtDesignation']").val()) + "',"
                        + "'Photo':'" + $("input[id$='hdnPictureId']").val() + "'"
                        + "}";
                    //Business_Community_Details_form.aspx/SaveBusinessCommunityDetails

                    //../RMS/RMSWebMethod.aspx/SaveBusinessCommunityDetails
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json",
                        url: "Business_Community_Details_form.aspx/SaveBusinessCommunityDetails",
                        data: request,
                        success: function (data) {
                            showSuccessMsg("Information saved successfully!");
                            $("[id$='hdnEID']").val(data.d);
                            $("[id$='txtId']").val(data.d);
                            $("#divFMS").show();
                            //$("#btnAddServant").show();
                            getBusinessCommunityDetails();
                        }
                    });

                }

                function clearResidenet() {
                    $("div[id*='AsyncFileUpload1']").css("width", "400px");
                    $("div[id*='AsyncFileUpload1']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUpload1']").val("");
                    $("input[id*='AsyncFileUpload1']").css("background-color", "");
                    $("input[id$='hdnPictureId']").val("");
                    $("img[id$='imgDisplay']").hide();
                    $("#dummy").addClass("dummy");
                    $("#tblPersonal input[type=text]").val("");
                    $("#tblPersonal select").val("");

                    $("[id$='hdnEID']").val("");

                }
                //---------------------------------------------Inactivate Employee Record------------------------------------------
                function InactiveEmployee(EID) {

                    if (confirm("Are you sure you wish to Inactive this User?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/InactiveEmployee",
                            data: "{'EID':'" + EID + "'}",
                            success: onsuccessInactiveEmployee
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessInactiveEmployee(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Black Listed Successfully!");
                    getBusinessCommunityDetails();
                    return false;
                }



                //-----------------------------------------------end-------------------------------------------------------------


                //---------------------------------------------Activate Employee Record------------------------------------------
                function ActivateEmployee(EID) {

                    if (confirm("Are you sure you wish to Activate this User?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/ActivateEmployeeRecord",
                            data: "{'EID':'" + EID + "'}",
                            success: onsuccessActivateUser
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessActivateUser(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Activated Successfully!");
                    getBusinessCommunityDetails();
                    return false;
                }


                //----------------------------------------Black List Employee---------------------------------------------------------------------------------------
                function CloseModalBlackList() {
                    //  Clear_Details();
                    // alert("test");
                    $("#divBlackLisReasoning").jqmHide();
                    $(".jqmWindow input, select").attr("disabled", false);
                    return false;
                }

                function savereason() {

                    var EmployeeID = $("input[id$='txtEmployeeIDS']").val();
                    var BlackListReason = $("input[id$='txtReason']").val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "../RMS/RMSWebMethod.aspx/AddEmployeeBLReason",
                        data: "{'EmployeeID':'" + EmployeeID + "','BlackListReason':'" + BlackListReason + "'}",
                        success: onsuccessSaveReson
                    });

                }
                var empBlackListFlag = false;
                function onsuccessSaveReson(msg) {
                    empBlackListFlag = true;
                    BlackListPACSResident($("input[id$='txtEmployeeIDS']").val(), true);
                }
                function BlackListPACSResident(EID, flag) {
                    //$("#divBlackLisReasoning").show();

                    // e.preventDefault();
                    if (flag != true && flag == true) {
                        $("input[id$='txtEmployeeIDS']").val("");
                        $("#txtEmployeeIDS").val(EID);
                        $('#divBlackLisReasoning').addClass("jqmWindow");
                        //$('#divChangePassword').css("margin-left", "-44%");
                        $('#divBlackLisReasoning').css("width", "45%");
                        $('#divBlackLisReasoning').css("z-index", "15");
                        $('#divBlackLisReasoning').jqm({ modal: true, overlay: 75, trigger: false });
                        $('#divBlackLisReasoning').jqmShow();
                    }
                    else if (confirm("Are you sure you wish to Black List this User?")) {
                        {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "../RMS/RMSWebMethod.aspx/BlackListResidentRecord",
                                data: "{'EID':'" + EID + "'}",
                                success: onsuccessBlackListResident
                            });
                        }
                        return false;
                    }


                    else
                        return false;

                }


                function onsuccessBlackListResident(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Black Listed Successfully!");
                    // CloseModalBlackList();
                    getBusinessCommunityDetails();
                    return false;
                }

                //-----------------------------------------------end-------------------------------------------------------------


                function saveFamilyMember() {
                    $("#divMsg").hide();

                    if ($("input[id$='hdnPictureIdForFamily']").val().indexOf(":") >= 0) {
                        $("input[id$='hdnPictureIdForFamily']").val("");

                    }
                    if ($.trim($("[id$='hdnEID']").val()) == "0") {
                        showErrorMsg("Please save Personal Information first!");
                        return false;
                    }
                    else {
                        if (!validate("tblFamilyMember")) {
                            var EFID = $.trim($("[id$='txtIdFM']").val()) == "" ? 0 : $.trim($("[id$='txtIdFM']").val());
                            var request = "{"
                                + "'EFID':'" + EFID + "',"
                                + "'EID':'" + $.trim($("[id$='hdnEID']").val()) + "',"
                                + "'FirstName':'" + $.trim($("[id$='txtFirstNameFM']").val()) + "',"
                                + "'LastName':'" + $.trim($("[id$='txtLastNameFM']").val()) + "',"
                                + "'Relation':'" + $.trim($("[id$='ddlRelationFM']").val()) + "',"
                                //+ "'RoleId':'" + $.trim($("[id$='txtFatherHusbandFM']").val()) + "',"
                                + "'NIC':'" + $.trim($("[id$='txtNICFM']").val()) + "',"
                                + "'CardNumber':'" + $.trim($("[id$='txtCardNoFM']").val()) + "',"
                                + "'Mobile':'" + $.trim($("[id$='txtCellNoFM']").val()) + "',"
                                + "'vpurpose':'" + $.trim($("[id$='txtVisitPurpose']").val()) + "',"
                                 + "'photo':'" + $.trim($("[id$='hdnPictureIdForFamily']").val()) + "',"
                                + "'vaddr':'" + $.trim($("[id$='txtVisitorAdd']").val()) + "',"
                                 + "'cardPrefix':'" + $("select[id$='ddlFamilyCardCategory']").val() + "'"
                                + "}";

                            $.ajax({
                                type: "POST",
                                dataType: "json",
                                contentType: "application/json",
                                url: "../RMS/RMSWebMethod.aspx/SaveFamilyMember",
                                data: request,
                                success: function () {
                                    showSuccessMsg("Information saved successfully!");
                                    $("#tblFamilyMember input[type=text]").val("");
                                    $("#tblFamilyMember select").val("");
                                    $("[id$='txtIdFM']").val("");
                                    getFamilyMembers($("[id$='hdnEID']").val(), 1);
                                    getBusinessCommunityDetails();
                                    $("#btnAddFM").hide();

                                    $("input[id$='txtVisitorAdd']").focus();
                                }
                            });
                        }
                    }

                }

                function ShowDetails_Modal(EID, elm, flag) {



                    editResident(EID, elm, flag);

                }
                function CloseModal() {
                    //  Clear_Details();
                    // alert("test");
                    $("#fieldsetPersonal").jqmHide();
                    $(".jqmWindow input, select").attr("disabled", false);
                    return false;
                }


                function ShowDetails_ModalForServant(SID, elm, flag) {
                    editServant(SID, elm, flag);
                }

                function CloseModalForServant() {
                    //  Clear_Details();
                    // alert("test");
                    $("#divServantInfo").jqmHide();
                    $(".jqmWindow input, select").attr("disabled", false);
                    return false;
                }

                function editResident(eid, elm, flag) {
                    if (flag == '1') {
                        //alert("testdjdjjdjd")
                        $('#fieldsetPersonal').addClass("jqmWindow");
                        $(".jqmWindow input, select").attr("disabled", true);
                        $("img[src$='Calendar.gif']").hide();
                        $('#fieldsetPersonal').css("margin-left", "-44%");
                        $('#fieldsetPersonal').css("width", "86%");
                        $('#trClose').show();
                        $("img[src$='btn_close02.png']").show();
                        $("input[id$='btnSaveResident']").hide();
                        $("div[id*='AsyncFileUpload1']").hide();
                        $('#fieldsetPersonal').jqm({ modal: true, overlay: 75, trigger: false });
                        $('#fieldsetPersonal').jqmShow();
                    }
                    else {
                        $('#fieldsetPersonal').css("margin-left", "0%");
                        $('#fieldsetPersonal').css("width", "97%");
                        $('#trClose').hide();
                        $("img[src$='btn_close02.png']").hide();
                        $("input[id$='btnSaveResident']").show();
                        $("div[id*='AsyncFileUpload1']").show();
                        $(".jqmWindow input, select").attr("disabled", false);
                        $("img[src$='Calendar.gif']").show();
                        $('#fieldsetPersonal').removeClass("jqmWindow");
                    }
                    $("div[id*='AsyncFileUpload1']").css("width", "400px");
                    $("input[id*='AsyncFileUpload1']").val("");
                    $("div[id*='AsyncFileUpload1']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUpload1']").css("background-color", "");
                    $("input[id$='hdnPictureId']").val("");
                    $("img[id$='imgDisplay']").hide();
                    $("#divdummyClass").addClass("dummy");


                    clearFamilyMember();
                    $("#tblPersonal input[type=text]").val("");
                    $("#tblPersonal select").val("");
                    $("[id$='hdnEID']").val(eid);
                    $("#txtId").val(eid);
                    $("#txtPNO").val($.trim($(elm).closest("tr").find(".pno").html()));
                    $("#txtFirstName").val($.trim($(elm).closest("tr").find(".fn").html()));
                    $("#txtLastName").val($.trim($(elm).closest("tr").find(".ln").html()));
                    $("#txtNIC").val($.trim($(elm).closest("tr").find(".nic").html()));
                    $("[id$='txtDOB']").val($.trim($(elm).closest("tr").find(".DOB").html()));

                    $("#txtCurrentAdd").val($.trim($(elm).closest("tr").find(".cAdd").html()));
                    $("[id$='ddlDeptUnit']").val($.trim($(elm).closest("tr").find(".dept").html()));
                    $("#txtPermanentAdd").val($.trim($(elm).closest("tr").find(".pAdd").html()));
                    $("[id$='ddlNearLoc']").val($.trim($(elm).closest("tr").find(".loc").html()));
                    $("#txtCellPhone").val($.trim($(elm).closest("tr").find(".mob").html()));
                    $("#txtCardNo").val($.trim($(elm).closest("tr").find(".cardNo").html()));
                    $("#txtPhoneHome").val($.trim($(elm).closest("tr").find(".poh").html()));

                    $("[id$='ddlCategory']").val($.trim($(elm).closest("tr").find(".pcat").html()));
                    $("[id$='ddlRank']").val($.trim($(elm).closest("tr").find(".rank").html()));
                    $("[id$='ddlDesignation']").val($.trim($(elm).closest("tr").find(".desg").html()));

                    $("#txtPhoneOffice").val($.trim($(elm).closest("tr").find(".pof").html()));

                    $("input[id$='txtAllotmentDate']").val($.trim($(elm).closest("tr").find(".altd").html()));
                    $("input[id$='txtValidity']").val($.trim($(elm).closest("tr").find(".reld").html()));

                    $("select[id$='ddlMaritalStatus']").val($.trim($(elm).closest("tr").find(".MaritalStatus").html()));
                    $("input[id$='txtJobLoc']").val($.trim($(elm).closest("tr").find(".jobloc").html()));

                    var CardPrefix = $.trim($(elm).closest("tr").find(".cardNo").html());
                    CardPrefix = CardPrefix.split('-')[0];
                    $("select[id$='ddlCardCategory']").val(CardPrefix);

                    var str = $(elm).closest("tr").find(".newImage img").attr("src");

                    var last = str.substring(str.lastIndexOf("/") + 1, str.length);

                    if (last.split('.')[0] != "") {
                        $("#imgDisplay").attr("src", str);
                        $("input[id$='hdnPictureId']").val(last.split('.')[0])
                        $("#imgDisplay").show();
                        $("#divdummyClass").removeClass("dummy");
                    }
                    else {
                        $("#imgDisplay").hide();
                        $("#divdummyClass").addClass("dummy");
                    }

                    $("#fieldsetPersonal").show();
                    $("#fieldsetFM").hide();
                    $("#txtPhoneHome").focus();
                    $("#fieldsetServant").hide();
                    //$("#txtValidity").val($.trim($(elm).find(".cardNo").html()));            
                    //window.location = "../RMS/AddResident.aspx?EID=" + eid + "&&Status=" + status + "&&E=R";

                    getRanks($(elm).closest("tr").find(".rank").html());

                }
                function editFM(eid, efid, elm) {
                    $("#tblFamilyMember input[type=text]").val("");
                    $("#tblFamilyMember select").val("");
                    $("[id$='txtIdFM']").val(efid);
                    $("[id$='hdnEID']").val(eid);

                    $("[id$='txtCardNoFM']").val($.trim($(elm).closest("tr").find(".cardNo").html()));
                    $("[id$='txtFirstNameFM']").val($.trim($(elm).closest("tr").find(".firstName").html()));
                    $("[id$='txtLastNameFM']").val($.trim($(elm).closest("tr").find(".lastName").html()));
                    $("[id$='ddlRelationFM']").val($.trim($(elm).closest("tr").find(".relation").html()));
                    $("[id$='txtNICFM']").val($.trim($(elm).closest("tr").find(".nic").html()));
                    $("[id$='txtCellNoFM']").val($.trim($(elm).closest("tr").find(".mobile").html()));
                    $("[id$='txtVisitorAdd']").val($.trim($(elm).closest("tr").find(".vAdd").html()));
                    $("[id$='txtVisitPurpose']").val($.trim($(elm).closest("tr").find(".vPurpose").html()));

                    var CardPrefix = $.trim($(elm).closest("tr").find(".cardNo").html());
                    CardPrefix = CardPrefix.split('-')[0];
                    $("select[id$='ddlFamilyCardCategory']").val(CardPrefix);

                    var str = $(elm).closest("tr").find(".phto img").attr("src");

                    var last = str.substring(str.lastIndexOf("/") + 1, str.length);

                    if (last.split('.')[0] != "") {
                        $("#imgDisplayForFamily").attr("src", str);
                        $("input[id$='hdnPictureIdForFamily']").val(last.split('.')[0])
                        $("#imgDisplayForFamily").show();
                        $("#divdummyClassForFamily").removeClass("dummy");
                    }
                    else {
                        $("#imgDisplayForFamily").hide();
                        $("#divdummyClassForFamily").addClass("dummy");
                    }

                    $("#fieldsetFM").show();
                    //$("#fieldsetPersonal").hide();            
                }

                function editFMS(eid, sid, elm) {

                    $("div[id*='AsyncFileUploadForServantFamily']").css("width", "400px");
                    $("input[id*='AsyncFileUploadForServantFamily']").val("");
                    $("div[id*='AsyncFileUploadForServantFamily']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUploadForServantFamily']").css("background-color", "");
                    // $("input[id$='hdnPictureIdForServantFamily']").val("");
                    $("img[id$='imgDisplayForServantFamily']").hide();
                    $("#divdummyClassForServantFamily").addClass("dummy");


                    $("#tblFMSForm input[type=text]").val("");
                    $("#tblFMSForm select").val("");
                    $("[id$='txtIdFMS']").val(sid);
                    $("[id$='hdnEID']").val(eid);

                    $("[id$='txtFirstNameFMS']").val($.trim($(elm).closest("tr").find(".firstName").html()));
                    $("[id$='txtLastNameFMS']").val($.trim($(elm).closest("tr").find(".lastName").html()));
                    $("[id$='txtNICFMS']").val($.trim($(elm).closest("tr").find(".nic").html()));
                    $("[id$='txtProfessionFMS']").val($.trim($(elm).closest("tr").find(".prof").html()));
                    $("[id$='txtCellNoFMS']").val($.trim($(elm).closest("tr").find(".mob").html()));
                    $("[id$='ddlRelationFMS']").val($.trim($(elm).closest("tr").find(".relation").html()));
                    $("[id$='txtPOWFMS']").val($.trim($(elm).closest("tr").find(".pow").html()));
                    $("[id$='txtCardNoFMS']").val($.trim($(elm).closest("tr").find(".cardNo").html()));

                    var str = $(elm).closest("tr").find(".phto img").attr("src");

                    var last = str.substring(str.lastIndexOf("/") + 1, str.length);

                    if (last.split('.')[0] != "") {
                        $("#imgDisplayForServantFamily").attr("src", str);
                        $("input[id$='hdnPictureIdForServantFamily']").val(last.split('.')[0])
                        $("#imgDisplayForServantFamily").show();
                        $("#divdummyClassForServantFamily").removeClass("dummy");
                    }
                    else {
                        $("#imgDisplayForServantFamily").hide();
                        $("#divdummyClassForServantFamily").addClass("dummy");
                    }

                }
                function saveServant() {
                    //alert($.trim($("[id$='hdnPictureIdForServant']").val()));
                    if ($("input[id$='hdnPictureIdForServant']").val().indexOf(":") >= 0) {
                        $("input[id$='hdnPictureIdForServant']").val("");

                    }
                    $("#divMsg").hide();
                    if (!validate("tblServant")) {
                        var SID = $.trim($("[id$='txtIdST']").val()) == "" ? 0 : $.trim($("[id$='txtIdST']").val());
                        var request = "{"
                            + "'SID':'" + SID + "',"
                            + "'EID':'" + $.trim($("[id$='hdnEID']").val()) + "',"
                            + "'FirstName':'" + $.trim($("[id$='txtFirstNameST']").val()) + "',"
                            + "'LastName':'" + $.trim($("[id$='txtLastNameST']").val()) + "',"
                            + "'NIC':'" + $.trim($("[id$='txtNICST']").val()) + "',"
                            + "'CurrAddr':'" + $.trim($("[id$='txtCurrentAddST']").val()) + "',"
                            + "'DOB':'" + $.trim($("[id$='txtDOBST']").val()) + "',"
                            + "'PerAddr':'" + $.trim($("[id$='txtPermanentAddST']").val()) + "',"
                            + "'FH':'" + $.trim($("[id$='txtFH']").val()) + "',"
                            + "'Mobile':'" + $.trim($("[id$='txtCellPhoneST']").val()) + "',"
                            + "'Religion':'" + $.trim($("[id$='ddlReligionST']").val()) + "',"
                            + "'PlaceofWork':'" + $.trim($("[id$='txtPOWST']").val()) + "',"
                            + "'MarkofIdentification':'" + $.trim($("[id$='txtMarkofIdentification']").val()) + "',"
                            + "'PhoneOffice':'" + $.trim($("[id$='txtPhoneOfficeST']").val()) + "',"
                            + "'Phonehome':'" + $.trim($("[id$='txtPhoneHomeST']").val()) + "',"
                            + "'Photo':'" + $.trim($("[id$='hdnPictureIdForServant']").val()) + "'"
                            + "}";

                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            contentType: "application/json",
                            url: "../RMS/RMSWebMethod.aspx/SaveServant",
                            data: request,
                            success: function (data) {
                                showSuccessMsg("Information saved successfully!");

                                $("[id$='txtIdST']").val(data.d);
                                getServants($.trim($("[id$='hdnEID']").val()));
                                getBusinessCommunityDetails();
                                ClearServantTable();
                                // alert($("[id$='txtIdST']").val());
                            }
                        });
                    }
                }

                function editServant(sid, elm, flag) {

                    if (flag == '1') {
                        $('#divServantInfo').addClass("jqmWindow");
                        $(".jqmWindow input, select").attr("disabled", true);
                        $("img[src$='Calendar.gif']").hide();
                        $('#divServantInfo').css("margin-left", "-44%");
                        $('#divServantInfo').css("width", "86%");
                        $('#trCloseforServant').show();
                        $("#divServantSaveClearButtons").hide();
                        $("div[id*='AsyncFileUploadForServant']").hide();

                        $('#divServantInfo').jqm({ modal: true, overlay: 75, trigger: false });
                        $('#divServantInfo').jqmShow();
                    }
                    else {
                        $('#divServantInfo').css("margin-left", "0%");
                        $('#divServantInfo').css("width", "97%");
                        $('#trCloseforServant').hide();

                        $("#divServantSaveClearButtons").show();
                        $("div[id*='AsyncFileUploadForServant']").show();
                        $(".jqmWindow input, select").attr("disabled", false);
                        $("img[src$='Calendar.gif']").show();
                        $('#divServantInfo').removeClass("jqmWindow");
                        $('#divServantInfo').show();
                    }


                    $("div[id*='AsyncFileUploadForServant']").css("width", "400px");
                    $("input[id*='AsyncFileUploadForServant']").val("");
                    $("div[id*='AsyncFileUploadForServant']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUploadForServant']").css("background-color", "");
                    $("input[id$='hdnPictureIdForServant']").val("");
                    $("img[id$='imgDisplayForServant']").hide();
                    $("#divdummyClassForServant").addClass("dummy");

                    $("[id$='txtIdST']").val(sid);
                    // $("[id$='hdnEID']").val();

                    $("[id$='txtFirstNameST']").val($.trim($(elm).closest("tr").find(".firstName").html()));
                    $("[id$='txtLastNameST']").val($.trim($(elm).closest("tr").find(".lastName").html()));
                    $("[id$='txtNICST']").val($.trim($(elm).closest("tr").find(".nic").html()));

                    $("[id$='txtCurrentAddST']").val($.trim($(elm).closest("tr").find(".curAddr").html()));
                    $("[id$='txtDOBST']").val($.trim($(elm).closest("tr").find(".dob").html()));
                    $("[id$='txtPermanentAddST']").val($.trim($(elm).closest("tr").find(".PerAdd").html()));
                    $("[id$='txtFH']").val($.trim($(elm).closest("tr").find(".fh").html()));

                    $("[id$='ddlReligionST']").val($.trim($(elm).closest("tr").find(".religion").html()));
                    $("[id$='txtPhoneOfficeST']").val($.trim($(elm).closest("tr").find(".phof").html()));
                    $("[id$='txtPOWST']").val($.trim($(elm).closest("tr").find(".PlaceofWork").html()));
                    $("[id$='txtMarkofIdentification']").val($.trim($(elm).closest("tr").find(".MarkofIdentification").html()));
                    $("[id$='txtPhoneHomeST']").val($.trim($(elm).closest("tr").find(".phHome").html()));
                    $("[id$='txtCellPhoneST']").val($.trim($(elm).closest("tr").find(".mob").html()));
                    $("[id$='txtCardNoST']").val($.trim($(elm).closest("tr").find(".cardNo").html()));




                    var str = $(elm).closest("tr").find(".phto img").attr("src");

                    var last = str.substring(str.lastIndexOf("/") + 1, str.length);

                    if (last.split('.')[0] != "") {
                        $("#imgDisplayForServant").attr("src", str);
                        $("input[id$='hdnPictureIdForServant']").val(last.split('.')[0])
                        $("#imgDisplayForServant").show();
                        $("#divdummyClassForServant").removeClass("dummy");
                    }
                    else {
                        $("#imgDisplayForServant").hide();
                        $("#divdummyClassForServant").addClass("dummy");
                    }

                }

                //----------------------------------------------------------Clear and Delete Servant Record --------------------------------------------------------------------
                function ClearServantTable() {
                    $("#tblServant input[type='text']").val('');
                    $("div[id*='AsyncFileUploadForServant']").css("width", "400px");
                    $("input[id*='AsyncFileUploadForServant']").val("");
                    $("div[id*='AsyncFileUploadForServant']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUploadForServant']").css("background-color", "");
                    $("input[id$='hdnPictureIdForServant']").val("");
                    $("img[id$='imgDisplayForServant']").hide();
                    $("select[id$='ddlReligionST']").val("");
                    $("#divdummyClassForServant").addClass("dummy");
                }

                //-----------------------------------------------Inactive Servant Record-----------------------------------------------------------------------------------------------
                function InactiveServantRecord(SID) {

                    if (confirm("Are you sure you wish to Inactive this Record?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/InactiveServantRecord",
                            data: "{'SID':'" + SID + "'}",
                            success: onsuccessInactiveServantRecord
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessInactiveServantRecord(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Inactivate Successfully!");
                    getServants($.trim($("[id$='hdnEID']").val()));
                    getBusinessCommunityDetails();
                    return false;
                }


                //---------------------------------------------Activate Visitor Record------------------------------------------
                function ActivateServantRecord(SID) {

                    if (confirm("Are you sure you wish to Activate this User?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/ActivateServantRecord",
                            data: "{'SID':'" + SID + "'}",
                            success: onsuccessActivateServantRecord
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessActivateServantRecord(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Activated Successfully!");
                    getServants($.trim($("[id$='hdnEID']").val()));
                    getBusinessCommunityDetails();
                    return false;
                }

                //----------------------------------------Black List Visistor---------------------------------------------------------------------------------------

                function BlackListServantRecord(SID) {
                    if (confirm("Are you sure you wish to Black List this User?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/BlackListServantRecord",
                            data: "{'SID':'" + SID + "'}",
                            success: onsuccessBlackListServant
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessBlackListServant(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Black Listed Successfully!");
                    getServants($.trim($("[id$='hdnEID']").val()));
                    getBusinessCommunityDetails();
                    return false;
                }



                //-----------------------------------------------------------End Delete Servant--------------------------------------------------
                function saveServantFamilyMember() {

                    if ($("input[id$='hdnPictureIdForServantFamily']").val().indexOf(":") >= 0) {
                        $("input[id$='hdnPictureIdForServantFamily']").val("");

                    }
                    $("#divMsg").hide();
                    if ($.trim($("[id$='txtIdST']").val()) == "" || $.trim($("[id$='txtIdST']").val()) == "0") {
                        showErrorMsg("Please save Servant Information first!");
                        return false;
                    }
                    else {
                        if (!validate("tblFMSForm")) {
                            var SFID = $.trim($("[id$='txtIdFMS']").val()) == "" ? 0 : $.trim($("[id$='txtIdFMS']").val());
                            var request = "{"
                                + "'SFID':'" + SFID + "',"
                                + "'SID':'" + $.trim($("[id$='txtIdST']").val()) + "',"
                                + "'EID':'" + $.trim($("[id$='hdnEID']").val()) + "',"
                                + "'FirstName':'" + $.trim($("[id$='txtFirstNameFMS']").val()) + "',"
                                + "'LastName':'" + $.trim($("[id$='txtLastNameFMS']").val()) + "',"
                                + "'Relation':'" + $.trim($("[id$='ddlRelationFMS']").val()) + "',"
                                + "'NIC':'" + $.trim($("[id$='txtNICFMS']").val()) + "',"
                                + "'Profession':'" + $.trim($("[id$='txtProfessionFMS']").val()) + "',"
                                + "'Mobile':'" + $.trim($("[id$='txtCellNoFMS']").val()) + "',"
                                + "'PlaceofWork':'" + $.trim($("[id$='txtPOWFMS']").val()) + "',"
                                + "'Photo':'" + $.trim($("[id$='hdnPictureIdForServantFamily']").val()) + "'"
                                + "}";

                            $.ajax({
                                type: "POST",
                                dataType: "json",
                                contentType: "application/json",
                                url: "../RMS/RMSWebMethod.aspx/SaveFamilyMemberServant",
                                data: request,
                                success: function () {
                                    showSuccessMsg("Information saved successfully!");
                                    //$("#tblFMSForm input[type=text]").val("");
                                    $("#tblFMSForm select").val("");

                                    getServantFamily($.trim($("[id$='txtIdST']").val()), "", $("[id$='hdnEID']").val());
                                    // getFamilyMembers($("[id$='txtIdST']").val(), 1);
                                    ClearServantFamilyTable();
                                }
                            });
                        }
                    }
                }
                //------------------------------------------------Clear and Delete Servant Family Member Record-----------------------------------------------------------------------------------------
                function ClearServantFamilyTable() {
                    $("#tblFMSForm input[type='text'], select").val('');

                    $("div[id*='AsyncFileUploadForServantFamily']").css("width", "400px");
                    $("input[id*='AsyncFileUploadForServantFamily']").val("");
                    $("div[id*='AsyncFileUploadForServantFamily']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUploadForServantFamily']").css("background-color", "");
                    $("input[id$='hdnPictureIdForServantFamily']").val("");
                    $("img[id$='imgDisplayForServantFamily']").hide();
                    //$("select[id$='ddlReligionST']").val("");
                    $("#divdummyClassForServantFamily").addClass("dummy");

                }
                function clearSearchCriteria() {
                    $("#tblSearchCriteria input[type=text]").val("");
                    $("#tblSearchCriteria select").val("");
                }

                function InactiveServantFamilyRecord(SFID) {

                    if (confirm("Are you sure you wish to Inactive this Record?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/InactiveServantFamilyRecord",
                            data: "{'SFID':'" + SFID + "'}",
                            success: onsuccessInactiveServantFamilRecord
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessInactiveServantFamilRecord(msg) {
                    //$("#divMsg").html("Record Inactived Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User Inactivated Successfully!");
                    getServantFamily($.trim($("[id$='txtIdST']").val()));
                    return false;
                }






                //---------------------------------------------Activate ServantFamily Record------------------------------------------
                function ActivateServantFamilyRecord(SFID) {

                    if (confirm("Are you sure you wish to Activate this User?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/ActivateServantFamilyRecord",
                            data: "{'SFID':'" + SFID + "'}",
                            success: onsuccessDeleteServantFamilys
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessDeleteServantFamilys(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Activated Successfully!");
                    getServantFamily($.trim($("[id$='txtIdST']").val()));
                    return false;
                }

                //----------------------------------------Black List Visistor---------------------------------------------------------------------------------------

                function BlackListServantFamilyRecord(SFID) {
                    if (confirm("Are you sure you wish to Black List this User?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/BlackListServantFamilyRecord",
                            data: "{'SFID':'" + SFID + "'}",
                            success: onsuccessBlackListServantFamily
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessBlackListServantFamily(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Black Listed Successfully!");
                    getServantFamily($.trim($("[id$='txtIdST']").val()));
                    return false;
                }


                //-----------------------------------------------End-------------------------------------------------------------------------------------------------------------

                function showHideImageForFamilyMembers() {

                    $("div[id*='AsyncFileUpload1']").css("width", "400px");
                    $("input[id*='AsyncFileUpload1']").val("");
                    $("input[id*='AsyncFileUpload1']").css("background-color", "");
                    $("input[id$='hdnPictureId']").val("");
                    $("img[id$='imgDisplay']").hide();
                    $("#divdummyClass").addClass("dummy");
                }


                function addNewEmployee() {
                    //$("select[id$='ddlRank']").html("");
                    //$("select[id$='ddlRank']").text("");
                    $('#fieldsetPersonal').css("margin-left", "0%");
                    $('#fieldsetPersonal').css("width", "97%");
                    $('#trClose').hide();
                    $("img[src$='btn_close02.png']").hide();
                    $("input[id$='btnSaveResident']").show();
                    $("div[id*='AsyncFileUpload1']").show();
                    $('#fieldsetPersonal').removeClass("jqmWindow");
                    $(".jqmWindow input, select").attr("disabled", false);
                    $("img[src$='Calendar.gif']").show();
                    $("#fieldsetPersonalGrd").hide();
                    $("#fieldsetFM").hide();
                    $("[id$='hdnEID']").val("0");
                    $("div[id*='AsyncFileUpload1']").css("width", "400px");
                    $("input[id*='AsyncFileUpload1']").val("");
                    $("div[id*='AsyncFileUpload1']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUpload1']").css("background-color", "");
                    $("input[id$='hdnPictureId']").val("");
                    $("img[id$='imgDisplay']").hide();
                    $("#divdummyClass").addClass("dummy");

                    $("#fieldsetPersonal").show();
                    //$("#fieldsetFM").show();
                    $("#tblPersonal input[type=text]").val("");
                    $("input[id$='hdnPictureId']").val("")
                    $("#tblPersonal select").val("");
                    $("#tblFamilyMember input[type=text]").val("");
                    $("#tblFamilyMember select").val("");
                }
                function addFamilyM() {
                    $("#fieldsetFM").show();
                    $("#fieldsetServant").hide();
                    $("#tblFamilyMember input[type=text]").val("");
                    $("#tblFamilyMember select").val("");
                    $("[id$='txtIdST']").val("0");
                    getFamilyMembers($("[id$='hdnEID']").val(), 1);

                }

                function AddServant() {
                    $("#fieldsetFM").hide();
                    $("#fieldsetServant").show();
                    $("div[id*='AsyncFileUploadForServant']").css("width", "400px");
                    $("input[id*='AsyncFileUploadForServant']").val("");
                    $("div[id*='AsyncFileUploadForServant']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUploadForServant']").css("background-color", "");
                    $("input[id$='hdnPictureIdForServant']").val("");
                    $("img[id$='imgDisplayForServant']").hide();
                    $("#divdummyClassForServant").addClass("dummy");
                    $("#tblServant input[type=text]").val("");
                    $("#tblServant select").val("");

                    $("[id$='txtIdST']").val("0");

                }
                function clearFamilyMember() {
                    $("div[id*='AsyncFileUploadForFamily']").css("width", "400px");
                    $("div[id*='AsyncFileUploadForFamily']").css("margin-top", "-34px");
                    $("input[id*='AsyncFileUploadForFamily']").val("");
                    $("input[id*='AsyncFileUploadForFamily']").css("background-color", "");
                    $("input[id$='hdnPictureIdForFamily']").val("");
                    $("img[id$='imgDisplayForFamily']").hide();
                    $("#divdummyClassForFamily").addClass("dummy");
                    $("#tblFamilyMember input[type=text]").val("");
                    $("#tblFamilyMember select").val("");

                    $("[id$='txtIdFM']").val("");
                }


                //------------------------------------------------Inactive Family Member-----------------------------------------------------------

                function InactiveEmployeeFamilyRecord(EFID) {

                    if (confirm("Are you sure you wish to Inactive this Record?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/InactiveEmployeeFamilyRecord",
                            data: "{'EFID':'" + EFID + "'}",
                            success: onsuccessInactiveEmployeeFamilRecord
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessInactiveEmployeeFamilRecord(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Inactivated Successfully!");
                    getFamilyMembers($("[id$='hdnEID']").val(), 1);
                    return false;
                }


                //---------------------------------------------Activate Visitor Record------------------------------------------
                function ActivateEmployeeFamilyMember(EFID) {

                    if (confirm("Are you sure you wish to Activate this User?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/ActivateEmployeeFamilyRecord",
                            data: "{'EFID':'" + EFID + "'}",
                            success: onsuccessActivateEmployeeFamilyMember
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessActivateEmployeeFamilyMember(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Activated Successfully!");
                    getFamilyMembers($("[id$='hdnEID']").val(), 1);
                    return false;
                }

                //----------------------------------------Black List Visistor---------------------------------------------------------------------------------------

                function BlackListEmployeeFamilyMember(EFID) {
                    if (confirm("Are you sure you wish to Black List this User?")) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/BlackListEmployeeFamilyRecord",
                            data: "{'EFID':'" + EFID + "'}",
                            success: onsuccessBlackListEmployeeFamilyMember
                        });

                        return false;
                    }
                    else
                        return false;
                }


                function onsuccessBlackListEmployeeFamilyMember(msg) {
                    //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                    showSuccessMsg("User has been Black Listed Successfully!");
                    getFamilyMembers($("[id$='hdnEID']").val(), 1);
                    return false;
                }


                //---------------------------------------------------------------End-----------------------------------------------------------------------

                //function editFamilyMember(eid,efid, status) {
                //    window.location = "../RMS/AddResident.aspx?EID=" + eid + "&&EFID=" + efid + "&&Status=" + status + "&&E=F";
                //}



                //-----------------------------------------------Get Rankas on the basis of change the category dropdown list-------------------------------------------------------------
                var rankIds = '';
                function getRanks(rankId) {
                    //$("select[id$='ddlRank']").html("");
                    //$("select[id$='ddlRank']").text("");
                    rankIds = rankId;
                    var catVal = $("select[id$='ddlCategory']").val();

                    if (catVal.trim() != "") {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../RMS/RMSWebMethod.aspx/getRanks",
                            data: "{'catVal':'" + catVal + "'}",
                            success: onsuccessGetRanks
                        });
                    }
                }

                function onsuccessGetRanks(msg) {

                    var data = msg.d;
                    var catop = "";
                    catop += "<option value=''>--Select--</option>";
                    for (var i = 0; i < data.RanksDetail.length; i++) {
                        //   catop += "<option value=''>--Select--</option>";
                        catop += "<option value='" + data.RanksDetail[i].Rank_ID + "'>" + data.RanksDetail[i].Rank_Name + "</option>";
                    }
                    if (rankIds != '') {

                        $("select[id$='ddlRank']").append(catop);
                        $("select[id$='ddlRank']").val(rankIds);

                    }

                    else
                        $("select[id$='ddlRank']").append(catop);

                    //  $("select[id$='ddlRank'] option:first").before("<option>hi</option>");

                    getDesignation();


                }

                function getDesignation() {

                    var catVal = $("select[id$='ddlCategory']").val();

                    if (catVal == '1' || catVal == '2') {
                        catVal = '1,2';
                    }
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "../RMS/RMSWebMethod.aspx/getDesignation",
                        data: "{'catVal':'" + catVal + "'}",
                        success: onsuccessGetDesignation
                    });
                }

                function onsuccessGetDesignation(msg) {

                    $("select[id$='ddlDesignation']").html("");
                    $("select[id$='ddlDesignation']").text("")
                    var data = msg.d;
                    var catop = "";
                    catop += "<option value=''>--Select--</option>";
                    for (var i = 0; i < data.DesignationDetail.length; i++) {
                        catop += "<option value='" + data.DesignationDetail[i].Designation_ID + "'>" + data.DesignationDetail[i].designation + "</option>";
                    }
                    $("select[id$='ddlDesignation']").append(catop);


                }

                //------------------------------------------------------------------------End-----------------------------------------------------------------------------------
        </script>
    </asp:Content>

