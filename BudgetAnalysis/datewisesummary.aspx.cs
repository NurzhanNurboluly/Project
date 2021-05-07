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

public partial class datewisesummary : System.Web.UI.Page
{
    SqlConnection con;
    DataSet ds;
    SqlDataAdapter da;
    String startDate, endDate;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("index.aspx");
        }
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["budget"].ConnectionString);
        con.Open();
    }

    protected void btnShow_Click(object sender, EventArgs e)
    {
        startDate = Request.Form.Get("txtStartDate");
        endDate = Request.Form.Get("txtEndDate");
        if (startDate == "" || endDate == "")
        {
            lblMSg.Text = "Missing fields,Select a start date and end date.";
        }
        String sql = "SELECT CONVERT(CHAR(11), A.PDate, 106) as PDate, A.ProjectName,A.SKU, A.Sold, A.Prices, A.Total, B.PackagingCost, B.ActualShippingCost, B.UnitCost, B.EbayFee, B.MarketFee," +
            "B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee AS TotalUnitCost, " +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee AS TotalCost," +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee - A.Total AS TotalEarning " +
            "FROM Inventory AS A INNER JOIN ProductInfo AS B ON A.SKU = B.SKU WHERE ( (A.PDate >= '" + startDate + "') AND (A.PDate < '" + endDate + "'))" +
            " ORDER BY A.PDate";
        //Response.Write(sql);
        da = new SqlDataAdapter(sql, con);
        ds = new DataSet();
        da.Fill(ds);
        gvSummary.DataSource = ds.Tables[0];
        gvSummary.DataBind();
    }
    protected void gvSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSummary.PageIndex = e.NewPageIndex;
        String sql = "SELECT CONVERT(CHAR(11), A.PDate, 106) as PDate, A.ProjectName,A.SKU, A.Sold, A.Prices, A.Total, B.PackagingCost, B.ActualShippingCost, B.UnitCost, B.EbayFee, B.MarketFee," +
            "B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee AS TotalUnitCost, " +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee AS TotalCost," +
            "(B.PackagingCost + B.ActualShippingCost + B.UnitCost + B.MarketFee) * A.Sold + B.EbayFee - A.Total AS TotalEarning " +
            "FROM Inventory AS A INNER JOIN ProductInfo AS B ON A.SKU = B.SKU WHERE ( (A.PDate >= '" + startDate + "') AND (A.PDate < '" + endDate + "'))" +
            " ORDER BY A.PDate";
        //Response.Write(sql);
        da = new SqlDataAdapter(sql, con);
        ds = new DataSet();
        da.Fill(ds);
        gvSummary.DataSource = ds.Tables[0];
        gvSummary.DataBind();
    }
}
