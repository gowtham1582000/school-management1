Imports System.Data.SqlClient

Public Class Adding_teacher
    Inherits System.Web.UI.Page
    Dim conn As String = ConfigurationManager.ConnectionStrings("schoolmanagement").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BindStudentsGrid()
    End Sub
    Protected Sub BindStudentsGrid()
        Using connection As New SqlConnection(conn)
            Dim adapter As New SqlDataAdapter("SELECT t.TeacherID,c.CourseName,c.CourseID,t.FirstName,t.LastName,t.DateOfBirth,t.Gender,t.ContactNumber,t.Address FROM Teachers as t join Courses as c on c.TeacherID=t.TeacherID", connection)
            Dim dataSet As New DataSet()
            adapter.Fill(dataSet)
            GridViewStudents.DataSource = dataSet
            GridViewStudents.DataBind()
        End Using
    End Sub

End Class