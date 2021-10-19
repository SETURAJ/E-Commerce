using E_Commerce.SRC.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace E_Commerce.SRC
{
    public partial class AddBrand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewInsert(object sender, EventArgs e)
        {
            TextBox txtBrand = GridView1.FooterRow.FindControl("txtBrand") as TextBox;
            GridView1.EditIndex = GridView1.Rows.Count;
            using(var ctx = new EcommerceDb())
            {
                var brand = new Brand() { Name = txtBrand.Text };
                ctx.Brands.Add(brand);



                ctx.SaveChanges();
                txtBrand.Text = "";
            }
        }

        public void refreshData()
        {
            using (var ctx = new EcommerceDb())
            {
                DataTable dt = Converter.ToDataTable(ctx.Brands.ToList());

                GridView1.DataSource = dt;
                ctx.SaveChanges();
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using(var ctx = new EcommerceDb())
            {
                GridViewRow rows = GridView1.Rows[e.RowIndex];
                TableCell cell = rows.Cells[2];
                var name = (TextBox)cell.FindControl("TextBox2");
                int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());



                ctx.Brands.Any(
                    delegate (Brand b)
                    {
                        if (b.BrandID == id)
                        {
                            b.Name = name.Text;
                            return true;
                        }
                        return false;
                    }
                );
                ctx.SaveChanges();
                GridView1.EditIndex = -1;

                refreshData();

            }
        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            refreshData();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (var ctx = new EcommerceDb())
            {

                int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

                ctx.Brands.Remove(ctx.Brands.Find(id));

                ctx.SaveChanges();
            refreshData();


            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewRow rows = GridView1.Rows[e.RowIndex];
            TableCell cell = rows.Cells[2];
            var name = (TextBox)cell.FindControl("TextBox2");
            if (GridView1.EditIndex == GridView1.Rows.Count - 1 && name.Text == "")
                GridView1.DeleteRow(GridView1.Rows.Count - 1);

            GridView1.EditIndex = -1;
            refreshData();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GridView1.EditIndex = -1;
            refreshData();
        }

        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            refreshData();
            int last = GridView1.Rows.Count - 1;
            if(last != -1)
            GridView1.Rows[last].Cells[3].Controls[1].Visible = true;
        }

        protected void butAddBrand_Click(object sender, EventArgs e)
        {
            TextBox txtBrand = GridView1.Controls[0].Controls[0].FindControl("txtBrand") as TextBox;
            using (var ctx = new EcommerceDb())
            {
                var brand = new Brand() { Name = txtBrand.Text };
                ctx.Brands.Add(brand);



                ctx.SaveChanges();
                txtBrand.Text = "";
            }
        }
    }
}