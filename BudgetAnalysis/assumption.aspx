<%@ Page Language="C#" AutoEventWireup="true" CodeFile="assumption.aspx.cs" Inherits="assumption"MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="height:395px; text-align:center;background-image:url(images/abt.jpg)">

<div style="float:left; width:519px; height:394px; padding-top:30px; text-align:center; overflow:scroll">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical" Width="483px" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="SKU" HeaderText="SKU" />
            <asp:BoundField DataField="EbayFeeFV1" HeaderText="Ebay Fee (0-25)" />
            <asp:BoundField DataField="EbayFeeFV2" HeaderText="Ebay Fee (25-1000)" />
            <asp:BoundField DataField="BuyItNow1" HeaderText="Buy It Now 1" />
            <asp:BoundField DataField="BuyItNow2" HeaderText="Buy It Now 2" />
            <asp:BoundField DataField="BuyItNow3" HeaderText="Buy It Now 3" />
            <asp:BoundField DataField="Insertion" HeaderText="Insertion" />
        </Columns>
    </asp:GridView>
</div><div style="float:right; width:365px; height:394px">
    <table style="margin:0 auto; margin-top:50px; width: 324px;">
        <tr>
            <td colspan="2" style="font-weight:bold">
                UPLOAD ASSUMPTION FILE</td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                Choose File</td>
            <td style="width: 100px">
                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload"
                    Width="83px" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Width="337px"></asp:Label></td>
        </tr>
    </table>
</div>
</div>
</asp:Content>
 