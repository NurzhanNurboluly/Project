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

public partial class inv_upload : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["budget"].ConnectionString);
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        if (!IsPostBack)
        {
            da = new SqlDataAdapter("select projectname from projects", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlpjcts.Items.Add("--Select--");
            foreach (DataRow drow in ds.Tables[0].Rows)
            {
                ddlpjcts.Items.Add(drow["projectname"].ToString());
            }
        }
    }


    protected void Btn1_Click(object sender, EventArgs e)
    {
        if (ddlpjcts.SelectedValue =="--Select--")
        {
            lblmsg.Text = "Please select a project name";
            return;
        }
     
   
            String filename;
            try
            {
                if (!FileUpload1.HasFile)
                {
                    lblmsg.Text = "Please select an excel file";
                    return;
                }
                else
                {
                    filename = FileUpload1.PostedFile.FileName;
                    filename = filename.Substring(filename.LastIndexOf("\\") + 1);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "/uploads/" + filename);
                }
                DataSet dsRecords = new DataSet();
                string strConn = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source= " + Server.MapPath(".") + "/uploads/" + filename + ";Extended Properties=Excel 8.0;";
                OleDbDataAdapter daGetExcel = new OleDbDataAdapter("SELECT * FROM [Inventory$]", strConn);
                daGetExcel.Fill(dsRecords, "Inventory");
                String ProjectName = ddlpjcts.SelectedValue;
                foreach (DataRow myDataRow in dsRecords.Tables["Inventory"].Rows)
                {
                    if (myDataRow[0].ToString() != "")
                    {
                        
                        String SKU = myDataRow[0].ToString();
                        String sd = myDataRow[1].ToString();
                        String pr = myDataRow[2].ToString();
                        String tot = myDataRow[3].ToString();
                        Double Sold = Double.Parse(sd);
                        Double Prices = Double.Parse(pr);
                        Double Total = Double.Parse(tot);
                        String sql = "INSERT INTO Inventory values('"+ ProjectName + "','" + SKU + "','" + Sold +
                         "','" + Prices + "','" + Total + "','" + DateTime.Now +  "')";
                        cmd.CommandText = sql;
                        cmd.ExecuteNonQuery();
                    }
                    lblmsg.Text = "Inventory details successfully inserted";

                }
            }


            catch (Exception ex)
            {
                Response.Write("Error:" + ex.Message);
                //Thread.Sleep(15000);
            }
        }
    }
