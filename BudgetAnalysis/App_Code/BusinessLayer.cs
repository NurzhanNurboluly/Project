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

/// <summary>
/// Summary description for BusinessLayer
/// </summary>
public class BusinessLayer
{
    SqlConnection con;
    SqlCommand cmd;
	public BusinessLayer()
	{
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["budget"].ConnectionString);
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
	}
    public SqlDataReader getData(String sql)
    {
        SqlDataReader dr;
        cmd.CommandText = sql;
        dr = cmd.ExecuteReader();
        return dr;
    }
    public int updateData(String sql)
    {
        cmd.CommandText = sql;
        int ret=cmd.ExecuteNonQuery();
        return ret;
    }
}
