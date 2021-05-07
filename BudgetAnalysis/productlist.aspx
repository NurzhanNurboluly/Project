<%@ Page Language="C#" AutoEventWireup="true" CodeFile="productlist.aspx.cs" Inherits="productlist" MasterPageFile="~/MasterPage.master" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style=" text-align: center;padding-top:30px;height:375px; background-image:url(images/abt.jpg); overflow:scroll">
    &nbsp;&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="798px" Height="167px"  AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="SKU" HeaderText="SKU" >
                    <HeaderStyle BackColor="DodgerBlue" />
                </asp:BoundField>
                <asp:BoundField DataField="PackagingCost" HeaderText="Packaging cost">
                    <HeaderStyle BackColor="DodgerBlue" />
                </asp:BoundField>
                <asp:BoundField DataField="ActualShippingCost" HeaderText="Actual shipping cost">
                    <HeaderStyle BackColor="DodgerBlue" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitCost" HeaderText="Unit Cost">
                    <HeaderStyle BackColor="DodgerBlue" />
                </asp:BoundField>
                <asp:BoundField DataField="EbayFee" HeaderText="EbayFee">
                    <HeaderStyle BackColor="DodgerBlue" />
                </asp:BoundField>
                <asp:BoundField DataField="MarketFee" HeaderText="Market Fee" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    
    </div>

</asp:Content>