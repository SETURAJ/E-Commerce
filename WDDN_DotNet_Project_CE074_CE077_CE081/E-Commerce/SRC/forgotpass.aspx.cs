using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;
namespace E_Commerce.SRC
{
    public partial class forgotpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnresetpass_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EcommerceDb"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from users where Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    string myguid = Guid.NewGuid().ToString();
                    int Uid = Convert.ToInt32(dt.Rows[0][0]);
                    SqlCommand cmd1 = new SqlCommand("Insert into ForgotPass(Id,Uid,RequestDateTime) values('" + myguid + "','" + Uid + "',GETDATE())", con);
                    cmd1.ExecuteNonQuery();

                    //Send reset link via Email
                    String emailadd =dt.Rows[0][3].ToString();
                    string username =dt.Rows[0][1].ToString() ;
                    string EmailBody = "Hi ,"+username + " ,<br/><br/> Click link below to reset your password <br/> <br/> https://localhost:44397/SRC/recoverpass.aspx?id="+myguid ;
                    MailMessage passreset = new MailMessage("enteryouremail", emailadd);
                    passreset.Body = EmailBody;
                    passreset.IsBodyHtml = true;
                    passreset.Subject = "Reset Password";
                    SmtpClient SMTP = new SmtpClient("smtp.gmail.com",587);
                    SMTP.Credentials = new NetworkCredential()
                    {
                        UserName = "enteryouremai",
                        Password ="enteryourpasssword"
                    };
                    SMTP.EnableSsl = true;
                    SMTP.Send(passreset);

                     
                    //----
                    //using(SmtpClient client = new SmtpClient())
                   // {
                    //    client.EnableSsl = true;
                     //   client.UseDefaultCredentials = false;
                     //   client.Credentials = new NetworkCredential("seturajmatroja@gmail.com", "seturaj123");
                     //   client.Host = "seturajmatroja@gmail.com";
                     //   client.Port = 587;
                    //    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    //    client.Send(passreset);
                   // }


                    lblresetmsg.Text = "Reset Link send ! Check your mail";
                    lblresetmsg.ForeColor = System.Drawing.Color.Green;
                    txtemail.Text = string.Empty;
                }
                else
                {
                    lblresetmsg.Text = "Oopss!! This email doesnot exist";
                    lblresetmsg.ForeColor = System.Drawing.Color.Red;
                    txtemail.Text = string.Empty;
                    txtemail.Focus();
                }
            }
        }
    }
}