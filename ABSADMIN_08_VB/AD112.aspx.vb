Imports CustodianAdmin.Data

Public Class AD112
    Inherits System.Web.UI.Page


    'Dim lifReceipt As ReportDocument
    'Dim reportpath As String = SiteGlobal.ReportPath
    Dim reportname As String = String.Empty

    Protected FirstMsg As String
    Protected PageLinks As String
    Dim acRepo As AdminCodeRepository

    Protected publicMsgs As String = String.Empty
    Protected strPOP_UP As String
    Dim rParams As String() = {"nw", "nw", "new", "new", "new", "new", "new", "new", "new", "new", "new", "new", "new"}
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            acRepo = New AdminCodeRepository

            SetComboBinding(ddlTransClass, acRepo.GetAdminCodes("010"), "ItemDesc", "ItemCode")
            SetComboBinding(ddlTransID, acRepo.GetAdminCodes("011"), "ItemDesc", "ItemCode")
            SetComboBinding(ddlStartBranch, acRepo.GetAdminCodes("009"), "ItemDesc", "ItemCode")
            SetComboBinding(ddlEndBranch, acRepo.GetAdminCodes("009"), "ItemDesc", "ItemCode")
            Session("acRepo") = acRepo

        Else 'post back
            acRepo = CType(Session("acRepo"), AdminCodeRepository)


        End If
    End Sub

    Private Sub SetComboBinding(ByVal toBind As ListControl, ByVal dataSource As Object, ByVal displayMember As String, ByVal valueMember As String)
        toBind.DataTextField = displayMember
        toBind.DataValueField = valueMember
        toBind.DataSource = dataSource
        toBind.DataBind()
        toBind.Items.Insert(0, New ListItem("Select", "NA"))
    End Sub

    Private Function ValidDate(ByVal DateValue As String) As DateTime
        Dim dateparts() As String = DateValue.Split(Microsoft.VisualBasic.ChrW(47))
        Dim strDateTest As String = dateparts(1) & "/" & dateparts(0) & "/" & dateparts(2)
        Dim dateIn As Date = Format(CDate(strDateTest), "MM/dd/yyyy")
        Return dateIn
    End Function
    Private Function ValidDateFromDb(ByVal DateValue As Date) As String
        Dim dateparts() As String = DateValue.Date.ToString.Split(Microsoft.VisualBasic.ChrW(47))
        Dim strDateTest As String = dateparts(1) & "/" & dateparts(0) & "/" & Left(dateparts(2), 4)
        Return strDateTest
    End Function


    Private Sub Print_That()
        Dim reportname As String

        Dim sStartDate As String = ConvertMyDate(txtStartDate.Text)
        Dim sEndDate As String = ConvertMyDate(txtEndDate.Text)

        'reportpath = SiteGlobal.ReportPath
        reportname = "AdminExpenses"

      
        If txtStartBranch.Text > txtEndBranch.Text Then
            txtEndBranch.Text = "zzzz"
        End If
        rParams(0) = reportname
        rParams(1) = "pStartDate="
        rParams(2) = sStartDate.Trim + "&"
        rParams(3) = "pEndDate="
        rParams(4) = sEndDate.Trim + "&"
        rParams(5) = "pTransClass="
        rParams(6) = txtTransClass.Text.Trim + "&"
        rParams(7) = "pTransID="
        rParams(8) = txtTransID.Text + "&"
        rParams(9) = "pStartBranch="
        rParams(10) = txtStartBranch.Text.Trim + "&"
        rParams(11) = "pEndBranch="
        rParams(12) = txtEndBranch.Text.Trim + "&"


        Session("ReportParams") = rParams
        Response.Redirect("PrintView.aspx")
    End Sub
    Protected Sub ddlTransClass_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles ddlTransClass.SelectedIndexChanged
        txtTransClass.Text = ddlTransClass.SelectedValue.ToString()
        SetComboBinding(ddlTransID, acRepo.GetAdminOtherCodes("011", ddlTransClass.SelectedValue), "ItemDesc", "ItemCode")


    End Sub

    Protected Sub ddlTransID_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles ddlTransID.SelectedIndexChanged
        txtTransID.Text = ddlTransID.SelectedValue.ToString()
    End Sub
    Public Function ConvertMyDate(ByVal inDate As String) As String
        Dim myDateArray As Array = inDate.Split("/")
        Dim myNewDate As String = myDateArray(1) & "/" & myDateArray(0) & "/" & myDateArray(2)
        ConvertMyDate = myNewDate
    End Function

    Protected Sub butPrint_Click(sender As Object, e As EventArgs) Handles butPrint.Click
        Print_That
    End Sub

    Protected Sub ddlStartBranch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlStartBranch.SelectedIndexChanged
        txtStartBranch.Text = ddlStartBranch.SelectedValue.ToString()
    End Sub

    Protected Sub ddlEndBranch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlEndBranch.SelectedIndexChanged
        txtEndBranch.Text = ddlEndBranch.SelectedValue.ToString()
    End Sub
End Class