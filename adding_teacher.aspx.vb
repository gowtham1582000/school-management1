Imports System.Data.SqlClient

Public Class adding_teacher1
    Inherits System.Web.UI.Page
    Dim conn As String = ConfigurationManager.ConnectionStrings("schoolmanagement").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAddCourse_Click(sender As Object, e As EventArgs) Handles btnAddStudent.Click
        Dim conn1 As SqlConnection = New SqlConnection(conn)
        Dim ds As New DataSet()
        Dim adapter As New SqlDataAdapter("SELECT * FROM Teachers", conn1)
        adapter.Fill(ds)
        Dim builder As New SqlCommandBuilder(adapter)
        Dim newRow As DataRow = ds.Tables(0).NewRow()
        newRow("FirstName") = FirstName.Text
        newRow("TeacherID") = Techer_ID.Text
        newRow("LastName") = LastName.Text
        newRow("DateOfBirth") = dob.Text
        newRow("Gender") = gender.Text
        newRow("ContactNumber") = phno.Text
        newRow("Address") = address.Text
        ds.Tables(0).Rows.Add(newRow)
        adapter.Update(ds)
        FirstName.Text = String.Empty
        LastName.Text = String.Empty
        Techer_ID.Text = String.Empty
        gender.Text = String.Empty
        phno.Text = String.Empty
        address.Text = String.Empty
        dob.Text = String.Empty
    End Sub
End Class