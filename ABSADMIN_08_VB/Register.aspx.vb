Imports System.Net.Mail
Imports CustodianAdmin.Data
Imports CustodianAdmin.Model
'Imports MailMessage = System.Web.Mail.MailMessage

Public Class Register
    Inherits System.Web.UI.Page
    Dim udRepo As UserDetailRepository
    Dim uDetail As UserDetail
    Dim li As ListItem
    Protected blnStatus As Boolean
    Protected blnStatusX As Boolean
    Dim MenuName As String
    Dim MenuPosition As String
    Protected FirstMsg As String
    Dim updateFlag As Boolean
    Dim strKey As String
    Dim strOption As String
    Dim strErrMsg As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.txtUserID.Text = RTrim("001")
        If Not Page.IsPostBack Then
            'udRepo = New UserDetailRepository
            ' Session("udRepo") = udRepo
            updateFlag = False
            Session("updateFlag") = updateFlag
            strKey = Request.QueryString("idd")
            Session("strKey") = strKey

            strOption = Request.QueryString("sopt")
            Session("strOption") = strOption

            li = New ListItem
            li.Text = "*** Select ***"
            li.Value = "*"
            cboGroup.Items.Add(li)

            li = New ListItem
            li.Text = "Administrators"
            li.Value = "admin"
            cboGroup.Items.Add(li)

            li = New ListItem
            li.Text = "Management"
            li.Value = "mgt"
            cboGroup.Items.Add(li)

            li = New ListItem
            li.Text = "System Users"
            li.Value = "sysuser"
            cboGroup.Items.Add(li)

            cboRole.Items.Add("Select")
            li = New ListItem("Super User", 1)
            cboRole.Items.Add(li)
            li = New ListItem("Administrator", 2)
            cboRole.Items.Add(li)
            li = New ListItem("Officer", 3)
            cboRole.Items.Add(li)
            cboRole.Text = 1


            Me.txtName.Enabled = True
            Me.txtName.Focus()


        Else 'post back
            udRepo = CType(Session("udRepo"), UserDetailRepository)
            strOption = CType(Session("strOption"), String)
        End If
    End Sub
    Protected Sub cmdSaveN_Click(sender As Object, e As EventArgs) Handles cmdSaveN.Click
        Call DoSave()
    End Sub

    Protected Sub txtLoginName_TextChanged(sender As Object, e As EventArgs) Handles txtLoginName.TextChanged
        If RTrim(Me.txtLoginName.Text) <> "" Then
            lblMessage.Text = RTrim(Me.txtShortName.Text)
            ' strREC_ID = RTrim(Me.txtLoginName.Text)
        End If
    End Sub

    Protected Sub DoNew()
        Me.cboGroup.SelectedIndex = 0
        Me.cboRole.SelectedIndex = 0
        With Me
            .txtRecNo.Text = "0"
            .txtRecNo.Enabled = False
            .txtUserID.Enabled = False
            .txtGroup.Text = ""
            .txtShortName.Text = ""
            .txtName.Text = ""
            .txtCustPhone01.Text = ""
            .txtCustPhone02.Text = ""
            .txtCustEmail01.Text = ""
            .txtCustEmail02.Text = ""
            txtBranch.Text = ""
            txtLoginName.Text = ""
            txtPassword.Text = ""
            txtConPassword.Text = ""

            txtLoginName.Enabled = True
            txtLoginName.ReadOnly = False
            '  .lblMessage.Text = "Status: New Entry..."
        End With
        ' strREC_ID = ""
    End Sub

    Private Sub DoSave()
        lblMessage.Text = ""
        Dim strMyVal As String


        Try
            If Me.cboGroup.SelectedIndex >= 1 Then
                'Me.txtCustModule.Text = cboCustModule.SelectedValue
                Me.txtGroup.Text = cboGroup.SelectedItem.Value
            End If
        Catch ex As Exception
        End Try

        Try
            If Me.cboRole.SelectedIndex >= 1 Then
                'Me.txtCustCateg.Text = cboCustCateg.SelectedValue
                'Me.txtCustCateg.Text = cboRole.SelectedItem.Value
            End If
        Catch ex As Exception
        End Try


        strMyVal = RTrim(Me.txtUserID.Text)
        If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid " & Me.lblCustID.Text
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If
        If Trim(Me.txtName.Text) = "" Or RTrim(Me.txtName.Text) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid " & Me.lblFullName.Text
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If
        strMyVal = RTrim(Me.txtShortName.Text)
        If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid " & Me.lblShortName.Text
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If
        'strMyVal = RTrim(Me.txtGroup.Text)
        'If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
        '    Me.lblMessage.Text = "Missing/Invalid " & Me.lblGroup.Text
        '    FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
        '    Exit Sub
        'End If
        'strMyVal = RTrim(Me.cboRole.Text)
        'If RTrim(strMyVal) = "Select" Or RTrim(strMyVal) = "*" Then
        '    Me.lblMessage.Text = "Missing/Invalid " & Me.lblRole.Text
        '    FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
        '    Exit Sub
        'End If
        strMyVal = RTrim(Me.txtBranch.Text)
        If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid  Branch "
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If

        strMyVal = RTrim(Me.txtLoginName.Text)
        If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid " & Me.lblLoginName.Text
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If

        strMyVal = RTrim(Me.txtPassword.Text)
        If RTrim(strMyVal) = "" Then
            Me.lblMessage.Text = "Missing/Invalid " & Me.lblPassword.Text
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If

        strMyVal = RTrim(Me.txtConPassword.Text)
        If RTrim(strMyVal) = "" Then
            Me.lblMessage.Text = "Missing/Invalid " & Me.lblConPassword.Text
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If

        If txtPassword.Text <> txtConPassword.Text Then
            Me.lblMessage.Text = "Password does not matches"
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If

        If LTrim(RTrim(Me.txtCustPhone01.Text)) = "" Then
            Me.lblMessage.Text = "Missing " & Me.lblCustPhone01.Text
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        Else
            If IsNumeric(LTrim(RTrim(Me.txtCustPhone01.Text))) And Len(LTrim(RTrim(Me.txtCustPhone01.Text))) = 11 Then
            Else
                Me.lblMessage.Text = "Incorrect/Invalid " & Me.lblCustPhone01.Text
                FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
                Exit Sub
            End If
        End If

        If LTrim(RTrim(Me.txtCustPhone02.Text)) = "" Then
            'Me.lblMessage.Text = "Missing " & Me.lblCustPhone02.Text
            'FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            'Exit Sub
        Else
            If IsNumeric(LTrim(RTrim(Me.txtCustPhone02.Text))) And Len(LTrim(RTrim(Me.txtCustPhone02.Text))) = 7 Then
            Else
                Me.lblMessage.Text = "Incorrect/Invalid " & Me.lblCustPhone02.Text
                FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
                Exit Sub
            End If
        End If


        If LTrim(RTrim(Me.txtCustEmail01.Text)) = "" Then
        Else
            blnStatus = gnParseEmail_Address(RTrim(Me.txtCustEmail01.Text))
            If blnStatus = False Then
                Me.lblMessage.Text = "Incorrect/Invalid " & Me.lblCustEmail01.Text
                FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
                Exit Sub

            End If
        End If

        If LTrim(RTrim(Me.txtCustEmail02.Text)) = "" Then
        Else
            blnStatus = gnParseEmail_Address(RTrim(Me.txtCustEmail02.Text))
            If blnStatus = False Then
                Me.lblMessage.Text = "Incorrect/Invalid " & Me.lblCustEmail02.Text
                FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
                Exit Sub

            End If
        End If





        Dim myUserIDX As String = ""
        Try
            myUserIDX = CType(Session("MyUserIDX"), String)
        Catch ex As Exception
            myUserIDX = ""
        End Try

        udRepo = New UserDetailRepository()
        uDetail = New UserDetail()

        uDetail.User_Id = RTrim(Me.txtUserID.Text)
        uDetail.User_Login = RTrim(Me.txtLoginName.Text)
        uDetail.User_Name = RTrim(Me.txtName.Text)
        uDetail.User_ShortName = RTrim(Me.txtShortName.Text)
        uDetail.User_GroupCode = RTrim(Me.txtGroup.Text)
        uDetail.User_Role = LTrim(Me.cboRole.Text)
        uDetail.User_Branch = LTrim(Me.txtBranch.Text)
        uDetail.User_Password = EncryptNew(LTrim(Me.txtPassword.Text))
        uDetail.User_Phone1 = Left(LTrim(Me.txtCustPhone01.Text), 11)
        uDetail.User_Phone2 = Left(LTrim(Me.txtCustPhone02.Text), 11)
        uDetail.User_Email1 = Left(LTrim(Me.txtCustEmail01.Text), 49)
        uDetail.User_Email2 = Left(LTrim(Me.txtCustEmail02.Text), 49)
        uDetail.User_Last_Pword_change = CDate("1905-06-21")
        uDetail.User_Last_Login_Date = CDate("1905-06-21")
        uDetail.User_FlagID = "A"
        uDetail.User_OperID = CType(myUserIDX, String)
        uDetail.User_Keydate = Now
        udRepo.Save(uDetail)
        Session("uDetail") = uDetail
        Me.lblMessage.Text = "New Record Saved to Database Successfully."


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


    Public Function DecryptNew(ByVal icText As String) As String
        Dim icLen As Integer
        Dim i As Long
        Dim icNewText As String
        Dim icChar As String

        icChar = ""
        icNewText = ""

        icLen = Len(icText)
        For i = 1 To icLen
            icChar = Mid(icText, i, 1)
            Select Case Asc(icChar)
                Case 192 To 217
                    icChar = Chr(Asc(icChar) - 127)
                Case 218 To 243
                    icChar = Chr(Asc(icChar) - 121)
                Case 244 To 253
                    icChar = Chr(Asc(icChar) - 196)
                Case 32
                    icChar = Chr(32)
            End Select
            icNewText = icNewText + icChar
        Next
        DecryptNew = icNewText
    End Function

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

    Protected Sub cmdNew_Click(sender As Object, e As EventArgs) Handles cmdNew.Click
        DoNew()
        lblMessage.Text = "Status: New Entry..."
    End Sub

   


End Class