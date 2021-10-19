using E_Commerce.SRC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce.SRC
{
    public partial class AddSize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void butAdd_Click(object sender, EventArgs e)
        {
            using (var ctx = new EcommerceDb())
            {
                var Value = new Size() {  };
                ctx.Sizes.Add(Value);
                ctx.SaveChanges();
                txtBox.Text = "";
            }
        }
    }
}