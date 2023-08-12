<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="student_performance.aspx.vb" Inherits="MyWebAppDemo1.student_performance" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        #form1 {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        .form-container {
            width: 40%;
            padding: 20px;
            align-items: center;
        }

        .chart-container {
            width: 55%;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 50%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            .button:hover {
                background-color: #45a049;
            }

        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

            .gridview th, .gridview td {
                padding: 8px;
                border: 1px solid #ccc;
                text-align: left;
            }

            .gridview th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

        .form-chart-container {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
        }

        .form-container {
            flex: 1;
            padding: 20px;
            box-sizing: border-box;
        }

        .chart-container {
            flex: 1;
            padding: 20px;
            box-sizing: border-box;
        }
         h1 {
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
            color: #333; /* Change the color as desired */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Student Performance Report</h1>
        <div class="container">
            <div class="form-chart-container">
                <div class="form-container">
                    <label for="txtStudentID">Enter Student ID:</label>
                    <input type="text" id="txtStudentID" runat="server" />
                    <br />
                    <label for="Text1">Enter Mark ID:</label>
                    <input type="text" id="Text1" runat="server" />
                    <br />
                    <br />
                    <asp:Button ID="btnGenerateReport" Text="Generate Mark Report" OnClick="btnGenerateReport_Click" runat="server" CssClass="button" />
                </div>
                <div class="chart-container">
                    <asp:Chart ID="Chart1" runat="server" Height="190px" Width="273px">
                        <Series>
                            <asp:Series Name="Series1" ChartType="Pie" ChartArea="ChartArea1"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
        </div>
        <br />
        <asp:GridView ID="GridViewStudents" CssClass="gridview" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewStudents_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                <asp:BoundField DataField="marks_id" HeaderText="Mark ID" />
                <asp:BoundField DataField="class" HeaderText="Class" />
                <asp:TemplateField HeaderText="Generate Report">
                    <ItemTemplate>
                        <asp:Button ID="btnGenerateStudentReport" Text="Generate Mark Report" CommandName="Select" CommandArgument='<%# Eval("StudentID").ToString() + ";" + Eval("marks_id").ToString() %>' runat="server" CssClass="button" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
