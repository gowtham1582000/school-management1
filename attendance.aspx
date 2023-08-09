<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="attendance.aspx.vb" Inherits="MyWebAppDemo1.attendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance Page</title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:GridView ID="GridViewAttendance" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
        <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
        <asp:BoundField DataField="CourseID" HeaderText="Course ID" />
        <asp:TemplateField HeaderText="Attendance Date">
            <ItemTemplate>
                <asp:Label ID="LabelAttendanceDate" runat="server" Text=""></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
       <asp:TemplateField HeaderText="Attendance Mark">
                        <ItemTemplate>
                            <asp:RadioButtonList ID="RadioButtonListAttendance" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Present" Value="Present" />
                                <asp:ListItem Text="Absent" Value="Absent" />
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
    </Columns>
</asp:GridView>

        <asp:Button ID="Button1" runat="server" Text="Button" />
    </form>
</body>
</html>
