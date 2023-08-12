Imports System.Data.SqlClient

Public Class grade
    Inherits System.Web.UI.Page
    Dim conn As String = ConfigurationManager.ConnectionStrings("schoolmanagement").ConnectionString
    Dim ds As New DataSet()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            grade()
        End If
    End Sub
    Protected Sub grade()
        Dim conn1 As SqlConnection = New SqlConnection(conn)
        Dim adapter As New SqlDataAdapter("SELECT StudentID,concat(FirstName,' ',LastName) as StudentName,class
                                    from Students", conn1)
        adapter.Fill(ds)
        GridView1.DataSource = ds
        GridView1.DataBind()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim conn1 As SqlConnection = New SqlConnection(conn)
        Dim adapter As New SqlDataAdapter("SELECT * FROM StudentMarks", conn1)
        Dim ds As New DataSet()
        adapter.Fill(ds)
        Dim builder As New SqlCommandBuilder(adapter)
        For Each row As GridViewRow In GridView1.Rows
            Dim studentID As Integer = Convert.ToInt32(row.Cells(0).Text)
            Dim studentName As String = row.Cells(1).Text
            Dim class1 As String = row.Cells(3).Text
            Dim txtMarks As TextBox = CType(row.FindControl("txtMarks6"), TextBox)
            Dim txtMarks1 As TextBox = CType(row.FindControl("txtMarks1"), TextBox)
            Dim txtMarks2 As TextBox = CType(row.FindControl("txtMarks2"), TextBox)
            Dim txtMarks3 As TextBox = CType(row.FindControl("txtMarks3"), TextBox)
            Dim txtMarks4 As TextBox = CType(row.FindControl("txtMarks4"), TextBox)
            Dim txtMarks5 As TextBox = CType(row.FindControl("txtMarks5"), TextBox)
            Dim newRow As DataRow = ds.Tables(0).NewRow()
            Dim marks_id As Integer = txtMarks.Text
            Dim tamilMarks As String = txtMarks1.Text
            Dim scienceMarks As String = txtMarks2.Text
            Dim mathsMarks As String = txtMarks3.Text
            Dim socialMarks As String = txtMarks4.Text
            Dim englishMarks As String = txtMarks5.Text
            newRow("StudentID") = studentID
            newRow("studentname") = studentName
            newRow("class") = class1
            newRow("marks_id") = marks_id
            newRow("tamil") = tamilMarks
            newRow("science") = scienceMarks
            newRow("maths") = mathsMarks
            newRow("social") = socialMarks
            newRow("english") = englishMarks
            ds.Tables(0).Rows.Add(newRow)
        Next
        adapter.Update(ds)
        grade()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Dim conn1 As SqlConnection = New SqlConnection(conn)
        Dim txtMarks As TextBox = CType(FindControl("txtSearch"), TextBox)
        Try
            Dim grade As Integer = txtMarks.Text
            If Integer.TryParse(txtMarks.Text, grade) Then
                Dim adapter As New SqlDataAdapter($"SELECT StudentID,concat(FirstName,' ',LastName) as StudentName,class
                                    from Students
                                    WHERE
                                        StudentID = {grade}", conn1)
                adapter.Fill(ds)
                GridView1.DataSource = ds
                GridView1.DataBind()
            End If
        Catch ex As Exception
            Dim conn2 As SqlConnection = New SqlConnection(conn)
            Dim adapter As New SqlDataAdapter("SELECT StudentID,concat(FirstName,' ',LastName) as StudentName,class
                                    from Students", conn2)
            adapter.Fill(ds)
            GridView1.DataSource = ds
            GridView1.DataBind()
        End Try
    End Sub
End Class