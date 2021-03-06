﻿<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="Users.Master" CodeBehind="ADPermissions.aspx.vb" Inherits="ABSADMIN_08_VB.ADPermissions" %>

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

    <%--<script src="dist/libs/jquery.js"></script>--%>
    <script src="dist/jstree.min.js"></script>
    <script>
        $(function () {
            // 6 create an instance when the DOM is ready
            $('#jstree').jstree();
            // 7 bind to events triggered on the tree
            $('#jstree').on("changed.jstree", function (e, data) {
                console.log(data.selected);
            });
            // 8 interact with the tree - either way is OK
            $('button').on('click', function () {
                $('#jstree').jstree(true).select_node('child_node_1');
                $('#jstree').jstree('select_node', 'child_node_1');
                $.jstree.reference('#jstree').select_node('child_node_1');
            });
        });


        $('#jstree').on('close_node.jstree', function (e, data) {
            data.instance.open_node(data.node);
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3 style="background-color: lightgrey; padding: 5px; margin-top: 0;">User Permissions</h3>
    <!--<div class="div_container_02">-->
    <br />
    <table align="center" border="0" class="tbl_main">
        <tr>
            <td align="left" valign="top">
                <table border="0" class="tbl_butt">
                    <tr>
                        <td valign="top">&nbsp;<a href="#" onclick="javascript:JSDO_RETURN('dashboard.aspx')" style="color: blue; font-weight: bold;">Go to Menu</a><div style="float: right">
                            &nbsp;<asp:Button ID="cmdSave" CssClass="cmd_butt" Text="Save Data" runat="server" Visible="false" />
                            &nbsp;<asp:Button ID="cmdSaveN" CssClass="cmd_butt" Text="Save Data" runat="server" OnClientClick="JavaSave_Rtn()" Height="26px" />
                            &nbsp;<asp:Button ID="cmdDel" CssClass="cmd_butt" Text="Delete Data" Enabled="false" runat="server" Visible="false" />
                            &nbsp;<asp:Button ID="cmdDelN" CssClass="cmd_butt" Text="Delete Data" runat="server" OnClientClick="JavaDel_Rtn()" Enabled="False" />
                            </div>
                            &nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top" align="right">
                            <asp:Label ID="Label1" runat="server" Text="Role"></asp:Label>
                            &nbsp; &nbsp; &nbsp;
                            <asp:DropDownList ID="cboRole" runat="server" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td valign="top">
                <asp:Label ID="lblMessage" Text="Status:" ForeColor="Red" runat="server"></asp:Label></td>
        </tr>

        <tr>
            <td valign="top">
                <table align="left" width="100%">
                    <tr>
                        <td align="left" colspan="2" valign="top" class="tbl_caption">User Permissions
                        </td>
                    </tr>

                    <tr>
                        <td valign="top" class="auto-style2" style="font-weight: bold; font-size: 14pt;">Menu
                        </td>
                        <td valign="top" rowspan="2">

                            <asp:GridView ID="GrdLapsePolicy" runat="server"
                                AutoGenerateColumns="False" Height="117px" Width="502px" BorderWidth="0px" BorderStyle="None" BorderColor="Transparent">
                                <Columns>
                                    <asp:TemplateField HeaderText="All" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="MyButtonClick" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Add" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkAdd" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkEdit" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkDelete" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Print" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkPrint" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Visibility" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkVisible" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <SelectedRowStyle BackColor="Silver" />
                                <HeaderStyle CssClass="CartListHead" Font-Bold="True"
                                    ForeColor="White" />
                                <RowStyle BackColor="Control" Font-Names="Trebuchet MS" Font-Size="Small " ForeColor="black" />
                                <AlternatingRowStyle BackColor="white" Font-Names="Trebuchet MS" Font-Size="Small "
                                    ForeColor="black" />
                            </asp:GridView>
                            <asp:GridView ID="GridView1" runat="server" Visible="False">
                            </asp:GridView>
                        </td>
                    </tr>

                    <tr>
                        <td valign="top" class="auto-style1">
                            <div id="jstree" style="background-color: #fff!important">
                                <ul>
                                    <li data-jstree='{"icon":"imgsIcon/icon_telephone_blue.png", "opened":true,"selected":true}'>Telephone Bill
                                            <ul>
                                                <li>Code SetUp</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                    </li>
                                    <li data-jstree='{"icon":"imgsIcon/icon_service.png", "opened":true,"selected":true}'>Services Bill
                                            <ul>
                                                <li>Code SetUp</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                    </li>
                                    <li data-jstree='{"icon":"imgsIcon/icon_moto.png", "opened":true,"selected":true}'>Motor Vehicle (R & M)
                                            <ul>
                                                <li>Code Setup</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                    </li>
                                    <li data-jstree='{"icon":"imgsIcon/icon_procurement.png", "opened":true,"selected":true}'>Procurement
                                            <ul>
                                                <li>Code Setup</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                    </li>
                                    <li data-jstree='{"icon":"imgsIcon/icon_expenses.png", "opened":true,"selected":true}'>Branch Expenses
                                            <ul>
                                                <li>Code Setup</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                    </li>

                                    <li data-jstree='{"icon":"imgsIcon/icon_premRec.png", "opened":true,"selected":true}'>Insurance Premium Records
                                            <ul>
                                                <li>Code Setup</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                    </li>

                                    <li data-jstree='{"icon":"imgsIcon/icon_claimRec.png", "opened":true,"selected":true}'>Insurance Claim Records
                                            <ul>
                                                <li>Code Setup</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                    </li>
                                    <li data-jstree='{"icon":"imgsIcon/icon_claimRec.png", "opened":true,"selected":true}'>Settings
                                            <ul>
                                                <li>User Setup</li>
                                                <li>User Role</li>
                                                <%--<li>Report</li>--%>
                                            </ul>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>

    </table>
    <!-- </div>-->
</asp:Content>
