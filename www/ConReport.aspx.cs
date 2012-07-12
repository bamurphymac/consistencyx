using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace NFLWeb
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Request.Cookies.Get("fum") != null) && (IsPostBack == false))
            {
                TextFumble.Text = Request.Cookies["fum"].Value;
                TextIntercept.Text = Request.Cookies["int"].Value;
                TextPassPoints.Text = Request.Cookies["tpp"].Value;
                TextPassTD.Text = Request.Cookies["tpt"].Value;
                TextPassYards.Text = Request.Cookies["tpy"].Value;
                TextReception.Text = Request.Cookies["rec"].Value;
                TextRecPoints.Text = Request.Cookies["rcp"].Value;
                TextRecTD.Text = Request.Cookies["rct"].Value;
                TextRecYards.Text = Request.Cookies["rcy"].Value;
                TextRushPoints.Text = Request.Cookies["trp"].Value;
                TextRushTD.Text = Request.Cookies["trt"].Value;
                TextRushYards.Text = Request.Cookies["try"].Value;
            }
        }

        protected void ButtonEdit_Click(object sender, EventArgs e)
        {
            PanelScore.Visible = true;
            ButtonEdit.Visible = false;
        }

        protected void ButtonHideScoring_Click(object sender, EventArgs e)
        {
            PanelScore.Visible = false;
            ButtonEdit.Visible = true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropName.SelectedValue = GridView1.SelectedValue.ToString();
            PanelMain.Visible = false;
            PanelSummary.Visible = true;
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            DropName.SelectedValue = null;
            GridView1.SelectedIndex = -1;
            PanelMain.Visible = true;
            PanelSummary.Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonRecalculate_Click(object sender, EventArgs e)
        {
            bool changed = false;
            Err.Visible = false;

            if (TextPassPoints.Text == "")
            {
                TextPassPoints.Text = "1";
                changed = true;
            }
            
            if (TextFumble.Text == "")
            {
                TextFumble.Text = "-1";
                changed = true;
            }

            if (TextIntercept.Text == "")
            {
                TextIntercept.Text = "-1";
                changed = true;
            }

            if (TextPassTD.Text == "")
            {
                TextPassTD.Text = "4";
                changed = true;
            }

            if (TextPassYards.Text == "")
            {
                TextPassYards.Text = "20";
                changed = true;
            }

            if (TextReception.Text == "")
            {
                TextReception.Text = "0";
                changed = true;
            }

            if (TextRecPoints.Text == "")
            {
                TextRecPoints.Text = "1";
                changed = true;
            }

            if (TextRecTD.Text == "")
            {
                TextRecTD.Text = "6";
                changed = true;
            }

            if (TextRecYards.Text == "")
            {
                TextRecYards.Text = "10";
                changed = true;
            }

            if (TextRushPoints.Text == "")
            {
                TextRushPoints.Text = "1";
                changed = true;
            }

            if (TextRushTD.Text == "")
            {
                TextRushTD.Text = "6";
                changed = true;
            }

            if (TextRushYards.Text == "")
            {
                TextRushYards.Text = "10";
                changed = true;
            }

            if (changed == true)
            {
                Err.Visible = true;
            }
            
            if ((double.Parse(TextFumble.Text) > 0) || (double.Parse(TextIntercept.Text) > 0))
            {
                LabelWarning.Visible = true;
            }
            else
            {
                LabelWarning.Visible = false;
            }
        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            TextPassPoints.Text = "1";
            TextFumble.Text = "-1";
            TextIntercept.Text = "-1";
            TextPassTD.Text = "4";
            TextPassYards.Text = "20";
            TextReception.Text = "0";
            TextRecPoints.Text = "1";
            TextRecTD.Text = "6";
            TextRecYards.Text = "10";
            TextRushPoints.Text = "1";
            TextRushTD.Text = "6";
            TextRushYards.Text = "10";
            LabelWarning.Visible = false;
            Err.Visible = false;
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            ButtonRecalculate_Click(sender,e);
            Response.Cookies["fum"].Value = TextFumble.Text;
            Response.Cookies["int"].Value = TextIntercept.Text;
            Response.Cookies["tpp"].Value = TextPassPoints.Text;
            Response.Cookies["tpt"].Value = TextPassTD.Text;
            Response.Cookies["tpy"].Value = TextPassYards.Text;
            Response.Cookies["rec"].Value = TextReception.Text;
            Response.Cookies["rcp"].Value = TextRecPoints.Text;
            Response.Cookies["rct"].Value = TextRecTD.Text;
            Response.Cookies["rcy"].Value = TextRecYards.Text;
            Response.Cookies["trp"].Value = TextRushPoints.Text;
            Response.Cookies["trt"].Value = TextRushTD.Text;
            Response.Cookies["try"].Value = TextRushYards.Text;
        }
    }
}
