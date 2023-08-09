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
        Dim query As String = "SELECT StudentID, StudentName, CourseID FROM Students"
        Using connection As New SqlConnection(conn)
            Dim adapter As New SqlDataAdapter("SELECT s.StudentID, CONCAT(s.FirstName, ' ', s.LastName) AS StudentName, c.CourseID 
                          FROM Students s  
                          JOIN Courses c ON s.course_ID  = c.CourseID", connection)
            Dim dataSet As New DataSet()
            adapter.Fill(dataSet, "Students")
            GridViewAttendance.DataSource = dataSet.Tables("Students")
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
        For Each row As GridViewRow In GridViewAttendance.Rows
            Dim studentID As String = row.Cells(0).Text
            Dim attendanceMark As String = CType(row.FindControl("RadioButtonListAttendance"), RadioButtonList).SelectedItem.Text


            Dim updateQuery As String = "UPDATE Attendance SET AttendanceDate = @AttendanceDate,Attedancemark = @AttendanceMark WHERE StudentID = @StudentID"

            Using connection As New SqlConnection(conn)
                Dim command As New SqlCommand(updateQuery, connection)
                command.Parameters.AddWithValue("@AttendanceMark", attendanceMark)
                command.Parameters.AddWithValue("@StudentID", studentID)
                connection.Open()
                command.ExecuteNonQuery()
            End Using
        Next
    End Sub
End Class