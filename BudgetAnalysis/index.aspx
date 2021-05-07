<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="index.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="height:307px;background-image:url(images/abt.jpg)">
    <div id="leftd" style="width:503px; float:left; height:341px;">
        
        <div style="margin:30px 0 0 20px">
        <asp:Label ID="Label1" runat="server" Height="25px" Text="Login: Login into Analyzer for getting the whole needs"
            Width="351px" BackColor="#E0E0E0" Font-Bold="True"></asp:Label><br />
        </div>
        <div id="contentareatitle"  style="font-size:25px; margin:10px 0 0 20px; text-align:left">LOGIN</div>
        <table id="TABLE1" border="0" style="margin:10px 0 0 20px; width: 404px; font-weight:bold">
            <tbody>
            <tr>
                <td style="width: 78px">
                    Username :</td>
                <td style="width: 150px"><asp:TextBox id="txtUsername" runat="server"></asp:TextBox></td>
                <td style="width: 158px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
                        ErrorMessage="Username required" Font-Bold="False" Width="138px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 78px">
                    Password&nbsp; :
                </TD>
                <td style="width: 150px"><asp:TextBox id="txtPassword" runat="server" Width="147px" TextMode="Password"></asp:TextBox></TD>
                <td style="width: 158px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Password required" Font-Bold="False" Width="139px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="2"><asp:Button id="btnLogin" onclick="btnLogin_Click" runat="server" Width="69px" Text="Login"></asp:Button> 
                    </td>
                <td align="center" colspan="1" style="width: 158px">
                </td>
            </tr>
            </tbody>
        </table>
        <div style="margin:10px 0 0 20px" ><asp:Label ID="lblMsg" runat="server" ForeColor="Red" Width="313px"></asp:Label></div>          
    </div>
    <div id="rightd" style="width:387px; float:right; text-align:center; height:340px">
    </div>
</div>

</asp:Content>

