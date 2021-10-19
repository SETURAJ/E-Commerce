using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_Commerce.SRC
{
    public partial class Cart : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["EcommerceDb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                BindProductCart();
                BindCartNumber();
            }
        }
        private void BindProductCart()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                DataTable dt = new DataTable();
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                if (CookieDataArray.Length > 0)
                {
                    h4Noitems.InnerText = "My Cart(" + CookieDataArray.Length + "items)";
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieData[i].ToString().Split('-')[0];
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            using (SqlCommand cmd = new SqlCommand("SELECT A.*,ProductImages.Name,Extension from Products A cross apply(select top 1  B.Name,Extension from ProductImages B WHERE B.ProductID=A.ProductID)ProductImages where A.ProductID='" + PID + "'", con))
                            {
                                cmd.CommandType = CommandType.Text;
                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    sda.Fill(dt);
                                }
                            }
                        }
                    }
                }
                rptrCartProducts.DataSource = dt;
                rptrCartProducts.DataBind();
            }
        }
        public void BindCartNumber()
        {
            if (Session["USERID"] != null)
            {
                string UserIDD = Session["USERID"].ToString();
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@UserID", UserIDD);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                            //string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                            //CartBadge.InnerText = CartQuantity;

                        }
                        else
                        {
                            //_ = CartBadge.InnerText == 0.ToString();
                            //CartBadge.InnerText = "0";

                        }
                    }
                }
            }
        }

        protected void RptrCartProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
            //This will add +1 to current quantity using PID
            if (e.CommandName == "DoPlus")
            {
                string PID = (e.CommandArgument.ToString());
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_getUserCartItem", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@PID", PID);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Int32 updateQty = Convert.ToInt32(dt.Rows[0]["Qty"].ToString());
                            SqlCommand myCmd = new SqlCommand("SP_UpdateCart", con)
                            {
                                CommandType = CommandType.StoredProcedure
                            };
                            myCmd.Parameters.AddWithValue("@Quantity", updateQty + 1);
                            myCmd.Parameters.AddWithValue("@CartPID", PID);
                            myCmd.Parameters.AddWithValue("@UserID", UserID);
                            con.Open();
                            Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                            con.Close();
                            BindProductCart();
                            BindCartNumber();
                        }
                    }

                }
            }
            else if (e.CommandName == "DoMinus")
            {
                string PID = (e.CommandArgument.ToString());
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_getUserCartItem", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@PID", PID);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Int32 myQty = Convert.ToInt32(dt.Rows[0]["Qty"].ToString());
                            if (myQty <= 1)
                            {
                                //divQtyError.Visible = true;
                            }
                            else
                            {
                                SqlCommand myCmd = new SqlCommand("SP_UpdateCart", con)
                                {
                                    CommandType = CommandType.StoredProcedure
                                };
                                myCmd.Parameters.AddWithValue("@Quantity", myQty - 1);
                                myCmd.Parameters.AddWithValue("@CartPID", PID);
                                myCmd.Parameters.AddWithValue("@UserID", UserID);
                                con.Open();
                                Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                                con.Close();
                                BindProductCart();
                                BindCartNumber();

                            }
                        }

                    }
                }
            }
            else if (e.CommandName == "RemoveThisCart")
            {
                int CartPID = Convert.ToInt32(e.CommandArgument.ToString().Trim());
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand myCmd = new SqlCommand("SP_DeleteThisCartItem", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    myCmd.Parameters.AddWithValue("@CartID", CartPID);
                    con.Open();
                    myCmd.ExecuteNonQuery();
                    con.Close();
                    BindProductCart();
                    BindCartNumber();
                }
            }
        }
        protected void btnRemoveCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SRC/Products.aspx");
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SRC/payment.aspx");
        }

        
    }
}