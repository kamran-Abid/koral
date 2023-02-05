using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.SqlClient;
using System.Web.Script.Services;

public partial class Default : System.Web.UI.Page
{
    public string totalEmp, currservingEmp, retiredEmp, blockedEmp;
    
    protected void Page_Load(object sender, EventArgs e)
    {

        Common ObjCommon = new Common();
        DataTable CountEmpVeh = ObjCommon.GetEmployeeCount();
        var rows = CountEmpVeh.Rows[0];


        lblTotalEmp.Text = rows[0].ToString();
        totalEmp = lblTotalEmp.Text;
        //pb_total.Text = rows[0].ToString();
        lblActiveEmp.Text = rows[1].ToString();
        currservingEmp = rows[1].ToString();
        lblInactiveEmp.Text = rows[2].ToString();
        retiredEmp = rows[2].ToString();
        blockedEmp = rows[41].ToString();
        level1h.Text = rows[3].ToString();
        level2h.Text = rows[4].ToString();
        level3h.Text = rows[5].ToString();
        level4h.Text = rows[6].ToString();
        tei1.Text = rows[7].ToString();
        tei2.Text = rows[8].ToString();
        tei3.Text = rows[9].ToString();
        tei4.Text = rows[10].ToString();
        teo1.Text = rows[11].ToString();
        teo2.Text = rows[12].ToString();
        teo3.Text = rows[13].ToString();
        teo4.Text = rows[14].ToString();
        empLevel1.Text = rows[26].ToString();
        empLevel2.Text = rows[27].ToString();
        empLevel3.Text = rows[28].ToString();
        empLevel4.Text = rows[29].ToString();
        empLevel5.Text = rows[30].ToString();
        ycross.Text = rows[42].ToString();
        gate2.Text = rows[43].ToString();
        barrier2.Text = rows[44].ToString();
        bridgePost.Text = rows[45].ToString();
        g24g1.Text = rows[46].ToString();
        g24g3.Text = rows[47].ToString();

        //DropDownListHidden.DataSource = CountEmpVeh;
        //DropDownListHidden.DataTextField = CountEmpVeh.List();
        //DropDownListHidden.DataValueField = CountEmpVeh.Rows[0].ToString();
        //DropDownListHidden.DataBind();


    }

    [WebMethod]
    public static EmpHrnoDetails GetEmpDetails(string hrn)
    {
        EmpHrnoDetails hrno = new EmpHrnoDetails();
        string cs = ConfigurationManager.ConnectionStrings["vmsconnectionstring"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(cs))
        {

            SqlCommand cmd = new SqlCommand("GetEmpByHrno", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Hrno",
                Value = hrn
            });
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            //checkValue = rdr;
            while (rdr.Read())
            {
                hrno.Hrno = rdr["HRNO"].ToString();
                hrno.Name = rdr["Name"].ToString();
                hrno.Cnic = rdr["Cnic"].ToString();
                hrno.Mobile = rdr["Mobile"].ToString();
                hrno.Designation = rdr["Designation"].ToString();
                hrno.Department = rdr["Department"].ToString();
                hrno.Rank = rdr["Rank"].ToString();
                hrno.Dob = rdr["Dob"].ToString();
                hrno.Gender = rdr["Gender"].ToString();
                hrno.maxTimeIn = rdr["TIME_IN"].ToString();
                hrno.maxTimeOut = rdr["TIME_OUT"].ToString();
                hrno.gateNo = rdr["GATE_NUMBER"].ToString();
            }
        }
        return hrno;

    }

    static public string scs = ConfigurationManager.ConnectionStrings["vmsconnectionstring"].ConnectionString;

    [ScriptMethod()]
    [WebMethod]
    public static List<string> GetHrnos(string prefixText, int count)
    {
        List<string> hrnos = new List<string>();
        SqlConnection sqlConn = new SqlConnection(scs);
        string sqlQuery = "SELECT [ServiceNo], [Nic] FROM [YCROSS3].[dbo].[Employee] WHERE [ServiceNo] LIKE @hrno + '%' OR [Nic] LIKE @hrno + '%'";
        SqlCommand cmd = new SqlCommand(sqlQuery, sqlConn);
        cmd.Parameters.AddWithValue("@hrno", prefixText);
        sqlConn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            hrnos.Add(sdr["ServiceNo"].ToString());
            hrnos.Add(sdr["Nic"].ToString());
        }
        sqlConn.Close();

        return hrnos;
    }
}