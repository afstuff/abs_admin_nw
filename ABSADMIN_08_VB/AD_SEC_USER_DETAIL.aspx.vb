Imports CustodianAdmin.Data
Imports CustodianAdmin.Model
'Imports System.Linq
Public Class AD_SEC_USER_DETAIL
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




            Call Proc_DataBind()
            Call DoNew()
            'Me.lblMessage.Text = strSQL
            Me.txtAction.Text = ""
            'Me.txtCustNum.Enabled = True
            'Me.txtCustNum.Focus()
            Me.txtName.Enabled = True
            Me.txtName.Focus()
            'If Me.txtAction.Text = "New" Then
            '    Call DoNew()
            '    'Call Proc_OpenRecord(Me.txtNum.Text)
            '    Me.txtAction.Text = ""
            '    Me.txtName.Focus()
            'End If

            'If Me.txtAction.Text = "Save" Then
            '    'Call DoSave()
            '    'Me.txtAction.Text = ""
            'End If

            'If Me.txtAction.Text = "Delete" Then
            '    Call DoDelete()
            '    Me.txtAction.Text = ""
            'End If

            'If Me.txtAction.Text = "Delete_Item" Then
            '    ''Call DoDelItem()
            '    Me.txtAction.Text = ""
            'End If

        Else 'post back
            udRepo = CType(Session("udRepo"), UserDetailRepository)
            strOption = CType(Session("strOption"), String)
        End If
    End Sub

    Protected Sub cmdSave_Click(sender As Object, e As EventArgs) Handles cmdSave.Click

    End Sub

    Protected Sub cmdSaveN_Click(sender As Object, e As EventArgs) Handles cmdSaveN.Click
        Call DoSave()
        Me.txtAction.Text = ""
    End Sub

    Protected Sub txtLoginName_TextChanged(sender As Object, e As EventArgs) Handles txtLoginName.TextChanged
        If RTrim(Me.txtLoginName.Text) <> "" Then
            lblMessage.Text = RTrim(Me.txtShortName.Text)
            ' strREC_ID = RTrim(Me.txtLoginName.Text)
            strErrMsg = Proc_OpenRecord(Me.txtLoginName.Text)
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
            .cmdDel.Enabled = False
            .cmdDelN.Enabled = False
            txtLoginName.Enabled = True
            txtLoginName.ReadOnly = False
            '  .lblMessage.Text = "Status: New Entry..."
        End With
        ' strREC_ID = ""
    End Sub

    Protected Sub Proc_Populate_Box(ByVal pvCODE As String, ByVal pvTransType As String, ByVal pvcboList As DropDownList)
        ''Populate box with codes
        'pvcboList.Items.Clear()
        'Select Case UCase(Trim(pvCODE))
        '    Case "IL_BRK_MODULE_LIST"
        '        strTable = strTableName
        '        strSQL = ""
        '        Call gnPopulate_DropDownList(pvCODE, pvcboList, strSQL, "", "(Select item)", "*")

        '    Case "IL_BRK_CLASS_LIST"
        '        strTable = strTableName
        '        strTable = RTrim("TBIL_CUST_CAT")
        '        strSQL = ""
        '        strSQL = strSQL & "SELECT TBIL_CUST_CATEG AS MyFld_Value, TBIL_CUST_CAT_DESC AS MyFld_Text"
        '        strSQL = strSQL & " FROM " & strTable
        '        strSQL = strSQL & " WHERE TBIL_CUST_CAT_ID = '" & RTrim(pvTransType) & "'"
        '        strSQL = strSQL & " ORDER BY TBIL_CUST_CAT_ID, TBIL_CUST_CAT_DESC"
        '        Call gnPopulate_DropDownList(pvCODE, pvcboList, strSQL, "", "(Select item)", "*")

        '    Case "IL_BRK_DETAIL_LIST"
        '        'Try
        '        '    Me.txtCustModule.Text = cboCustModule.SelectedValue
        '        'Catch ex As Exception
        '        'End Try

        '        strTable = strTableName
        '        strSQL = ""
        '        strSQL = strSQL & "SELECT TBIL_CUST_CODE AS MyFld_Value"
        '        strSQL = strSQL & ",RTRIM(ISNULL(TBIL_CUST_DESC,'')) AS MyFld_Text"
        '        strSQL = strSQL & " FROM " & strTable
        '        strSQL = strSQL & " WHERE TBIL_CUST_ID = '" & RTrim(pvTransType) & "'"
        '        'strSQL = strSQL & " AND TBIL_CUST_MDLE = '" & RTrim(Me.txtCustModule.Text) & "'"
        '        strSQL = strSQL & " AND (TBIL_CUST_DESC LIKE '%" & RTrim(Me.txtSearch.Value) & "%')"
        '        strSQL = strSQL & " ORDER BY TBIL_CUST_ID, RTRIM(ISNULL(TBIL_CUST_DESC,''))"
        '        Call gnPopulate_DropDownList(pvCODE, pvcboList, strSQL, "", "(Select item)", "*")
        'End Select

    End Sub
    Private Sub Proc_DataBind()
        Dim o
        ''Me.cmdDelItem.Enabled = True
        udRepo = New UserDetailRepository()
        With GridView1
            .DataSource = udRepo.GetUsersHelp(RTrim(Me.txtSearch.Value))
            .DataBind()
        End With
        Dim P As Integer = 0
        Dim C As Integer = 0

        C = 0
        For P = 0 To Me.GridView1.Rows.Count - 1
            C = C + 1
        Next
        If C >= 1 Then
            Me.cmdDelN.Enabled = True
        End If

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
        strMyVal = RTrim(Me.txtGroup.Text)
        If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid " & Me.lblGroup.Text
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If
        strMyVal = RTrim(Me.cboRole.Text)
        If RTrim(strMyVal) = "Select" Or RTrim(strMyVal) = "*" Then
            Me.lblMessage.Text = "Missing/Invalid " & Me.lblRole.Text
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
            Exit Sub
        End If
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

        Dim search = udRepo.GetByLoginName(txtLoginName.Text)
        If search Is Nothing Then
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
        Else
            Session("uDetail") = uDetail
            Me.txtRecNo.Text = search.User_RecId
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
            uDetail.User_FlagID = "C"
            uDetail.User_OperID = CType(myUserIDX, String)
            uDetail.User_Keydate = Now
            udRepo.Update(uDetail)
            Me.lblMessage.Text = "Record Updated to Database Successfully."
        End If
        FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
        'Me.lblMessage.Text = ""

        Me.txtSearch.Value = RTrim(Me.txtName.Text)
        Call Proc_DataBind()
        Me.txtSearch.Value = ""

        DoNew()

        Me.txtName.Enabled = True
        Me.txtName.Focus()

    End Sub

    Protected Sub DoDelete()

        'Dim strMyVal As String
        'strMyVal = RTrim(Me.txtUserID.Text)
        'If RTrim(strMyVal) = "" Or RTrim(strMyVal) = "*" Then
        '    Me.lblMessage.Text = "Missing/Invalid " & Me.lblCustID.Text
        '    FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
        '    Exit Sub
        'End If

        'If Trim(Me.txtShortName.Text) = "" Then
        '    Me.lblMessage.Text = "Missing " & Me.lblFullName.Text
        '    FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "')"
        '    Exit Sub
        'End If

        'Dim intC As Long = 0

        'strTable = strTableName

        'strREC_ID = Trim(Me.txtLoginName.Text)

        'strSQL = "SELECT TOP 1 SEC_USER_LOGIN FROM " & strTable
        'strSQL = strSQL & " WHERE SEC_USER_LOGIN = '" & RTrim(strREC_ID) & "'"
        'strSQL = strSQL & " AND SEC_USER_ID = '" & RTrim(Me.txtUserID.Text) & "'"

        'Dim mystrCONN As String = CType(Session("connstr"), String)
        'Dim objOLEConn As New OleDbConnection(mystrCONN)
        'Dim objOLECmd As OleDbCommand = New OleDbCommand(strSQL, objOLEConn)

        'objOLECmd.CommandType = CommandType.Text
        ''objOLECmd.Parameters.Add("p01", OleDbType.VarChar, 50).Value = strREC_ID

        ''open connection to database
        'objOLEConn.Open()

        'strOPT = "NEW"
        'FirstMsg = ""

        'Dim objOLEDR As OleDbDataReader = objOLECmd.ExecuteReader()
        'If (objOLEDR.Read()) Then
        '    strOPT = "OLD"
        'End If

        '' dispose of open objects
        'objOLECmd.Dispose()
        'objOLECmd = Nothing

        'If objOLEDR.IsClosed = False Then
        '    objOLEDR.Close()
        'End If
        'objOLEDR = Nothing

        'Select Case RTrim(strOPT)
        '    Case "OLD"
        '        'Delete record
        '        'Me.lblMessage.Text = "Deleting record... "
        '        strSQL = ""
        '        strSQL = "DELETE FROM " & strTable
        '        strSQL = strSQL & " WHERE SEC_USER_LOGIN = '" & RTrim(strREC_ID) & "'"
        '        strSQL = strSQL & " AND SEC_USER_ID = '" & RTrim(Me.txtUserID.Text) & "'"

        '        Dim objOLECmd2 As OleDbCommand = New OleDbCommand()
        '        objOLECmd2.Connection = objOLEConn
        '        objOLECmd2.CommandType = CommandType.Text
        '        objOLECmd2.CommandText = strSQL
        '        intC = objOLECmd2.ExecuteNonQuery()
        '        objOLECmd2.Dispose()
        '        objOLECmd2 = Nothing
        '    Case Else
        'End Select

        ''Try
        ''Catch ex As Exception
        ''End Try

        'If objOLEConn.State = ConnectionState.Open Then
        '    objOLEConn.Close()
        'End If
        'objOLEConn = Nothing


        'If intC >= 1 Then
        '    Me.lblMessage.Text = "Record deleted successfully."
        '    FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "');"
        'Else
        '    Me.lblMessage.Text = "Sorry!. Record not deleted..."
        '    FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "');"
        'End If
        ''Me.lblMessage.Text = ""

        ''Call Proc_Populate_Box("IL_INS_DETAIL_LIST", Trim(Me.txtCustID.Text), Me.cboTransList)
        ''Call Proc_DataBind()

        'Me.cmdDelete_ASP.Enabled = False

        'Call DoNew()
        'Me.txtName.Enabled = True
        'Me.txtName.Focus()

    End Sub

    'Protected Sub cboTransList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboTransList.SelectedIndexChanged
    '    Me.txtCustNum.Text = RTrim(Me.cboTransList.SelectedItem.Value)
    '    If RTrim(Me.txtCustNum.Text) = "*" Or RTrim(Me.txtCustNum.Text) = "" Or RTrim(Me.txtCustNum.Text) = "0" Then
    '        Me.txtCustNum.Text = ""
    '        Call DoNew()
    '        Exit Sub
    '    End If

    '    If RTrim(Me.txtCustNum.Text) <> "" Then
    '        lblMessage.Text = RTrim(Me.txtCustNum.Text)
    '        strREC_ID = RTrim(Me.txtCustNum.Text)
    '        strErrMsg = Proc_OpenRecord(Me.txtCustNum.Text)
    '    End If

    'End Sub

    Private Function Proc_OpenRecord(ByVal strRefNo As String) As String
        udRepo = New UserDetailRepository
        On Error GoTo myRtn_Err

        strErrMsg = "false"

        lblMessage.Text = ""
        If Trim(strRefNo) = "" Then
            Proc_OpenRecord = strErrMsg
            Return Proc_OpenRecord
        End If

        Dim search = udRepo.GetByLoginName(strRefNo)
        If search IsNot Nothing Then
            Session("uDetail") = search
            Me.txtRecNo.Text = search.User_RecId
            Me.txtUserID.Text = search.User_Id
            Me.cboRole.Text = search.User_Role
            Me.txtShortName.Text = search.User_ShortName
            Me.txtName.Text = search.User_Name
            Me.txtBranch.Text = search.User_Branch
            Me.txtCustPhone01.Text = search.User_Phone1
            Me.txtCustPhone02.Text = search.User_Phone2
            Me.txtCustEmail01.Text = search.User_Email1
            Me.txtCustEmail02.Text = search.User_Email2


            Me.txtGroup.Text = search.User_GroupCode

            'Call Proc_DDL_Get(Me.cboGroup, RTrim(Me.txtGroup.Text))
            'This will be done dynamic later
            If txtGroup.Text = "admin" Then
                'cboGroup.Text = "Administrators"
                cboGroup.Text = "admin"
                cboGroup.SelectedValue = "admin"
            ElseIf txtGroup.Text = "mgt" Then
                cboGroup.Text = "mgt"
            ElseIf txtGroup.Text = "sysuser" Then
                cboGroup.Text = "sysuser"
            End If

            Call DisableBox(Me.txtLoginName)
            strErrMsg = "Status: Data Modification"
            ' strOPT = "1"
            Me.cmdNew.Enabled = True
            Me.cmdDelN.Enabled = True
        Else
            'Me.txtCustNum.Text = ""
            Me.cmdDelN.Enabled = False
            strErrMsg = "Status: New Entry..."
            Me.txtName.Enabled = True
            Me.txtName.Focus()
        End If

        GoTo MyRtn_Ok

