using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace E_Commerce.SRC
{
    public partial class recoverpass : System.Web.UI.Page
    {
        string guidvalue;
        DataTable dt = new DataTable();
        
        int Uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcommerceDb"].ConnectionString))
            {
                con.Open();
                guidvalue = Request.QueryString["id"];
                if(guidvalue!=null)
                {
                    SqlCommand cmd = new SqlCommand("select * from ForgotPass where Id=@Id",con);
                    
                    cmd.Parameters.AddWithValue("@Id", guidvalue);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);

                    sda.Fill(dt);
                    if(dt.Rows.Count != 0)
                    {
                       Uid = Convert .ToInt32(dt.Rows[0][1]);
                    }
                    else
                    {

                        lblmsg.Text = "Your password reset link is expired or Invalid .. try again";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Response.Redirect("~/SRC/home.aspx");
                }
            }
            if(!IsPostBack)
            {
                if(dt.Rows.Count!=0)
                {
                    txtconfirmpass.Visible = true;
                    txtnewpass.Visible = true;
                    lblnewpass.Visible = true;
                    lblconfirmpass.Visible = true;
                    btnresetpass.Visible = true;
                }
                else
                {
                    lblmsg.Text = "Your password reset link is expired or Invalid .. try again";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnresetpass_Click(object sender, EventArgs e)
        {
            if (txtnewpass.Text != "" && txtconfirmpass.Text != "" && txtconfirmpass == txtnewpass)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcommerceDb"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update users set Password=@p where Uid=@Uid", con);
                    cmd.Parameters.AddWithValue("@p", txtnewpass.Text);
                    cmd.Parameters.AddWithValue("@Uid", Uid);
                    cmd.ExecuteNonQuery();

                    SqlCommand cmd2 = new SqlCommand("delete from ForgotPass where Uid='" + Uid + "'", con);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script> alert('Password reset Successfully done');</script>");
                    Response.Redirect("~/SignIn.aspx");

                }
            }
        }
    }
}