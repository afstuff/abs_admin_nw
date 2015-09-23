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
        .grd_ctrl 
{
	 /* background-color: #FAFAD2; */
	  background-color: White;
	 /* border-color: #D2B4BC; */
	 /* color: #333333; */
	 /* color: Black; */
	 border-width: 1px;
	 font-size: small;
	 width: 100%;	 
}

        .grd_page_style 
{ 
	/* background-color: #483D8B; */
	/* background-color: #666666; */
	 /* background-color: #999999; */
	 /* background-color: Teal; */
	 /* color: White; */
	 font-size: large;
	 /* font-weight: bold; */
	text-align: left;
}

.grd_header_style 
{
	/* background-color: #507CD1; */
	/* background-color: #9ACD32; */
    /* background-color: #D2B4BC; */
	/* background-color: Black; */
	 background-color: #000084;
	background-color: #1C5E55;
	 color:White; 
	 font-size:medium;
	 font-weight: bold;
	 text-align: left;
	 vertical-align: top;
}

.grd_row_style 
{ 
	/* background-color:#EFF3FB; */
	/* background-color : #EEEEEE; */
	/* background-color: #E3EAEB; */
	font-size:small;
	/* font-weight: bold; */
}

.grd_selrow_style 
{ 
	/* background-color: LightCyan; */
	/* background-color: #483D8B; */
	 background-color: #008A8C;
	background-color: #C5BBAF;
    /* color: DarkBlue; */
    /* color: #F8F8FF; */
    /* color: White; */
    color: #333333;
	font-size:medium;
    font-weight: bold;
}

.grd_editrow_style
{
	background-color: #7C6F57;
	font-size:medium;
}

.grd_altrow_style 
{ 
	/* background-color:  #FFFFFF; */
	/* background-color:  #EEE8AA; */
	 background-color: #DCDCDC;
	background-color: White;
	background-color: #CDE4F1;
	font-size:small;
}

.grd_footer_style 
{ 
	/* background-color: #507CD1; */
	/* background-color: #9ACD32; */
	/* background-color: #D2B4BC; */
	/* background-color: Black; */
	 background-color: #CCCCCC;
	background-color: #1C5E55;
	 color:White; 
	 /* font-weight: bold; */
	 font-size:medium;
	 font-weight: bold;
	 text-align: left;
	 vertical-align: top;
}


.grd_PagerSettings 
{
	/* background-color: #507CD1; */
	/* background-color: #9ACD32; */
    /* background-color: #D2B4BC; */
	/* background-color: Black; */
	 background-color: #000084;
	background-color: #1C5E55;
	 color:White; 
	 font-size: large;
	 font-weight: bold;
	 text-align: left;
	 vertical-align: top;
}
        .cmd_butt { font-size:medium; font-weight:normal; height: 35px; width: 120px;}

        .auto-style1 {
            height: 26px;
        }

    </style>
    <title></title>
