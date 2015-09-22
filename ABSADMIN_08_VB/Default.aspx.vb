Imports CustodianAdmin.Data
Imports CustodianAdmin.Model

Public Class _Default
    Inherits System.Web.UI.Page

    Shared acRepo As AdminPermissionsRepository
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
    Public Shared Function GetUserRolesInfo(ByVal roleId As Integer) As String
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


    Public Shared Function EncryptNew(ByVal icText As String) As String
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

    <System.Web.Services.WebMethod(EnableSession:=True)> _
    Public Shared Function DoLogin(ByVal userName As String, ByVal userPassword As String) As String
        Dim roleinfo As String = String.Empty
        Dim roleInfoDt As DataTable = Nothing
        Dim userPassword1 As String = String.Empty
        'Dim crit As String = 
        If (userName <> Nothing And userPassword <> Nothing) Then
            userPassword1 = EncryptNew(userPassword)
        End If

        Try
            roleinfo = acRepo.DoUserLogin(userName, userPassword1)
            roleInfoDt = acRepo.DoUserLoginDt(userName, userPassword1)

            Dim ctx As HttpContext = System.Web.HttpContext.Current
            ctx.Session("roleInfoDt") = roleInfoDt

            Return roleinfo
        Finally
            If roleinfo = "<NewDataSet />" Then
                Throw New Exception()
            End If
        End Try

    End Function

End Class