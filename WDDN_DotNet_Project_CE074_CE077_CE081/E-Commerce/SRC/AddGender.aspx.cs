using E_Commerce.SRC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce.SRC
{
    public partial class AddGender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void butAdd_Click(object sender, EventArgs e)
        {
            using (var ctx = new EcommerceDb())
            {
                var gender = new Gender() { GenderName = txtBox.Text };
                ctx.Genders.Add(gender);
                ctx.SaveChanges();
                txtBox.Text = "";
            }
        }
    }
}