<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="grade.aspx.vb" Inherits="MyWebAppDemo1.grade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        body {
            font-family: Arial, sans-serif;
        }
        #form1 {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .input-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        #txtSearch {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        #btnSearch {
            margin-left: 10px;
            padding: 8px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        #GridView1 {
            width: 100%;
            border-collapse: collapse;
        }
        #GridView1 th, #GridView1 td {
            padding: 8px;
            border: 1px solid #ccc;
        }
        #GridView1 th {
            background-color: #f2f2f2;
        }
        #GridView1 input[type="text"] {
            width: 80px;
            padding: 5px;
        }
        #Button1 {
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .search-heading {
            font-size: 24px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="search-heading">Student Attendance Management</h1>
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Enter Student ID"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search"/><br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                    <asp:BoundField DataField="studentname" HeaderText="Student Name" />
                    <asp:BoundField DataField="CourseID" HeaderText="Course ID" />
                    <asp:BoundField DataField="courseName" HeaderText="Course Name" />
                    <asp:TemplateField HeaderText="Marks">
                        <ItemTemplate>
                            <asp:TextBox ID="txtMarks" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Save Attendance" />
    </form>
</body>
</html>
