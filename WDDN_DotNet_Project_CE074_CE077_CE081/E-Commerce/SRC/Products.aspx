<%@ Page Title="" Language="C#" MasterPageFile="~/SRC/user.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="E_Commerce.SRC.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    
    <div class="row" style="padding-top:50px">
        <asp:Repeater ID="rptrProducts" runat="server">
            <ItemTemplate>
        <div class="col-sm-3 col-md-3">
            <a href="ProductView.aspx?ProductID=<%# Eval("ProductID") %>" style="text-decoration:none;">
            <div class="thumbnail">
                <img src="../Images/Product Images/<%# Eval("ProductID") %>/<%# Eval("ImageName") %><%# Eval("Extension") %>" alt="<%# Eval("ImageName") %>" />
                <div class="caption">
                    <div class="probrand" style=" font-size: 15px;font-weight: 600;line-height: 15px;text-transform: uppercase;font-family: sans-serif;"><%# Eval("BrandName") %></div>
                    <div class="proName" style=" font-size: 13px;line-height: 17px;font-family: sans-serif;"><%# Eval("ProductName") %></div>
                    <div class="proPrice" style="font-size: 14px;line-height: 17px;font-family: sans-serif;font-weight: 600;">
                        <span class="proogprice" style="font-size: 13px;line-height: 17px;font-family: sans-serif;font-weight: 400;text-decoration: line-through;color: gray;"><%# Eval("PPrice") %></span>
                        <%# Eval("PSellPrice") %>&nbsp<span class="proPriceDiscount" style=" font-size: 13px;font-family: sans-serif;font-weight: 400;color: deeppink;"><%# Eval("DiscAmount") %>(Less)</span>
                    </div>
                </div>
            </div>
        </div>
                </a>
                </ItemTemplate>
        </asp:Repeater>
    </div>



</asp:Content>
