<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="attendance.aspx.vb" Inherits="MyWebAppDemo1.attendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        #container {
            max-width: 610px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .grid-container {
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .grid-container label {
            font-weight: bold;
        }

        .attendance-mark {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }

        .attendance-mark label {
            width: 150px;
        }

        .btn-container {
            text-align: center;
            margin-top: 30px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Attendance Page</h1>
            <div class="grid-container">
                <asp:GridView ID="GridViewAttendance" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
            <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
            <asp:BoundField DataField="class" HeaderText="Class" />
            <asp:TemplateField HeaderText="Attendance Date">
                <ItemTemplate>
                    <asp:Label ID="LabelAttendanceDate" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Attendance Mark">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBoxAttendancePresent" runat="server" Text="Present" />
                    <asp:CheckBox ID="CheckBoxAttendanceAbsent" runat="server" Text="Absent" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>                </asp:GridView>
                
            </div>
            <div class="btn-container">
                <asp:Button ID="Button1" runat="server" Text="Save Attendance" CssClass="btn-primary" />
            </div>
        </div>
    </form>
</body>
</html>
