<%@ Page Title="" Language="C#" MasterPageFile="~/PACS.master" AutoEventWireup="true" CodeFile="ManualVisitorRegistrationEntry.aspx.cs" Inherits="ManualVisitorRegistrationEntry" %>
<%-- <%@ Register Assembly="RJS.Web.WebControl.PopCalendar.Net.2008" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
 
  

    <script type="text/javascript">
        $(document).ready(function () {
            getCurrentTime();
        });
        function getCurrentTime() {
            var currentTime = new Date()
            var hours = currentTime.getHours()
            var minutes = currentTime.getMinutes()

            if (minutes < 10)
                minutes = "0" + minutes;

            var suffix = "AM";
            if (hours >= 12) {
                suffix = "PM";
                hours = hours - 12;
            }
            if (hours == 0) {
                hours = 12;
            }
            var current_time = hours + ":" + minutes + " " + suffix;
            $("input[id$='txtTimeIn']").val(current_time);
          //  show_message("Current Your System Time is : " + current_time);
        }
    </script>
    <table id="tblManualEntry"  style="font-family: Calibri; font-size: 11pt;width:100%;" >
                    <tr>
                       
                        <td style="width:140px;text-align:left;">
                            Visitor Name:<span class="reqSpan">*</span>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtVisitorName" class="req"  runat="server" ></asp:TextBox>
                        </td>
                        
                        </tr>
        <tr>
             <td style="width:140px;text-align:left;">
                            Father Name:<span class="reqSpan">*</span>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtFatherName" class="req"  runat="server" ></asp:TextBox>
                        </td>
        </tr>

            <tr>
             <td style="width:140px;text-align:left;">
                            CNIC:<span class="reqSpan">*</span>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtCNIC" runat="server" class="req" ></asp:TextBox>
                        </td>
        </tr>

         <tr>
             <td style="width:140px;text-align:left;">
                            Date Of Birth:<span class="reqSpan">*</span>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtDateOfBirth" runat="server" class="req" ></asp:TextBox>
                            
                       <%--     <rjs:popcalendar ID="rjsDOB" Separator="/" Format="mm dd yyyy" Control="txtDateOfBirth" runat="server"
                                Font-Names="Tahoma" />--%>
                        </td>
        </tr>
         <tr style="display:none;">
             <td style="width:140px;text-align:left;">
                            Name:<span class="reqSpan">*</span>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtEngName" runat="server" class="req" ></asp:TextBox>
                        </td>
        </tr>

        <tr>
            <td style="width:140px;text-align:left;">
                            <asp:Label ID="Label11" Text="Address:" runat="server"></asp:Label>
                        </td>
                        <td   >
                            <asp:TextBox ID="txtAddress" Width="50%"  runat="server" BackColor="White" ></asp:TextBox>
                        </td>
        </tr>
         
         <tr>
             <td style="width:140px;text-align:left;">
                            <asp:Label ID="Label4" Text="Phone No:" runat="server"></asp:Label>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtEngPhoneNo" Width="50%"  runat="server" BackColor="White" ></asp:TextBox>
                        </td>
        </tr>

         <tr>
             <td style="width:140px;text-align:left;">
                            <asp:Label ID="Label5" Text="Time In:" runat="server"></asp:Label>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtTimeIn" Width="50%"  runat="server" BackColor="White" ></asp:TextBox>
                        </td>
        </tr>

         <tr>
             <td style="width:140px;text-align:left;">
                            <asp:Label ID="Label6" Text="Time Out:" runat="server"></asp:Label>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtTimeOut" Width="50%"  runat="server" BackColor="White" ></asp:TextBox>
                        </td>
        </tr>

        <tr>
             <td style="width:140px;text-align:left;">
                            <asp:Label ID="Label7" Text="Visitor of Visit:" runat="server"></asp:Label>
                        </td>
                        <td   style="width: 600px;">
                            <asp:DropDownList Width="50.6%"  ID="ddlPlaceOfVisit" runat="server"></asp:DropDownList>
                        </td>
        </tr>

        <tr>
             <td style="width:140px;text-align:left;">
                            <asp:Label ID="Label8" Text="Resident Address:" runat="server"></asp:Label>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtResidentAddress" Width="50%"  runat="server" BackColor="White" ></asp:TextBox>
                        </td>
        </tr>

        <tr>
             <td style="width:140px;text-align:left;">
                            <asp:Label ID="Label9" Text="Vehicle No:" runat="server"></asp:Label>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtVehicleNo" Width="50%"  runat="server" BackColor="White" ></asp:TextBox>
                        </td>
        </tr>
        <tr>
             <td style="width:140px;text-align:left;">
                            <asp:Label ID="Label10" Text="Token No:" runat="server"></asp:Label>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtTokenNo" Width="50%"  runat="server" BackColor="White" ></asp:TextBox>
                            
                        </td>
        </tr>
        <tr>
             <td  align="left">
                            <asp:TextBox ID="txtID" Style="display: none;" runat="server"></asp:TextBox>
                        </td>
           
                        
                   
                        <td align="left">
                            <asp:Button ID="btnSave" Text="Add"  CssClass="btn" onMouseOver="getCurrentTime();" OnClientClick="return SaveVisitor();" runat="server" />
                        
                            <asp:Button ID="btnClearVisitor" Text="Clear"  CssClass="btn" OnClientClick="return ClearVisitor();" runat="server" />
                        
                            <asp:Button ID="btnUpdate" Text="Update" Style="display: none;"  CssClass="btn" OnClientClick="return UpdateVisitor();" runat="server" />
                        </td>
        </tr>
                </table>



    <div id="divVisitorDetails" style="overflow: auto;width:100%;" >
            <fieldset id="fldVisitorDetails" style="overflow: auto; width: 800px; height: 300px;">
                <legend>Visitors Details</legend>
                <table id="tblVisitorDetails" class="dataTable">
                </table>
	</fieldset>
        </div>

     <script type="text/javascript" language="javascript">
         var oTable;

         $(document).ajaxStart(blockUI).ajaxStop(unblockUI);

         function blockUI() {
             $.blockUI({
                 message: '<img src="images/ajax-loader.gif" />',
                 css: { borderStyle: 'none', backgroundColor: "Transparent" }
             });
         }
         function unblockUI() {
             $.unblockUI();
         }
    $(document).ready(function () {
        getVisitor();
        
    });
    
      function dataTable() {
          oTable = $("#tblVisitorDetails").dataTable({
              bPaginate: false,
              bJQueryUI: true,
              oLanguage: { "sSearch": "Filter: " }
          });
      }
   
      function SaveVisitor()
      {
          if (!validate("tblManualEntry")) {
              var CNIC = $("input[id$='txtCNIC']").val().trim();
              var VISITOR_NAME = $("input[id$='txtVisitorName']").val().trim();
              var FATHER_NAME = $("input[id$='txtFatherName']").val().trim();
              var DOB = $("input[id$='txtDateOfBirth']").val().trim();
              var ADDRESS = $("input[id$='txtAddress']").val().trim();
              var TIME_IN = $("input[id$='txtTimeIn']").val().trim();
              var TIME_OUT = $("input[id$='txtTimeOut']").val().trim();
              var HOST = $("select[id$='ddlPlaceOfVisit'] option:selected").text().trim();

              var VEHICLE_NUMBER = $("input[id$='txtVehicleNo']").val().trim();
              var TOKEN_NUMBER = $("input[id$='txtVehicleNo']").val().trim();

              var DEPARTMENT = "";
              var GATE_NUMBER = "";
              var NAME = "";


              var PHONE_NUMBER = $("input[id$='txtEngPhoneNo']").val().trim();
              var RESTRICTED = "0";
              var PICTURE_ID = "";
              $.ajax({
                  type: "POST",
                  contentType: "application/json; charset=utf-8",
                  url: "../VMS/webmethods.aspx/SaveVisitor",
                  data: "{'CNIC':'" + CNIC + "','VISITOR_NAME':'" + VISITOR_NAME + "','FATHER_NAME':'" + FATHER_NAME + "','DOB':'" + DOB + "','ADDRESS':'" + ADDRESS + "','TIME_IN':'" + TIME_IN + "','TIME_OUT':'" + TIME_OUT + "','HOST':'" + HOST + "','VEHICLE_NUMBER':'" + VEHICLE_NUMBER + "','TOKEN_NUMBER':'" + TOKEN_NUMBER + "','DEPARTMENT':'" + DEPARTMENT + "','GATE_NUMBER':'" + GATE_NUMBER + "','NAME':'" + NAME + "','PHONE_NUMBER':'" + PHONE_NUMBER + "','RESTRICTED':'" + RESTRICTED + "','PICTURE_ID':'" + PICTURE_ID + "'}",                  
                  success: onsuccessSaveVisitor,
                  error: onretrieveSaveVisitorError
              });
          }
        return false; 
      }
      function onsuccessSaveVisitor(msg)
      {
          $("#divSuccessMsg").show();
          $("#divSuccessMsg").html("");
          $("#divSuccessMsg").html("Record Successfully Saved!");
          $("#divSuccessMsg").fadeOut(6000);
        $("input[id$='txtVisitorName']").val("");
        getVisitor();
        return false;
      }
      function onretrieveSaveVisitorError(msg)
      {
          
        alert("Error In Saving Data ssss!"+msg.responseText);
        return false; 
      }
      function ClearVisitor()
      {
        $("input[id$='txtVisitorName']").val("");
         
        $("input[id$='btnUpdate']").hide();
        $("input[id$='btnSave']").attr("disabled", false);
        return false;
      }
      function getVisitor()
      {
        $.ajax({
            type: "POST",
            contentType:"application/json; charset=utf-8",
            url: "../VMS/webmethods.aspx/getVisitorDetail",
            data: "{}", 
            success:onsuccessgetVisitor
        });
        return false; 
      }
      function onsuccessgetVisitor(msg)
      {
        var data = msg.d;
        if(oTable !=null)
                    {
                      oTable.fnClearTable();
                      oTable.fnDestroy();
                    }  
          var tbl = "";
                tbl += "<thead>";
                tbl += "<tr>";
                tbl += "<th style='text-align:center;width:8%;'>Delete</th>";
                tbl += "<th style='text-align:center; white-space:nowrap;display:none;'>Edit</th>";
                tbl += "<th style='text-align:left; white-space:nowrap; display:none;'>Visitor ID</th>";
                
                tbl += "<th style='white-space:nowrap; text-align:left;'>Visitor Name</th>";
                
                tbl += "<th style='white-space:nowrap; text-align:left;'>Father Name</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Date Of Birth</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Address</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Date</th>";

                tbl += "<th style='white-space:nowrap; text-align:left;'>Time In</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Time Out</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Place Of Visit</th>";

                tbl += "<th style='white-space:nowrap; text-align:left;'>Vechile No.</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Token No</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Department</th>";

                tbl += "<th style='white-space:nowrap; text-align:left;'>Gate No.</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Name</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Phone No.</th>";

                tbl += "</tr>";
                tbl += "</thead>";
                tbl += "<tbody>";
                for (var i = 0; i < data.VisitorDetail.length; i++) {                   
                    tbl += "<tr id='trmain" + i + "' style='cursor:default;background-color:white;' onclick='getRowID(" + i + ");'>";
                    tbl += "<td id='txtDelete' align='center'> <input  type='image' src='images/Cross2.png' onclick='return DeleteVisitorRecord(" + i + ");'> </td>";
                            tbl += "<td style='cursor:Pointer;display:none;' id='txtUpdate' align='center' onclick='return EditRecord("+i+");'><img src='images/Edit.png'></td>";
                            tbl += "<td style='text-align:right; white-space:nowrap; display:none;' id='txtID" + i + "'>" + data.VisitorDetail[i].ID + "</td>";
                            
                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtVisitorName" + i + "'>" + data.VisitorDetail[i].VISITOR_NAME + "</td>";
                            
                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtCreatedBy" + i + "'>" + data.VisitorDetail[i].FATHER_NAME + "</td>";
                            tbl += "<td style='text-align:right; white-space:nowrap;' id='txtCreatedDate" + i + "'>" + data.VisitorDetail[i].DOB + " </td>";
                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtModBy" + i + "'>" + data.VisitorDetail[i].ADDRESS + " </td>";
                            tbl += "<td style='text-align:right; white-space:nowrap;' id='txtModDate" + i + "'>" + data.VisitorDetail[i].DATE + " </td>";


                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtCreatedBy" + i + "'>" + data.VisitorDetail[i].TIME_IN + "</td>";
                            tbl += "<td style='text-align:right; white-space:nowrap;' id='txtCreatedDate" + i + "'>" + data.VisitorDetail[i].TIME_OUT + " </td>";
                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtModBy" + i + "'>" + data.VisitorDetail[i].HOST + " </td>";
                            tbl += "<td style='text-align:right; white-space:nowrap;' id='txtModDate" + i + "'>" + data.VisitorDetail[i].VEHICLE_NUMBER + " </td>";
                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtCreatedBy" + i + "'>" + data.VisitorDetail[i].TOKEN_NUMBER + "</td>";
                            tbl += "<td style='text-align:right; white-space:nowrap;' id='txtCreatedDate" + i + "'>" + data.VisitorDetail[i].DEPARTMENT + " </td>";
                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtModBy" + i + "'>" + data.VisitorDetail[i].GATE_NUMBER + " </td>";
                            tbl += "<td style='text-align:right; white-space:nowrap;' id='txtModDate" + i + "'>" + data.VisitorDetail[i].NAME + " </td>";
                            tbl += "<td style='text-align:right; white-space:nowrap;' id='txtModDate" + i + "'>" + data.VisitorDetail[i].PHONE_NUMBER + " </td>";
                      tbl += "</tr>";
                }   
                tbl += "</tbody>";
                tbl += "</table>";
                $("#tblVisitorDetails").html(tbl);
                dataTable();
                return false; 
      }

      function getRowID(rowID) {
          $("table[id$='tblVisitorDetails'] tr").css("background-color", "white");
          $("#trmain" + rowID).css("background-color", "#6798c1");

      }
      
      function DeleteVisitorRecord(rowNo) {
          

          var ID = $("#txtID"+rowNo).html();
          
              if (confirm("Are you sure you wish to delete this Record?")) {
                  $.ajax({
                      type: "POST",
                      contentType: "application/json; charset=utf-8",
                      url: "../VMS/webmethods.aspx/DeleteVisitor",
                      data: "{'ID':'" + ID + "'}",
                      success: onsuccessDeleteData
                  });
              
              return false;
          }
          else
                  return false;

      }

      function onsuccessDeleteData(msg) {
          $("#divMsg").html("Record Successfully Saved!").removeClass("error").addClass("success").show();          
          getVisitor();
          return false;

      }

      function EditRecord(rowNo)
      {
          var ID = $("#txtID"+rowNo).html().trim();
          $("input[id$='txtID']").val(ID);

          var HOST_NAME = $("#txtVisitorName"+rowNo).html().trim();
          $("input[id$='txtVisitorName']").val(HOST_NAME);
          
          $("input[id$='btnUpdate']").show();
          $("input[id$='btnSave']").attr("disabled", true);
          return false;
      }
      function UpdateVisitor()
      {
          if (!validate("tblManualEntry")) {
              var ID = $("input[id$='txtID']").val();

              var HOST_NAME = $("input[id$='txtVisitorName']").val();

              $.ajax({
                  type: "POST",
                  contentType: "application/json; charset=utf-8",
                  url: "../VMS/webmethods.aspx/UpdateVisitor",
                  data: "{'ID':'" + ID + "','HOST_NAME':'" + HOST_NAME + "'}",
                  success: onsuccessUpdateVisitors
              });
          }
        return false; 
      }
      function onsuccessUpdateVisitors()
      {          
          $("#divMsg").html("Record Updated Successfully!").removeClass("error").addClass("success").show();
          $("input[id$='txtVisitorName']").val("");
          getVisitor();

        ClearVisitor();
        getVisitor();
        return false;
      }
    
    </script>
</asp:Content>

