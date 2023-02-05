﻿ <%@ Page Title="" Language="C#" MasterPageFile="~/PACS.master" AutoEventWireup="true" CodeFile="AddSiteAllowed.aspx.cs" Inherits="Setting_Forms_CardCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="css/dataTable.css" rel="stylesheet" />
    <table style="width: 100%; margin-top: 0%;">

        <tr>
            <td>
                <fieldset>
                    <legend>Add/Modify Clearance Level</legend>

                    <table id="tbldamoclesinfo" style="font-family: Calibri; font-size: 11pt; width: 100%;">
                        <tr>
                            <td style="width: 140px; text-align: left;">Site Allowed:<span class="reqSpan">*</span>
                            </td>
                            <td style="width: 600px;">
                                <asp:TextBox ID="txtSiteAllowed" Width="95%" placeholder="Site Allowed" class="req"  runat="server" BackColor="White"></asp:TextBox>
                            </td>
                             <td style="width: 140px; text-align: left;">Site Prefix:<span class="reqSpan">*</span>
                            </td>
                            <td style="width: 600px;">
                                <asp:TextBox ID="txtSitePrefix" Width="95%" placeholder="Card Prefix" class="req"   runat="server" BackColor="White"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtID" Style="display: none;" runat="server"></asp:TextBox>
                            </td>
                            </tr>
                        <tr style="width:100%;">

                            <td>
                                </td>
                            <td>
                                <asp:Button ID="btnSave" Text="Add" CssClass="btn" OnClientClick="return SaveCardCategory();" runat="server" />

                                <asp:Button ID="btnClearCard" Text="Clear" CssClass="btn" OnClientClick="return ClearCardCategory();" runat="server" />

                                <asp:Button ID="btnUpdate" Text="Update" Style="display: none;" CssClass="btn" OnClientClick="return UpdateCardCategory();" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>

    </table>
    <div id="divCardCategory">
        <fieldset id="fldCaardCategory" >
            <legend>Clearance Level Details</legend>
                  
            <table id="tbleCardCategory" class="dataTable">
            </table>
                
        </fieldset>
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
                getCardCateogry();

            });

            function dataTable() {
                oTable = $("#tbleCardCategory").dataTable();
            }

            function SaveCardCategory() {
                var SiteAllowed = $("input[id$='txtSiteAllowed']").val().trim();
                var SitePrefix = $("input[id$='txtSitePrefix']").val().trim();

                if (SiteAllowed == "") {
                    alert("Please Enter Site Allowed!");
                    return false;
                }

                if (SitePrefix == "") {
                    alert("Please Enter Site Prefix!");
                    return false;
                }
                var i = 0;
                if ($("#tbleDamoclesInfosDetail tr").length - 1 > 1) {
                    for (i = 0; i < $("#tbleDamoclesInfosDetail tr").length - 1; i++) {

                        if ($("#txtSiteAllowed" + i).html().toUpperCase().trim() == $("input[id$='txtSiteAllowed']").val().toUpperCase().trim()) {
                            alert("Card Name " + $("input[id$='txtSiteAllowed']").val() + " is already added!");
                            $("input[id$='txtSiteAllowed']").val("");
                            return false;
                        }
                        // alert("test")
                    }
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Settingwebmethods.aspx/SaveSiteAllowed",
                        data: "{'Site_Name':'" + SiteAllowed + "', 'Site_Prefix':'" + SitePrefix + "'}",
                        success: onsuccessSaveDamoclesInfos
                    });

                    return false;
                }



            }
            function onsuccessSaveDamoclesInfos(msg) {
                //$("#divMsg").html("Record Successfully Saved!").removeClass("error").addClass("succsess").show();
                showSuccessMsg("Record saved successfully!");
                $("input[id$='txtIp']").val("");
                $("input[id$='txtSiteAllowed']").val("");
                //$("select[id$='txtSitePrefix']").val("");
                getCardCateogry();
                return false;
            }
            function ClearCardCategory() {
                debugger;
                $("input[id$='txtID']").val("");
                $("input[id$='txtSiteAllowed']").val("");
                $("input[id$='txtSitePrefix']").val("");
                $("input[id$='btnUpdate']").hide();
                $("input[id$='btnSave']").attr("disabled", false);
                return false;
            }
            function getCardCateogry() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Settingwebmethods.aspx/getSiteAllowed",
                    data: "{}",
                    success: onsuccessgetCardCategory
                });
                return false;
            }
            function onsuccessgetCardCategory(msg) {

                var data = msg.d;
                if (oTable != null) {
                    oTable.fnClearTable();
                    oTable.fnDestroy();
                }
                var tbl = "";
                tbl += "<thead>";
                tbl += "<tr>";
                //    tbl += "<th style='text-align:center;width:8%;'>Delete</th>";
                tbl += "<th style='text-align:center; white-space:nowrap;'>Edit</th>";
                tbl += "<th style='text-align:left; white-space:nowrap; display:none;'> ID</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Site Name</th>";
                tbl += "<th style='white-space:nowrap; text-align:left;'>Site Prefix</th>";
                tbl += "</tr>";
                tbl += "</thead>";
                tbl += "<tbody>";
                for (var i = 0; i < data.tbleCardCategory.length; i++) {
                    tbl += "<tr id='trmain" + i + "' style='cursor:default;background-color:white;' onclick='getRowID(" + i + ");'>";
                    //  tbl += "<td id='txtDelete' align='center'> <input  type='image' src='../images/Cross2.png' onclick='return  DeletedamoclesInfos(" + i + ");'> </td>";
                    tbl += "<td style='cursor:Pointer;' id='txtUpdate' align='center' onclick='return EditRecord(" + i + ");'><img src='../images/Edit.png'></td>";
                    tbl += "<td style='text-align:left; white-space:nowrap; display:none;' id='txtID" + i + "'>" + data.tbleCardCategory[i].ID + "</td>";

                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtSite_Name" + i + "'>" + data.tbleCardCategory[i].Site_Name + "</td>";

                    tbl += "<td style='text-align:left; white-space:nowrap;' id='txtSite_Prefix" + i + "'>" + data.tbleCardCategory[i].Site_Prefix + "</td>";

                    //tbl += "<td style='text-align:left; white-space:nowrap;' id='txtModBy" + i + "'>" + data.CasteDetail[i].modified_by + " </td>";
                    //tbl += "<td style='text-align:right; white-space:nowrap;' id='txtModDate" + i + "'>" + data.CasteDetail[i].modified_date + " </td>";
                    tbl += "</tr>";
                }
                tbl += "</tbody>";
                tbl += "</table>";
                $("#tbleCardCategory").html(tbl);
                dataTable();
                ClearCardCategory();
                return false;
            }

            function getRowID(rowID) {
                $("table[id$='tbleDamoclesInfosDetail'] tr").css("background-color", "white");
                $("#trmain" + rowID).css("background-color", "#6798c1");

            }

            function DeletedamoclesInfos(rowNo) {

                var Dam_ID = $("#txtID" + rowNo).html();

                if (confirm("Are you sure you wish to delete this Record?")) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Settingwebmethods.aspx/DeleteDamoclesInfos",
                        data: "{'Dam_ID':'" + Dam_ID + "'}",
                        success: onsuccessDeleteData,
                        error: onerror
                    });

                    return false;
                }
                else
                    return false;
            }

            function onerror(xhr) {
                $(".alert").html(xhr.responseText);

            }
            function onsuccessDeleteData(msg) {
                //$("#divMsg").html("Record deleted Successfully!").removeClass("error").addClass("success").show();
                showSuccessMsg("Record deleted successfully!");
                ClearCardCategory();
                return false;
            }

            function EditRecord(rowNo) {
                var ID = $("#txtID" + rowNo).html().trim();
                $("input[id$='txtID']").val(ID);

                var Card_Name = $("#txtSite_Name" + rowNo).html().trim();
                $("input[id$='txtSiteAllowed']").val(Card_Name);

                var Card_Prefix = $("#txtSite_Prefix" + rowNo).html().trim();
                $("input[id$='txtSitePrefix']").val(Card_Prefix);

                $("input[id$='btnUpdate']").show();
                $("input[id$='btnSave']").attr("disabled", true);
                return false;
            }
            function UpdateCardCategory() {

                //var i = 0;
                //if ($("#tbleCardCategory tr").length - 1 > 1) {
                //    for (i = 0; i < $("#tbleCardCategory tr").length - 1; i++) {

                //        if ($("#txtSiteAllowed" + i).html().toUpperCase().trim() == $("input[id$='txtSiteAllowed']").val().toUpperCase().trim()) {
                //            alert("Card Category " + $("input[id$='txtSiteAllowed']").val() + " is already added!");
                //            $("input[id$='txtSiteAllowed']").val("");
                //            return false;
                //        }
                //        // alert("test")
                //    }
                //}

                var Cat_ID = $("input[id$='txtID']").val();
                var SiteAllowed = $("input[id$='txtSiteAllowed']").val();
                var Site_prefix = $("input[id$='txtSitePrefix']").val();

                if (SiteAllowed == "") {
                    alert("Please Enter Site Allowed!");
                    return false;
                }

                if (Site_prefix == "") {
                    alert("Please Enter Site Prefix!");
                    return false;
                }

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Settingwebmethods.aspx/UpdateSiteAllowed",
                    data: "{'ID':" + Cat_ID + ",'SiteAllowed':'" + SiteAllowed + "','Site_prefix':'" + Site_prefix + "'}",
                    success: onsuccessUpdateCardCategory
                });

                return false;
            }
            function onsuccessUpdateCardCategory() {
                //  $("#divMsg").html("Record Updated Successfully!").removeClass("error").addClass("success").show();
                showSuccessMsg("Record Updated successfully!");
                //  $("input[id$='txtIp']").val("");
                getCardCateogry();

                ClearCardCategory();

                return false;
            }
        </script>
    </div>
</asp:Content>

