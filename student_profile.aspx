<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="student_profile.aspx.vb" Inherits="MyWebAppDemo1.student_profile" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Profile Page Design Example</title>
    <meta name="author" content="Codeconvey" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css' />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css' />
    <style>
        body {
            background: #67B26F;
            background: -webkit-linear-gradient(to right, #4ca2cd, #67B26F);
            background: linear-gradient(to right, #4ca2cd, #67B26F);
            padding: 0;
            margin: 0;
            font-family: 'Lato', sans-serif;
            color: #000;
        }

        .student-profile .card {
            border-radius: 10px;
        }

            .student-profile .card .card-header .profile_img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                margin: 10px auto;
                border: 10px solid #ccc;
                border-radius: 50%;
            }

            .student-profile .card h3 {
                font-size: 20px;
                font-weight: 700;
            }

            .student-profile .card p {
                font-size: 16px;
                color: #000;
            }

        .student-profile .table th,
        .student-profile .table td {
            font-size: 14px;
            padding: 5px 10px;
            color: #000;
        }

        @import url('https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900');

        html {
            box-sizing: border-box;
        }

        *, *:before, *:after {
            box-sizing: inherit;
        }

        article, header, section, aside, details, figcaption, figure, footer, header, hgroup, main, nav, section, summary {
            display: block;
        }

        body {
            color: #222;
            font-size: 100%;
            line-height: 24px;
            margin: 0;
            padding: 0;
            font-family: "Raleway",sans-serif;
        }

        a {
            font-family: "Raleway",sans-serif;
            text-decoration: none;
            outline: none;
        }

            a:hover, a:focus {
                color: #373e18;
            }

        section {
            float: left;
            width: 100%;
            padding-bottom: 3em;
        }

        h2 {
            color: #1a0e0e;
            font-size: 26px;
            font-weight: 700;
            margin: 0;
            line-height: normal;
            text-transform: uppercase;
        }

            h2 span {
                display: block;
                padding: 0;
                font-size: 18px;
                opacity: 0.7;
                margin-top: 5px;
                text-transform: uppercase;
            }

        #float-right {
            float: right;
        }


        .ScriptTop {
            background: #fff none repeat scroll 0 0;
            float: left;
            font-size: 0.69em;
            font-weight: 600;
            line-height: 2.2;
            padding: 12px 0;
            text-transform: uppercase;
            width: 100%;
        }

            /* To Navigation Style 1*/
            .ScriptTop ul {
                margin: 24px 0;
                padding: 0;
                text-align: left;
            }

            .ScriptTop li {
                list-style: none;
                display: inline-block;
            }

                .ScriptTop li a {
                    background: #6a4aed none repeat scroll 0 0;
                    color: #fff;
                    display: inline-block;
                    font-size: 14px;
                    font-weight: 600;
                    padding: 5px 18px;
                    text-decoration: none;
                    text-transform: capitalize;
                }

                    .ScriptTop li a:hover {
                        background: #000;
                        color: #fff;
                    }




        .ScriptHeader {
            float: left;
            width: 100%;
            padding: 2em 0;
        }

        .rt-heading {
            margin: 0 auto;
            text-align: center;
        }

        .Scriptcontent {
            line-height: 28px;
        }

        .ScriptHeader h1 {
            font-family: "brandon-grotesque", "Brandon Grotesque", "Source Sans Pro", "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif;
            text-rendering: optimizeLegibility;
            -webkit-font-smoothing: antialiased;
            color: #6a4aed;
            font-size: 26px;
            font-weight: 700;
            margin: 0;
            line-height: normal;
        }

        .ScriptHeader h2 {
            color: #312c8f;
            font-size: 20px;
            font-weight: 400;
            margin: 5px 0 0;
            line-height: normal;
        }

        .ScriptHeader h1 span {
            display: block;
            padding: 0;
            font-size: 22px;
            opacity: 0.7;
            margin-top: 5px;
        }

        .ScriptHeader span {
            display: block;
            padding: 0;
            font-size: 22px;
            opacity: 0.7;
            margin-top: 5px;
        }

        .rt-container {
            margin: 0 auto;
            padding-left: 12px;
            padding-right: 12px;
        }

        .rt-row:before, .rt-row:after {
            display: table;
            line-height: 0;
            content: "";
        }

        .rt-row:after {
            clear: both;
        }

        #viewport {
            display: flex;
            min-height: 100vh;
            transition: all 0.5s ease;
        }


        #sidebar {
            z-index: 1000;
            width: 250px;
            background: #37474F;
            transition: all 0.5s ease;
            display: flex;
            flex-direction: column;
            padding-top: 20px; /* Add padding to the top of the sidebar */
        }

            #sidebar header {
                background-color: #263238;
                font-size: 20px;
                line-height: 52px;
                text-align: left;
                color: white;
                padding-left: 20px;
                margin-bottom: 20px;
            }

                #sidebar header a {
                    color: #fff;
                    display: block;
                    text-decoration: none;
                    padding: 16px 0;
                }

                    #sidebar header a:hover {
                        color: #fff;
                    }

            #sidebar .nav {
                flex-grow: 1;
                padding-top: 20px;
            }

                #sidebar .nav a {
                    color: #CFD8DC;
                    font-size: 14px;
                    padding: 16px 24px;
                    text-decoration: none;
                    transition: color 0.3s ease;
                }

                #sidebar .nav li {
                    color: #CFD8DC;
                    font-size: 14px;
                    padding: 20px;
                    text-decoration: none;
                    transition: color 0.3s ease;
                    list-style: none;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                }

                #sidebar .nav a:hover {
                    color: #ECEFF1;
                }

                #sidebar .nav a i {
                    margin-right: 16px;
                }

        /* Content */

        #content {
            flex-grow: 1;
            padding: 20px;
            transition: all 0.5s ease;
        }

        /* Navbar Styles */

        .navbar-default {
            background-color: #fff;
            border-color: transparent;
        }

            .navbar-default .navbar-nav > li > a {
                color: #333;
            }

                .navbar-default .navbar-nav > li > a:hover {
                    color: #555;
                }

                .navbar-default .navbar-nav > li > a > i {
                    margin-right: 10px;
                }


        @media (min-width: 768px) {
            .rt-container {
                width: 750px;
            }

            [class^="col-rt-"] {
                float: left;
                width: 49.9999999999%;
            }

            .col-rt-6, .col-rt-12 {
                width: 100%;
            }
        }

        @media (min-width: 1200px) {
            .rt-container {
                width: 1170px;
            }

            .col-rt-1 {
                width: 16.6%;
            }

            .col-rt-2 {
                width: 30.33%;
            }

            .col-rt-3 {
                width: 50%;
            }

            .col-rt-4 {
                width: 67.664%;
            }

            .col-rt-5 {
                width: 83.33%;
            }
        }

        @media only screen and (min-width:240px) and (max-width: 768px) {
            .ScriptTop h1, .ScriptTop ul {
                text-align: center;
            }

            .ScriptTop h1 {
                margin-top: 0;
                margin-bottom: 15px;
            }

            .ScriptTop ul {
                margin-top: 12px;
            }

            .ScriptHeader h1,
            .ScriptHeader h2,
            .scriptnav ul {
                text-align: center;
            }

            .scriptnav ul {
                margin-top: 12px;
            }

            #float-right {
                float: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="viewport">
            <div id="sidebar">
                <header>
                    <a href="#">My App</a>
                </header>
                <ul class="nav">
                    <li>
                        <a href="student_profile.aspx">
                            <i class="zmdi zmdi-view-dashboard"></i>Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="#" style="white-space: nowrap">
                            <i class="zmdi zmdi-link"></i>Attendance Chart
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="zmdi zmdi-widgets"></i>Mark Report
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="zmdi zmdi-calendar"></i>Time Table
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="zmdi zmdi-info-outline"></i>Log Out
                        </a>
                    </li>

                </ul>
            </div>
            <div id="content">
                <header class="ScriptHeader">
                    <div class="rt-container">
                        <div class="col-rt-12">
                            <div class="rt-heading">
                                <h1>Student Profile Page</h1>
                            </div>
                        </div>
                    </div>
                </header>

                <section>
                    <div class="rt-container">
                        <div class="col-rt-12">
                            <div class="Scriptcontent">
                                <div class="student-profile py-4">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="card shadow-sm">
                                                    <div class="card-header bg-transparent text-center">
                                                        <asp:Image ID="profileImg" runat="server" CssClass="profile_img" />
                                                        <h3>
                                                            <asp:Label ID="studentName" runat="server"></asp:Label></h3>
                                                    </div>
                                                    <div class="card-body">
                                                        <p class="mb-0"><strong class="pr-1">Student ID:</strong><asp:Label ID="studentID" runat="server"></asp:Label></p>
                                                        <p class="mb-0"><strong class="pr-1">Class:</strong><asp:Label ID="studentClass" runat="server"></asp:Label></p>
                                                        <p class="mb-0"><strong class="pr-1">Section:</strong><asp:Label ID="studentSection" runat="server"></asp:Label></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="card shadow-sm">
                                                    <div class="card-header bg-transparent border-0">
                                                        <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
                                                    </div>
                                                    <div class="card-body pt-0">
                                                        <table class="table table-bordered">
                                                            <tr>
                                                                <th width="30%">Roll</th>
                                                                <td width="2%">:</td>
                                                                <td>
                                                                    <asp:Label ID="studentRoll" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="30%">Academic Year</th>
                                                                <td width="2%">:</td>
                                                                <td>
                                                                    <asp:Label ID="academicYear" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="30%">Gender</th>
                                                                <td width="2%">:</td>
                                                                <td>
                                                                    <asp:Label ID="studentGender" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="30%">Religion</th>
                                                                <td width="2%">:</td>
                                                                <td>
                                                                    <asp:Label ID="studentReligion" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="30%">Blood</th>
                                                                <td width="2%">:</td>
                                                                <td>
                                                                    <asp:Label ID="studentBlood" runat="server"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>


    </form>
</body>
</html>
