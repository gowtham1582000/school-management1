<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adding_student.aspx.vb" Inherits="MyWebAppDemo1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
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

        

        #FirstName, #LastName, #dob, #gender, #phno, #address {
            margin: 10px 0;
            padding: 10px;
            width: 70%;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-left:100px;
        }
        #btnAddStudent {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            width:200px;
             border: 1px solid #ccc;
            border-radius: 3px;
            margin-left:300px;
             padding: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <h2  style="text-align:center;">Add New Student</h2>
        <asp:TextBox ID="FirstName" runat="server" placeholder="First Name"></asp:TextBox>
        <asp:TextBox ID="LastName" runat="server" placeholder="Last Name"></asp:TextBox>
            <br />
        <asp:TextBox ID="dob" runat="server" placeholder="Date Of Birth"></asp:TextBox>
        <asp:TextBox ID="gender" runat="server" placeholder="Gender"></asp:TextBox>
            <br />
        <asp:TextBox ID="phno" runat="server" placeholder="Contact Number"></asp:TextBox>
        <asp:TextBox ID="address" runat="server" placeholder="Address"></asp:TextBox>
         
        </div>
        <p>
        <asp:Button ID="btnAddStudent" runat="server" Text="Add Student" OnClick="btnAddStudent_Click" />
        </p>
    </form>
</body>
</html>
