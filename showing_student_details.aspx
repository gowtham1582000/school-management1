<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="showing_student_details.aspx.vb" Inherits="MyWebAppDemo1.showing_student_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #GridViewStudents {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        #GridViewStudents th, #GridViewStudents td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        #GridViewStudents th {
            background-color: #f2f2f2;
        }
         body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        #form1 {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        h1, h2 {
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 style="text-align:center;">Students</h1>
        <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False">
            <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="ContactNumber" HeaderText="Phone Number" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
            </Columns>
        </asp:GridView>
        </div>
    </form>
</body>
</html>
