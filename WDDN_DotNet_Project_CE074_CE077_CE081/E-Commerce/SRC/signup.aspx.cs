using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using E_Commerce.SRC.Models;

namespace E_Commerce.SRC
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Signup_Click(object sender, EventArgs e)
        {
            if(isformvalid())
            {

                User newUser = new User(Name: fullname.Text, Username: uname.Text, Email :email.Text, Password : pass1.Text );
                try
                {
                    using (var ctx = new EcommerceDb())
                    {
                       // Response.Write("<script>alert(" + newUser.Uid + ");</script>");
                        ctx.Users.Add(newUser);
                        ctx.SaveChanges();
                        clr();
                        lbl.Text = "Registration Done Successfully";
                        lbl.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("~/SRC/signIn.aspx");
                    }
                }catch (Exception)
                {

                    //Response.Write("<script> alert(" + "Username or email is already in use" + ");</script>");
                    lbl.Text = "Username or email is already in use";
                    lbl.ForeColor = System.Drawing.Color.Red;

                    // Response.Redirect("~/SRC/signup.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Registration Failed');</script>");
                lbl.Text = "Registration failed";
                lbl.ForeColor = System.Drawing.Color.Red;
            }

        }

        private bool isformvalid()
        {
            if(uname.Text=="")
            {
                Response.Write("<script>alert('username not valid');</script>");
                uname.Focus();
                return false;
            }
            else if(pass1.Text=="")
            { 
                Response.Write("<script>alert('Password not valid');</script>");
                pass1.Focus();
                return false;
            }
            else if(pass2.Text!=pass1.Text)
            {
                Response.Write("<script>alert('Password does not match');</script>");
                pass2.Focus();
                return false;
            }
            else if(fullname.Text=="")
            {
                Response.Write("<script>alert('Name not valid');</script>");
                fullname.Focus();
                return false;
            }
            else if(email.Text=="")
            {
                Response.Write("<script>alert('Email not valid');</script>");
                email.Focus();
                return false;
            }
            return true;
        }
        private void clr()
        {
            uname.Text = string.Empty;
            pass1.Text = string.Empty;
            pass2.Text = string.Empty;
            email.Text = string.Empty;
            fullname.Text = string.Empty;
        }
    }
}