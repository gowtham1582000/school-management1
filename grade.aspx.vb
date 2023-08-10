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

        Dim adapter As New SqlDataAdapter("SELECT s.StudentID,concat(s.FirstName,' ',s.LastName) as StudentName,c.CourseID,c.courseName FROM 
            Students as s join Courses as c on c.CourseID=s.course_ID", conn1)
        adapter.Fill(ds)
        GridView1.DataSource = ds
        GridView1.DataBind()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim conn1 As SqlConnection = New SqlConnection(conn)
        Dim adapter As New SqlDataAdapter("SELECT * FROM Grades", conn1)
        Dim ds As New DataSet()
        adapter.Fill(ds)
        Dim builder As New SqlCommandBuilder(adapter)

        For Each row As GridViewRow In GridView1.Rows
            Dim studentID As Integer = Convert.ToInt32(row.Cells(0).Text)
            Dim studentName As String = row.Cells(1).Text
            Dim courseID As Integer = Convert.ToInt32(row.Cells(2).Text)
            Dim courseName As String = row.Cells(3).Text
            Dim txtMarks As TextBox = CType(row.FindControl("txtMarks"), TextBox)
            Dim grade As Integer

            If Integer.TryParse(txtMarks.Text, grade) Then
                Dim newRow As DataRow = ds.Tables(0).NewRow()
                newRow("StudentID") = studentID
                newRow("studentname") = studentName
                newRow("CourseID") = courseID
                newRow("courseName") = courseName
                newRow("Grade") = grade
                ds.Tables(0).Rows.Add(newRow)
            End If
        Next
        adapter.Update(ds)
        grade()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Dim conn1 As SqlConnection = New SqlConnection(conn)
        Dim txtMarks As TextBox = CType(FindControl("txtSearch"), TextBox)
        Dim grade As Integer = txtMarks.Text
        If Integer.TryParse(txtMarks.Text, grade) Then
            Dim adapter As New SqlDataAdapter($"SELECT
                                        s.StudentID,
                                        CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
                                        c.CourseID,
                                        c.CourseName
                                    FROM
                                        Students s
                                    JOIN
                                        Courses c ON s.course_ID = c.CourseID
                                    WHERE
                                        s.StudentID = {grade}", conn1)
            adapter.Fill(ds)
            GridView1.DataSource = ds
            GridView1.DataBind()
        End If
    End Sub

End Class