using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class PROJECTS : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["budget"].ConnectionString);
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        ds.Clear();
        da=new SqlDataAdapter("Select projectname,description from projects",con);
        da.Fill(ds,"projects");
        GridView1.DataSource=ds.Tables["projects"];
        GridView1.DataBind();
       
    }


    protected void btnCreate_Click(object sender, EventArgs e)
    {
        String pname = txtprojectname.Text;
        String desc=  txtdescription.Text;
        string status = txtstatus.Text;
        String sql = "SELECT * FROM projects WHERE projectname='" + pname + "'";
        cmd.CommandText = sql;
        dr = cmd.ExecuteReader();   

        if (dr.Read())
        {
            lblmsg.Text = "Project with this name already exist";
            return;
        }
        dr.Close();
        sql = "INSERT INTO projects values('" + pname + "','" + desc + "','" + status + "')";
        cmd.CommandText = sql;
        int x = cmd.ExecuteNonQuery();
        if (x > 0)
        {
            lblmsg.Text = "Project successfully created!";
            txtprojectname.Text = null;
            txtdescription.Text = null;
            txtstatus.Text = null;
            ds.Clear();
            da = new SqlDataAdapter("Select projectname,description from projects", con);
            da.Fill(ds, "projects");
            GridView1.DataSource = ds.Tables["projects"];
            GridView1.DataBind();
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        da=new SqlDataAdapter("Select projectname,description from projects",con);
        da.Fill(ds,"projects");
        GridView1.DataSource=ds.Tables["projects"];
        GridView1.DataBind();

    }
}
