Imports CustodianAdmin.Data

Public Class Site2
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("roleInfoDt") Is Nothing Then
            Response.Redirect("default.aspx")
        End If
        'Dim roleId As Int32
        'Dim roleInfo As DataTable = Session("roleInfoDt")
        'For Each dr As DataRow In roleInfo.Rows
        '    roleId = dr("SEC_USER_ROLE").ToString()
        '    GetUserRoleValue(roleId)
        'Next
    End Sub

    Private Sub GetUserRoleValue(ByVal rId As Int32)
        Dim acRepo As AdminPermissionsRepository = New AdminPermissionsRepository
        Dim dt As DataTable = acRepo.GeUserRoleInfoDt(rId)


        For Each dr As DataRow In dt.Rows
            If ((dr("ADM_Menu_Position") = "2.1") And (dr("ADM_Option_Add") = 0)) Then
                subMenuDdl.Items.Remove(subMenuDdl.Items.FindByText("Code Setup"))
            End If

            If ((dr("ADM_Menu_Position") = "2.2") And (dr("ADM_Option_Add") = 0)) Then
                subMenuDdl.Items.Remove(subMenuDdl.Items.FindByText("Transactions"))
            End If

            If ((dr("ADM_Menu_Position") = "2.3") And (dr("ADM_Option_Add") = 0)) Then
                subMenuDdl.Items.Remove(subMenuDdl.Items.FindByText("Report"))
            End If

        Next

    End Sub

    Protected Sub GoToPage(sender As Object, e As EventArgs) Handles subMenuDdl.TextChanged
        If (subMenuDdl.SelectedItem.Text = "Code Setup") Then
            Response.Redirect("AD111.aspx?sopt=007")
        ElseIf (subMenuDdl.SelectedItem.Text = "Transactions") Then
            Response.Redirect("AD140.aspx")
        ElseIf (subMenuDdl.SelectedItem.Text = "Report") Then
            Response.Redirect("AD112.aspx")
        Else
            Exit Sub
        End If
    End Sub


End Class