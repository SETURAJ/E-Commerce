<%@ Page Title="" Language="C#" MasterPageFile="~/SRC/user.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="E_Commerce.SRC.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    <div style="padding-top:50px">
        
            <div class="col-md-5">
                <div style="max-width:480px" class="thumbnail">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
      <asp:Repeater ID="rptrImage" runat="server">
          <ItemTemplate>
            <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>">
                <img src="../Images/Product Images/<%# Eval("ProductID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="<%# Eval("Name") %>">
            </div>
          </ItemTemplate>
    </asp:Repeater>
    
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
                    
                </div>
            </div>
            <div class="col-md-5">
                <asp:Repeater ID="rptrProductDetails" runat="server" >
                    <ItemTemplate>
                <div class="divDet1" style="border-bottom:1px dashed black;margin-bottom:20px;">
                    <h1 class="proNameView" style="font-size:20px;line-height:25px;font-family:sans-serif;color:#696e80;"><%# Eval("ProductName") %></h1>
                    <span class="proogpriceView" style="font-size: 15px;font-family: sans-serif;font-weight: 400;text-decoration: line-through;color: gray;"><%# Eval("PPrice") %></span>
                    <span class="proPriceDiscountView" style="font-size: 15px;font-family: sans-serif;font-weight: 400;color: deeppink;">&nbsp <%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSellPrice"))) %>(Less)</span>
                    <p class="proPriceView "><%# Eval("PSellPrice") %></p>
                </div>
                <div class="divDet1" style="border-bottom:1px dashed black;margin-bottom:20px;">
                    <asp:button ID="btnAddtoCart" CssClass="mainButton" runat="server" text="ADD TO CART" OnClick="btnAddtoCart_Click"/>
                </div>
                <div class="divDet1" style="border-bottom:1px dashed black;margin-bottom:20px;">
                    <h5 class="h5size" style="font-weight:600">Description</h5>
                    <p>
                        <%# Eval("Pdescription") %>
                    </p>
                    <h5 class="h5size" style="font-weight:600">Product Details</h5>
                    <p>
                        <%# Eval("PProductDetails") %>
                    </p>
                    <h5 class="h5size" style="font-weight:600">Material and Care</h5>
                    <p>
                        <%# Eval("PMAterialCare") %>
                    </p>
                </div>
                <div class="h5size" style="font-weight:600">
                    <p><%#Convert.ToInt32(Eval("FreeDelivery"))==1?"Free Delivery":"" %></p>
                    <p><%#Convert.ToInt32(Eval("_30DayRet"))==1?"30 Days Returns":"" %></p>
                    <p><%#Convert.ToInt32(Eval("COD"))==1?"Cash on Delivery":"" %></p>
                    
                </div>
                        </ItemTemplate>
                </asp:Repeater>
            </div>
       
    </div>

</asp:Content>
