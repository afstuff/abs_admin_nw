﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site7.Master" CodeBehind="AD180.aspx.vb" Inherits="ABSADMIN_08_VB.AD180" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Content/StyleAdmin.css" />
    <script src="Scripts/jquery.simplemodal.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.11.0.js" type="text/javascript"></script>

    <script type="text/javascript" src="Scripts/ScriptJS.js">
    </script>


    <script type="text/javascript">
        // calling jquery functions once document is ready
        $(document).ready(function () {

            //screen responds according to selection
            $("#<%= txtPolicyNo.ClientID %>").on('focusout', function (e) {
                e.preventDefault();
                //    LoadPolicyInfoObject();

            });

            //load data into type combo according to selection
            function onErrorLoadPolicyInfoObject(response) {
                //debugger;
                alert('Error!: Policy Info does not exist!' + '\n\n');
            }

            function onFailure(response) {
                //debugger;
                alert('Failure!!!' + '<br/>' + response.reponseText);
            }

            function retrievePolicyInfoValues(policyholders) {
                //debugger;
                $.each(policyholders, function () {
                    var policyholder = $(this);

                    $('#<%= txtBrokerName.ClientID %>').val($(this).find("sBrokerName").text());
                    $('#<%= txtInsurerName.ClientID %>').val($(this).find("sInsuredName").text());
                    $("#<%= cmbTransType.ClientID %>").val($(this).find("sInsuranceClass").text());

                });
            }

            function onSuccessLoadPolicyInfoObject(response) {
                //debugger;

                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var policyholders = xml.find("Table");
                retrievePolicyInfoValues(policyholders);

            }

            function loadPolicyInfoObject() {
                var txtPolicyNo = $("#<%= txtPolicyNo.ClientID %>").Val();
                $.ajax({
                    type: "POST",
                    url: "AD180.aspx/GetPolicyInformation",
                    data: JSON.stringify({ _polnum: txtPolicyNo }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: onSuccessLoadPolicyInfoObject,
                    failure: onFailure,
                    error: onErrorLoadPolicyInfoObject
                });
                // this avoids page refresh on button click
                return false;
            } // retrieve the values and
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="background-color: lightgrey; padding: 5px; margin-top: 0;">Transactions
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
            <td colspan="7" valign="top">
                <asp:Label ID="lblMessage" Text="Status:" ForeColor="Red" runat="server"></asp:Label></td>
        </tr>

        <tr>
            <td colspan="7" valign="top">
                <table align="left" width="100%">
                    <tr>
                        <td align="left" colspan="2" valign="top" class="tbl_caption">Insurance Records Data Entry</td>
                    </tr>

                    <tr>
                        <td colspan="2" valign="top"></td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblTransNum" Text="Transaction No:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtTransNum" MaxLength="15" AutoPostBack="false" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lbltranstype" Text="Transaction Type:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="cmbTransType" Width="150" runat="server">
                                <asp:ListItem Text="Fire" Value="Fire"></asp:ListItem>
                                <asp:ListItem Text="Motor" Value="Motor"></asp:ListItem>
                                <asp:ListItem Text="Accident" Value="Accident"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblTransDate" Text="Trans Date:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtTransDate" MaxLength="10" runat="server"></asp:TextBox>&nbsp;&nbsp;dd/mm/yyyy</td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblBraNum" Text="Branch:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="ddlBraNum" AutoPostBack="false" Width="300" runat="server"></asp:DropDownList>
                            &nbsp;<asp:TextBox ID="txtBraNum" Enabled="false" Visible="false" Width="60" MaxLength="4" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
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
                            <asp:Label ID="lblClaimNo" Text="Claim No:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtClaimNo" runat="server" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblPolicyNo" Text="Policy No:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtPolicyNo" runat="server" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblBroker" Text="Broker Name:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="cmbBrokerName" Width="300" runat="server"></asp:DropDownList><asp:TextBox ID="txtBrokerName" runat="server" Width="300px" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblInsurerName" Text="Insurer Name:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:DropDownList ID="cmbInsurerName" Width="300" runat="server"></asp:DropDownList>
                            <asp:TextBox ID="txtInsurerName" runat="server" Width="300px" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblTransDescr" Text="Description:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtTransDescr" runat="server" Width="300px"></asp:TextBox>&nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblLossDate" Text="Loss Date:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtLossDate" MaxLength="10" runat="server"></asp:TextBox>&nbsp;&nbsp;dd/mm/yyyy</td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblClaimReq" Text="Requested Amt =N=:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtClaimRequested" MaxLength="15" runat="server"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblClaimPaid" Text="Claim Paid =N=:" runat="server"></asp:Label>&nbsp;</td>
                        <td valign="top">
                            <asp:TextBox ID="txtClaimPaid" MaxLength="15" runat="server"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top">&nbsp;</td>
                    </tr>

                </table>
            </td>

        </tr>

        <tr>
            <td colspan="7" valign="top">
                <table align="center" width="95%" style="border-style: groove;">
                    <tr>
                        <td align="left" colspan="4" valign="top" class="tbl_caption">Transaction Details</td>
                    </tr>
                    <tr>
                        <td align="left" colspan="4" valign="top" style="background-color: #ccccee; height: 26px">&nbsp;&nbsp;<asp:Button ID="cmdDelItem_ASP" Enabled="true" Font-Bold="true" Text="Delete Item" runat="server" />
                            &nbsp;&nbsp;<asp:Button ID="cmdDelItem" Enabled="false" Font-Bold="true" Visible="false" Text="Delete Item" runat="server" />
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

                                    <asp:HyperLinkField DataTextField="cbId" DataNavigateUrlFields="cbId,TransNo"
                                        DataNavigateUrlFormatString="~/AD180.aspx?idd={0},{1}" HeaderText="ID"></asp:HyperLinkField>

                                    <asp:HyperLinkField DataTextField="TransNo" DataNavigateUrlFields="cbId,TransNo"
                                        DataNavigateUrlFormatString="~/AD180.aspx?idd={0},{1}" HeaderText="Trans #"></asp:HyperLinkField>

                                    <asp:BoundField DataField="ClaimNo" HeaderText="Claims #" />
                                    <asp:BoundField DataField="PolicyNo" HeaderText="Policy #" />

                                    <asp:BoundField DataField="LossDate" HeaderText="Loss Date" DataFormatString="{0:d}" />
                                    <asp:TemplateField HeaderText="Requested">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRequested" runat="server" DataFormatString="{0:N2}" Text='<%#Eval("ClaimRequested") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>

                                            <asp:Label ID="lbltxtTotalReq" runat="server" Text="0.00" />

                                        </FooterTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPaid" runat="server" DataFormatString="{0:N2}" Text='<%#Eval("ClaimPaid") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>

                                            <asp:Label ID="lbltxtTotal" runat="server" Text="0.00" />

                                        </FooterTemplate>

                                    </asp:TemplateField>
                                    <asp:BoundField DataField="BrokerName" HeaderText="Broker" />

                                </Columns>

                            </asp:GridView>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" valign="top" style="width: auto;">&nbsp;</td>
                    </tr>
                </table>
    </table>
    <asp:ObjectDataSource ID="ods" runat="server" SelectMethod="InsuranceClaimBills" TypeName="CustodianAdmin.Data.InsuranceClaimRepository"></asp:ObjectDataSource>
</asp:Content>
