using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Web.Services;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Drawing;


public partial class UVSS_Report_UVSS_Report : System.Web.UI.Page
{

    Common ObjCommon = new Common();
    //static string GridDataQuery = Session["GridValue"].ToString();// = Query;
    private string GridDataQuery
    {
        get
        {
            var value = ViewState["GridDataQuery"];
            return null != value ? (string)value : "";
        }
        set
        {
            ViewState["GridDataQuery"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //GridDataQuery = Query;


        if (!IsPostBack)
        {
            txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            //DataTable VehicleNo = ObjCommon.GetUVSSVehicelNumber();
            //ddlVehicleNo.DataSource = VehicleNo;
            //ddlVehicleNo.DataValueField = "UVSSID";
            //ddlVehicleNo.DataTextField = "VehicleNumber";
            //ddlVehicleNo.DataBind();
            //ddlVehicleNo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));

            

            DataTable GateLane = ObjCommon.GetGateLane();
            ddlGateLane.DataSource = GateLane;
            ddlGateLane.DataValueField = "ID";
            ddlGateLane.DataTextField = "LocationName";
            ddlGateLane.DataBind();
            ddlGateLane.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));

            DataTable FOD = ObjCommon.GetUVSSFOD();
            ddlFOD.DataSource = FOD;
            ddlFOD.DataValueField = "FOD_ID";
            ddlFOD.DataTextField = "FOD_Status";
            ddlFOD.DataBind();
            ddlFOD.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));

