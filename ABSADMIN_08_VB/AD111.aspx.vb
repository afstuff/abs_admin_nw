Imports CustodianAdmin.Data
Imports CustodianAdmin.Model

Public Class AD111
    Inherits System.Web.UI.Page
    Protected FirstMsg As String
    Protected PageLinks As String

    Protected strPOP_UP As String
    Dim acRepo As AdminCodeRepository
    Dim aCode As AdminCode
    Dim updateFlag As Boolean
    Dim strKey As String
    Dim strOption As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            acRepo = New AdminCodeRepository

            Session("acRepo") = acRepo
            updateFlag = False
            Session("updateFlag") = updateFlag
            strKey = Request.QueryString("idd")
            Session("strKey") = strKey

            strOption = Request.QueryString("sopt")
            Session("strOption") = strOption

            'initialize all the dropdown list values
            'the meter types 
            If strOption IsNot Nothing Then
                AdjustScreen()
            End If


            SetComboBinding(ddlBraNum, acRepo.GetAdminCodes("009"), "ItemDesc", "ItemCode")
            SetComboBinding(ddlDeptNum, acRepo.GetAdminCodes("008"), "ItemDesc", "ItemCode")
            SetComboBinding(ddlTransClass, acRepo.GetAdminCodes("010"), "ItemDesc", "ItemCode")
            'SetComboBinding(cmbCodeType, acRepo.GetCarMakes(), "Type", "mId")

            If strKey IsNot Nothing Then
                FillValues()
            Else
                acRepo = CType(Session("acRepo"), AdminCodeRepository)
            End If


        Else 'post back

            acRepo = CType(Session("acRepo"), AdminCodeRepository)

            strOption = CType(Session("strOption"), String)

            Me.Validate()
            If (Not Me.IsValid) Then
                Dim msg As String
                ' Loop through all validation controls to see which 
                ' generated the error(s).
                Dim oValidator As IValidator
                For Each oValidator In Validators
                    If oValidator.IsValid = False Then
                        msg = msg & "\n" & oValidator.ErrorMessage
                    End If
                Next

                'lblError.Text = msg
                'lblError.Visible = True
                'publicMsgs = "javascript:alert('" + msg + "')"
            End If



        End If


        Try
            strPOP_UP = CType(Request.QueryString("popup"), String)
        Catch ex As Exception
            strPOP_UP = "NO"
        End Try

        If UCase(Trim(strPOP_UP)) = "YES" Then
            Me.PageAnchor_Return_Link.Visible = False
            PageLinks = "<a href='javascript:void(0);' onclick='javascript:window.close();'>CLOSE PAGE...</a>"
        Else
            Me.PageAnchor_Return_Link.Visible = True
            PageLinks = ""
        End If
    End Sub

    Protected Sub AdjustScreen()
        cmbCodeClass.SelectedValue = strOption
    End Sub
    Private Sub SetComboBinding(ByVal toBind As ListControl, ByVal dataSource As Object, ByVal displayMember As String, ByVal valueMember As String)
        toBind.DataTextField = displayMember
        toBind.DataValueField = valueMember
        toBind.DataSource = dataSource
        toBind.DataBind()
        toBind.Items.Insert(0, New ListItem("Select", "NA"))
    End Sub


    Private Sub FillValues()
        strKey = CType(Session("strKey"), String)
        acRepo = CType(Session("acRepo"), AdminCodeRepository)
        aCode = CType(Session("aCode"), AdminCode)

        aCode = acRepo.GetById(strKey)
        txtCodeClass.Text = CType(Session("cmbCodeClassValue"), String)
        If aCode IsNot Nothing Then
            With aCode
                If txtCodeClass.Text.Trim = "011" Then
                    ddlTransClass.SelectedValue = .Branch
                Else
                    ddlBraNum.SelectedValue = .Branch
                End If
                ddlDeptNum.SelectedValue = .Dept
                cmbCodeClass.SelectedValue = .ClassCode
                txtCodeDescr.Text = .ItemDesc
                cmbCodeType.SelectedValue = .TransType
                txtCode.Text = .ItemCode

                Session("aCode") = aCode
            End With

            updateFlag = True
            Session("updateFlag") = updateFlag
            grdData.DataBind()


        End If
    End Sub


End Class