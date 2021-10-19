using E_Commerce.SRC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace E_Commerce.SRC
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void butAdd_Click(object sender, EventArgs e)
        {
            using(var ctx = new EcommerceDb())
            {
                Product product = new Product() { 
                    ProductName = txtProductName.Text,
                    PProductDetails = txtPDetail.Text, 
                    BrandID = int.Parse(ddlBrand.SelectedValue), 
                    COD = cbCOD.Checked, 
                    FreeDelivery = chFD.Checked, 
                    _30DayRet = ch30Ret.Checked,
                    GenderID = int.Parse(ddlGender.SelectedValue),
                    Pdescription = txtDescription.Text,
                    PMAterialCare = txtMatCar.Text, 
                    PPrice = decimal.Parse(txtPrice.Text), 
                    PSellPrice = decimal.Parse(txtsellPrice.Text),
                    Size=txtDynamicsize.Text,
                    SubCategoryID=int.Parse(ddlSubCategory.SelectedValue)
                };

                
                ctx.Products.Add(product);
                
                ProductSizeQuantity Pquantity = new ProductSizeQuantity()
                {
                    Quantity = int.Parse(txtQuantity.Text),
                    PID= product.ProductID
                };
                ctx.productSizeQuantities.Add(Pquantity);
                ctx.SaveChanges();

                if(fuImg01.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/Product Images/") + product.ProductID;
                    if(!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                    fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim()+ "01" + Extention);

                    ProductImages Pimg1 = new ProductImages()
                    {
                        Name = txtProductName.Text.ToString().Trim() + "01",
                        Extension = Extention,
                        ProductID=product.ProductID
                    };
                    ctx.productImages.Add(Pimg1);
                    ctx.SaveChanges();
                }

                if (fuImg02.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/Product Images/") + product.ProductID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                    fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extention);

                    ProductImages Pimg2 = new ProductImages()
                    {
                        Name = txtProductName.Text.ToString().Trim() + "02",
                        Extension = Extention,
                        ProductID = product.ProductID
                    };
                    ctx.productImages.Add(Pimg2);
                    ctx.SaveChanges();
                }

                if (fuImg03.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/Product Images/") + product.ProductID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                    fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extention);

                    ProductImages Pimg3 = new ProductImages()
                    {
                        Name = txtProductName.Text.ToString().Trim() + "03",
                        Extension = Extention,
                        ProductID = product.ProductID
                    };
                    ctx.productImages.Add(Pimg3);
                    ctx.SaveChanges();
                }

                if (fuImg04.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/Product Images/") + product.ProductID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
                    fuImg04.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "04" + Extention);

                    ProductImages Pimg4 = new ProductImages()
                    {
                        Name = txtProductName.Text.ToString().Trim() + "04",
                        Extension = Extention,
                        ProductID = product.ProductID
                    };
                    ctx.productImages.Add(Pimg4);
                    ctx.SaveChanges();
                }

                clr();
                lbl.Text= "Product added Successfully";
            }
        }
        private void clr()
        {
            txtProductName.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtsellPrice.Text = string.Empty;
            txtDynamicsize.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtPDetail.Text = string.Empty;
            txtMatCar.Text = string.Empty;
            chFD.Checked = false;
            ch30Ret.Checked = false;
            cbCOD.Checked = false;
        }
    }
}