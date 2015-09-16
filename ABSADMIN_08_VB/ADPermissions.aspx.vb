Imports CustodianAdmin.Data
Imports CustodianAdmin.Model
Public Class ADPermissions
    Inherits System.Web.UI.Page
    Dim acRepo As AdminPermissionsRepository
    Dim aCode As AdminPermissions
    Dim li As ListItem

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        acRepo = New AdminPermissionsRepository
        If Not Page.IsPostBack Then
            GrdLapsePolicy.DataSource = acRepo.GetAdminPermissions(1)
            GrdLapsePolicy.DataBind()
            cboRole.Items.Add("Select")
            li = New ListItem("Super User", 1)
            cboRole.Items.Add(li)
            li = New ListItem("Administrator", 2)
            cboRole.Items.Add(li)
            li = New ListItem("Officer", 3)
            cboRole.Items.Add(li)

        End If
    End Sub

    Protected Sub cmdSave_Click(sender As Object, e As EventArgs) Handles cmdSave.Click
      
    End Sub

    Protected Sub cmdSaveN_Click(sender As Object, e As EventArgs) Handles cmdSaveN.Click
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

            acRepo = New AdminPermissionsRepository
            Dim aCode As AdminPermissions
            aCode = New AdminPermissions()

            aCode.ADM_Role_ID = Convert.ToInt32(cboRole.SelectedValue)
            aCode.ADM_Menu_Position = ""
            aCode.ADM_Menu_Name = ""
            aCode.ADM_Option_Add = chkAddValue
            aCode.ADM_Option_Edit = chkEditValue
            aCode.ADM_Option_Delete = chkDeleteValue
            aCode.ADM_Option_Print = chkPrintValue
            aCode.ADM_FlagID = "A"
            aCode.ADM_OperID = ""
            aCode.ADM_Keydate = Now
            acRepo.Save(aCode)
            lblMessage.Text = "Permission updated successfully"
        Next
    End Sub
End Class