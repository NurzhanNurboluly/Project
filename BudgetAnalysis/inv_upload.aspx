<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inv_upload.aspx.cs" Inherits="inv_upload" MasterPageFile="~/MasterPage.master" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<div style="height:410px; background-image:url(images/abt.jpg)">
    <div style="height:369px; width:390px; float:left; padding-top:30px">
        <blockquote>
            Here you can upload the daily inventory information which contains product name,
            total sales, unit cost of each product sold, total sales amount.
                To upload the file
            select a project whicih is already created. Project name is &nbsp;used to distinct
            the inventory details on each upload. Summary information is calculated using the
            inventory uploaded and the product information details.</blockquote>
    </div>
    <div style="float:right; height:399px; width: 499px;">
        <table border="0" cellspacing="4" cellpadding="1" align="center" style="width: 432px; margin-top:30px" >
        <tr>
            <td style="height: 53px; text-align:center; font-size:20px; font-weight:bold"colspan="2">
                Daily Inventory Upload</td>
            <td colspan="1" style="font-weight: bold; font-size: 20px; width: 325px; height: 53px;
                text-align: center">
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td colspan="2" style="height: 31px;font-size:15px; text-align:center">
                Upload the inventory file contains daily sales details</td>
            <td colspan="1" style="font-size: 15px; width: 325px; height: 31px; text-align: center">
            </td>
        </tr>
        <tr>
            <td style="Width:92px; font-weight:bold">
                    <asp:Label ID="Label2" runat="server" Text="Select Project" Width="111px" ></asp:Label></td>
            <td style="width: 134px">
                <asp:DropDownList ID="ddlpjcts" runat="server" Width="201px">
                </asp:DropDownList></td>
            <td style="width: 325px">
            </td>
        </tr>
        <tr>
                <td style="width: 92px; height: 31px">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Height="27px" Text="Choose File" Width="114px" ></asp:Label></td>
            <td style="width: 134px">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td style="width: 325px">
            <asp:Button ID="Btn1" runat="server" Text="Upload" OnClick="Btn1_Click" Width="62px"  /></td>
        </tr>
        <tr>
            <td colspan="2" style="height: 58px; text-align:center">
            <asp:Label ID="lblmsg" runat="server" Width="406px" ForeColor="Red"></asp:Label></td>
            <td colspan="1" style="width: 325px; height: 58px; text-align: center">
            </td>
        </tr>
        </table>
    </div>
</div>

</asp:Content>
