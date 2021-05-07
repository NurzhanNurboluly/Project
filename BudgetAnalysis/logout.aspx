<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="iso-8859-1" %>
<% 
    Session.Clear();
    Session.Abandon();
    Response.Redirect("index.aspx");
%>