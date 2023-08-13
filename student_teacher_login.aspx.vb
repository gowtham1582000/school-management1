Imports System.Collections.ObjectModel
Imports System.Data.SqlClient
Imports System.Security.Cryptography

Public Class student_teacher_login
    Inherits System.Web.UI.Page
    Dim conn As String = ConfigurationManager.ConnectionStrings("schoolmanagement").ConnectionString
    Dim ds As New DataSet()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim loggedInEmail As String = Convert.ToString(Session("LoggedInEmail"))
        End If
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim conn1 As SqlConnection = New SqlConnection(conn)
        Dim email As String = txtLoginEmail.Text
        Dim password As String = txtLoginPassword.Text
        Dim query As String = "SELECT password FROM Students WHERE email = @email"
        Using conn1
            conn1.Open()
            Using cmd As New SqlCommand(query, conn1)
                cmd.Parameters.AddWithValue("@email", email)
                Dim hashedEnteredPassword As String = password
                Dim hashedDatabasePassword As String = CStr(cmd.ExecuteScalar())
                If hashedEnteredPassword = hashedDatabasePassword Then
                    Response.Redirect("student_profile.aspx?email=" & HttpUtility.UrlEncode(email))
                Else
                    MsgBox("Invalid email or password.")
                End If
            End Using
        End Using
    End Sub


End Class