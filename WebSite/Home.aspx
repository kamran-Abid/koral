<%@ Page Title="Welcome to Visitor Management System" Language="C#" MasterPageFile="~/PACS.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <style type="text/css" completionlistitemcssclass="AutoExtenderListItem ">
        .watermark {
            /*position: fixed;*/
            bottom: 610px;
            right: 1024px;
            opacity: 0.60;
            z-index: 99;
            color: white;
            padding-left: 190px;
        }

        .background_popup {
            background-color: black;
            /*filter: alpha(opacity=90%);*/
            opacity: 0.7;
        }

        .popup {
            background: #d4edda;
            width: 70vw;
        }

        .web_dialog {
            left: 50%;
            top: 10%;
            width: 60vw;
            height: auto;
            background-color: white;
            border: 3px solid black;
            z-index: 102;
            display: none;
            position: fixed;
            margin-left: -35vw;
            opacity: 1;
            margin-top: auto;
        }

        .overlay {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            left: 0;
            right: 0;
            bottom;
            0;
            top: 0;
            z-index: 101;
            background-color: #000000;
            opacity: .75;
            /*filter: alpha(opacity=15);
            -moz-opacity: .15; */
        }

        .td-vehTitle {
            width: 200px;
        }

        .auto-style1 {
            left: 0px;
            top: 0px;
        }
        .table tr td input {
            background: #edf0ee;
        }

        
        .AutoExtenderList {
            font-family: Verdana, Helvetica, sans-serif;
            font-size: .8em;
            margin: 0px;
            font-weight: normal;
            border: solid 1px #006400;
            line-height: 20px;
            padding-left: 0px;
            background-color: #d4edda;
            list-style-type: none;
        }

        .AutoExtenderListItem {
            border-bottom: dotted 1px #006400;
            cursor: pointer;
            color: #006400;
            left: auto;
            margin: 0px;
            padding-left: 10px;
        }

        .AutoExtenderHighlight {
            color: White;
            background-color: #006400;
            cursor: pointer;
            margin: 0px;
            padding-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <%--<asp:ToolkitScriptManager ID="toolkitScriptManager" runat="server"></asp:ToolkitScriptManager>--%>

    <div style="background-color: rgb(240, 247, 250);">
        <!-- PACS VACS Tap  -->
        <nav class="nav justify-content-around nav-pills bg-dark nav-fill" style="height: 40px;">
            <li class="nav-item">
                <a class="nav-link text-light" aria-current="page" href="/">PACS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active text-light" href="home.aspx" style="background-image: linear-gradient(180deg, #006400, #008000);">VACS</a>
            </li>
        </nav>
    </div>

    <p id="message_backend"></p>

    <!-- <nav class="nav nav-pills justify-content-around nav-fill">
        <a class="nav-link active" aria-current="page" href="#">PACS</a>
        <a class="nav-link" href="index.html">VACS</a>
      </nav> -->

    <!--**********************************
       VACS Tap start
    ***********************************-->

    <%--<asp:ScriptManager ID="scriptManager1" runat="server" EnablePageMethods="true" ></asp:ScriptManager>--%>
    <div class="d-flex justify-content-between align-items-center px-3">
        <h1 class="text-success my-4 h1">Vehicle Access Control System (VACS) Again</h1>

        <!-- Topbar Search -->

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div class="input-group-append">
            <asp:TextBox
                class="d-flex justify-content-end"
                ID="searchRegno"
                Style="width: 25vw; background: #d4edda;"
                type="text"
                placeholder="Search Vehicle by Reg No."
                aria-label="PACS Search"
                aria-describedby="basic-addon2"
                runat="server" />
            <a class="btn-success bg-success text-light" href="#" id="linkShowDialog" style="padding: 10px; border-radius: 0 10px 10px 0; width: 60px;">
                <img src="images/search-icon.svg" alt="search-icon" />
            </a>
            <ajaxToolkit:AutoCompleteExtender ID="searchHrno_AutoCompleteExtender" runat="server" EnableCaching="true" BehaviorID="searchHrno_AutoCompleteExtender" DelimiterCharacters="" TargetControlID="searchRegno" ServiceMethod="GetRegnos" MinimumPrefixLength="1" CompletionSetCount="1" CompletionInterval="10" CompletionListCssClass="AutoExtenderList" CompletionListHighlightedItemCssClass="AutoExtenderHighlight" CompletionListItemCssClass="AutoExtenderListItem">
            </ajaxToolkit:AutoCompleteExtender>
            <%--<asp:Button ID="BtnVehRegno" runat="server" Text="Get Details" class="btn btn-success bg-success text-light" OnCommand="BtnVehRegno_Command" CssClass="auto-style1" />--%>


            <div class="float-right">
                <a id="vacs-report" class="btn bg-success text-light ml-1 mt-1 py-2" href="PACS_Report/VACS-REPORT.aspx">Get Report</a>
            </div>

        </div>



        <%--<div class="input-group " style="">
            
        </div>--%>
    </div>

    <div class="dialog_div">

        <div id="overlay" class="overlay"></div>
        <div id="modal_dialog" class="web_dialog rounded px-4">
            <h1 class="pt-4 text-center text-success">Vehicle Detail</h1>
            <table class="table">
                <thead>
                    <tr>
                        <td class="td-vehTitle">Registration No.</td>
                        <td>
                            <input type="text" id="td-VehRegno" readonly="true" /></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="td-vehTitle">Vehicle Type</td>
                        <td class="td-vehData">
                            <input type="text" id="td-VehType" readonly="true" /></td>
                        <td class="td-vehTitle">Vehicle Color</td>
                        <td class="td-vehData">
                            <input type="text" id="td-VehColor" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td class="td-vehTitle">Make</td>
                        <td class="td-vehData">
                            <input type="text" id="td-VehMake" readonly="true" /></td>
                        <td class="td-vehTitle">Vehicle Model</td>
                        <td class="td-vehData">
                            <input type="text" id="td-VehModel" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td class="td-vehTitle">Current Status</td>
                        <td class="td-vehData">
                            <input type="text" id="td-currLoc" readonly="true" /></td>
                        <td class="td-vehTitle">Valid up to</td>
                        <td class="td-vehData">
                            <input type="text" id="td-ValidUpto" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td class="td-vehTitle">Last Time In</td>
                        <td class="td-vehData">
                            <input type="text" id="td-LastTimeIn" readonly="true" /></td>
                        <td class="td-vehTitle">Last Time Out</td>
                        <td class="td-vehData">
                            <input type="text" id="td-LastTimeOut" readonly="true" /></td>
                    </tr>
                </tbody>
            </table>
            <div class="p-4 float-right">
                <button id="LinkClose" class="btn bg-danger text-light">Close</button>
            </div>

        </div>
    </div>



    <%--top summary of data--%>

    <div class="d-flex mx-5 px-5">

        <div class="mx-4 mr-2 rounded shadow px-2 alert-primary" style="width: 25%; display: flex; justify-content: space-between; border: 1px solid dodgerblue;">
            <span class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Vehicle Register</span>
            <asp:Label class="display-4 mb-1 font-weight-bold text-gray-800 mr-5" ID="lblTotalVeh" Text="" runat="server" />
        </div>

        <div class="mx-4 mr-2 border-info rounded shadow px-2 alert-info" style="width: 20%; display: flex; justify-content: space-between; border: 1px solid dodgerblue;">
            <span class="text-xs font-weight-bold text-info text-uppercase mb-1">In Project</span>
            <asp:Label class="display-4 mb-1 font-weight-bold text-gray-800 mr-5 d-block" ID="insiteVeh" Text="" runat="server" />
        </div>

        <div class="mx-4 mr-2 border-success rounded shadow px-2 alert-success" style="width: 20%; display: flex; justify-content: space-between; border: 1px solid dodgerblue;">
            <span class="text-xs font-weight-bold text-success text-uppercase mb-1">Tag Assigned</span>
            <asp:Label class="display-4 mb-1 font-weight-bold text-gray-800 mr-5" ID="lblTagVeh" Text="" runat="server" />
        </div>

        <div class="mx-4 mr-2 border-danger rounded shadow px-2 alert-danger" style="width: 20%; display: flex; justify-content: space-between; border: 1px solid dodgerblue;">
            <span class="text-xs font-weight-bold text-danger text-uppercase mb-1">None E Tag</span>
            <asp:Label class="display-4 mb-1 font-weight-bold text-gray-800 mr-5" ID="lblNoneETagVeh" Text="" runat="server" />
        </div>

    </div>

    <%--hidden div for database data--%>

    <div style="display: none;">
        <asp:Label ID="lblBlockVeh" Text="" runat="server" />
        <asp:Label ID="tvi1" runat="server" Text="" />
        <asp:Label ID="tvi2" runat="server" Text="" />
        <asp:Label ID="tvi3" runat="server" Text="" />
        <asp:Label ID="tvi4" runat="server" Text="" />
        <asp:Label ID="tvo1" runat="server" Text="" />
        <asp:Label ID="tvo2" runat="server" Text="" />
        <asp:Label ID="tvo3" runat="server" Text="" />
        <asp:Label ID="tvo4" runat="server" Text="" />
        
        <asp:Label ID="outsiteVeh" runat="server" Text="" /> 
        <asp:Label ID="blockVeh" runat="server" Text="" /> 
        
        <asp:Label ID="vehLevel5" runat="server" Text="" />
        <asp:Label ID="vehLevel4" runat="server" Text="" />
        <asp:Label ID="vehLevel3" runat="server" Text="" />
        <asp:Label ID="vehLevel2" runat="server" Text="" />
        <asp:Label ID="vehLevel1" runat="server" Text="" />
        
        <asp:Label ID="ycross" runat="server" Text="" />
        <asp:Label ID="gate2" runat="server" Text="" />
        <asp:Label ID="barrier2" runat="server" Text="" />
        <asp:Label ID="bridgePost" runat="server" Text="" />
        <asp:Label ID="g24g1" runat="server" Text="" />
        <asp:Label ID="g24g3" runat="server" Text="" />
    </div>

        



    <!-- Charts design start  -->

    <div class="d-flex ml-3 py-5">

        <%--pie chart start--%>

        <div class="grid-margin stretch-card d-none" style="padding-right: 10px; width: 30%;">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Vehicle Type</h4>
                    <canvas id="pieChart" width="300" height="300"></canvas>
                </div>
            </div>
        </div>

        <%--pie chart end--%>

        <div class="col-md-3" style="background: white; padding-top: 20px; margin-right: 20px;">
            <h2 class="box-title text-center mb-4">Vehicle Summary</h2>
            <ul class="" style="list-style-type: none; margin-left: 0px;">
                <li class="my-4">
                    <div class="d-flex justify-content-between">
                        <h4>Total Vehicles</h4>
                        <%--<large><%= DateTime.Now.ToString() %>  </large>--%>
                        <span class="mt-2 font-weight-bold text-gray-800">
                            <%--<asp:Label ID="pb_total" Text="" runat="server" />--%>
                            <span id="totalVeh"><%= totalVeh %> </span>
                                &#40<span id="totalVehP"></span>&#41
                        </span>
                    </div>
                    <div class="progress">
                        <div class="progress-bar ctn-vs-1" role="progressbar" aria-valuenow="<%= totalVeh %>" aria-valuemin="0" aria-valuemax="100" style="width: 100%; background: #0d6efe;">
                        </div>
                    </div>
                </li>
                <li class="my-4">
                    <div class="d-flex justify-content-between">
                        <h4>E Tag Vehicles</h4>
                        <span>
                            <span id="eTagVeh"><%= ETagVeh %> </span>
                            (<span id="ETagVehP"></span>)
                        </span>
                    </div>
                    <div class="progress  mb-2">
                        <div class="progress-bar ctn-vs-1 p" id="div_etag" role="progressbar" aria-valuenow="<%= ETagVeh %>" aria-valuemin="0" aria-valuemax="100" style="background: #479f76;">
                        </div>
                    </div>
                </li>
                
                <li class="my-4">
                    <div class="d-flex justify-content-between">
                        <h4>None E Tag Vehicles</h4>
                        <span>
                            <span id="neTagVeh"><%= NonETagVeh %> </span>
                            (<span id="noneETagP"></span>)
                        </span>
                    </div>
                    <div class="progress">
                        <div class="progress-bar ctn-vs-1" id="div_netag" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%; background: #b02a37;">
                        </div>
                    </div>
                </li>

                <li class="my-4">
                    <div class="d-flex justify-content-between">
                        <h4>Official Vehicles</h4>
                        <span>
                            <asp:Label ID="ofcVeh" runat="server" Text="" />
                            (<span id="ofcVehP"></span>)
                        </span>
                    </div>
                    <div class="progress">
                        <div class="progress-bar ctn-vs-1" id="div_ofcVeh" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%; background: rgb(133 42 176);">
                        </div>
                    </div>
                </li>

                <li class="my-4">
                    <div class="d-flex justify-content-between">
                        <h4>Private Vehicles</h4>
                        <span>
                            <asp:Label ID="pvtVeh" runat="server" Text="" />
                            (<span id="pvtVehP"></span>)
                        </span>
                    </div>
                    <div class="progress">
                        <div class="progress-bar ctn-vs-1" id="div_pvtVeh" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%; background: #fd7e14;">
                        </div>
                    </div>
                </li>
            </ul>
        </div>


        <div class="grid-margin stretch-card" style="padding-right: 20px; width: 27%;">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Vehicle Entrance</h4>
                    <canvas id="pbarChart" height="220"></canvas>
                </div>
            </div>
        </div>

        <div class="grid-margin stretch-card" style="padding-right: 20px; width: 23%;">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Vehicle Status
                    </h4>
                    <canvas id="doughtnutChart" style="height: 10px"></canvas>
                </div>
            </div>
        </div>

        <div class="grid-margin stretch-card" style="padding-right: 10px; width: 23%; height: 220px;">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Vehicle Category
                    </h4>
                    <canvas id="vehLevel" style="height: 220px"></canvas>
                </div>
            </div>
        </div>





    </div>

    <!--**********************************
       VACS Tap End
    ***********************************-->


    <!-- Chart design end  -->

    <!-- bootstrap script files links  -->

    <script
        src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
    <script src="js/Chart.js"></script>

    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>
    <script src="Scripts/JQueryUpdated.js"></script>
    <script>

        var totalVeh = document.getElementById('ContentPlaceHolder1_lblTotalVeh').textContent;
        var eTagVeh = document.getElementById('ContentPlaceHolder1_lblTagVeh').textContent;
        var neTagVeh = document.getElementById('neTagVeh').textContent;
        var blockVeh = document.getElementById('ContentPlaceHolder1_lblBlockVeh').textContent;
        var tvi1 = document.getElementById('ContentPlaceHolder1_tvi1').textContent;
        var tvi2 = document.getElementById('ContentPlaceHolder1_tvi2').textContent;
        var tvi3 = document.getElementById('ContentPlaceHolder1_tvi3').textContent;
        var tvi4 = document.getElementById('ContentPlaceHolder1_tvi4').textContent;
        var tvo1 = document.getElementById('ContentPlaceHolder1_tvo1').textContent;
        var tvo2 = document.getElementById('ContentPlaceHolder1_tvo2').textContent;
        var tvo3 = document.getElementById('ContentPlaceHolder1_tvo3').textContent;
        var tvo4 = document.getElementById('ContentPlaceHolder1_tvo4').textContent;
        var insiteVeh = document.getElementById('ContentPlaceHolder1_insiteVeh').textContent;
        var outsiteVeh = document.getElementById('ContentPlaceHolder1_outsiteVeh').textContent;
        var blockVeh = document.getElementById('ContentPlaceHolder1_blockVeh').textContent;
        var ofcVeh = document.getElementById('ContentPlaceHolder1_ofcVeh').textContent;
        var pvtVeh = document.getElementById('ContentPlaceHolder1_pvtVeh').textContent;
        var vehLevel5 = document.getElementById('ContentPlaceHolder1_vehLevel5').textContent;
        var vehLevel4 = document.getElementById('ContentPlaceHolder1_vehLevel4').textContent;
        var vehLevel3 = document.getElementById('ContentPlaceHolder1_vehLevel3').textContent;
        var vehLevel2 = document.getElementById('ContentPlaceHolder1_vehLevel2').textContent;
        var vehLevel1 = document.getElementById('ContentPlaceHolder1_vehLevel1').textContent;
        var ycross = document.getElementById('ContentPlaceHolder1_ycross').textContent;
        var gate2 = document.getElementById('ContentPlaceHolder1_gate2').textContent;
        var barrier2 = document.getElementById('ContentPlaceHolder1_barrier2').textContent;
        var bridgePost = document.getElementById('ContentPlaceHolder1_bridgePost').textContent;
        var g24g1 = document.getElementById('ContentPlaceHolder1_g24g1').textContent;
        var g24g3 = document.getElementById('ContentPlaceHolder1_g24g3').textContent;

        const ctxPB = document.getElementById("pbarChart").getContext("2d");
        const ctxP = document.getElementById("pieChart").getContext("2d");
        const ctxVL = document.getElementById('vehLevel').getContext('2d');
        const ctxD = document.getElementById('doughtnutChart').getContext('2d');


        const data = {
            labels: ["YCross", "Gate 2", "Barrier 2", "Bridge Post", "Outsite", "Blocked"],
            datasets: [
                {
                    label: "Vehicle status",
                    //data: [totalEmp, activeEmp, inactiveEmp],
                    data: [ycross - g24g1, gate2, barrier2 - g24g3, bridgePost, outsiteVeh, blockVeh],
                    backgroundColor: [
                        "#ffc107", "#E8720C", "#f4fc92", "#fcdeb8", "#20c997", "#AB2328"
                    ],
                    borderColor: [
                        "#ffc107", "#E8720C", "#f4fc92", "#fcdeb8", "#20c997", "#AB2328"
                    ],
                    borderWidth: 1,
                },
            ],
        };

        const dpVehLevel = {
            labels: ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"],
            datasets: [
                {
                    label: "Vehicle Category",
                    //data: [totalEmp, activeEmp, inactiveEmp],
                    data: [vehLevel1, vehLevel2, vehLevel3, vehLevel4, vehLevel5],
                    backgroundColor: [
                        "#20388F", "#6EC9E0", "#9E4770", "#9EA900", "#0B681A"
                    ],
                    borderColor: [
                        "#20388F", "#6EC9E0", "#9E4770", "#9EA900", "#0B681A"
                    ],
                    borderWidth: 1,
                },
            ],
        };

        //const dataPie = {
        //    labels: ["Private", "Official"],
        //    datasets: [
        //        {
        //            label: "Vehicle Type",
        //            //data: [totalEmp, activeEmp, inactiveEmp],
        //            data: [pvtVeh, ofcVeh],
        //            backgroundColor: [
        //                "#EB681A", "#126DB3"
        //            ],
        //            borderColor: [
        //                "#EB681A", "#126DB3"
        //            ],
        //            borderWidth: 1,
        //        },
        //    ],
        //};

        const myChartVL = new Chart(ctxVL, {
            type: "pie",
            data: dpVehLevel,
        });

        //const myChartP = new Chart(ctxP, {
        //    type: "pie",
        //    data: dataPie,
        //});

        

        const dataPB = {
            labels: ["12AM - 6AM", "6AM - 12PM", "12PM - 6PM", "6PM - 12AM"],
            datasets: [
                {
                    label: "Check In",
                    data: [tvi1, tvi2, tvi3, tvi4],
                    backgroundColor: "rgba(255, 206, 86, 1)",
                    borderColor: "rgba(255, 206, 86, 1)",
                    borderWidth: 1,
                },
                {
                    label: "Check Out",
                    data: [tvo1, tvo2, tvo3, tvo4],
                    backgroundColor: "rgba(75, 192, 192, 1)",
                    borderColor: "rgba(75, 192, 192, 1)",
                    borderWidth: 1,
                },
            ],
        };


        const pbarChart = new Chart(ctxPB, {
            type: "bar",
            data: dataPB,
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                    },
                },
            },
        });

        // doughtnut chart 

        const myChart2 = new Chart(ctxD, {
            type: 'doughnut',
            data: data,
        });


        //Vehicle registration Search

        //onclick function btnSearchVehRegno 

        //$('#BtnPanelPopup').click(() => {
        //    alert("veh btn clicked");
        //})

        //$('document').ready(function () {
        //    // alert("This is ready alert;");

        //    $('#popup_div').on('load', function(){
        //        alert('Reg Veh btn clicked...');
        //    })

        //})

        $(function () {
            $('#linkShowDialog').click(function (e) {
                var input_regno = $('#ContentPlaceHolder1_searchRegno').val().trim();
                if (input_regno == "") {
                    alert("Please enter vehicle registration number first.");
                    $('#ContentPlaceHolder1_searchRegno').val("");
                    return;
                } else {
                    $.ajax({
                        url: 'Home.aspx/vehRD',
                        //url: 'Settingwebmethods.aspx/getColor',
                        //url: 'Settingwebmethods.aspx/GetVehRegnoDetails',
                        method: 'POST',
                        contentType: 'application/json',
                        data: '{regno : "' + input_regno + '"}',
                        dataType: 'json',
                        success: function (data) {
                            $('#td-VehRegno').val(data.d.Id);
                            if ($('#td-VehRegno').val() != input_regno) {
                                alert("Record not found " + $('#td-VehRegno').val() + " " + input_regno);
                                $('#ContentPlaceHolder1_searchRegno').val("");
                                return;
                            }
                            // if we get data 
                            $('#td-VehRegno').val(input_regno);
                            $('#td-VehType').val(data.d.Type);
                            $('#td-VehColor').val(data.d.Colour);
                            $('#td-VehMake').val(data.d.Make);
                            $('#td-VehModel').val(data.d.Model);
                            $('#td-ValidUpto').val(data.d.ValidUpTo);
                            $('#td-LastTimeIn').val(data.d.maxTimeIn);
                            if (data.d.maxTimeOut == "") {
                                $('#td-currLoc').val("Inside the project");
                                $('#td-LastTimeOut').val("N/A");
                                // $("#lastTimeOutField").css("display", "none");
                            } else {
                                $('#td-currLoc').val("Outside of project");
                                $('#td-LastTimeOut').val(data.d.maxTimeOut);
                                // $("#lastTimeOutField").css("display", "block");
                            }
                            showDialog();
                            e.preventDefault();
                            return false;
                        },
                        error: err => {

                            //$('#message_backend').text(JSON.stringify(err));
                            //console.log(JSON.stringify(err));
                            //alert(JSON.stringify(err));
                            alert(err);
                            $('#ContentPlaceHolder1_searchRegno').val("");
                            return;
                        }
                    });

                    $('#ContentPlaceHolder1_searchRegno').val("");

                }

                function showDialog() {
                    $('#overlay').show();
                    $('#modal_dialog').slideDown(500);
                }


            })

            $('#LinkClose').click(function (e) {
                HideDialog();
                e.preventDefault();
            })

            //$('#LinkOk').click(function (e) {
            //    var value = $('#txtInput').val();
            //    $('#spText').text('You have entered [' + value + ']');
            //    HideDialog();
            //})

        })

        function HideDialog() {

            $('#overlay').hide();
            $('#modal_dialog').slideUp(500);
        }


        // set progress bar values 

        $(document).ready(function () {
            var totalVehP = totalVeh / totalVeh * 100;
            var eTagVehP = (eTagVeh / totalVeh * 100).toFixed(2);
            var neTagVehP = (neTagVeh / totalVeh * 100).toFixed(2);
            var ofcVehP = (ofcVeh / totalVeh * 100).toFixed(2);
            var pvtVehP = (pvtVeh / totalVeh * 100).toFixed(2);
            $('#totalVehP').text(totalVehP + "%");
            $('#ETagVehP').text(eTagVehP + "%");
            $('#noneETagP').text(neTagVehP + "%");
            $('#ofcVehP').text(ofcVehP + "%");
            $('#pvtVehP').text(pvtVehP + "%");
            // $('#ContentPlaceHolder1_lblInProject').text('21');
            document.getElementById("div_etag").style.width = $('#ETagVehP').text(); // #479f76
            document.getElementById("div_netag").style.width = $('#noneETagP').text();
            document.getElementById("div_ofcVeh").style.width = $('#ofcVehP').text();
            document.getElementById("div_pvtVeh").style.width = $('#pvtVehP').text();
            //document.getElementById("div_blockedEmp").style.width = $('#blockedEmpP').text();
            // console.log($('#totalEmpP').text());
        });


    </script>

    <!-- my script file links  -->
    <script src="script.js"></script>



</asp:Content>

