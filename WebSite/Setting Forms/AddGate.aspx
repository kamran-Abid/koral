﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PACS.master" AutoEventWireup="true" CodeFile="AddGate.aspx.cs" Inherits="AddGate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
     
  

       <table style="width:100%;margin-top:0%;vertical-align:top;">
        <tr>
                <td>
                    <div class="sussessMessageDiv" id="divSuccessMsg" style="display: none">&nbsp;
                    </div>
                     <div class="ErrorMessageDiv" id="ErrorMessageDiv" style="display: none">&nbsp;
                    </div>
                </td>
            </tr>
        <tr>
            <td>
               <fieldset>
                   <legend>Add/Modified Gate Name/Location</legend>
               
                    <table  style="font-family: Calibri; font-size: 11pt;width:100%;" >
                    <tr>
                        <td style="width:140px;text-align:left;">
                            <asp:Label ID="lblGateName" Text="Gate Name:" runat="server"></asp:Label>
                        </td>
                        <td   style="width: 600px;">
                            <asp:TextBox ID="txtGateName" Width="95%"   class="alphanumeric" runat="server" BackColor="White" ></asp:TextBox>
                        </td>
                        
                       
                        <td  align="left">
                            <asp:TextBox ID="txtID" Style="display: none;" runat="server"></asp:TextBox>
                        </td>
                        
                   
                        <td align="left">
                            <asp:Button ID="btnSave" Text="Add" CssClass="btn" OnClientClick="return SaveGate();" runat="server" />
                        
                            <asp:Button ID="btnClearGate" Text="Clear" CssClass="btn" OnClientClick="return ClearGate();" runat="server" />
                        
                            <asp:Button ID="btnUpdate" Text="Update" Style="display: none;" CssClass="btn" OnClientClick="return UpdateGate();" runat="server" />
                        </td>
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>

    </table>
     <div id="divGateDetails"  >
            <fieldset id="fldGateDetails" >
                <legend>Gates Details</legend>
                 <div style="overflow: auto; width: 100%;">
                  
            
                <table id="tblGateDetails" class="dataTable">
                </table>
                     </div>
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
        getGate();
        
    });
    
      function dataTable() {
          oTable = $("#tblGateDetails").dataTable();
      }
   
      function SaveGate()
      {
          var i = 0;
          if ($("#tblGateDetails tr").length - 1 > 1) {
              for (i = 0; i < $("#tblGateDetails tr").length - 1; i++) {

                  if ($("#txtGateName" + i).html().toUpperCase().trim() == $("input[id$='txtGateName']").val().toUpperCase().trim()) {
                      alert("Gate " + $("input[id$='txtGateName']").val() + " is already added!");
                      $("input[id$='txtGateName']").val("");
                      return false;
                  }
                  // alert("test")
              }
          }
          var Gate_Name = $("input[id$='txtGateName']").val().trim();
         
          if (Gate_Name == "")
            {
                alert("Please Enter Gate Name!");
                return false;
        }
        
                $.ajax({
                type: "POST",
                contentType:"application/json; charset=utf-8",
                url: "Settingwebmethods.aspx/SaveGate",
                data: "{'Gate_Name':'" + Gate_Name + "'}",
                success:onsuccessSaveGate,
                error:onretrieveSaveGateError 
                });
        return false; 
      }
      function onsuccessSaveGate(msg)
      {
          $("#divSuccessMsg").show();
          $("#divSuccessMsg").html("");
          $("#divSuccessMsg").html("Record Successfully Saved!");
          $("#divSuccessMsg").fadeOut(6000);
        $("input[id$='txtGateName']").val("");
        getGate();
        return false;
      }
      function onretrieveSaveGateError(msg)
      {
          
        alert("Error In Saving Data!");
        return false; 
      }
      function ClearGate()
      {
        $("input[id$='txtGateName']").val("");
         
        $("input[id$='btnUpdate']").hide();
        $("input[id$='btnSave']").attr("disabled", false);
        return false;
      }
      function getGate()
      {
        $.ajax({
            type: "POST",
            contentType:"application/json; charset=utf-8",
            url: "Settingwebmethods.aspx/getGateDetail",
            data: "{}", 
            success:onsuccessgetGate,
            error:onretrievegetGate 
        });
        return false; 
      }
      function onsuccessgetGate(msg)
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
                tbl += "<th style='text-align:center; white-space:nowrap;'>Edit</th>";
                tbl += "<th style='text-align:left; white-space:nowrap; display:none;'>Gate ID</th>";
                
                tbl += "<th style='white-space:nowrap; text-align:left;'>Gate Name</th>";
                
                tbl += "<th style='white-space:nowrap; text-align:left;'>Created By</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Created Date</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Modified By</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Modified Date</th>";
                tbl += "</tr>";
                tbl += "</thead>";
                tbl += "<tbody>";
                for (var i = 0; i < data.GateDetail.length; i++) {                   
                    tbl += "<tr id='trmain" + i + "' style='cursor:default;background-color:white;' onclick='getRowID(" + i + ");'>";
                    tbl += "<td id='txtDelete' align='center'> <input  type='image' src='../images/Cross2.png' onclick='return DeleteGateRecord(" + i + ");'> </td>";
                            tbl += "<td style='cursor:Pointer;' id='txtUpdate' align='center' onclick='return EditRecord("+i+");'><img src='../images/Edit.png'></td>";
                            tbl += "<td style='text-align:right; white-space:nowrap; display:none;' id='txtID" + i + "'>" + data.GateDetail[i].Gate_ID + "</td>";
                            
                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtGateName" + i + "'>" + data.GateDetail[i].Gate_Name + "</td>";
                            
                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtCreatedBy" + i + "'>" + data.GateDetail[i].created_by + "</td>";
                            tbl += "<td style='text-align:right; white-space:nowrap;' id='txtCreatedDate" + i + "'>" + data.GateDetail[i].created_date + " </td>";
                            tbl += "<td style='text-align:left; white-space:nowrap;' id='txtModBy" + i + "'>" + data.GateDetail[i].modified_by + " </td>";
                            tbl += "<td style='text-align:right; white-space:nowrap;' id='txtModDate" + i + "'>" + data.GateDetail[i].modified_date + " </td>";
                      tbl += "</tr>";
                }   
                tbl += "</tbody>";
                tbl += "</table>";
                $("#tblGateDetails").html(tbl);
                dataTable();
                return false; 
      }

      function getRowID(rowID) {
          $("table[id$='tblGateDetails'] tr").css("background-color", "white");
          $("#trmain" + rowID).css("background-color", "#6798c1");

      }
      function onretrievegetGate()
      {
        alert("Error In Loading Details!");
        return false;
      }

      function DeleteGateRecord(rowNo) {
          

          var Gate_ID = $("#txtID" + rowNo).html();
          
              if (confirm("Are you sure you wish to delete this Record?")) {
                  $.ajax({
                      type: "POST",
                      contentType: "application/json; charset=utf-8",
                      url: "Settingwebmethods.aspx/DeleteGate",
                      data: "{'Gate_ID':'" + Gate_ID + "'}",
                      success: onsuccessDeleteData,
                      error: OnretrievePhysicianError
                  });
              
              return false;
          }
          else
                  return false;

      }

      function onsuccessDeleteData(msg) {



          $("#divSuccessMsg").show();
          $("#divSuccessMsg").html("");
          $("#divSuccessMsg").html("Record Successfully Deleted!");
          $("#divSuccessMsg").fadeOut(6000);
          getGate();
          return false;

      }

      function OnretrievePhysicianError(msg) {
         // getGatealRecod();
          alert(msg.responseText);
          $("#ErrorMessageDiv").show();
          $("#ErrorMessageDiv").html("");
          $("#ErrorMessageDiv").html("Error in Record Deleting!" );
          $("#ErrorMessageDiv").fadeOut(6000);
          return false;
      }

      function EditRecord(rowNo)
      {
          var ID = $("#txtID"+rowNo).html().trim();
          $("input[id$='txtID']").val(ID);

          var Gate_ID = $("#txtGateName" + rowNo).html().trim();
          $("input[id$='txtGateName']").val(Gate_ID);
          
          $("input[id$='btnUpdate']").show();
          $("input[id$='btnSave']").attr("disabled", true);
          return false;
      }
      function UpdateGate()
      {
          var Gate_ID = $("input[id$='txtID']").val();

          var Gate_Name = $("input[id$='txtGateName']").val();
         
          if (Gate_Name == "")
            {
                alert("Please Enter Gate Name!");
                return false;
          }
          var i = 0;
          if ($("#tblGateDetails tr").length - 1 > 1) {
              for (i = 0; i < $("#tblGateDetails tr").length - 1; i++) {

                  if ($("#txtGateName" + i).html().toUpperCase().trim() == $("input[id$='txtGateName']").val().toUpperCase().trim()) {
                      alert("Gate " + $("input[id$='txtGateName']").val() + " is already added!");
                     // $("input[id$='txtGateName']").val("");
                      return false;
                  }
                  // alert("test")
              }
          }
       
        $.ajax({
            type: "POST",
            contentType:"application/json; charset=utf-8",
            url: "Settingwebmethods.aspx/UpdateGate",
            data: "{'Gate_ID':'" + Gate_ID + "','Gate_Name':'" + Gate_Name + "'}",
            success:onsuccessUpdateGates,
            error:onretrieveUpdateGates 
        });
        return false; 
      }
      function onsuccessUpdateGates()
      {
          $("#divSuccessMsg").show();
          $("#divSuccessMsg").html("");
          $("#divSuccessMsg").html("Record Successfully Updated!");
          $("#divSuccessMsg").fadeOut(6000);
          $("input[id$='txtGateName']").val("");
          getGate();

        ClearGate();
        getGate();
        return false;
      }
      function onretrieveUpdateGates()
      {
        alert("Error In Updating Record!");
        return false;
      }
     
    
    
    
    </script>
</asp:Content>

