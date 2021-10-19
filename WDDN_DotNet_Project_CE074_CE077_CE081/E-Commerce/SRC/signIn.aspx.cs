using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using E_Commerce.SRC.Models;

namespace E_Commerce.SRC
{
    public partial class signIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.Cookies["UNAME"]!=null && Request.Cookies["PWD"] != null)
                {
                    txtuname.Text= Request.Cookies["UNAME"].Value;
                    txtpass.Text = Request.Cookies["PWD"].Value;
                    CheckBox1.Checked = true;
                }
            }
        }

        protected void butlogin_Click(object sender, EventArgs e)
        {
            using (var ctx = new EcommerceDb())
            {
              

                User currentUser = null;
                var iscorrect = ctx.Users.Any(
                    delegate(User usr)
                    {
                        if (usr.Username == txtuname.Text && usr.Password == txtpass.Text)
                        {
                            currentUser = usr;
                            return true;
                        }
                        return false;
                    }
                );



                if (iscorrect)
                {
                    if(CheckBox1.Checked)
                    {
                        Response.Cookies["UNAME"].Value = txtuname.Text;
                        Response.Cookies["PWD"].Value = txtpass.Text;
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddHours(10);
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddHours(10);
                    }
                    else
                    {
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                    }
                    string utype;
                    utype = currentUser.UserType ;
                    if(utype=="User")
                    {
                        Session["username"] = txtuname.Text;
                        Response.Redirect("~/SRC/userhome.aspx");
                    }
                    if (utype == "Admin")
                    {
                        Session["username"] = txtuname.Text;
                        Response.Redirect("~/SRC/admin.aspx");
                    }
                }
                else
                {
                    lblerror.Text = "Invalid username and password";
                }
                    
                //lbl.Text = "Registration Done Successfully";
                //lbl.ForeColor = System.Drawing.Color.Green;
            }
        }

        private void clr()
        {
            txtuname.Text = string.Empty;
            txtpass.Text = string.Empty;
            txtuname.Focus();
        }
    }
}