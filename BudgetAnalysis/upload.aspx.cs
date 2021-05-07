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

public partial class upload : System.Web.UI.Page
{     
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["budget"].ConnectionString);
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
    }
    
    protected void Button1_Click(object sender, EventArgs e)
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
            cmd.CommandText = "DELETE FROM ProductInfo";
            cmd.ExecuteNonQuery();
            DataSet dsRecords = new DataSet();
            string strConn = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " + Server.MapPath(".") + "/uploads/" + filename + ";Extended Properties=Excel 8.0;";
            OleDbDataAdapter daGetExcel = new OleDbDataAdapter("SELECT * FROM [Data$]", strConn);
            daGetExcel.Fill(dsRecords, "Data");
            foreach (DataRow myDataRow in dsRecords.Tables["Data"].Rows)
            {
                if (myDataRow[0].ToString() != "")
                {
                    String sku = myDataRow[0].ToString();
                    String pc = myDataRow[1].ToString();
                    String sc = myDataRow[2].ToString();
                    String uc = myDataRow[3].ToString();
                    String ef = myDataRow[4].ToString();
                    String mf = myDataRow[5].ToString();
                    Double packFee = Double.Parse(pc);
                    Double shipcost = Double.Parse(sc);
                    Double unitcost = Double.Parse(uc);
                    Double ebay = Double.Parse(ef);
                    Double marketfee = Double.Parse(mf);
                    String sql = "INSERT INTO ProductInfo values('" + sku + "','" + packFee +
                     "','" + shipcost + "','" + unitcost + "','" + ebay + "','" + marketfee + "')";
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();
                }
                lblmsg.Text = "Product information successfully updated";
                
            }

        }
        catch (Exception ex)
        {
            Response.Write("Error:Inalid file format or Invalid excel file selected " +  "<br>"+ ex.Message);
            //Thread.Sleep(15000);
        }

    }
}
