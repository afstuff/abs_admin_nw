﻿<%@ Page Title="Codes Setup ::Service Bill" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="AD140.aspx.vb" Inherits="ABSADMIN_08_VB.AD140" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" href="Content/calendar.css" />
	<link rel="stylesheet" type="text/css" href="Content/StyleAdmin.css" />
	<script src="Scripts/jquery.simplemodal.js" type="text/javascript"></script>
	<script src="Scripts/jquery-1.11.0.js" type="text/javascript"></script>
	<script type="text/javascript" src="Scripts/ScriptJS.js"></script>


	<script type="text/vbscript">
	
Sub cmdDelete_ASP_OnClick()
	Dim P : P = 0
	for each V in Form1.elements
		if V.id = "cmdDelete_ASP" then
			P = P + 1
		end if
	next
	If P > 0 then
		if msgbox("Are you sure you want to delete this record from database?", 36, "Confirm Delete!") = 6 then
			Form1.txtAction.value="Delete"
			Form1.Submit
		else  
			'msgbox "Current record not deleted!", , "Delete Record"
		end if
	Else
	End if
		
End Sub

Sub cmdDelItem_ASP_OnClick()
	Dim P : P = 0
	for each V in Form1.elements
		'if v.type = "checkbox" then
		'if v.Checked = True then P = P + 1
		'end if

		if V.type = "checkbox" and right(V.id,6) = "chkSel" and (left(V.id,9) = "DataGrid1" or left(V.id,9) = "GridView1") then
		   'msgbox "Found Control Type: " &  V.type & vbcrLF & "Found Control ID: " & V.id & vbcrLF & "Status: " & V.Checked
		   if V.Checked = True then
			  P = P + 1
		   end if
		end if

	next
	
	if P > 0 then
	if msgbox("Are you sure you want to delete the selected item(s)?", 36, "Confirm Delete!") = 6 then
		Form1.txtAction.value="Delete_Item"
		Form1.Submit
	end if
	Else
		msgbox "You must select an item to delete!", , "Nothing to Delete"
	End if
