using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;

public partial class Home : System.Web.UI.Page
{
    public string totalVeh, ETagVeh, NonETagVeh, blockedEmp;
    protected void Page_Load(object sender, EventArgs e)
    {
        Common ObjCommon = new Common();

        //DataTable txtEmployeeCount = ObjCommon.GetEmployeeCount();
        //lblTotalEmp.Text = txtEmployeeCount.ToString();
        //Page.Response.Write("alert('" + lblTotalEmp + "')");
        //lblTotalEmp.DataBind();

        // int Emp_total = Convert.ToInt32()

        // ddlDepartmentSearch.DataSource = txtEmployeeCount;

        DataTable empDetails = ObjCommon.GetEmployeeCount();

        var rows = empDetails.Rows[0];

        //ddlDepartmentSearch.DataSource = dtDepartments;
        //ddlDepartmentSearch.DataValueField = "Department_Id";
        //ddlDepartmentSearch.DataTextField = "Hrno";
        //ddlDepartmentSearch.DataBind();

        //ddlDepartmentSearch.Items.Insert(0, new ListItem("-- Select --", ""));

        //ObjCommon.fill(txtEmployeeCount);

        lblTotalVeh.Text = rows[31].ToString();
        totalVeh = lblTotalVeh.Text;
        lblTagVeh.Text = rows[32].ToString();
        ETagVeh = lblTagVeh.Text;
        //lblBlockVeh.Text = rows[33].ToString();
        int noneETag = int.Parse(lblTotalVeh.Text) - int.Parse(lblTagVeh.Text);
        lblNoneETagVeh.Text = noneETag.ToString();
        NonETagVeh = lblNoneETagVeh.Text;


        tvi1.Text = rows[15].ToString();
        tvi2.Text = rows[16].ToString();
        tvi3.Text = rows[17].ToString();
        tvi4.Text = rows[18].ToString();
        tvo1.Text = rows[19].ToString();
        tvo2.Text = rows[20].ToString();
        tvo3.Text = rows[21].ToString();
        tvo4.Text = rows[22].ToString();
        insiteVeh.Text = rows[23].ToString();
        outsiteVeh.Text = rows[24].ToString();
        blockVeh.Text = rows[25].ToString();
        pvtVeh.Text = rows[34].ToString();
        ofcVeh.Text = rows[35].ToString();
        vehLevel5.Text = rows[36].ToString();
        vehLevel4.Text = rows[37].ToString();
        vehLevel3.Text = rows[38].ToString();
        vehLevel2.Text = rows[39].ToString();
        vehLevel1.Text = rows   [40].ToString();

        ycross.Text = rows[48].ToString();
        gate2.Text = rows[49].ToString();
        barrier2.Text = rows[50].ToString();
        bridgePost.Text = rows[51].ToString();
        g24g1.Text = rows[52].ToString();
        g24g3.Text = rows[53].ToString();
        //int g13g2 = int.Parse(lblTotalVeh.Text) - int.Parse(lblTagVeh.Text);
        //int g13g4 = int.Parse(lblTotalVeh.Text) - int.Parse(lblTagVeh.Text);



        //Page.Response.Write("<script>console.log('"++"');</script>");


        //ModalPopupExtender1.Show();

    }


    //public VehRegnoDetails GetEmployeeByRegno(string Regno)
    //{
    //    // get vehicle registration number
    //}


    protected void BtnVehRegno_Command(object sender, CommandEventArgs e)
    {

        //DBManager ObjDBManager = new DBManager();
        //ObjDBManager.AddParameter("id", searchRegno.Text);

        //DataTable dt = ObjDBManager.ExecuteDataTable("GetVacsDashboardDetail", "vmsconnectionstring");

        //Response.Write("<script>connsole.log('" + dt + "');</script>");

        Common ObjCommon = new Common();
        string regno = searchRegno.Text; //"vu-691"
        DataTable vehRegnoDetails = ObjCommon.GetVehRegnoDetails(regno);

        var rows = vehRegnoDetails.Rows;

        try
        {
            if (rows.Count == 0)
            {
                Response.Write("<script>alert('" + rows.Count + " Record found.');</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('No record found." + rows.Count + ex + "');</script>");
        }
    }


    public void GetVehRegnoDetails()
    {
        string regno = "vu-691";
        //VehRegnoDetails vehRegno = new VehRegnoDetails();
        string cs = ConfigurationManager.ConnectionStrings["YCROSE3"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("GetVacsDashboardDetail", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Id",
                Value = regno
            });
            conn.Open();



            ///SqlDataReader rdr = cmd.ExecuteReader();
            ///while (rdr.Read())
            ///{
            ///    vehRegno.Id = rdr["id"].ToString();
            ///    vehRegno.Type = rdr["id"].ToString();
            ///    vehRegno.Colour = rdr["id"].ToString();
            ///    vehRegno.UHF_TAG_ID = rdr["id"].ToString();
            ///}
        }

        //return vehRegno;
    }

    [WebMethod]
    public static void vehRegnoDetails(string regno)
    {
        DBManager ObjDBManager = new DBManager();
        ObjDBManager.AddParameter("id", regno);

        DataTable dt = ObjDBManager.ExecuteDataTable("GetVacsDashboardDetail", "vmsconnectionstring");
    }

    [WebMethod]
    public static VehRegnoDetails vehRD(string regno)
    {
        //DBManager ObjDBManager = new DBManager();
        //ObjDBManager.AddParameter("@Id", regno);

        //return ObjDBManager.ExecuteDataTable("GetVacsDashboardDetail", "vmsconnectionstring");


        VehRegnoDetails vregno = new VehRegnoDetails();
        string cs = ConfigurationManager.ConnectionStrings["vmsconnectionstring"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(cs))
        {

            SqlCommand cmd = new SqlCommand("GetVacsDashboardDetail", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Id",
                Value = regno
            });
            conn.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rdr = cmd.ExecuteReader();
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "RegisterStartupScript", "textscript", true);
            //checkValue = rdr;
            while (rdr.Read())
            {
                vregno.Id = rdr["id"].ToString();
                // lblVehType.Text = rdr["Type"].ToString(); 
                vregno.Type = rdr["Type"].ToString();
                // tbVehType.Text = vregno.Type.ToString();
                vregno.Colour = rdr["Colour"].ToString();
                vregno.Make = rdr["Make"].ToString();
                vregno.Model = rdr["Model"].ToString();
                vregno.ValidUpTo = rdr["ValidUpTo"].ToString();
                vregno.maxTimeIn = rdr["maxTimeIn"].ToString();
                vregno.maxTimeOut = rdr["maxTimeOut"].ToString();
            }
        }
        return vregno;

    }

    static public string scs = ConfigurationManager.ConnectionStrings["vmsconnectionstring"].ConnectionString;

    [ScriptMethod()]
    [WebMethod]
    public static List<string> GetRegnos(string prefixText, int count)
    {
        List<string> regnos = new List<string>();
        SqlConnection sqlConn = new SqlConnection(scs);
        string sqlQuery = "SELECT [VehicleNo] FROM [YCROSS3].[dbo].[mctx_VACS] WHERE [VehicleNo] LIKE @regno + '%'";
        SqlCommand cmd = new SqlCommand(sqlQuery, sqlConn);
        cmd.Parameters.AddWithValue("@regno", prefixText);
        sqlConn.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            regnos.Add(sdr["VehicleNo"].ToString());
        }
        sqlConn.Close();

        return regnos;
    }
}