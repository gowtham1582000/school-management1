Imports System.Collections.ObjectModel
Imports System.Data.SqlClient
Imports Newtonsoft.Json.Linq

Public Class WebForm1
    Inherits System.Web.UI.Page
    Dim conn As String = ConfigurationManager.ConnectionStrings("schoolmanagement").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAddStudent_Click(sender As Object, e As EventArgs) Handles btnAddStudent.Click
        Dim conn1 As SqlConnection = New SqlConnection(conn)
        Dim ds As New DataSet()
        Dim adapter As New SqlDataAdapter("SELECT * FROM Students", conn1)
        adapter.Fill(ds)
        Dim builder As New SqlCommandBuilder(adapter)
        Dim newRow As DataRow = ds.Tables(0).NewRow()
        newRow("StudentID") = StudentID.Text
        newRow("FirstName") = FirstName.Text
        newRow("LastName") = LastName.Text
        newRow("DateOfBirth") = dob.Text
        newRow("Gender") = gender.Text
        newRow("class") = Class1.Text
        newRow("ContactNumber") = phno.Text
        newRow("Address") = address.Text
        ds.Tables(0).Rows.Add(newRow)
        adapter.Update(ds)
        StudentID.Text = String.Empty
        FirstName.Text = String.Empty
        LastName.Text = String.Empty
        gender.Text = String.Empty
        dob.Text = String.Empty
        phno.Text = String.Empty
        address.Text = String.Empty
        Class1.Text = String.Empty
    End Sub

End Class