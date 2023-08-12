Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Web.UI.DataVisualization.Charting

Public Class student_performance
    Inherits System.Web.UI.Page
    Dim conn As String = ConfigurationManager.ConnectionStrings("schoolmanagement").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindStudentData()
        End If
    End Sub
    Protected Sub BindStudentData()
        Using connection As New SqlConnection(conn)
            Dim query As String = "SELECT StudentID,StudentName,marks_id,class
                                    from StudentMarks"
            Using command As New SqlCommand(query, connection)
                connection.Open()
                Dim adapter As New SqlDataAdapter(command)
                Dim dataset As New DataSet()
                adapter.Fill(dataset)
                GridViewStudents.DataSource = dataset.Tables(0)
                GridViewStudents.DataBind()
            End Using
        End Using
    End Sub
    Protected Sub btnGenerateReport_Click(sender As Object, e As EventArgs) Handles btnGenerateReport.Click
        Dim selectedStudentID As Integer = Convert.ToInt32(txtStudentID.Value)
        Dim selectedMarkID As Integer = Convert.ToInt32(Text1.Value)

        Using connection As New SqlConnection(conn)
            connection.Open()
            Dim query As String = "SELECT tamil, science, maths, social, english FROM StudentMarks WHERE StudentID = @StudentID AND marks_id = @MarkID"

            Using command As New SqlCommand(query, connection)
                command.Parameters.AddWithValue("@StudentID", selectedStudentID)
                command.Parameters.AddWithValue("@MarkID", selectedMarkID)

                Using reader As SqlDataReader = command.ExecuteReader()
                    Dim subjects As New List(Of String)()
                    Dim marks As New List(Of Integer)()

                    If reader.Read() Then
                        Dim tamilMark As Integer = Convert.ToInt32(reader("tamil"))
                        Dim scienceMark As Integer = Convert.ToInt32(reader("science"))
                        Dim mathsMark As Integer = Convert.ToInt32(reader("maths"))
                        Dim socialMark As Integer = Convert.ToInt32(reader("social"))
                        Dim englishMark As Integer = Convert.ToInt32(reader("english"))

                        subjects.Add("Tamil")
                        subjects.Add("Science")
                        subjects.Add("Maths")
                        subjects.Add("Social")
                        subjects.Add("English")

                        marks.Add(tamilMark)
                        marks.Add(scienceMark)
                        marks.Add(mathsMark)
                        marks.Add(socialMark)
                        marks.Add(englishMark)

                        Chart1.Series("Series1").Points.DataBindXY(subjects, marks)
                        Chart1.Series("Series1").Label = "#VALY"
                        Chart1.Series("Series1").ChartType = SeriesChartType.Pie
                        Chart1.ChartAreas("ChartArea1").Area3DStyle.Enable3D = True
                        Chart1.Legends.Add(New Legend("Legend1"))

                        For i As Integer = 0 To subjects.Count - 1
                            Chart1.Series("Series1").Points(i).LegendText = subjects(i)
                        Next i
                    End If
                End Using
            End Using
        End Using
    End Sub

    Protected Sub GridViewStudents_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewStudents.SelectedIndexChanged
        Dim selectedRow As GridViewRow = GridViewStudents.SelectedRow
        Dim studentID As Integer = Convert.ToInt32(selectedRow.Cells(0).Text)
        Dim markID As Integer = Convert.ToInt32(selectedRow.Cells(2).Text)
        Using connection As New SqlConnection(conn)
            connection.Open()
            Dim query As String = "SELECT tamil, science, maths, social, english FROM StudentMarks WHERE StudentID = @StudentID AND marks_id = @MarkID"

            Using command As New SqlCommand(query, connection)
                command.Parameters.AddWithValue("@StudentID", studentID)
                command.Parameters.AddWithValue("@MarkID", markID)

                Using reader As SqlDataReader = command.ExecuteReader()
                    Dim subjects As New List(Of String)()
                    Dim marks As New List(Of Integer)()

                    If reader.Read() Then
                        Dim tamilMark As Integer = Convert.ToInt32(reader("tamil"))
                        Dim scienceMark As Integer = Convert.ToInt32(reader("science"))
                        Dim mathsMark As Integer = Convert.ToInt32(reader("maths"))
                        Dim socialMark As Integer = Convert.ToInt32(reader("social"))
                        Dim englishMark As Integer = Convert.ToInt32(reader("english"))

                        subjects.Add("Tamil")
                        subjects.Add("Science")
                        subjects.Add("Maths")
                        subjects.Add("Social")
                        subjects.Add("English")

                        marks.Add(tamilMark)
                        marks.Add(scienceMark)
                        marks.Add(mathsMark)
                        marks.Add(socialMark)
                        marks.Add(englishMark)

                        Chart1.Series("Series1").Points.DataBindXY(subjects, marks)
                        Chart1.Series("Series1").Label = "#VALY"
                        Chart1.Series("Series1").ChartType = SeriesChartType.Pie
                        Chart1.ChartAreas("ChartArea1").Area3DStyle.Enable3D = True
                        Chart1.Legends.Add(New Legend("Legend1"))

                        For i As Integer = 0 To subjects.Count - 1
                            Chart1.Series("Series1").Points(i).LegendText = subjects(i)
                        Next i
                    End If
                End Using
            End Using
        End Using
    End Sub
End Class