</head>
<body onload="<%= FirstMsg %>">
    <form id="form1" runat="server">
      <h3 style="background-color: lightgrey; padding: 5px; margin-top: 0;">User Setup 
    </h3>

    <table align="center" border="0" class="tbl_main">
        <tr>
            <td align="left" valign="top">
                <table border="0" class="tbl_butt">
                    <tr>
                        <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="cmdNew" CssClass="cmd_butt" Text="New Data" runat="server" />
                            &nbsp;
                        <asp:Button ID="cmdSave" CssClass="cmd_butt" Text="Save Data" runat="server" Visible="false" />
                            <asp:Button ID="cmdSaveN" CssClass="cmd_butt" Text="Save Data" runat="server" OnClientClick="JavaSave_Rtn()" />
                            <asp:Button ID="cmdDel" CssClass="cmd_butt" Text="Delete Data" Enabled="false" runat="server" Visible="false" />
                            <asp:Button ID="cmdDelN" CssClass="cmd_butt" Text="Delete Data" runat="server" OnClientClick="JavaDel_Rtn()" />
                            <asp:Button ID="cmdPrint" CssClass="cmd_butt" Enabled="false" Text="Print" runat="server" />
                        </td>
                        <td colspan="1" valign="top" align="right">
                            <div style="display: none;">
                                &nbsp;&nbsp;Status:&nbsp;<asp:TextBox ID="txtAction" Visible="true" runat="server" EnableViewState="false" Width="50px"></asp:TextBox>&nbsp;
                            </div>
                           <span style="font-weight:bold">Find</span> :&nbsp;
                                <input type="text" id="txtSearch" name="txtSearch" value="Search..." runat="server"
                                    onfocus="if (this.value == 'Search...') {this.value = '';}"
                                    onblur="if (this.value == '') {this.value = 'Search...';}"></input>&nbsp;
                                <asp:Button ID="cmdSearch" Text="Search" runat="server" />
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
                        <td align="left" colspan="2" valign="top" class="tbl_caption">User Setup
                        </td>
                    </tr>

                    <tr>
                        <td align="right" valign="top" colspan="2">
                            
                            <asp:GridView id="GridView1" CellPadding="2" runat="server" CssClass="grd_ctrl"
                                    DataKeyNames="User_RecId" HorizontalAlign="Left"
                                    AutoGenerateColumns="False" AllowPaging="True" AllowSorting="false" PageSize="10"
                                    PagerSettings-Position="TopAndBottom" PagerSettings-Mode="NextPreviousFirstLast"
                                    PagerSettings-FirstPageText="First" PagerSettings-NextPageText="Next"
                                    PagerSettings-PreviousPageText="Previous" PagerSettings-LastPageText="Last"
                                    EmptyDataText="No data available..."
                                    GridLines="Both" ShowFooter="True">                        

                        
                                    <PagerStyle CssClass="grd_page_style" />
                                    <HeaderStyle CssClass="grd_header_style" />
                                    <RowStyle CssClass="grd_row_style" />
                                    <SelectedRowStyle CssClass="grd_selrow_style" />
                                    <EditRowStyle CssClass="grd_editrow_style" />
                                    <AlternatingRowStyle CssClass="grd_altrow_style" />
                                    <FooterStyle CssClass="grd_footer_style" />
                    
                                    <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" Position="TopAndBottom" 
                                        PreviousPageText="Previous">
                                    </PagerSettings>
                        
                                    <Columns>
                                        <asp:TemplateField>
        			                        <ItemTemplate>
        						                <asp:CheckBox id="chkSel" runat="server"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                            
                                        <asp:CommandField ShowSelectButton="True" />
                            
                                        <asp:BoundField readonly="true" DataField="User_RecId" HeaderText="Ref.No" HeaderStyle-HorizontalAlign="Left" convertemptystringtonull="true" HeaderStyle-ForeColor="White" />
                                        <asp:BoundField readonly="true" DataField="User_Id" HeaderText="Ref.ID" HeaderStyle-HorizontalAlign="Left" convertemptystringtonull="true" HeaderStyle-ForeColor="White"/>
                                        <asp:BoundField readonly="true" DataField="User_Login" HeaderText="Username" HeaderStyle-HorizontalAlign="Left" convertemptystringtonull="true" HeaderStyle-ForeColor="White"/>
                                        <asp:BoundField readonly="true" DataField="User_Name" HeaderText="Name" HeaderStyle-HorizontalAlign="Left" convertemptystringtonull="true" HeaderStyle-ForeColor="White" />
                                        <asp:BoundField readonly="true" DataField="User_Phone1" HeaderText="Phone No" HeaderStyle-HorizontalAlign="Left" convertemptystringtonull="true" HeaderStyle-ForeColor="White"/>
                                    </Columns>
   
                                </asp:GridView>

                        </td>
                    </tr>
                     <tr>
                        <td colspan="2"><hr /></td>
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
                            <asp:TextBox ID="txtShortName" runat="server" EnableViewState="true" MaxLength="10" Width="100px"></asp:TextBox>
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
                        <td align="right" valign="top" class="auto-style1">
                            <asp:Label ID="lblLoginName" runat="server" Text="Login Email"></asp:Label>
                        </td>
                        <td valign="top" class="auto-style1">
                            <asp:TextBox ID="txtLoginName" runat="server" EnableViewState="true" Width="447px" type="Email"></asp:TextBox>
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

        </table>
    </form>
</body>
</html>
