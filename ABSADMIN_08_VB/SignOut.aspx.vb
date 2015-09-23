Public Class SignOut
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Count > 0 Then
            Session.RemoveAll()
            Response.Redirect("default.aspx")
        Else
            Response.Redirect("default.aspx")

        End If

    End Sub

End Class