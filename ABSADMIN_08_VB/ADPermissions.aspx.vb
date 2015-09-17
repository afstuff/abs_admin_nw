Imports CustodianAdmin.Data
Imports CustodianAdmin.Model
Imports System.Data
Public Class ADPermissions
    Inherits System.Web.UI.Page
    Dim acRepo As AdminPermissionsRepository
    Dim aCode As AdminPermissions
    Dim li As ListItem
    Dim MenuName As String
    Dim MenuPosition As String
    Dim FirstMsg As String
    Dim updateFlag As Boolean
    Dim strKey As String
    Dim strOption As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            acRepo = New AdminPermissionsRepository
            Session("acRepo") = acRepo
            updateFlag = False
            Session("updateFlag") = updateFlag
            strKey = Request.QueryString("idd")
            Session("strKey") = strKey

            strOption = Request.QueryString("sopt")
            Session("strOption") = strOption


            GetPermissions(1)
            cboRole.Items.Add("Select")
            li = New ListItem("Super User", 1)
            cboRole.Items.Add(li)
            li = New ListItem("Administrator", 2)
            cboRole.Items.Add(li)
            li = New ListItem("Officer", 3)
            cboRole.Items.Add(li)
            cboRole.Text = 1
        Else 'post back

            acRepo = CType(Session("acRepo"), AdminPermissionsRepository)
            strOption = CType(Session("strOption"), String)

        End If
    End Sub

    Protected Sub cmdSave_Click(sender As Object, e As EventArgs) Handles cmdSave.Click

    End Sub

    Protected Sub cmdSaveN_Click(sender As Object, e As EventArgs) Handles cmdSaveN.Click
        If Me.cboRole.SelectedIndex = -1 Or Me.cboRole.SelectedIndex = 0 Or _
           Me.cboRole.SelectedItem.Value = "" Or Me.cboRole.SelectedItem.Value = "*" Then
            lblMessage.Text = "Please select a role"
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "');"
        End If
        Dim aCode As AdminPermissions
        acRepo.DeleteRoles(cboRole.SelectedItem.Value)
            For i = 0 To GrdLapsePolicy.Rows.Count - 1
                Dim chkAll As CheckBox
                Dim chkAdd As CheckBox
                Dim chkEdit As CheckBox
                Dim chkDelete As CheckBox
                Dim chkPrint As CheckBox

                Dim chkAllValue As Integer
                Dim chkAddValue As Integer
                Dim chkEditValue As Integer
                Dim chkDeleteValue As Integer
                Dim chkPrintValue As Integer

                chkAll = GrdLapsePolicy.Rows(i).FindControl("chkAll")
                chkAdd = GrdLapsePolicy.Rows(i).FindControl("chkAdd")
                chkEdit = GrdLapsePolicy.Rows(i).FindControl("chkEdit")
                chkDelete = GrdLapsePolicy.Rows(i).FindControl("chkDelete")
                chkPrint = GrdLapsePolicy.Rows(i).FindControl("chkPrint")

                If chkAll.Checked Then
                    chkAllValue = 1
                Else
                    chkAllValue = 0
                End If

                If chkAdd.Checked Then
                    chkAddValue = 1
                Else
                    chkAddValue = 0
                End If

                If chkEdit.Checked Then
                    chkEditValue = 1
                Else
                    chkEditValue = 0
                End If

                If chkDelete.Checked Then
                    chkDeleteValue = 1
                Else
                    chkDeleteValue = 0
                End If


                If chkPrint.Checked Then
                    chkPrintValue = 1
                Else
                    chkPrintValue = 0
                End If

                'acRepo = New AdminPermissionsRepository

                aCode = New AdminPermissions()

                MenuName = DetermineMenuName(i)
                MenuPosition = DetermineMenuPosition(i)


                aCode.ADM_Role_ID = Convert.ToInt32(cboRole.SelectedValue)
                aCode.ADM_Menu_Position = MenuPosition
                aCode.ADM_Menu_Name = MenuName
                aCode.ADM_Option_Add = chkAddValue
                aCode.ADM_Option_Edit = chkEditValue
                aCode.ADM_Option_Delete = chkDeleteValue
                aCode.ADM_Option_Print = chkPrintValue
                aCode.ADM_FlagID = "A"
                aCode.ADM_OperID = "CRU"
                aCode.ADM_Keydate = Now
                acRepo.Save(aCode)
                Session("aCode") = aCode
            Next
        lblMessage.Text = "Permission updated successfully"
        cmdDelN.Enabled = False
    End Sub

    Private Function DetermineMenuName(ByVal i As Integer) As String
        Dim Menu_Name As String
        If i = 0 Then
            Menu_Name = "Telephone Bill"
        ElseIf i = 1 Then
            Menu_Name = "Code Setup"
        ElseIf i = 2 Then
            Menu_Name = "Transactions"
        ElseIf i = 3 Then
            Menu_Name = "Reports"
        ElseIf i = 4 Then
            Menu_Name = "Services Bill"
        ElseIf i = 5 Then
            Menu_Name = "Code Setup"
        ElseIf i = 6 Then
            Menu_Name = "Transactions"
        ElseIf i = 7 Then
            Menu_Name = "Reports"
        ElseIf i = 8 Then
            Menu_Name = "Motor Vehicle (R & M)"
        ElseIf i = 9 Then
            Menu_Name = "Code Setup"
        ElseIf i = 10 Then
            Menu_Name = "Transactions"
        ElseIf i = 11 Then
            Menu_Name = "Reports"
        ElseIf i = 12 Then
            Menu_Name = "Procurement "
        ElseIf i = 13 Then
            Menu_Name = "Code Setup"
        ElseIf i = 14 Then
            Menu_Name = "Transactions"
        ElseIf i = 15 Then
            Menu_Name = "Reports"
        ElseIf i = 16 Then
            Menu_Name = "Branch Expenses"
        ElseIf i = 17 Then
            Menu_Name = "Code Setup"
        ElseIf i = 18 Then
            Menu_Name = "Transactions"
        ElseIf i = 19 Then
            Menu_Name = "Reports"
        ElseIf i = 20 Then
            Menu_Name = "Insurance Premium Records"
        ElseIf i = 21 Then
            Menu_Name = "Code Setup"
        ElseIf i = 22 Then
            Menu_Name = "Transactions"
        ElseIf i = 23 Then
            Menu_Name = "Reports"
        ElseIf i = 24 Then
            Menu_Name = "Insurance Claim Records"
        ElseIf i = 25 Then
            Menu_Name = "Code Setup"
        ElseIf i = 26 Then
            Menu_Name = "Transactions"
        ElseIf i = 27 Then
            Menu_Name = "Reports"
        End If
        Return Menu_Name
    End Function

    Private Function DetermineMenuPosition(ByVal i As Integer) As String
        Dim Menu_Position As String
        If i = 0 Then
            Menu_Position = "1"
        ElseIf i = 1 Then
            Menu_Position = "1.1"
        ElseIf i = 2 Then
            Menu_Position = "1.2"
        ElseIf i = 3 Then
            Menu_Position = "1.3"
        ElseIf i = 4 Then
            Menu_Position = "2"
        ElseIf i = 5 Then
            Menu_Position = "2.1"
        ElseIf i = 6 Then
            Menu_Position = "2.2"
        ElseIf i = 7 Then
            Menu_Position = "2.3"
        ElseIf i = 8 Then
            Menu_Position = "3"
        ElseIf i = 9 Then
            Menu_Position = "3.1"
        ElseIf i = 10 Then
            Menu_Position = "3.2"
        ElseIf i = 11 Then
            Menu_Position = "3.3"
        ElseIf i = 12 Then
            Menu_Position = "4 "
        ElseIf i = 13 Then
            Menu_Position = "4.1"
        ElseIf i = 14 Then
            Menu_Position = "4.2"
        ElseIf i = 15 Then
            Menu_Position = "4.3"
        ElseIf i = 16 Then
            Menu_Position = "5"
        ElseIf i = 17 Then
            Menu_Position = "5.1"
        ElseIf i = 18 Then
            Menu_Position = "5.2"
        ElseIf i = 19 Then
            Menu_Position = "5.3"
        ElseIf i = 20 Then
            Menu_Position = "6"
        ElseIf i = 21 Then
            Menu_Position = "6.1"
        ElseIf i = 22 Then
            Menu_Position = "6.2"
        ElseIf i = 23 Then
            Menu_Position = "6.3"
        ElseIf i = 24 Then
            Menu_Position = "7"
        ElseIf i = 25 Then
            Menu_Position = "7.1"
        ElseIf i = 26 Then
            Menu_Position = "7.2"
        ElseIf i = 27 Then
            Menu_Position = "7.3"
        End If
        Return Menu_Position
    End Function

    Private Sub GetPermissions(ByVal _roleId As Integer)
        cmdDelN.Enabled = False
        GridView1.DataSource = acRepo.GetAdminPermissions(_roleId)
        GridView1.DataBind()
        GrdLapsePolicy.DataSource = acRepo.GetAdminPermissions(_roleId)
        GrdLapsePolicy.DataBind()
        For i = 0 To GrdLapsePolicy.Rows.Count - 1
            'Dim chkAllValue As Integer
            Dim chkAddValue As Integer
            Dim chkEditValue As Integer
            Dim chkDeleteValue As Integer
            Dim chkPrintValue As Integer

            chkAddValue = GridView1.Rows(i).Cells(4).Text
            chkEditValue = GridView1.Rows(i).Cells(5).Text
            chkDeleteValue = GridView1.Rows(i).Cells(6).Text
            chkPrintValue = GridView1.Rows(i).Cells(7).Text
            Dim chkAll As CheckBox
            Dim chkAdd As CheckBox
            Dim chkEdit As CheckBox
            Dim chkDelete As CheckBox
            Dim chkPrint As CheckBox

            chkAll = GrdLapsePolicy.Rows(i).FindControl("chkAll")
            chkAdd = GrdLapsePolicy.Rows(i).FindControl("chkAdd")
            chkEdit = GrdLapsePolicy.Rows(i).FindControl("chkEdit")
            chkDelete = GrdLapsePolicy.Rows(i).FindControl("chkDelete")
            chkPrint = GrdLapsePolicy.Rows(i).FindControl("chkPrint")

            If chkAddValue = 1 Then
                chkAdd.Checked = True
                cmdDelN.Enabled = True
            Else
                chkAdd.Checked = False
            End If

            If chkEditValue = 1 Then
                chkEdit.Checked = True
                cmdDelN.Enabled = True
            Else
                chkEdit.Checked = False
            End If

            If chkDeleteValue = 1 Then
                chkDelete.Checked = True
                cmdDelN.Enabled = True
            Else
                chkDelete.Checked = False
            End If

            If chkPrintValue = 1 Then
                chkPrint.Checked = True
                cmdDelN.Enabled = True
            Else
                chkPrint.Checked = False
            End If
        Next
    End Sub

    Protected Sub cboRole_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboRole.SelectedIndexChanged
        lblMessage.Text = ""
        Try
            If Me.cboRole.SelectedIndex = -1 Or Me.cboRole.SelectedIndex = 0 Or _
            Me.cboRole.SelectedItem.Value = "" Or Me.cboRole.SelectedItem.Value = "*" Then

            Else
                GetPermissions(Convert.ToInt32(cboRole.SelectedValue.Trim()))
            End If
        Catch ex As Exception
            Me.lblMessage.Text = "Error. Reason: " & ex.Message.ToString
            lblMessage.Visible = True
        End Try
    End Sub

    Protected Sub cmdDelN_Click(sender As Object, e As EventArgs) Handles cmdDelN.Click
        If Me.cboRole.SelectedIndex = -1 Or Me.cboRole.SelectedIndex = 0 Or _
          Me.cboRole.SelectedItem.Value = "" Or Me.cboRole.SelectedItem.Value = "*" Then
            lblMessage.Text = "Please select a role"
            FirstMsg = "Javascript:alert('" & Me.lblMessage.Text & "');"
        End If
        Dim aCode As AdminPermissions
        acRepo.DeleteRoles(Convert.ToInt32(cboRole.SelectedItem.Value))
        For i = 0 To GrdLapsePolicy.Rows.Count - 1
            'Dim chkAll As CheckBox
            'Dim chkAdd As CheckBox
            'Dim chkEdit As CheckBox
            'Dim chkDelete As CheckBox
            'Dim chkPrint As CheckBox

            Dim chkAllValue As Integer
            Dim chkAddValue As Integer
            Dim chkEditValue As Integer
            Dim chkDeleteValue As Integer
            Dim chkPrintValue As Integer

            'chkAll = GrdLapsePolicy.Rows(i).FindControl("chkAll")
            'chkAdd = GrdLapsePolicy.Rows(i).FindControl("chkAdd")
            'chkEdit = GrdLapsePolicy.Rows(i).FindControl("chkEdit")
            'chkDelete = GrdLapsePolicy.Rows(i).FindControl("chkDelete")
            'chkPrint = GrdLapsePolicy.Rows(i).FindControl("chkPrint")

           
            chkAllValue = 0
            chkAddValue = 0
            chkEditValue = 0
            chkDeleteValue = 0
            aCode = New AdminPermissions()
            MenuName = DetermineMenuName(i)
            MenuPosition = DetermineMenuPosition(i)


            aCode.ADM_Role_ID = Convert.ToInt32(cboRole.SelectedValue)
            aCode.ADM_Menu_Position = MenuPosition
            aCode.ADM_Menu_Name = MenuName
            aCode.ADM_Option_Add = chkAddValue
            aCode.ADM_Option_Edit = chkEditValue
            aCode.ADM_Option_Delete = chkDeleteValue
            aCode.ADM_Option_Print = chkPrintValue
            aCode.ADM_FlagID = "A"
            aCode.ADM_OperID = "CRU"
            aCode.ADM_Keydate = Now
            acRepo.Save(aCode)
            Session("aCode") = aCode
        Next
        GetPermissions(Convert.ToInt32(cboRole.SelectedValue))
        lblMessage.Text = "Permission deleted successfully for " & cboRole.SelectedItem.Text & " role"
        cmdDelN.Enabled = False
    End Sub

    Protected Sub CheckAll(ByVal i As Integer)
        Dim chkAll As CheckBox
            Dim chkAdd As CheckBox
            Dim chkEdit As CheckBox
            Dim chkDelete As CheckBox
            Dim chkPrint As CheckBox


            chkAll = GrdLapsePolicy.Rows(i).FindControl("chkAll")
            chkAdd = GrdLapsePolicy.Rows(i).FindControl("chkAdd")
            chkEdit = GrdLapsePolicy.Rows(i).FindControl("chkEdit")
            chkDelete = GrdLapsePolicy.Rows(i).FindControl("chkDelete")
            chkPrint = GrdLapsePolicy.Rows(i).FindControl("chkPrint")

        If chkAll.Checked = True Then
            chkAdd.Checked = True
            chkEdit.Checked = True
            chkDelete.Checked = True
            chkPrint.Checked = True
        Else
            chkAdd.Checked = False
            chkEdit.Checked = False
            chkDelete.Checked = False
            chkPrint.Checked = False
        End If
    End Sub
    Protected Sub MyButtonClick(sender As Object, e As System.EventArgs)
        'Get the button that raised the event
        Dim chk As CheckBox = CType(sender, CheckBox)

        'Get the row that contains this button
        'Dim gvr As  GridViewRow  = (GridViewRow)chk.NamingContainer;
        Dim gvr As GridViewRow = CType(sender, CheckBox).NamingContainer

        '  DocId = Integer.Parse(TryCast(sender, LinkButton).CommandArgument)

        'Get rowindex
        Dim rowindex As Integer = gvr.RowIndex
        CheckAll(rowindex)
    End Sub
End Class