End Sub

	</script>

	<script type="text/javascript">
		// calling jquery functions once document is ready
		$(document).ready(function () {
			//test jqr
			//alert("page loade!");



			//$('#branch-line').hide();
			$('#dept-line').hide();
			$("#transid-line").hide();
			$("#service_coy_line").hide();


		});     //End of JQuery Document ready 
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h3 style="background-color: lightgrey; padding: 5px; margin-top: 0;">Transactions
	</h3>
	<table align="center" border="0" class="tbl_main">
		<tr>
			<td align="left" valign="top">
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
						<td id="td_Return_Link" colspan="1" valign="top" runat="server">&nbsp;
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
			<td valign="top">
				<asp:Label ID="lblMessage" Text="Status:" ForeColor="Red" runat="server"></asp:Label></td>
		</tr>

		<tr>
			<td valign="top">
				<table align="left" width="100%">
					<tr>
						<td align="left" colspan="2" valign="top" class="tbl_caption">Repairs/Maintenance Data Entry</td>
					</tr>
					<tr>
						<td colspan="2" valign="top"></td>
					</tr>
					<tr>
						<td align="right" valign="top">
							<asp:Label ID="Label3" Text="Trans Class:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:DropDownList ID="ddlTransClass" Width="300" runat="server" AutoPostBack="True"></asp:DropDownList>
							&nbsp;<asp:TextBox ID="txtClassID" Visible="false" Enabled="false" Width="60" MaxLength="4" runat="server"></asp:TextBox>
							&nbsp;<asp:TextBox ID="txtClassName" Visible="false" Enabled="false" Width="60" runat="server"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td align="right" valign="top">
							<asp:Label ID="Label4" Text="Trans ID:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:DropDownList ID="ddlTransID" Width="300" runat="server"></asp:DropDownList>
							&nbsp;<asp:TextBox ID="txtTransID" Visible="false" Enabled="false" Width="60" MaxLength="4" runat="server"></asp:TextBox>
							&nbsp;<asp:TextBox ID="txtTransName" Visible="false" Enabled="false" Width="60" runat="server"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td align="right" valign="top">
							<asp:Label ID="Label1" Text="Trans No:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:TextBox ID="txtTransNum" MaxLength="15" runat="server"></asp:TextBox></td>
					</tr>

					<tr id="transid-line">
						<td align="right" valign="top">
							<asp:Label ID="lblTransNum" Text="Transaction Type:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:DropDownList ID="ddlTransType" AutoPostBack="false" Width="300" runat="server">
							</asp:DropDownList>
							&nbsp;<asp:TextBox ID="txtTransType" Enabled="false" Width="60" MaxLength="4" runat="server" Visible="false"></asp:TextBox>
						</td>
					</tr>
					<tr id="branch-line">
						<td align="right" valign="top">
							<asp:Label ID="lblBraNum" Text="Branch:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:DropDownList ID="ddlBraNum" AutoPostBack="false" Width="300" runat="server"></asp:DropDownList>
							&nbsp;<asp:TextBox ID="txtBraNum" Enabled="false" Width="60" MaxLength="4" runat="server" Visible="false"></asp:TextBox>
						</td>
					</tr>
					<tr id="dept-line">
						<td align="right" valign="top">
							<asp:Label ID="lblDeptNum" Text="Department:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:DropDownList ID="ddlDeptNum" Width="300" runat="server"></asp:DropDownList>
							&nbsp;<asp:TextBox ID="txtDeptNum" Visible="false" Enabled="false" Width="60" MaxLength="5" runat="server"></asp:TextBox>
							&nbsp;<asp:TextBox ID="txtDeptName" Visible="false" Enabled="false" Width="60" runat="server"></asp:TextBox>
						</td>
					</tr>

					<tr>
						<td align="right" valign="top">
							<asp:Label ID="lblTransDate" Text="Transaction Date:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:TextBox ID="txtTransDate" MaxLength="10" runat="server"></asp:TextBox>&nbsp;&nbsp;dd/mm/yyyy</td>
					</tr>
					<tr>
						<td align="right" valign="top">
							<asp:Label ID="lblTransAmt" Text="Amount =N=:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:TextBox ID="txtTransAmt" MaxLength="15" runat="server"></asp:TextBox>&nbsp;
						</td>
					</tr>
					<tr>
						<td align="right" valign="top">
							<asp:Label ID="lblTransDescr" Text="Description:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:TextBox ID="txtTransDescr" MaxLength="90" runat="server" Width="400px"></asp:TextBox>&nbsp;</td>
					</tr>
					<tr id="service_coy_line">
						<td align="right" valign="top">
							<asp:Label ID="lblServiceComp" Text="Service Company:" runat="server"></asp:Label>&nbsp;</td>
						<td valign="bottom">
							<asp:TextBox ID="txtServiceComp" Width="150" runat="server" MaxLength="15"></asp:TextBox>
							&nbsp;Find:<asp:TextBox ID="txtServiceComp_Search" Width="120px" runat="server"></asp:TextBox>
							&nbsp;<asp:Button ID="cmdCompany_Search" Text="Search" runat="server" OnClick="DoProc_Company_Search" />
							&nbsp;<asp:DropDownList ID="ddlServiceComp" AutoPostBack="true" runat="server" Width="220px" OnTextChanged="DoProc_Company_Change"></asp:DropDownList>

						</td>
					</tr>

					<tr>
						<td align="right" valign="top">
							<asp:Label ID="Label2" Text="Service HRS:" runat="server" Visible="false"></asp:Label>&nbsp;</td>
						<td valign="top">
							<asp:TextBox ID="txtServiceHrs" MaxLength="15" runat="server" Visible="false"></asp:TextBox></td>
					</tr>

					<tr>
						<td colspan="2" valign="top">&nbsp;</td>
					</tr>

				</table>
			</td>

		</tr>

		<tr>
			<td valign="top">
				<table align="center" width="95%" style="border-style: groove;">
					<tr>
						<td align="left" colspan="4" valign="top" class="tbl_caption">Transaction Details</td>
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
								AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
								SelectedIndex="0" PagerSettings-Position="TopAndBottom" PagerSettings-Mode="NextPreviousFirstLast"
								PagerSettings-FirstPageText="First" PagerSettings-NextPageText="Next"
								PagerSettings-PreviousPageText="Previous" PagerSettings-LastPageText="Last"
								EmptyDataText="No data available." Width="100%">

								<RowStyle></RowStyle>
								<PagerStyle></PagerStyle>
								<HeaderStyle BackColor="#9ACD32" ForeColor="White"></HeaderStyle>
								<SelectedRowStyle BackColor="LightCyan" ForeColor="DarkBlue" Font-Bold="true" />

								<Columns>
									<asp:TemplateField>
										<ItemTemplate>
											<asp:CheckBox ID="chkSel" runat="server"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:HyperLinkField DataTextField="rbId" DataNavigateUrlFields="rbId,TransNo"
										DataNavigateUrlFormatString="~/AD140.aspx?idd={0},{1}" HeaderText="ID"></asp:HyperLinkField>

									<asp:HyperLinkField DataTextField="TransNo" DataNavigateUrlFields="rbId,TransNo"
										DataNavigateUrlFormatString="~/AD140.aspx?idd={0},{1}" HeaderText="Trans #"></asp:HyperLinkField>

									<asp:BoundField DataField="TransDate" HeaderText="Trans Date" DataFormatString="{0:d}" />
									<asp:TemplateField HeaderText="Trans. Amt">
										<ItemTemplate>
											<asp:Label ID="lblTransAmt" runat="server" DataFormatString="{0:N2}" Text='<%#Eval("TransAmount") %>' />
										</ItemTemplate>
										<FooterTemplate>

											<asp:Label ID="lbltxtTotal" runat="server" Text="0.00" />

										</FooterTemplate>

									</asp:TemplateField>
									<asp:BoundField DataField="Description" HeaderText="Trans Description" />

								</Columns>

							</asp:GridView>
							&nbsp;</td>
					</tr>
				</table>

			</td>
		</tr>


		<tr>
			<td valign="top">&nbsp;</td>
			<asp:ObjectDataSource ID="ods" runat="server" SelectMethod="RepairsBills" TypeName="CustodianAdmin.Data.RepairsBillRepository"></asp:ObjectDataSource>
		</tr>

	</table>
</asp:Content>
