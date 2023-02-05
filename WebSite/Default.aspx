<%@ Page Title="Welcome to Visitor Management System" Language="C#" MasterPageFile="~/PACS.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
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
            bottom: 0;
            top: 0;
            z-index: 101;
            background-color: #000000;
            opacity: .75;
            /*filter: alpha(opacity=15);
            -moz-opacity: .15; */
        }

        .empTable {
            margin-top: 50px;
        }

        .td-vehTitle {
            width: 200px;
        }

        .empTable tr td {
            padding: 0.5rem 0.75rem;
        }

            .empTable tr td input {
                background: #edf0ee;
            }

        .AutoExtenderList {
            font-family: Verdana, Helvetica, sans-serif;
            font-size: .8em;
            margin: 0px;
            font-weight: normal;
            border: solid 1px #1171ba;
            line-height: 20px;
            padding-left: 0px;
            background-color: #aee6fc;
            list-style-type: none;
        }

        .AutoExtenderListItem {
            border-bottom: dotted 1px #1171ba;
            cursor: pointer;
            color: #1171ba;
            left: auto;
            margin: 0px;
            padding-left: 10px;
        }

        .AutoExtenderHighlight {
            color: White;
            background-color: #1171ba;
            cursor: pointer;
            margin: 0px;
            padding-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="background-color: rgb(240, 247, 250);">

        <!-- PACS VACS Tap  -->
        <nav class="nav justify-content-around nav-pills bg-dark nav-fill" style="height: 40px;">
            <li class="nav-item">
                <a class="nav-link active  text-light" aria-current="page" href="/" style="background: linear-gradient(180deg, #096192, #1171ba);">PACS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-light" href="home.aspx">VACS</a>
            </li>
        </nav>
    </div>

    <!-- <nav class="nav nav-pills justify-content-around nav-fill">
        <a class="nav-link active" aria-current="page" href="#">PACS</a>
        <a class="nav-link" href="index.html">VACS</a>
      </nav> -->

    <!--**********************************
       PACS Tap start
    ***********************************-->
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <div class="d-flex justify-content-between align-items-center px-3">
        <h1 class="my-4 h1" style="color: #1171ba;">Pedestrian Access Control System (PACS)</h1>

        <!-- Topbar Search -->


        <div class="input-group-append">
            <asp:TextBox
                class="d-flex justify-content-end"
                ID="searchHrno"
                Style="width: 25vw; background: #aee6fc;"
                type="text"
                placeholder="Search Employee by P No. / CNIC"
                aria-label="PACS Search"
                aria-describedby="basic-addon2"
                runat="server" />
            <%--<ajaxToolkit:AutoCompleteExtender ID="searchHrno_AutoCompleteExtender" runat="server" EnableCaching="true" BehaviorID="searchHrno_AutoCompleteExtender" DelimiterCharacters="" ServicePath="" TargetControlID="searchHrno" ServiceMethod="GetHrnos" MinimumPrefixLength="1" CompletionSetCount="1" CompletionInterval="10">
            </ajaxToolkit:AutoCompleteExtender>--%>
            <a class="text-light" href="#" id="linkShowDialog" style="background: #1171ba; padding: 10px; border-radius: 0 10px 10px 0; width: 60px;">
                <%--<i class="fa fa-search" aria-hidden="true"></i>--%>
                <img src="images/search-icon.svg" alt="search-icon" />
            </a>
            <ajaxToolkit:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" BehaviorID="TextBox1_AutoCompleteExtender" CompletionInterval="100" DelimiterCharacters="" MinimumPrefixLength="1" ServiceMethod="GetHrnos" TargetControlID="searchHrno" CompletionListCssClass="AutoExtenderList" CompletionListHighlightedItemCssClass="AutoExtenderHighlight" CompletionListItemCssClass="AutoExtenderListItem">
            </ajaxToolkit:AutoCompleteExtender>

            <div class="float-right">
                <a id="pacs-report" class="btn bg-success text-light ml-1 mt-1 py-2" href="Dashboard/PACS-Report.aspx">Get Report</a>
            </div>

        </div>

    </div>



    <div class="dialog_div">

        <div id="overlay" class="overlay"></div>
        <div id="modal_dialog" class="web_dialog rounded px-4">
            <h1 class="pt-4 text-center" style="color: #1171ba;">Employee Detail</h1>
            <table class="table empTable">
                <thead>
                    <tr>
                        <td class="td-vehTitle">P No.</td>
                        <td>
                            <input type="text" id="td-EmpHrno" readonly="true" /></td>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="td-vehTitle">Employee Name</td>
                        <td class="td-vehData">
                            <input type="text" id="td-EmpType" readonly="true" /></td>
                        <td class="td-vehTitle">Department</td>
                        <td class="td-vehData">
                            <input type="text" id="td-EmpDept" readonly="true" /></td>
                    </tr>

                    <tr>
                        <td class="td-vehTitle">CNIC</td>
                        <td class="td-vehData">
                            <input type="text" id="td-EmpCnic" readonly="true" /></td>
                        <td class="td-vehTitle">Designation</td>
                        <td class="td-vehData">
                            <input type="text" id="td-EmpDsgn" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td class="td-vehTitle">Phone Number</td>
                        <td class="td-vehData">
                            <input type="text" id="td-EmpMobile" readonly="true" /></td>
                        <td class="td-vehTitle">Rank</td>
                        <td class="td-vehData">
                            <input type="text" id="td-EmpRank" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td class="td-vehTitle">Gender</td>
                        <td class="td-vehData">
                            <input type="text" id="td-EmpGndr" readonly="true" /></td>
                        <td class="td-vehTitle">Current Status</td>
                        <td class="td-vehData">
                            <input type="text" id="td-currLoc" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td class="td-vehTitle">Last Time In</td>
                        <td class="td-vehData">
                            <input type="text" id="td-LastTimeIn" readonly="true" /></td>
                        <td class="td-vehTitle">Last Time Out</td>
                        <td class="td-vehData">
                            <input type="text" id="td-LastTimeOut" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td class="td-vehTitle">Gate Number <br />(of last entry)</td>
                        <td class="td-vehData">
                            <input type="text" id="td-gateNo" readonly="true" /></td>
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

        <div class="mx-4 mr-2 rounded shadow px-2 alert-primary" style="width: 20%; display: flex; justify-content: space-between; border: 1px solid dodgerblue;">
            <span class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Employee</span>
            <%--<span class="counter">100000</span>--%>
            <asp:Label class="display-4 mb-1 font-weight-bold text-gray-800 mr-5 counter" ID="lblTotalEmp" Text="" runat="server" />
        </div>

        
        <div class="mx-4 mr-2 border-success rounded shadow px-2 alert-success" style="width: 20%; display: flex; justify-content: space-between; border: 1px solid dodgerblue;">
            <span class="text-xs font-weight-bold text-success text-uppercase mb-1">In Project</span>
            <asp:Label class="display-4 mb-1 font-weight-bold text-gray-800 mr-5 d-none" ID="lblActiveEmp" Text="" runat="server" />
            <asp:Label class="display-4 mb-1 font-weight-bold text-gray-800 mr-5" ID="lblInProject" Text="" runat="server" />
        </div>

        <div class="mx-4 mr-2 border-warning rounded shadow px-2 alert-warning" style="width: 20%; display: flex; justify-content: space-between; border: 1px solid dodgerblue;">
            <span class="text-xs font-weight-bold text-warning text-uppercase mb-1">Outsite</span>
            <asp:Label class="display-4 mb-1 font-weight-bold text-gray-800 mr-5 d-none" ID="lblInactiveEmp" Text="" runat="server" />
            <asp:Label class="display-4 mb-1 font-weight-bold text-gray-800 mr-5" ID="lblOutside" Text="" runat="server" />
        </div>

    </div>



    <!-- Charts design start  -->

    <div class="row m-3">

        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 p-2" style="width: 25%; background: white;">
            <div class="white-box ">
                <h2 class="box-title text-center mb-4">Employee Summary</h2>
                <ul class="" style="list-style-type: none;">
                    <li class="my-4">
                        <div class="d-flex justify-content-between">
                            <h4>Total Employees</h4>
                            <%--<large><%= DateTime.Now.ToString() %>  </large>--%>
                            <span class="mt-2 font-weight-bold text-gray-800">
                                <%--<asp:Label ID="pb_total" Text="" runat="server" />--%>
                                <%= totalEmp %> 
                                &#40<span id="totalEmpP"></span>&#41
                            </span>
                        </div>
                        <div class="progress">
                            <div class="progress-bar ctn-vs-1" role="progressbar" aria-valuenow="<%= totalEmp %>" aria-valuemin="0" aria-valuemax="100" style="width: 100%; background: #0d6efe;">
                            </div>
                        </div>
                    </li>
                    <li class="my-3">
                        <div class="d-flex justify-content-between">
                            <h4>Currently serving</h4>
                            <span>
                            <span id="currserving"><%= currservingEmp %> </span>
                            (<span id="ServingEmpP"></span>)
                                </span>
                        </div>
                        <div class="progress  mb-2">
                            <div class="progress-bar ctn-vs-1 p" id="div_servingEmp" role="progressbar" aria-valuenow="<%= currservingEmp %>" aria-valuemin="0" aria-valuemax="100" style="background: #479f76;">
                            </div>
                        </div>
                    </li>
                    <li class="my-4">
                        <div class="d-flex justify-content-between">
                            <h4>Retired Employees</h4>
                            <span>
                            <%= retiredEmp %>
                            (<span id="retiredEmpP"></span>)
                                </span>
                        </div>
                        <div class="progress">
                            <div class="progress-bar ctn-vs-1" id="div_retiredEmp" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%; background: #fd7e14;">
                            </div>
                        </div>
                    </li> 
                    <li class="my-4">
                        <div class="d-flex justify-content-between">
                            <h4>Blocked Employees</h4>
                            <span>
                            <span id="blockedEmp"><%= blockedEmp %> </span>
                            (<span id="blockedEmpP"></span>)
                                </span>
                        </div>
                            <div class="progress" >
                                <div class="progress-bar ctn-vs-1" id="div_blockedEmp" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%; background: #b02a37;">
                                </div>
                            </div>
                    </li>
                </ul>
            </div>

            <div style="display: none;">
                <asp:Label ID="level1h" runat="server" Text="" />
                <asp:Label ID="level2h" runat="server" Text="" />
                <asp:Label ID="level3h" runat="server" Text="" />
                <asp:Label ID="level4h" runat="server" Text="" />
                <asp:Label ID="tei1" runat="server" Text="" />
                <asp:Label ID="tei2" runat="server" Text="" />
                <asp:Label ID="tei3" runat="server" Text="" />
                <asp:Label ID="tei4" runat="server" Text="" />
                <asp:Label ID="teo1" runat="server" Text="" />
                <asp:Label ID="teo2" runat="server" Text="" />
                <asp:Label ID="teo3" runat="server" Text="" />
                <asp:Label ID="teo4" runat="server" Text="" />
                <asp:Label ID="empLevel1" runat="server" Text="" />
                <asp:Label ID="empLevel2" runat="server" Text="" />
                <asp:Label ID="empLevel3" runat="server" Text="" />
                <asp:Label ID="empLevel4" runat="server" Text="" />
                <asp:Label ID="empLevel5" runat="server" Text="" />
                <asp:Label ID="ycross" runat="server" Text="" />
                <asp:Label ID="gate2" runat="server" Text="" />
                <asp:Label ID="barrier2" runat="server" Text="" />
                <asp:Label ID="bridgePost" runat="server" Text="" />
                <asp:Label ID="g24g1" runat="server" Text="" />
                <asp:Label ID="g24g3" runat="server" Text="" />
                
            </div>
            
        </div>

        <div class="col-lg-3 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Employee Entrance</h4>
                    <canvas id="pbarChart" height="205"></canvas>
                </div>
            </div>
        </div>

        <div class="col-lg-3 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Employee Status</h4>
                    <canvas id="doughtnutChart" style="height: 10px"></canvas>
                </div>
            </div>
        </div>

        <div class="col-lg-3 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Employee Catagory</h4>
                    <canvas id="pieChart" width="300" height="300"></canvas>
                </div>
            </div>
        </div>

    </div>

    <!--**********************************
       PACS Tap End
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

        var totalEmp = document.getElementById('ContentPlaceHolder1_lblTotalEmp').textContent;
        var activeEmp = document.getElementById('ContentPlaceHolder1_lblActiveEmp').textContent;
        var inactiveEmp = document.getElementById('ContentPlaceHolder1_lblInactiveEmp').textContent;
        var blockedEmp = document.getElementById('blockedEmp').textContent;
        var level1 = document.getElementById('ContentPlaceHolder1_level1h').textContent;
        var level2 = document.getElementById('ContentPlaceHolder1_level2h').textContent;
        var level3 = document.getElementById('ContentPlaceHolder1_level3h').textContent;
        var level4 = document.getElementById('ContentPlaceHolder1_level4h').textContent;
        var tei1 = document.getElementById('ContentPlaceHolder1_tei1').textContent;
        var tei2 = document.getElementById('ContentPlaceHolder1_tei2').textContent;
        var tei3 = document.getElementById('ContentPlaceHolder1_tei3').textContent;
        var tei4 = document.getElementById('ContentPlaceHolder1_tei4').textContent;
        var teo1 = document.getElementById('ContentPlaceHolder1_teo1').textContent;
        var teo2 = document.getElementById('ContentPlaceHolder1_teo2').textContent;
        var teo3 = document.getElementById('ContentPlaceHolder1_teo3').textContent;
        var teo4 = document.getElementById('ContentPlaceHolder1_teo4').textContent;
        var empLevel1 = document.getElementById('ContentPlaceHolder1_empLevel1').textContent;
        var empLevel2 = document.getElementById('ContentPlaceHolder1_empLevel2').textContent;
        var empLevel3 = document.getElementById('ContentPlaceHolder1_empLevel3').textContent;
        var empLevel4 = document.getElementById('ContentPlaceHolder1_empLevel4').textContent;
        var empLevel5 = document.getElementById('ContentPlaceHolder1_empLevel5').textContent;
        var ycross = document.getElementById('ContentPlaceHolder1_ycross').textContent;
        var gate2 = document.getElementById('ContentPlaceHolder1_gate2').textContent;
        var barrier2 = document.getElementById('ContentPlaceHolder1_barrier2').textContent;
        var bridgePost = document.getElementById('ContentPlaceHolder1_bridgePost').textContent;
        var g24g1 = document.getElementById('ContentPlaceHolder1_g24g1').textContent;
        var g24g3 = document.getElementById('ContentPlaceHolder1_g24g3').textContent;
        var outsiteEmp = document.getElementById('currserving').textContent;
        $('#ContentPlaceHolder1_lblInProject').text(Number(ycross) + Number(barrier2));
        $('#ContentPlaceHolder1_lblOutside').text(Number(outsiteEmp) - Number(ycross) - Number(barrier2));

        // console.log(totalEmp, activeEmp, inactiveEmp, level1, level2, level3, level4, empLevel1, empLevel2, empLevel3, empLevel4, empLevel5);

        const ctxPB = document.getElementById("pbarChart").getContext("2d");
        const ctxP = document.getElementById("pieChart").getContext("2d");
        const ctxD = document.getElementById('doughtnutChart').getContext('2d');


        const data = {
            labels: ["YCross", "Gate 2", "Barrier 2", "Bridge Post"],
            datasets: [
                {
                    label: "Employee List",
                    //data: [totalEmp, activeEmp, inactiveEmp],
                    data: [ycross - g24g1, gate2, barrier2 - g24g3, bridgePost],
                    backgroundColor: [
                        "#4e73df", "#1cc88a", "#36b9cc", "#8d4004", "#858796", "#5a5c69", "#f6c23e"
                    ],
                    borderColor: [
                        "#4e73df", "#1cc88a", "#36b9cc", "#8d4004", "#858796", "#5a5c69", "#f6c23e"
                    ],
                    borderWidth: 1,
                },
            ],
        };

        const dataLevel = {
            labels: ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"],
            datasets: [
                {
                    label: "Employee Catagories",
                    //data: [totalEmp, activeEmp, inactiveEmp],
                    data: [empLevel1, empLevel2, empLevel3, empLevel4, empLevel5],
                    backgroundColor: [
                        "#e74a3b", "#858796", "#058da1", "#f6c23e", "#AE388B"
                    ],
                    borderColor: [
                        "#e74a3b", "#858796", "#058da1", "#f6c23e", "#AE388B"
                    ],
                    borderWidth: 1,
                },
            ],
        };

        const dataPB = {
            labels: ["12AM - 6AM", "6AM - 12PM", "12PM - 6PM", "6PM - 12AM"],
            datasets: [
                {
                    label: "Check In",
                    data: [tei1, tei2, tei3, tei4],
                    backgroundColor: "rgba(255, 206, 86, 1)",
                    borderColor: "rgba(255, 206, 86, 1)",
                    borderWidth: 1,
                },
                {
                    label: "Check Out",
                    data: [teo1, teo2, teo3, teo4],
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

        const myChartP = new Chart(ctxP, {
            type: "pie",
            data: dataLevel,
        });



        $(function () {
            $('#linkShowDialog').click(function (e) {
                var input_pno = $('#ContentPlaceHolder1_searchHrno').val().trim();
                if (input_pno == "") {
                    alert("Please enter P No. or CNIC first.");
                    $('#ContentPlaceHolder1_searchHrno').val("");
                    return;
                } else {
                    $.ajax({
                        url: 'Default.aspx/GetEmpDetails',
                        //url: 'Settingwebmethods.aspx/getColor',
                        //url: 'Settingwebmethods.aspx/GetVehRegnoDetails',
                        method: 'POST',
                        contentType: 'application/json',
                        data: '{hrn : "' + input_pno + '"}',
                        dataType: 'json',
                        success: function (data) {
                            $('#td-EmpHrno').val(data.d.Hrno);
                            if (input_pno == data.d.Hrno || input_pno == data.d.Cnic) {
                                // if we get data 
                                $('#td-EmpHrno').val(data.d.Hrno);
                                $('#td-EmpType').val(data.d.Name);
                                data.d.Cnic != "" ? $('#td-EmpCnic').val(data.d.Cnic) : $('#td-EmpCnic').val("N/A");
                                data.d.Mobile != "" ? $('#td-EmpMobile').val(data.d.Mobile) : $('#td-EmpMobile').val("N/A");
                                data.d.Department != "" ? $('#td-EmpDept').val(data.d.Department) : $('#td-EmpDept').val("N/A");
                                data.d.Designation != "" ? $('#td-EmpDsgn').val(data.d.Designation) : $('#td-EmpDsgn').val("N/A");
                                data.d.Rank != "" ? $('#td-EmpRank').val(data.d.Rank) : $('#td-EmpRank').val("N/A");
                                data.d.Gender != "" ? $('#td-EmpGndr').val(data.d.Gender) : $('#td-EmpGndr').val("N/A");
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
                                $('#td-gateNo').val(data.d.gateNo);
                                showDialog();
                                e.preventDefault();
                                return false;
                            } else {
                                alert("Record not found " + data.d.Hrno);
                                $('#ContentPlaceHolder1_searchHrno').val("");
                                return;
                            }
                            
                        },
                        error: err => {

                            //$('#message_backend').text(JSON.stringify(err));
                            //console.log(JSON.stringify(err));
                            //alert(JSON.stringify(err));
                            console.log(err);
                            alert("Got error...");
                            return;
                        }
                    });

                    $('#ContentPlaceHolder1_searchHrno').val("");

                }

                function showDialog() {
                    $('#overlay').show();
                    $('#modal_dialog').slideDown(500);
                }

                $('#ContentPlaceHolder1_searchHrno').autocomplete({
                    source: function (req, res) {
                        var params = { hrDetails: $('#ContentPlaceHolder1_searchHrno').val() };
                        $.ajax({
                            url: "Default.aspx/GetHrnos",
                            data: JSON.stringify(params),
                            type: "post",
                            contentType: "application/json; charset=utf-8;",
                            datafilter: function (data) { return data; },
                            success: function (data) {
                                res($.map(data.d, function (item) { return { value: item } }))
                            },
                        });
                    },
                    minLength: 1

                })


            })

            $('#LinkClose').click(function (e) {
                HideDialog();
                e.preventDefault();
            })


            // set progress bar values 

            $(document).ready(function () {
                var totalEmpP = totalEmp / totalEmp * 100;
                var activeEmpP = (activeEmp / totalEmp * 100).toFixed(2);
                var inactiveEmpP = (inactiveEmp / totalEmp * 100).toFixed(2);
                var blockedEmpP = (blockedEmp / totalEmp * 100).toFixed(2);
                $('#totalEmpP').text(totalEmpP + "%");
                $('#ServingEmpP').text(activeEmpP + "%");
                $('#retiredEmpP').text(inactiveEmpP + "%");
                $('#blockedEmpP').text(blockedEmpP + "%");
                // $('#ContentPlaceHolder1_lblInProject').text('21');
                document.getElementById("div_servingEmp").style.width = $('#ServingEmpP').text();
                document.getElementById("div_retiredEmp").style.width = $('#retiredEmpP').text();
                document.getElementById("div_blockedEmp").style.width = $('#blockedEmpP').text();
                // console.log($('#totalEmpP').text());
            });

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

        //$('#totalEmpP').val = 100;
        //console.log($('#totalEmpP').text());


    </script>

    <!-- my script file links  -->
    <script src="script.js"></script>


</asp:Content>

