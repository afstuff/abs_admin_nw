<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ADPermissions.aspx.vb" Inherits="ABSADMIN_08_VB.ADPermissions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="Content/calendar.css" />
    <link rel="stylesheet" type="text/css" href="Content/StyleAdmin.css" />
    <%--<script src="AD_HOME.aspx" type="text/javascript"></script>--%>
    <script src="Scripts/jquery.simplemodal.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.11.0.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="Scripts/ScriptJS.js"></script>
    <link href="dist/themes/default/style.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <title>User Permission</title>
</head>
<body>
    <form id="ADPermissions" runat="server">
     <h3 style="background-color: lightgrey; padding: 5px; margin-top: 0;">User Permissions</h3>
    <div class="div_container_02">
    <br />
    <table align="center" border="0" class="tbl_main">
        <tr>
            <td align="left" colspan="7" valign="top">
                <table border="0" class="tbl_butt">
                    <tr>
                        <td colspan="5" valign="top">&nbsp;<asp:Button ID="cmdNew" CssClass="cmd_butt" Text="New Data" runat="server" />
                            &nbsp;<asp:Button ID="cmdSave" CssClass="cmd_butt" Text="Save Data" runat="server" Visible="false" />
                            &nbsp;<asp:Button ID="cmdSaveN" CssClass="cmd_butt" Text="Save Data" runat="server" OnClientClick="JavaSave_Rtn()" />
                            &nbsp;<asp:Button ID="cmdDel" CssClass="cmd_butt" Text="Delete Data" Enabled="false" runat="server" Visible="false" />
                            &nbsp;<asp:Button ID="cmdDelN" CssClass="cmd_butt" Text="Delete Data" runat="server" OnClientClick="JavaDel_Rtn()" />
                            &nbsp;<asp:Button ID="cmdPrint" CssClass="cmd_butt" Enabled="false" Text="Print" runat="server" />
                            &nbsp;
                        </td>
                        <td id="td_Return_Link" colspan="1" valign="top" runat="server"><%--&nbsp;|&nbsp;&nbsp;
                            <a id="PageAnchor_Return_Link" runat="server" href="Blankpg.aspx" style="font-size: large; font-weight: bold;">CLOSE PAGE</a>
                            <%=PageLinks%>&nbsp;&nbsp;|--%>
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
                        <td align="left" colspan="2" valign="top" class="tbl_caption">Miscellanous Codes Data Setup
                        </td>
                    </tr>
                    <tr><td style="width:400px"></td><td>&nbsp;</td></tr>
                    <tr>
                        <td align="left" valign="top" rowspan="8">
                              <div id="jstree" style="width:400px">
                                  <ul>
                                      <li data-jstree='{"icon":"glyphicon glyphicon-earphone", "opened":true,"selected":true}'>Telephone
                                            <ul>
                                                <li>Code Set Up</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                         </li>
                                       <li data-jstree='{"icon":"glyphicon glyphicon-earphone", "opened":true,"selected":true}'>Services
                                            <ul>
                                                <li>Code Set Up</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                         </li>
                                      <li data-jstree='{"icon":"glyphicon glyphicon-car", "opened":true,"selected":true}'>Motor Vehicle (R & M)
                                            <ul>
                                                <li>Code Set Up</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                         </li>
                                       <li data-jstree='{"icon":"glyphicon glyphicon-earphone", "opened":true,"selected":true}'>Procurement
                                            <ul>
                                                <li>Code Set Up</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                         </li>
                                        <li data-jstree='{"icon":"glyphicon glyphicon-earphone", "opened":true,"selected":true}'>Branch Expenses
                                            <ul>
                                                <li>Code Set Up</li>
                                                <li>Transactions</li>
                                                <li>Report</li>
                                            </ul>
                                         </li>
                                  </ul>
                              </div>
                        </td>
                        <td valign="top">
                           <asp:GridView ID="GrdLapsePolicy" runat="server"
                                          AutoGenerateColumns="False">
                              <Columns>
                                 <asp:TemplateField> 
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkPolicyNo" runat="server" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                  <asp:TemplateField> 
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkPolicyNo" runat="server" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                  <asp:TemplateField> 
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkPolicyNo" runat="server" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                  <asp:TemplateField> 
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkPolicyNo" runat="server" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                  <asp:TemplateField> 
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkPolicyNo" runat="server" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                    </Columns>
                      <SelectedRowStyle BackColor="Silver" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                  <HeaderStyle BackColor="ControlDarkDark" CssClass="CartListHead" Font-Bold="True"
                      ForeColor="White" />
                  <RowStyle BackColor="Control" Font-Names="Trebuchet MS" Font-Size="Small " ForeColor="black" />
                  <AlternatingRowStyle BackColor="white" Font-Names="Trebuchet MS" Font-Size="Small "
                      ForeColor="black" />
                            </asp:GridView></td>
                    </tr>

                    <tr>
                        <td valign="top">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;</td>
                    </tr>
                    <tr id="type1">
                        <td valign="top">
                            &nbsp;</td>
                    </tr>
                    <tr id="TransClassRow">
                        <td valign="top">
                            &nbsp;&nbsp;</td>
                    </tr>

                    <tr id="BranchRow">
                        <td valign="top">
                            &nbsp;&nbsp;</td>
                    </tr>
                    <tr id="DeptRow">
                        <td valign="top">
                            &nbsp;&nbsp;</td>
                    </tr>

                    <tr>
                        <td colspan="2" valign="top">&nbsp;</td>
                    </tr>

                </table>
            </td>
        </tr>

        <tr>
            <td colspan="7" valign="top">
                &nbsp;</td>
        </tr>


        <tr>
            <td colspan="7" valign="top">&nbsp;</td>
        </tr>

    </table>
        </div>
    </form> 
    <script src="dist/libs/jquery.js"></script>
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
  </script>
</body>
</html>
