using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce.SRC
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadminlogout_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/SRC/signIn.aspx");
            Session["username"] = null;
        }
    }
}