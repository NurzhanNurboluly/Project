<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="upload"MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="height:406px; background-image:url(images/abt.jpg)">
    <div style="width:350px; float:left; height: 359px; padding:25px 0 20px 0;background-image:url(images/back1.jpg)" >
        <blockquote>
            Here you can upload the full products information, ie the actual shipping cost,
            packaging cost, marketing rate, Ebay fee, unit cost &nbsp;and other cost values
            incurred during exporting a product. Summary details are calculated based on the
            values updated in the product information file. &nbsp;</blockquote>
        <p>
       
        </p>
    </div>
    <div style="width:507px; float:right; height: 399px;">
        <table border="0" cellspacing="1" cellpadding="1" align="center" style="width: 420px; height: 166px; margin-top:50px">
        <tr>
            <td style="height: 53px; text-align:center; font-size:20px; font-weight:bold" colspan="3">
                Product Information Upload</td>
        </tr>
        <tr>
            <td colspan="3" style="height: 31px;font-size:12px;font-weight:bold">
                Upload the products information MS Excel file which contain all costs</td>
        </tr>
        <tr>
            <td style="height: 31px">&nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Height="27px" Text="Choose File"
                Width="114px"></asp:Label></td>
            <td style="width: 353px; height: 31px;">&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            <td style="width: 353px; height: 31px">
                <asp:Button ID="Button1" runat="server" Font-Bold="False" Text="Upload" OnClick="Button1_Click" /></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 66px; text-align:center">
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Width="347px"></asp:Label></td>
        </tr>
        </table>
    </div>
</div>
</asp:Content>
 

