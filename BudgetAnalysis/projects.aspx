<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projects.aspx.cs" Inherits="PROJECTS" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="height:357px ;background-image:url(images/abt.jpg)">

    <table style="width: 878px; height: 373px;">
        <tr>
            <td style=" text-align:center; width:450px" valign="top">
            <div style="overflow:scroll; ">
                <asp:GridView ID="GridView1" runat="server" Width="411px" AllowPaging="True" AutoGenerateColumns="False" Caption="Projects List" CellPadding="4" ForeColor="#333333" GridLines="Vertical" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="projectname" HeaderText="Project Name" />
                        <asp:BoundField DataField="description" HeaderText="Description" />
                    </Columns>
                    <RowStyle BackColor="#EFF3FB" />
                    <EditRowStyle BackColor="#2461BF" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                </div>
            </td>
            <td >
                <div style="font-weight:bold; text-align:center; color:Black">CREATE NEW PROJECT HERE&nbsp;</div>
                <table width="300" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr style="width:450px">
    <th scope="row" style="width: 86px; height: 34px;">
        <asp:Label ID="Label1" runat="server" Height="23px" Text="Project Name" Width="95px"></asp:Label></th>
    <td style="width: 98px; height: 34px;"><asp:TextBox ID="txtprojectname" runat="server" Width="249px" ></asp:TextBox></td>
  </tr>
                    <tr>
                        <th scope="row" style="width: 86px; height: 13px">
                        </th>
                        <td style="width: 98px; height: 13px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtprojectname"
                                ErrorMessage="Project name required" Width="244px"></asp:RequiredFieldValidator></td>
                    </tr>
  <tr>
    <th scope="row" style="width: 86px; height: 13px;" valign="top">&nbsp;<asp:Label ID="Label2" runat="server" Height="22px" Text="Description" Width="85px"></asp:Label></th>
    <td style="width: 98px; height: 13px;"><asp:TextBox ID="txtdescription" runat="server" Height="139px" TextMode="MultiLine" Width="252px"></asp:TextBox></td>
  </tr>
                    <tr>
                        <th scope="row" style="width: 86px; height: 13px" valign="top">
                        </th>
                        <td style="width: 98px; height: 13px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdescription"
                                ErrorMessage="Project description  required" Width="244px"></asp:RequiredFieldValidator></td>
                    </tr>
  <tr>
    <th scope="row" style="width: 86px">
        <asp:Label ID="Label3" runat="server" Height="20px" Text="Status" Width="74px"></asp:Label>&nbsp;</th>
    <td style="width: 98px"><asp:TextBox ID="txtstatus" runat="server" Width="249px"></asp:TextBox></td>
  </tr>
  <tr>
      <td colspan="2" style="height: 28px; text-align:center" >
          <asp:Button ID="btnCreate" runat="server" Text="Create" Width="115px" OnClick="btnCreate_Click" /></td>
  </tr>
    <tr>
        <td colspan="2" style="height: 28px; text-align:center">
            
            <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Width="306px"></asp:Label></td>
    </tr>
</table>
            </td>
        </tr>
    </table>


</div>
</asp:Content>

