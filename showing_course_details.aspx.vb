Imports System.Data.SqlClient

Public Class showing_course_details
    Inherits System.Web.UI.Page
    Dim conn As String = ConfigurationManager.ConnectionStrings("schoolmanagement").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BindStudentsGrid()
    End Sub
    Protected Sub BindStudentsGrid()
        Using connection As New SqlConnection(conn)
            Dim adapter As New SqlDataAdapter("SELECT c.CourseID,c.CourseName,t.TeacherID,concat(t.FirstName, ' ',t.LastName) as TeacherName
                                FROM Courses as c join Teachers as t on t.TeacherID=c.TeacherID", connection)
            Dim dataSet As New DataSet()
            adapter.Fill(dataSet)
            GridViewStudents.DataSource = dataSet
            GridViewStudents.DataBind()
        End Using
    End Sub
End Class