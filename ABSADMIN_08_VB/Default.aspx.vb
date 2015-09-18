Imports CustodianAdmin.Data
Imports CustodianAdmin.Model

Public Class _Default
    Inherits System.Web.UI.Page

      Dim Shared acRepo As AdminPermissionsRepository
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


            'GetPermissions(1)
        Else 'post back

            acRepo = CType(Session("acRepo"), AdminPermissionsRepository)
            strOption = CType(Session("strOption"), String)

        End If
    End Sub

    'Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles loginBtn.Click
    '    Response.Redirect("dashboard.aspx")
    'End Sub

    
    <System.Web.Services.WebMethod()> _
    Public Shared Function GetUserRolesInfo(ByVal  roleId As Integer) As String
        Dim roleinfo As String = String.Empty
        'Dim crit As String = 

        Try
            roleinfo = acRepo.GeUserRoleInfo(roleId)
            Return roleinfo
        Finally
            If roleinfo = "<NewDataSet />" Then
                Throw New Exception()
            End If
        End Try

    End Function


End Class