<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploadselect.aspx.cs" Inherits="uploadselect" MasterPageFile="~/MasterPage.master" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="background-image:url(images/abt.jpg); height:319px">
    <div style="float:left; width:447px; height:319px; padding-top:15px"><blockquote>
        <span style="font-family: Arial"><span style="font-size: 10pt">
        <span>As so many Business Process Reengineering
            (BPR) and business IS/IT projects fail to improve the Customer Experience, 
            Profit from Information has formulated an alternative approach to achieve dramatic results more
                quickly and on a continuing basis. With even the best of traditional IS/IT and BPR
                projects failing to live up to expectations, why not find out more about how your
                business could benefit from our Customer-Business-Information Systems practical
                alignment service. </span>
                            </blockquote>
    </div>
    <div style="float:right; width:445px; height:331px">
        <table style="margin:0 auto; margin-top:50px; width: 337px; height: 111px;">
            <tr style="background-color:#EEDDFF">
                <td style="width: 425px">
                    To Upload the Product Information file , Click on upload</td>
                <td style="width: 100px">
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Underline="False"
                        ForeColor="#C04000" NavigateUrl="~/upload.aspx" Width="44px">Upload</asp:HyperLink></td>
            </tr>
            <tr>
                <td style="width: 425px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr style="background-color:#FFE1F0">
                <td style="width: 425px">
                    ToUpload the Inventory file, which contains the daily sales details,Click upload</td>
                <td style="width: 100px">
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Underline="False"
                        ForeColor="#C04000" NavigateUrl="~/inv_upload.aspx" Width="44px">Upload</asp:HyperLink></td>
            </tr>
        </table>
    </div>
</div>
    </SPAN></SPAN>
</asp:Content>