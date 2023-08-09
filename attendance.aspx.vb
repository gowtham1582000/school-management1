Imports System.Data.SqlClient
Imports System.Net

Public Class attendance
    Inherits System.Web.UI.Page
    Dim conn As String = ConfigurationManager.ConnectionStrings("schoolmanagement").ConnectionString
    Private attendanceDataSet As New DataSet()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        attendance()
    End Sub
    Protected Sub attendance()
        Using connection As New SqlConnection(conn)
            connection.Open()

            Dim query As String = "SELECT s.StudentID, CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, c.CourseID 
                          FROM Students s  
                          JOIN Courses c ON s.course_ID  = c.CourseID"
            Dim adapter As New SqlDataAdapter(query, connection)
            adapter.Fill(attendanceDataSet)
            GridViewAttendance.DataSource = attendanceDataSet
            GridViewAttendance.DataBind()
        End Using

    End Sub

    Protected Sub GridViewAttendance_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewAttendance.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim attendanceDateLabel As Label = CType(e.Row.FindControl("LabelAttendanceDate"), Label)
            attendanceDateLabel.Text = DateTime.Today.ToString("dd-MM-yyyy")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim connection As New SqlConnection(conn)
        Dim ds As New DataSet()
        Dim query As String = "SELECT * from Attendance"
        Dim adapter As New SqlDataAdapter(query, connection)
        adapter.Fill(ds)
        For Each row As GridViewRow In GridViewAttendance.Rows
            Dim studentID As Integer = Convert.ToInt32(row.Cells(0).Text)
            Dim studentName As String = row.Cells(1).Text
            Dim courseID As Integer = Convert.ToInt32(row.Cells(2).Text)
            Dim radioButtonList As RadioButtonList = CType(row.FindControl("RadioButtonListAttendance"), RadioButtonList)
            If radioButtonList IsNot Nothing Then
                Dim selectedValue As String = radioButtonList.SelectedValue.Trim()  ' Trim any spaces
                Dim newRow As DataRow = ds.Tables(0).NewRow()
                newRow("StudentID") = studentID
                newRow("StudentName") = studentName
                newRow("CourseID") = courseID
                newRow("AttendanceDate") = DateTime.Today

                If String.Equals(selectedValue, "Present", StringComparison.OrdinalIgnoreCase) Then
                    newRow("Attedancemark") = "Present"
                Else
                    newRow("Attedancemark") = "Absent"
                End If

                ds.Tables(0).Rows.Add(newRow)
            End If
        Next
        Dim builder As New SqlCommandBuilder(adapter)
        adapter.Update(ds)
    End Sub
End Class