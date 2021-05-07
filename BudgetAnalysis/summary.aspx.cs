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
using System.Data.OleDb;
using System.Data.SqlClient;


public partial class summary : System.Web.UI.Page
{
    SqlConnection con;
    DataSet ds;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("index.aspx");
        }
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["budget"].ConnectionString);
        con.Open();
        if (!IsPostBack)
        {
            da = new SqlDataAdapter("select projectname from projects", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            drop.Items.Add("--Select--");
            foreach (DataRow drow in ds.Tables[0].Rows)
            {
                drop.Items.Add(drow["projectname"].ToString());
            }
            
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (drop.SelectedValue == "--Select--")
        {
            lblMsg.Text = "Please, select a project name.";
            return;
        }
        lblMsg.Text = "";
        String pjtname = drop.SelectedValue;
        String sql = "SELECT A.SKU, A.Sold, A.Prices, A.Total, B.PackagingCost, B.ActualShippingCost, B.UnitCost, B.EbayFee, B.MarketFee," +
            "B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee AS TotalUnitCost, " +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee AS TotalCost," +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee - A.Total AS TotalEarning " +
            "FROM Inventory AS A INNER JOIN ProductInfo AS B ON A.SKU = B.SKU WHERE (A.ProjectName = '" + pjtname + "')";
        da = new SqlDataAdapter(sql, con);
        ds = new DataSet();
        da.Fill(ds);
        gvSummary.DataSource = ds.Tables[0];
        gvSummary.DataBind();
    }
    protected void gvSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSummary.PageIndex = e.NewPageIndex;
        String pjtname = drop.SelectedValue;
        String sql = "SELECT A.SKU, A.Sold, A.Prices, A.Total, B.PackagingCost, B.ActualShippingCost, B.UnitCost, B.EbayFee, B.MarketFee," +
            "B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee AS TotalUnitCost, " +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee AS TotalCost," +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee - A.Total AS TotalEarning " +
            "FROM Inventory AS A INNER JOIN ProductInfo AS B ON A.SKU = B.SKU WHERE (A.ProjectName = '" + pjtname + "')";
        da = new SqlDataAdapter(sql, con);
        ds = new DataSet();
        da.Fill(ds);
        gvSummary.DataSource = ds.Tables[0];
        gvSummary.DataBind();
    }
}
