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

public partial class yearwisesummary : System.Web.UI.Page
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
            for (int i = DateTime.Now.Year; i > 1990; i--)
            {
                cmbYear.Items.Add(i.ToString());
            }
            cmbYear.SelectedIndex = 0;
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        if (cmbYear.Text == "--Select--")
        {
            lblMSg.Text = "Missing fields,Select a year";
            return;
        }
        String sql = "SELECT CONVERT(CHAR(11), A.PDate, 106) as PDate, A.ProjectName,A.SKU, A.Sold, A.Prices, A.Total, B.PackagingCost, B.ActualShippingCost, B.UnitCost, B.EbayFee, B.MarketFee," +
            "B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee AS TotalUnitCost, " +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee AS TotalCost," +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee - A.Total AS TotalEarning " +
            "FROM Inventory AS A INNER JOIN ProductInfo AS B ON A.SKU = B.SKU WHERE (Year(A.PDate)=" + cmbYear.SelectedValue + ")ORDER BY A.PDate";
        
        //Response.Write(sql);
        da = new SqlDataAdapter(sql, con);
        ds = new DataSet();
        da.Fill(ds);
        yrSummary.DataSource = ds.Tables[0];
        yrSummary.DataBind();
    }

    protected void yrSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        yrSummary.PageIndex = e.NewPageIndex;
        String sql = "SELECT CONVERT(CHAR(11), A.PDate, 106) as PDate, A.ProjectName,A.SKU, A.Sold, A.Prices, A.Total, B.PackagingCost, B.ActualShippingCost, B.UnitCost, B.EbayFee, B.MarketFee," +
            "B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee AS TotalUnitCost, " +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee AS TotalCost," +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee - A.Total AS TotalEarning " +
            "FROM Inventory AS A INNER JOIN ProductInfo AS B ON A.SKU = B.SKU WHERE (Year(A.PDate)=" + cmbYear.SelectedValue + ")ORDER BY A.PDate";

        //Response.Write(sql);
        da = new SqlDataAdapter(sql, con);
        ds = new DataSet();
        da.Fill(ds);
        yrSummary.DataSource = ds.Tables[0];
        yrSummary.DataBind();
    }
}
