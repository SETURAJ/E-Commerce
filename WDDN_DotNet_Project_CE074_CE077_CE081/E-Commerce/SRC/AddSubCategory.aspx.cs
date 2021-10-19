using E_Commerce.SRC.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce.SRC
{
    public partial class AddSubCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public EcommerceDb ctx = new EcommerceDb();

        public void BindData()
        {
            using(var ctx = new EcommerceDb())
            {
               
                
                DataTable dt = Converter.ToDataTable(ctx.SubCategories.ToList());

                
                GridView1.DataSource = dt;
                ctx.SaveChanges();
                GridView1.DataBind();

            }
        }

        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            BindData();
            int last = GridView1.Rows.Count - 1;
            if (last != -1)
                GridView1.Rows[last].Cells[4].Controls[1].Visible = true;
        }


        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewRow rows = GridView1.Rows[e.RowIndex];
            var name = (TextBox)rows.FindControl("txtName");
            if (GridView1.EditIndex == GridView1.Rows.Count - 1 && name.Text == "")
                GridView1.DeleteRow(GridView1.Rows.Count - 1);

            GridView1.EditIndex = -1;
            BindData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (var ctx = new EcommerceDb())
            {

                int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

                ctx.SubCategories.Remove(ctx.SubCategories.Find(id));

                ctx.SaveChanges();
                BindData();


            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using(var ctx = new EcommerceDb())
            {
                int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
                GridViewRow rows = GridView1.Rows[e.RowIndex];
             
                var name = (TextBox)rows.FindControl("txtName");
                var ddlCat = rows.FindControl("ddlCats") as DropDownList;

                ctx.SubCategories.Any(
                    delegate(SubCategory s)
                    {
                        if(s.SubCatID == id)
                        {
                            s.Name = name.Text;
                            s.MainCatId = int.Parse(ddlCat.SelectedValue);
                            return true;
                        }
                        return false;
                    }
                    );
                ctx.SaveChanges();
                GridView1.EditIndex = -1;
                BindData();

            }
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindData();
        }

        protected void lblNew_Click(object sender, EventArgs e)
        {
            TextBox txtCats = GridView1.FooterRow.FindControl("txtCats") as TextBox;
            DropDownList ddlCats = GridView1.FooterRow.FindControl("ddlCats") as DropDownList;

            GridView1.EditIndex = GridView1.Rows.Count;

            using(var ctx = new EcommerceDb())
            {
                var subCat = new SubCategory() { Name=txtCats.Text, MainCatId=int.Parse(ddlCats.SelectedValue) };

                ctx.SubCategories.Add(subCat);

                ctx.SaveChanges();
                txtCats.Text = "";

            }

        }

        protected void butAddBrand_Click(object sender, EventArgs e)
        {
            TextBox name = GridView1.Controls[0].Controls[0].FindControl("txtSubCat") as TextBox;
            DropDownList ddl = GridView1.Controls[0].Controls[0].FindControl("DropDownList1") as DropDownList;

            using(var ctx = new EcommerceDb())
            {
                var sub = new SubCategory() { Name = name.Text, MainCatId = int.Parse(ddl.SelectedValue) };
                ctx.SubCategories.Add(sub);

                ctx.SaveChanges();
                name.Text = "";
            }
        }
    }
}