            DataTable PDI = ObjCommon.PDI();
            ddlPDI.DataSource = PDI;
            ddlPDI.DataValueField = "PDI_ID";
            ddlPDI.DataTextField = "PDI_Status";
            ddlPDI.DataBind();
            ddlPDI.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));


        }
    }
    public void BindGV()
    {
        // tbl += "<td style='text-align:left; white-space:nowrap;'id='SR#" + i + "'>" + j + "</td>";
        //<td style='text-align:left; white-space:nowrap;'id='SR#" + i + "'>" + j + "</td>


        string QueryFilters = " select  ROW_NUMBER() OVER (ORDER BY(SELECT 1)) AS SR#, ul.LogDate as LogDate, ul.LogDateTime as LogDateTime, p.LocationName as Lane, ul.VehicleNumber as VehicleNo, ufd.FOD_Status as FOD, upd.PDI_Status as PDI ";
        // "ServiceNo as PNo, FirstName  +  LastName as Name , vac.CNIC as CNIC, TIME_IN as TimeIn, TIME_OUT as TimeOut ";
        //if (id.Checked)
        //    QueryFilters += ",id ";
        //if (chkbxLocationName.Checked)
        //    QueryFilters += ",p.LocationName";//chkbxPreviousStatus
        if (chkbxPreviousStatus.Checked)
            QueryFilters += ",up.Previous_Status";
        if (chkbxRevisedDecision.Checked)
            QueryFilters += ",ul.RevisedDecision";
        if (chkbxRevisedRemarks.Checked)
            QueryFilters += ", ul.RevisedRemarks";


        string Query = QueryFilters + " from [tbl_UVSSlog] ul" +
                                    " LEFT JOIN UVSS_FOD ufd ON ufd.FOD_ID = ul.FOD" +
                                    " LEFT JOIN UVSS_PDI upd ON upd.PDI_ID = ul.PDI" +
                                    " LEFT JOIN UVSS_Previous up ON up.Previous_ID = ul.Previous" +
                                    " LEFT JOIN Place p ON p.ID = ul.Place_Id " +
//" where  (convert(varchar(25), ul.[LogDate] , 121) >= '" + txtDate.Text + "' and convert(varchar(25), ul.[LogDate], 121) <= '" + txtToDate.Text + "') Order by LogDate";

//if (txtVecNo.Text != "")
//    Query = Query + " and (ul.VehicleNumber ='" + txtVecNo.Text+ "')";

//if (ddlFOD.SelectedValue != "")
//    Query = Query + " and (ul.FOD ='" + ddlFOD.SelectedValue + "' ) ";

//if (ddlPDI.SelectedValue != "")
//    Query = Query + " and (ul.PDI ='" + ddlPDI.SelectedValue + "' ) ";

//if (ddlGateLane.SelectedValue != "")
//    Query = Query + " and (ul.Place_Id='" + ddlGateLane.SelectedValue + "' ) ";
//          " and (ul.Place_Id = '' or ul.Place_Id = '" + ddlGateLane.SelectedValue + "')" +

"where (convert(varchar(25), ul.[LogDate], 121) >= '" + txtDate.Text + "' and convert(varchar(25), ul.[LogDate], 121) <= '" + txtToDate.Text + "')" +
             " and ('" + txtVecNo.Text + "'='' or ul.VehicleNumber='" + txtVecNo.Text + "')" +
                        " and  ('" + ddlFOD.SelectedValue + "'='' or ul.FOD='" + ddlFOD.SelectedValue + "' )" +

                  // " and  ('" + txtDate.Text + "'='' or vl.DATE='" + txtDate.Text + "' AND  '" + txtToDate.Text + "'='' or vl.DATE='" + txtToDate.Text + "' )" +
                  " and ('" + ddlPDI.SelectedValue + "' = '' or ul.PDI ='" + ddlPDI.SelectedValue + "')" +
                  " and ('" + ddlGateLane.SelectedValue + "' = '' or ul.Place_Id ='" + ddlGateLane.SelectedValue + "')Order by LogDate";


        GridDataQuery = Query;
        //Session["GridValue"] = Query;
        DataSet ds = ObjCommon.GetEmployeeDetailForGV(Query);

        GVdetails.DataSource = ds;
        GVdetails.DataBind();

    }
    //string GridDataQuery;

    public void BindGVExport()
    {
        DataSet ds = ObjCommon.GetEmployeeDetailForGV(GridDataQuery);

        GVdetails.DataSource = ds;
        GVdetails.DataBind();

    }
    protected void btnSaveResident_Click(object sender, EventArgs e)
    {
        BindGV();
        Clear();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //  ExportGridToPDF();

        CreatePF();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVdetails.PageIndex = e.NewPageIndex;
        //  this.BindGrid();
        BindGV();
    }
    private void ExportGridToPDF()
    {
        int columnsCount = GVdetails.HeaderRow.Cells.Count;
        PdfPTable pdfTable = new PdfPTable(columnsCount);
        foreach (TableCell gridViewHeaderCell in GVdetails.HeaderRow.Cells)
        {
            iTextSharp.text.Font font = new iTextSharp.text.Font();
            font.Color = new BaseColor(GVdetails.HeaderStyle.ForeColor);
            PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewHeaderCell.Text, font));
            pdfCell.BackgroundColor = new BaseColor(GVdetails.HeaderStyle.BackColor);
            pdfTable.AddCell(pdfCell);
        }
        foreach (GridViewRow gridViewRow in GVdetails.Rows)
        {
            if (gridViewRow.RowType == DataControlRowType.DataRow)
            {
                foreach (TableCell gridViewCell in gridViewRow.Cells)
                {
                    iTextSharp.text.Font font = new iTextSharp.text.Font();
                    font.Color = new BaseColor(GVdetails.RowStyle.ForeColor);
                    PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewCell.Text, font));
                    pdfCell.BackgroundColor = new BaseColor(GVdetails.RowStyle.BackColor);
                    pdfTable.AddCell(pdfCell);
                }
            }
            Document pdfDocument = new Document(PageSize.A4);
            PdfWriter.GetInstance(pdfDocument, Response.OutputStream);
            pdfDocument.Open();
            pdfDocument.Add(pdfTable);
            pdfDocument.Close();
            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition",
                "attachment;filename=UVSSReport.pdf");
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();
        }
    }
    public void CreatePF()
    {

        GVdetails.PageSize = 35;
        int columnsCount = GVdetails.HeaderRow.Cells.Count;

        PdfPTable pdfTable = new PdfPTable(columnsCount);
        GVdetails.AllowPaging = false;
        BindGVExport();
        //BindGV();
        //GVdetails.DataBind();

        foreach (TableCell gridViewHeaderCell in GVdetails.HeaderRow.Cells)
        {

            iTextSharp.text.Font font = new iTextSharp.text.Font();

            font.Color = new BaseColor(GVdetails.HeaderStyle.ForeColor);
            font.Size = 8;
            PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewHeaderCell.Text, font));

            pdfCell.BackgroundColor = new BaseColor(GVdetails.HeaderStyle.BackColor);

            pdfTable.AddCell(pdfCell);
        }
        GVdetails.UseAccessibleHeader = true;
        //GVdetails.HeaderRow.TableSection = GVdetails.HeaderRow;
        GVdetails.Attributes["style"] = "border-collapse:seperate";
        foreach (GridViewRow gridViewRow in GVdetails.Rows)
        {
            if ((gridViewRow.RowIndex + 1) % GVdetails.PageSize == 0 && gridViewRow.RowIndex != 0)
            {
                gridViewRow.Attributes["style"] = "page-break-after:always;";
            }

            if (gridViewRow.RowType == DataControlRowType.DataRow)
            {

                foreach (TableCell gridViewCell in gridViewRow.Cells)
                {
                    iTextSharp.text.Font font = new iTextSharp.text.Font();
                    font.Color = new BaseColor(GVdetails.RowStyle.ForeColor);
                    font.Size = 8;
                    PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewCell.Text.Trim().Replace("&nbsp;", ""), font));
                    //PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewCell.Text, font));
                    pdfCell.BackgroundColor = new BaseColor(GVdetails.RowStyle.BackColor);

                    pdfTable.AddCell(pdfCell);

                }
            }
        }

        Document pdfDocument = new Document(PageSize.A4, -10f, -10f, 0f, -10f);

        PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

        pdfDocument.Open();
        pdfDocument.Add(pdfTable);
        pdfDocument.Close();

        Response.ContentType = "application/pdf";
        Response.AppendHeader("content-disposition",
            "attachment;filename=UVSSReport.pdf");
        Response.Write(pdfDocument);
        Response.Flush();
        Response.End();
    }

    protected void btnSaeExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=UVSSReport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GVdetails.AllowPaging = false;
            //BindGV();
            BindGVExport();

            GVdetails.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GVdetails.HeaderRow.Cells)
            {
                cell.BackColor = GVdetails.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GVdetails.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GVdetails.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GVdetails.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GVdetails.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
    public void Clear()
    {
        txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        txtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

        //txtVecNo
             txtVecNo.Text = string.Empty;
        //txtCNIC.Text = string.Empty;
        //txtPNo.Text = string.Empty;
        ddlPDI.SelectedIndex = 0;
        ddlFOD.SelectedIndex = 0;
        ddlGateLane.SelectedIndex = 0;
        //ddlGateNo.SelectedIndex = 0;
        //ddlMake.SelectedIndex = 0;
        //ddlVehicleNo.SelectedIndex = 0;
        
    }
}