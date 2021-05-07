<%@ Page Language="C#" AutoEventWireup="true" CodeFile="summary.aspx.cs" Inherits="summary" MasterPageFile="~/MasterPage.master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="height:500px; width:900px;  overflow:scroll; text-align:center;background-image:url(images/abt.jpg) ">
    <div>
        <div style="height:78px; float:left; width:278px; padding-top:20px">
            <div style="padding-bottom:10px"><asp:HyperLink ID="HyperLink1" runat="server" Width="183px" NavigateUrl="~/datewisesummary.aspx" Font-Bold="True" ForeColor="DimGray">Date range Summary</asp:HyperLink></div>
            <div style="padding-bottom:10px"><asp:HyperLink ID="HyperLink3" runat="server" Width="183px" NavigateUrl="~/monthwisesummary.aspx" Font-Bold="True" ForeColor="DimGray">Monthwise Summary</asp:HyperLink></div>
            <div style="padding-bottom:10px"><asp:HyperLink ID="HyperLink2" runat="server" Width="183px" NavigateUrl="~/yearwisesummary.aspx" Font-Bold="True" ForeColor="DimGray">Yearwise Summary</asp:HyperLink></div>
        
        </div>
        <div style="height:78px; float:right; width:602px; padding-top:20px">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Select Project Name"
            Width="162px"></asp:Label>&nbsp;<asp:DropDownList ID="drop" runat="server" Width="176px" >
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Show summary" OnClick="Button1_Click" Width="119px"   />
        <br />
         <br />
     
        <asp:Label ID="lblMsg" runat="server" Width="536px" Font-Bold="True" ForeColor="Red"></asp:Label>
        </div>
    </div>

    &nbsp;<asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
        GridLines="None" Width="331px" Height="214px" AllowPaging="True" OnPageIndexChanging="gvSummary_PageIndexChanging" >
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <Columns>
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
</asp:Content> 