myRtn_Err:
        strErrMsg = Err.Number & " - " & Err.Description
MyRtn_Ok:
        lblMessage.Text = strErrMsg
        Proc_OpenRecord = strErrMsg
        Return Proc_OpenRecord

    End Function

    Private Sub DisableBox(ByVal objTxtBox As TextBox)
        Dim c As System.Drawing.Color = Drawing.Color.LightGray
        objTxtBox.ReadOnly = True
        objTxtBox.Enabled = False
        'objTxtBox.BackColor = c

    End Sub

    ' Private Sub Proc_CloseDB(ByVal myOLECmd As OleDbCommand, ByVal myOLEConn As OleDbConnection)
    'myOLECmd.Dispose()
    'If myOLEConn.State = ConnectionState.Open Then
    '    myOLEConn.Close()
    'End If

    'End Sub

    Private Sub Proc_DDL_Get(ByVal pvDDL As DropDownList, ByVal pvRef_Value As String)
        'On Error Resume Next
        'pvDDL.SelectedIndex = pvDDL.Items.IndexOf(pvDDL.Items.FindByValue(CType(RTrim(pvRef_Value), String)))

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

    Protected Sub cboGroup_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGroup.SelectedIndexChanged
        Me.txtGroup.Text = RTrim(Me.cboGroup.SelectedItem.Value)
        If RTrim(Me.txtGroup.Text) = "*" Or RTrim(Me.txtGroup.Text) = "" Or RTrim(Me.txtGroup.Text) = "0" Then
            Me.txtGroup.Text = ""
            Exit Sub
        End If
    End Sub

    Protected Sub cmdNew_Click(sender As Object, e As EventArgs) Handles cmdNew.Click
        DoNew()
        lblMessage.Text = "Status: New Entry..."
    End Sub

    Protected Sub cmdDelN_Click(sender As Object, e As EventArgs) Handles cmdDelN.Click
        Dim msg As String = String.Empty
        'uDetail = New UserDetail
        ' udRepo = CType(Session("udRepo"), UserDetailRepository)
        udRepo = New UserDetailRepository
        uDetail = CType(Session("uDetail"), UserDetail)
        Try
            udRepo.Delete(uDetail)
            msg = "Record deleted successfully"
            lblMessage.Text = msg
            ' lblError.Text = msg
            '   grdData.DataBind()

        Catch ex As Exception
            msg = ex.Message
            'lblError.Text = msg
            'lblError.Visible = True
            'publicMsgs = "javascript:alert('" + msg + "')"
        End Try
        DoNew()
    End Sub

    Private Sub cmdSearch_Click(sender As Object, e As EventArgs) Handles cmdSearch.Click
        If Trim(Me.txtSearch.Value) = "" Or Trim(Me.txtSearch.Value) = "." Or Trim(Me.txtSearch.Value) = "*" Then
        Else
            Call Proc_DataBind()
        End If
    End Sub

    Private Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        Call Proc_DataBind()
        Me.lblMessage.Text = "Page " & GridView1.PageIndex + 1 & " of " & Me.GridView1.PageCount
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ' Get the currently selected row using the SelectedRow property.
        Dim row As GridViewRow = GridView1.SelectedRow

        ' Display the required value from the selected row.
        Me.txtRecNo.Text = row.Cells(2).Text

        Me.txtUserID.Text = row.Cells(3).Text
        'Call Proc_DDL_Get(Me.ddlGroup, RTrim(Me.txtGroupNum.Text))

        Me.txtLoginName.Text = row.Cells(4).Text
        'Call Proc_DDL_Get(Me.cboTransList, RTrim(Me.txtCustNum.Text))

        Call Proc_OpenRecord(Me.txtLoginName.Text)

        lblMessage.Text = "You selected " & Me.txtLoginName.Text & " / " & Me.txtRecNo.Text & "."
    End Sub
End Class