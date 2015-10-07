Imports CustodianAdmin.Data
Imports CustodianAdmin.Model

Public Class forgotpassword
    Inherits System.Web.UI.Page

    Dim udRepo As UserDetailRepository
    Dim uDetail As UserDetail
    Dim li As ListItem
    Protected blnStatus As Boolean
    Protected blnStatusX As Boolean
    Dim MenuName As String
    Dim MenuPosition As String
    Dim FirstMsg As String
    Dim updateFlag As Boolean
    Dim strKey As String
    Dim strOption As String
    Dim strErrMsg As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Public Sub VerifyDetails()
        lblMessage.Text = ""
        Dim strMyVal As String

        strMyVal = RTrim(Me.txtLoginName.Text)
        If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid email"
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "');"
            Exit Sub
        End If

        strMyVal = RTrim(Me.txtSecretPhrase.Text)
        If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid secret phrase"
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If

        udRepo = New UserDetailRepository()
        Dim userDetail = udRepo.GetBySecretPhrase(txtLoginName.Text.Trim(), txtSecretPhrase.Text.Trim())
        If userDetail IsNot Nothing Then
            Me.Panel1.Visible = True
        Else
            lblMessage.Text = "Invalid details entry!"
            Me.Panel1.Visible = False
        End If



    End Sub

    Public Function gnParseEmail_Address(ByVal emailString As String) As Boolean

        Dim pvblnStatus As Boolean = False

        Dim emailRegEx As New Regex("(\S+)@([^\.\s]+)(?:\.([^\.\s]+))+")
        Dim om As Match = emailRegEx.Match(emailString)
        If om.Success Then
            'Dim output As String = ""
            'output &= "User name: " & m.Groups(1).Value & vbCrLf
            'For i As Integer = 2 To m.Groups.Count - 1
            '    Dim g As Group = m.Groups(i)
            '    For Each c As Capture In g.Captures
            '        output &= "Address part: " & c.Value & vbCrLf
            '    Next
            'Next
            pvblnStatus = True
            'FirstMsg = "javascript:alert('E-mail address OK...');"
        Else
            pvblnStatus = False
            'FirstMsg = "javascript:alert('Error!. Invalid e-mail address...');"
        End If

        Return pvblnStatus

    End Function

    Protected Sub cmdSave_Click(sender As Object, e As EventArgs) Handles verifyBtn.Click
        VerifyDetails()
    End Sub

    Protected Sub changePwdBtn_Click(sender As Object, e As EventArgs) Handles changePwdBtn.Click
        ChangePassword(txtLoginName.Text, txtPwd2.Text)
    End Sub
    Public Function EncryptNew(ByVal icText As String) As String
        Dim icLen As Integer
        Dim icNewText As String
        Dim icChar As String
        Dim i As Long

        icChar = ""
        icNewText = ""

        icLen = Len(icText)
        For i = 1 To icLen
            icChar = Mid(icText, i, 1)
            Select Case Asc(icChar)
                Case 65 To 90
                    icChar = Chr(Asc(icChar) + 127)
                Case 97 To 122
                    icChar = Chr(Asc(icChar) + 121)
                Case 48 To 57
                    icChar = Chr(Asc(icChar) + 196)
                Case 32
                    icChar = Chr(32)
            End Select
            icNewText = icNewText + icChar
        Next
        EncryptNew = icNewText
    End Function

    Public Sub ChangePassword(ByVal email As String, ByVal password As String)

        lblMessage.Text = ""
        Dim strMyVal As String

        strMyVal = RTrim(Me.txtLoginName.Text)
        If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid email"
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "');"
            Exit Sub
        End If

        strMyVal = RTrim(Me.txtPwd2.Text)
        If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid password"
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If

        Try
            Dim update = New UserDetailRepository()
            update.UpdateUserPassword(email, EncryptNew(password))
            Me.lblMessage.Text = "Update successful!"
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
        Catch ex As Exception
            Me.lblMessage.Text = "Update failed"
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End Try


    End Sub

End Class