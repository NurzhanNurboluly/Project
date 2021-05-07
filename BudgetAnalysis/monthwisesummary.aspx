<%@ Page Language="C#" AutoEventWireup="true" CodeFile="monthwisesummary.aspx.cs" Inherits="monthwisesummary" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="height:500px; overflow:scroll; text-align:center;background-image:url(images/abt.jpg) ">

    <div>
    <div style="height:78px; padding-top:20px">
            <asp:Label ID="lblMSg" runat="server" Font-Bold="True" ForeColor="Red" Width="750px"></asp:Label>
            
            &nbsp;
            <table>
                <tr>
                    <td style="width: 72px">
                        Month</td>
                        <td style="width: 100px">
                            <asp:DropDownList ID="cmbMonth" runat="server" Width="106px">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Jan</asp:ListItem>
                                <asp:ListItem Value="2">Feb</asp:ListItem>
                                <asp:ListItem Value="3">Mar</asp:ListItem>
                                <asp:ListItem Value="4">Apr</asp:ListItem>
                                <asp:ListItem Value="5">May</asp:ListItem>
                                <asp:ListItem Value="6">Jun</asp:ListItem>
                                <asp:ListItem Value="7">Jul</asp:ListItem>
                                <asp:ListItem Value="8">Aug</asp:ListItem>
                                <asp:ListItem Value="9">Sep</asp:ListItem>
                                <asp:ListItem Value="10">Oct</asp:ListItem>
                                <asp:ListItem Value="11">Nov</asp:ListItem>
                                <asp:ListItem Value="12">Dec</asp:ListItem>
                            </asp:DropDownList></td>
                        
                    <td style="width: 97px">
                        Year</td>
                    <td style="width: 87px">
                        <asp:DropDownList ID="cmbYear" runat="server">
                        </asp:DropDownList></td>
                  
                        
                </tr>
                
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnShow" runat="server"  Text="Show Summary"
                            Width="109px" OnClick="btnShow_Click" /></td>
                </tr>
            </table>
        </div>
    <asp:GridView ID="mthSummary" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
        GridLines="None" Width="331px" Height="214px" AllowPaging="True" OnPageIndexChanging="mthSummary_PageIndexChanging"  >
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="PDate" HeaderText="Date" />
            <asp:BoundField DataField="ProjectName" HeaderText="Project Name" />
            <asp:BoundField DataField="SKU" HeaderText="SKU" />
            <asp:BoundField DataField="Sold" HeaderText="Quantity Sold" />
            <asp:BoundField DataField="Prices" HeaderText="Unit Price" />
            <asp:BoundField DataField="Total" HeaderText="Total Sales" />
            <asp:BoundField DataField="PackagingCost" HeaderText="Packaging Cost" />
            <asp:BoundField DataField="ActualShippingCost" HeaderText="Actual Shipping Cost" />
            <asp:BoundField DataField="UnitCost" HeaderText="Unit Cost" />
            <asp:BoundField DataField="EbayFee" HeaderText="Ebay Fee" />
            <asp:BoundField DataField="MarketFee" HeaderText="Market Fee" />
            <asp:BoundField DataField="TotalUnitCost" HeaderText="Total Unit Cost" />
            <asp:BoundField DataField="TotalCost" HeaderText="Total Cost" />
            <asp:BoundField DataField="TotalEarning" HeaderText="Profit/Loss" />
        </Columns>
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
    </div>
    </div>
    </asp:Content> 

   

 