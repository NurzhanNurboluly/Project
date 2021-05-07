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
using System.Data.OleDb;

public partial class assumption : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["budget"].ConnectionString);
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        ds.Clear();
        da = new SqlDataAdapter("Select SKU,EbayFeeFV1,EbayFeeFV2,BuyItNow1,BuyItNow2,BuyItNow3,Insertion from Assumption", con);
        da.Fill(ds, "assum");
        GridView1.DataSource = ds.Tables["assum"];
        GridView1.DataBind();
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        String filename;
        try
        {
            if (!FileUpload1.HasFile)
            {
                lblmsg.Text = "Please select the Product information Excel file";
                return;
            }
            else
            {
                filename = FileUpload1.PostedFile.FileName;
                filename = filename.Substring(filename.LastIndexOf("\\") + 1);
                FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "/uploads/" + filename);
            }
            cmd.CommandText = "DELETE FROM Assumption";
            cmd.ExecuteNonQuery();
            DataSet dsRecords = new DataSet();
            string strConn = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " + Server.MapPath(".") + "/uploads/" + filename + ";Extended Properties=Excel 8.0;";
            OleDbDataAdapter daGetExcel = new OleDbDataAdapter("SELECT * FROM [ASSUMPTION$]", strConn);
            daGetExcel.Fill(dsRecords, "Data");
            foreach (DataRow myDataRow in dsRecords.Tables["Data"].Rows)
            {
                if (myDataRow[0].ToString() != "")
                {
                    String sku = myDataRow[0].ToString();
                    String E1 = myDataRow[1].ToString();
                    String E2 = myDataRow[2].ToString();
                    String B1 = myDataRow[3].ToString();
                    String B2 = myDataRow[4].ToString();
                    String B3 = myDataRow[5].ToString();
                    String In = myDataRow[6].ToString();
                    Double Eb1 = Double.Parse(E1);
                    Double Eb2 = Double.Parse(E2);
                    Double Bu1 = Double.Parse(B1);
                    Double Bu2 = Double.Parse(B2);
                    Double Bu3 = Double.Parse(B3);
                    Double Ins = Double.Parse(In);
                    String sql = "INSERT INTO Assumption values('" + sku + "'," + Eb1 +
                     "," + Eb2 + "," + Bu1 + "," + Bu2 + "," + Bu3 + "," + Ins +  ")";
                    //Response.Write(sql + "<br>");
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();
                }
                lblmsg.Text = "Product information successfully updated";

            }

        }
        catch (Exception ex)
        {
            Response.Write("Error:Inalid file format or Invalid excel file selected " + "<br>" + ex.Message);
            //Thread.Sleep(15000);
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        ds.Clear();
        da = new SqlDataAdapter("Select SKU,EbayFeeFV1,EbayFeeFV2,BuyItNow1,BuyItNow2,BuyItNow3,Insertion from Assumption", con);
        da.Fill(ds, "assum");
        GridView1.DataSource = ds.Tables["assum"];
        GridView1.DataBind();
    }
}
