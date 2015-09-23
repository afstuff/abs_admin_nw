<%@ Page Title="Reports" Language="vb" AutoEventWireup="false" MasterPageFile="Reports.Master" CodeBehind="AD112.aspx.vb" Inherits="ABSADMIN_08_VB.AD112" %>

<%--<%@ Register Assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="Content/calendar.css" />
    <link rel="stylesheet" type="text/css" href="Content/StyleAdmin.css" />
    <script src="Scripts/jquery.simplemodal.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.11.0.js" type="text/javascript"></script>
    <script type="text/javascript" src="Scripts/ScriptJS.js"></script>


    <script type="text/javascript">

        function cancelEvent(event) {
            window[event] = function () { null }
        }

        // calling jquery functions once document is ready
        $(document).ready(function () {

            $("#ddlBraNumStart").on('focusout', function (e) {
                e.preventDefault();
                document.getElementById('txtBraNumStart').value = $("#ddlBraNumStart").val();
                return false;
            });


            $("#ddlBraNumEnd").on('focusout', function (e) {
                e.preventDefault();
                document.getElementById('txtBraNumEnd').value = $("#ddlBraNumEnd").val();
                return false;
            });


        }); //end of doc ready
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h3 style="background-color: lightgrey; padding: 5px; margin-top: 0;">Report
    </h3>

    <table align="center" border="0" class="tbl_main">
        <tr>
            <td align="left" colspan="7" valign="top">
                <table border="0" class="tbl_butt">
                    <tr>
                        <td colspan="5" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;
                        </td>
                        <td id="td_Return_Link" colspan="1" valign="top" runat="server">
                            &nbsp;
                        </td>
                        <td colspan="1" valign="top">
                            <div style="display: none;">
                                &nbsp;&nbsp;Status:&nbsp;<asp:TextBox ID="txtAction" Visible="true" runat="server" EnableViewState="false" Width="50px"></asp:TextBox>&nbsp;
                            </div>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td colspan="7" valign="top">
                <asp:Label ID="lblMessage" Text="Status:" ForeColor="Red" runat="server"></asp:Label></td>
        </tr>

        <tr>
            <td colspan="7" valign="top">
                <table align="left" width="100%">
                    <tr>
                        <td align="left" colspan="2" valign="top" class="tbl_caption">Bills Details Print
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="Label2" Text="Trans Class:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="ddlTransClass" AutoPostBack="true" Width="150" runat="server"></asp:DropDownList>
                            &nbsp;<asp:TextBox ID="txtTransClass" Enabled="true" Width="100" runat="server"
                                Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="Label3" Text="Trans ID:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="ddlTransID" Width="150" runat="server"
                                AutoPostBack="True">
                            </asp:DropDownList>
                            &nbsp;<asp:TextBox ID="txtTransID" Enabled="true" Width="100" runat="server"
                                Visible="False"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="Label4" Text="Start Branch:" runat="server"></asp:Label></td>
                        <td valign="top">
                            <asp:DropDownList ID="ddlStartBranch" Width="150" runat="server"
                                AutoPostBack="True">
                            </asp:DropDownList>
                            </td>
                    </tr>


                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="Label5" Text="End Branch:" runat="server"></asp:Label></td>
                        <td valign="top">
                            <asp:DropDownList ID="ddlStBranch" Width="150" runat="server"
                                AutoPostBack="True">
                            </asp:DropDownList>
                            </td>
                    </tr>


                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="Label1" Text="Start Print Date:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtStartDate" MaxLength="10" runat="server"></asp:TextBox>
                            <script type="text/javascript">
                                new tcal({ 'formname': 'AD112', 'controlname': 'txtTransDate' });</script>
                            &nbsp;&nbsp;dd/mm/yyyy</td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblTransDate" Text="End Print Date:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtEndDate" MaxLength="10" runat="server"></asp:TextBox>
                            <script type="text/javascript">
                                new tcal({ 'formname': 'AD112', 'controlname': 'txtTransDate' });</script>
                            &nbsp;&nbsp;dd/mm/yyyy</td>
                    </tr>

                    <tr>
                        <td colspan="2" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="butPrint" CssClass="cmd_butt" Enabled="true" Text="Print" runat="server" />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top">&nbsp; </td>
                    </tr>

                </table>
            </td>
        </tr>

        <tr>
            <td colspan="7" valign="top">
                <table align="center" width="90%" style="border-style: groove;">
                    <tr>
                        <td align="left" valign="top" colspan="4" class="tbl_caption">Bills Report Preview</td>
                    </tr>

                    <tr>
                        <td colspan="4" valign="top" style="width: auto;">
                            <%--<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />--%>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>


        <tr>
            <td colspan="7" valign="top">&nbsp;</td>

        </tr>

    </table>
</asp:Content>
