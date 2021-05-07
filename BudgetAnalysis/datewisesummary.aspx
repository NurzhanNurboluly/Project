<%@ Page Language="C#" AutoEventWireup="true" CodeFile="datewisesummary.aspx.cs" Inherits="datewisesummary" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="height:500px; width:900px; overflow:scroll; text-align:center;background-image:url(images/abt.jpg) ">
    <div >
        <div style="height:78px; padding-top:20px">
            <asp:Label ID="lblMSg" runat="server" Font-Bold="True" ForeColor="Red" Width="750px"></asp:Label>
            <table style="width: 530px">
                <tr>
                    <td style="width: 71px">
                        Start Date</td>
                    <td style="width: 67px">
                        <input id="txtStartDate" name="txtStartDate" type="text" readonly="readOnly" /></td>
                    <td style="width: 25px">
                    <a href="#" onclick="displayDatePicker('txtStartDate','','mdy');">
                            <img  src="images/calendar_view_day.png" alt="img" style="width:25px; height:25px; border:none" /></a>
                    </td>
                    <td style="width: 87px">
                        End Date</td>
                    <td style="width: 25px">
                        <input id="txtEndDate" name="txtEndDate" type="text" readonly="readOnly" /></td>
                    <td style="width: 25px">
                        <a href="#" onclick="displayDatePicker('txtEndDate','','mdy');">
                            <img alt="img" src="images/calendar_view_day.png" style="border-right: medium none;
                                border-top: medium none; border-left: medium none; width: 25px; border-bottom: medium none;
                                height: 25px" /></a></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:Button ID="btnShow" runat="server"  Text="Show Summary"
                            Width="109px" OnClick="btnShow_Click" /></td>
                    <td style="width: 25px">
                    </td>
                </tr>
            </table>
            &nbsp;
            
        </div>
        <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
        GridLines="None" Width="331px" Height="214px" AllowPaging="True" OnPageIndexChanging="gvSummary_PageIndexChanging" >
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="PDate" HeaderText="Date" >
                <ItemStyle Width="75px" Wrap="False" />
                <HeaderStyle Width="100px" Wrap="False" />
            </asp:BoundField>
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

