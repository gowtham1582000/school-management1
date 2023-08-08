Imports System.Data.SqlClient
Imports System.Net

Public Class course_adding
    Inherits System.Web.UI.Page
    Dim conn As String = ConfigurationManager.ConnectionStrings("schoolmanagement").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAddStudent_Click(sender As Object, e As EventArgs) Handles btnAddStudent.Click
        Dim conn1 As SqlConnection = New SqlConnection(conn)
        Dim ds As New DataSet()
        Dim adapter As New SqlDataAdapter("SELECT * FROM Courses", conn1)
        adapter.Fill(ds)
        Dim builder As New SqlCommandBuilder(adapter)
        Dim newRow As DataRow = ds.Tables(0).NewRow() ' Create a new row
        newRow(2) = FirstName.Text
        newRow(3) = LastName.Text
        newRow("CourseName") = course_name.Text
        newRow("CourseID") = course_id.Text
        ds.Tables(0).Rows.Add(newRow)
        adapter.Update(ds)
        FirstName.Text = String.Empty
        LastName.Text = String.Empty
        course_id.Text = String.Empty
        course_name.Text = String.Empty

    End Sub
End Class