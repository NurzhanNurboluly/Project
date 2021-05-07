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
public partial class productlist : System.Web.UI.Page
{

    SqlConnection con;
    SqlDataAdapter da;    
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        con  = new SqlConnection(ConfigurationManager.ConnectionStrings["budget"].ConnectionString);
        con.Open();
        if (!IsPostBack)
        {
            String sql = "select * from ProductInfo";
            da = new SqlDataAdapter(sql, con);
            da.Fill(ds, "result");
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        String sql = "select * from ProductInfo";
        da = new SqlDataAdapter(sql, con);
        da.Fill(ds, "result");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
}
