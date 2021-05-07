using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String uname = txtUsername.Text;
        String passwd = txtPassword.Text;
        String sql = "SELECT * FROM Login WHERE Username='" + uname + "' AND Password='" + passwd + "'";
        BusinessLayer bl = new BusinessLayer();
        dr = bl.getData(sql);
        if (dr.Read())
        {
            Session["userid"] = uname;
            Response.Redirect("projects.aspx");
        }
        else
            lblMsg.Text = "Invalid username or password";

        dr.Close();
    }
}
