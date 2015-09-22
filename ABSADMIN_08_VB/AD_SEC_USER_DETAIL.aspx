<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AD_SEC_USER_DETAIL.aspx.vb" Inherits="ABSADMIN_08_VB.AD_SEC_USER_DETAIL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="Content/calendar.css" />
    <link rel="stylesheet" type="text/css" href="Content/StyleAdmin.css" />
    <script src="Scripts/jquery.simplemodal.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.11.0.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="Scripts/ScriptJS.js"></script>
    <style>
        .myMenu_Title {
   background-color: #B0E0E6;
  font-size:large;
  font-weight:bold;
  margin: 0px;
  padding: 5px 3px;
  text-align:left;
  text-transform:uppercase;
}
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <h3 style="background-color: lightgrey; padding: 5px; margin-top: 0;">User Setup 
    </h3>

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
                        <td align="left" colspan="2" valign="top" class="tbl_caption">User Setup
                        </td>
                    </tr>

                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblCustID" runat="server" Enabled="false" Text="Record ID:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:TextBox ID="txtUserID" runat="server" Enabled="false" EnableViewState="true" MaxLength="3" Width="100px"></asp:TextBox>
                            <asp:Label ID="lblRecNo" runat="server" Enabled="false" Text="Rec. No:"></asp:Label>
                            <asp:TextBox ID="txtRecNo" runat="server" Enabled="false" MaxLength="18"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblFullName" runat="server" Text="FullName:"></asp:Label>
                            &nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtName" runat="server" EnableViewState="true" MaxLength="49" Width="450px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblShortName" runat="server" Text="Short Name :"></asp:Label>
                            &nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtShortName" runat="server" AutoPostBack="true" EnableViewState="true" MaxLength="10" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr id="type1">
                        <td align="right" valign="top">
                            <asp:Label ID="lblGroup" runat="server" Text="Group:"></asp:Label>
                            &nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtGroup" runat="server" Enabled="false" EnableViewState="true" MaxLength="3" Width="100px"></asp:TextBox>
                            <asp:DropDownList ID="cboGroup" runat="server" AutoPostBack="True" Visible="true" Width="200px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr id="TransClassRow">
                        <td align="right" valign="top">
                            <asp:Label ID="lblRole" runat="server" Text="Role:"></asp:Label>
                            &nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="cboRole" runat="server" Visible="true" Width="200px">
                            </asp:DropDownList>
                            &nbsp;&nbsp;</td>
                    </tr>

                    <tr id="BranchRow">
                        <td align="right" valign="top">
                            <asp:Label ID="lblBraNum" Text="Branch:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            &nbsp;<asp:TextBox ID="txtBranch" runat="server" EnableViewState="true" MaxLength="39" Width="400px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblCustPhone01" runat="server" Text="GSM/Mobile No:"></asp:Label>
                            &nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtCustPhone01" runat="server" EnableViewState="true" MaxLength="11" Width="200px"></asp:TextBox>
                            &nbsp;&nbsp;<asp:Label ID="lblCustPhone02" runat="server" Text="Land Line No:"></asp:Label>
                            <asp:TextBox ID="txtCustPhone02" runat="server" EnableViewState="true" MaxLength="11" Width="200px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblCustEmail01" runat="server" Text="Email Address - 1:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:TextBox ID="txtCustEmail01" runat="server" EnableViewState="true" MaxLength="49" Width="450px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblCustEmail02" runat="server" Text="Email Address - 2:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:TextBox ID="txtCustEmail02" runat="server" EnableViewState="true" MaxLength="49" Width="450px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td align="left" valign="top" colspan="2" class="myMenu_Title">
                            <asp:Label ID="lblCustEmail5" runat="server" Text="Login Detail:" Font-Bold="False"></asp:Label>
                        </td>
                    </tr>

                    <tr id="DeptRow">
                        <td align="right" valign="top">
                            <asp:Label ID="lblLoginName" runat="server" Text="Username:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:TextBox ID="txtLoginName" runat="server" AutoPostBack="True" EnableViewState="true" MaxLength="11" Width="200px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr id="DeptRow">
                        <td align="right" valign="top">
                            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:TextBox ID="txtPassword" runat="server" EnableViewState="true" MaxLength="11" TextMode="Password" Width="200px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr id="DeptRow">
                        <td align="right" valign="top">
                            <asp:Label ID="lblConPassword" runat="server" Text="Confirm Password:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:TextBox ID="txtConPassword" runat="server" EnableViewState="true" MaxLength="11" TextMode="Password" Width="200px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" valign="top">&nbsp;</td>
                    </tr>

                </table>
            </td>
        </tr>

        <tr>
            <td colspan="7" valign="top">
                <table align="center" width="90%" style="border-style: groove;">
                    <tr>
                        <td align="left" valign="top" colspan="4" class="tbl_caption">Transaction-Codes Details
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="4" valign="top" style="background-color: #ccccee; height: 26px">&nbsp;&nbsp;<asp:Button ID="cmdDelItem_ASP" Enabled="true" Font-Bold="true" Text="Delete Item" runat="server" />
                            &nbsp;&nbsp;<asp:Button ID="cmdDelItem" Enabled="false" Font-Bold="true" Visible="false" Text="Delete Item" runat="server" />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" valign="top" style="width: auto;">
                            <asp:GridView ID="grdData" Font-Size="Small" BackColor="White" BorderColor="Silver" BorderStyle="Solid" runat="server"
                                HorizontalAlign="Left" DataSourceID="ods"
                                AutoGenerateColumns="False" AllowPaging="True"
                                SelectedIndex="0" PagerSettings-Position="TopAndBottom" PagerSettings-Mode="NextPreviousFirstLast"
                                PagerSettings-FirstPageText="First" PagerSettings-NextPageText="Next"
                                PagerSettings-PreviousPageText="Previous" PagerSettings-LastPageText="Last"
                                EmptyDataText="No data available." Width="100%">

                                <RowStyle></RowStyle>
                                <PagerStyle></PagerStyle>
                                <HeaderStyle BackColor="#9ACD32" ForeColor="White"></HeaderStyle>
                                <SelectedRowStyle BackColor="LightCyan" ForeColor="DarkBlue" Font-Bold="true" />

                                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" Position="TopAndBottom" PreviousPageText="Previous"></PagerSettings>

                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSel" runat="server"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:HyperLinkField DataTextField="icId" DataNavigateUrlFields="icId,ClassCode"
                                        DataNavigateUrlFormatString="~/AD111.aspx?idd={0},{1}," HeaderText="ID"></asp:HyperLinkField>

                                    <asp:HyperLinkField DataTextField="ClassCode" DataNavigateUrlFields="icId,ClassCode"
                                        DataNavigateUrlFormatString="~/AD111.aspx?idd={0},{1}," HeaderText="Class"></asp:HyperLinkField>
                                    <asp:BoundField DataField="ItemCode" HeaderText="Code" />
                                    <asp:BoundField DataField="ItemDesc" HeaderText="Description" />

                                </Columns>

                            </asp:GridView>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>


        <tr>
            <td colspan="7" valign="top">&nbsp;</td>
        </tr>

    </table><table align="center" border="0" class="tbl_main">
        <tr>
            <td align="left" colspan="7" valign="top">
                <table border="0" class="tbl_butt">
                    <tr>
                        <td colspan="5" valign="top">&nbsp;<asp:Button ID="Button1" CssClass="cmd_butt" Text="New Data" runat="server" />
                            &nbsp;<asp:Button ID="Button2" CssClass="cmd_butt" Text="Save Data" runat="server" Visible="false" />
                            &nbsp;<asp:Button ID="Button3" CssClass="cmd_butt" Text="Save Data" runat="server" OnClientClick="JavaSave_Rtn()" />
                            &nbsp;<asp:Button ID="Button4" CssClass="cmd_butt" Text="Delete Data" Enabled="false" runat="server" Visible="false" />
                            &nbsp;<asp:Button ID="Button5" CssClass="cmd_butt" Text="Delete Data" runat="server" OnClientClick="JavaDel_Rtn()" />
                            &nbsp;<asp:Button ID="Button6" CssClass="cmd_butt" Enabled="false" Text="Print" runat="server" />
                            &nbsp;
                        </td>
                        <td id="td1" colspan="1" valign="top" runat="server">
                            &nbsp;
                        </td>
                        <td colspan="1" valign="top">
                            <div style="display: none;">
                                &nbsp;&nbsp;Status:&nbsp;<asp:TextBox ID="TextBox1" Visible="true" runat="server" EnableViewState="false" Width="50px"></asp:TextBox>&nbsp;
                            </div>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td colspan="7" valign="top">
                <asp:Label ID="Label1" Text="Status:" ForeColor="Red" runat="server"></asp:Label></td>
        </tr>

        <tr>
            <td colspan="7" valign="top">
                <table align="left" width="100%">
                    <tr>
                        <td align="left" colspan="2" valign="top" class="tbl_caption">Miscellanous Codes Data Setup
                        </td>
                    </tr>

                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="Label2" Text="Code Class:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="DropDownList1" Width="150" runat="server" AutoPostBack="true">
                                <asp:ListItem Text="Vehicle" Value="001"></asp:ListItem>
                                <asp:ListItem Text="Supplier" Value="002"></asp:ListItem>
                                <asp:ListItem Text="Equipment" Value="003"></asp:ListItem>
                                <asp:ListItem Text="Insurance Company" Value="004"></asp:ListItem>
                                <asp:ListItem Text="Broker" Value="005"></asp:ListItem>
                                <asp:ListItem Text="Telephone User" Value="006"></asp:ListItem>
                                <asp:ListItem Text="Meter No" Value="007"></asp:ListItem>
                                <asp:ListItem Text="Department" Value="008"></asp:ListItem>
                                <asp:ListItem Text="Branch" Value="009"></asp:ListItem>
                                <asp:ListItem Text="Trans Class" Value="010"></asp:ListItem>
                                <asp:ListItem Text="Trans IDs" Value="011"></asp:ListItem>
                            </asp:DropDownList><asp:TextBox ID="TextBox2" Visible="false" Enabled="false" Width="60" MaxLength="4" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="Label3" Text="Code:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="TextBox3" Width="150" runat="server"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="Label4" Text="Description:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="TextBox4" runat="server" Width="300"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr id="type1">
                        <td align="right" valign="top">
                            <asp:Label ID="Label5" Text="Code Type:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="DropDownList2" Width="300" runat="server">
                                <asp:ListItem Text="Insurance" Value="Insurance"></asp:ListItem>
                                <asp:ListItem Text="Supplier" Value="Supplier"></asp:ListItem>
                                <asp:ListItem Text="Services" Value="Services"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr id="TransClassRow">
                        <td align="right" valign="top">
                            <asp:Label ID="Label6" Text="TransClass:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="DropDownList3" Width="300" runat="server" AutoPostBack="true"></asp:DropDownList>
                            &nbsp;<asp:TextBox ID="TextBox5" Visible="false" Enabled="false" Width="60" MaxLength="4" runat="server"></asp:TextBox>
                            &nbsp;<asp:TextBox ID="TextBox6" Visible="false" Enabled="false" Width="60" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr id="BranchRow">
                        <td align="right" valign="top">
                            <asp:Label ID="Label7" Text="Branch:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="DropDownList4" Width="300" runat="server"></asp:DropDownList>
                            &nbsp;<asp:TextBox ID="TextBox7" Visible="false" Enabled="false" Width="60" MaxLength="4" runat="server"></asp:TextBox>
                            &nbsp;<asp:TextBox ID="TextBox8" Visible="false" Enabled="false" Width="60" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr id="DeptRow">
                        <td align="right" valign="top">
                            <asp:Label ID="Label8" Text="Department:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="DropDownList5" Width="300" runat="server"></asp:DropDownList>
                            &nbsp;<asp:TextBox ID="TextBox9" Visible="false" Enabled="false" Width="60" MaxLength="5" runat="server"></asp:TextBox>
                            &nbsp;<asp:TextBox ID="TextBox10" Visible="false" Enabled="false" Width="60" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" valign="top">&nbsp;</td>
                    </tr>

                </table>
            </td>
        </tr>

        <tr>
            <td colspan="7" valign="top">
                <table align="center" width="90%" style="border-style: groove;">
                    <tr>
                        <td align="left" valign="top" colspan="4" class="tbl_caption">Transaction-Codes Details
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="4" valign="top" style="background-color: #ccccee; height: 26px">&nbsp;&nbsp;<asp:Button ID="Button7" Enabled="true" Font-Bold="true" Text="Delete Item" runat="server" />
                            &nbsp;&nbsp;<asp:Button ID="Button8" Enabled="false" Font-Bold="true" Visible="false" Text="Delete Item" runat="server" />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" valign="top" style="width: auto;">
                            <asp:GridView ID="GridView1" Font-Size="Small" BackColor="White" BorderColor="Silver" BorderStyle="Solid" runat="server"
                                HorizontalAlign="Left" DataSourceID="ods"
                                AutoGenerateColumns="False" AllowPaging="True"
                                SelectedIndex="0" PagerSettings-Position="TopAndBottom" PagerSettings-Mode="NextPreviousFirstLast"
                                PagerSettings-FirstPageText="First" PagerSettings-NextPageText="Next"
                                PagerSettings-PreviousPageText="Previous" PagerSettings-LastPageText="Last"
                                EmptyDataText="No data available." Width="100%">

                                <RowStyle></RowStyle>
                                <PagerStyle></PagerStyle>
                                <HeaderStyle BackColor="#9ACD32" ForeColor="White"></HeaderStyle>
                                <SelectedRowStyle BackColor="LightCyan" ForeColor="DarkBlue" Font-Bold="true" />

                                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" Position="TopAndBottom" PreviousPageText="Previous"></PagerSettings>

                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSel" runat="server"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:HyperLinkField DataTextField="icId" DataNavigateUrlFields="icId,ClassCode"
                                        DataNavigateUrlFormatString="~/AD111.aspx?idd={0},{1}," HeaderText="ID"></asp:HyperLinkField>

                                    <asp:HyperLinkField DataTextField="ClassCode" DataNavigateUrlFields="icId,ClassCode"
                                        DataNavigateUrlFormatString="~/AD111.aspx?idd={0},{1}," HeaderText="Class"></asp:HyperLinkField>
                                    <asp:BoundField DataField="ItemCode" HeaderText="Code" />
                                    <asp:BoundField DataField="ItemDesc" HeaderText="Description" />

                                </Columns>

                            </asp:GridView>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>


        <tr>
            <td colspan="7" valign="top">&nbsp;</td>
        </tr>

    </table>
    </form>
</body>
</html>
