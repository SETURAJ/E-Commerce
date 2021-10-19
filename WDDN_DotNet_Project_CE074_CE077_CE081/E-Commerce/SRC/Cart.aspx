<%@ Page Title="" Language="C#" MasterPageFile="~/SRC/user.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="E_Commerce.SRC.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
<div style="padding-top:50px;">
    
    <div class="col-md-9">
        <h4 class="proNameViewCart" runat="server" id="h4Noitems"> My Cart</h4>
        
       
        <asp:Repeater ID="rptrCartProducts" runat="server" OnItemCommand="rptrCartProducts_ItemCommand" >
            <ItemTemplate>
        <%-- Show cart details--%>
        <div class="media" style="border: 1px solid black;">
            <div class="media-left">
                <a href="ProductView.aspx?ProductID=<%# Eval("ProductID") %>" target="_blank">
                    <img class="media-object" width="100px" src="../Images/Product Images/<%# Eval("ProductID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="<%# Eval("Name") %>" />

                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading proNameViewCart"><%# Eval("ProductName") %></h4>
                <span  class="proPriceDiscountView"><%# Eval("PSellPrice") %></span>
                <span  class="proogpriceView"><%# Eval("PPrice") %></span>
                <p>
                    <asp:Button ID="btnRemoveCart" CssClass="RemoveButton" style="border-radius:3px;outline:0;margin-top:10px;min-height:22px;font-size:13px;font-weight:500;background-color:#ff5722;border:1px solid #FF5722;color:#fff;" runat="server" Text="Remove" OnClick="btnRemoveCart_Click"  />
                    
                </p>

            </div>
        </div>
                </ItemTemplate>
                </asp:Repeater>
            
        <%-- Show cart details end--%>

    </div>

    <div class="col-md-3">
        <%--  --%>
        <div>
            <h5>PRICE DETAILS</h5>
            <div>
                <label>Cart Total</label>
                <span class="pull-right priceGray">1400</span>
            </div>

            <div>
                <label>Cart Discount</label>
                <span class="pull-right priceGreen">-200</span>
            </div>
        </div>

        <%--  --%>
        <div>
            <div class="proPriceView">
                <label>Cart Total</label>
                <span class="pull-right ">1200</span>
            </div>
            <div>
                    <asp:Button ID="btnBuy" CssClass="buyNowbtn" style="border-radius:3px;outline:0;margin-top:10px;min-height:22px;font-size:13px;font-weight:500;background-color:#ff5722;border:1px solid #FF5722;color:#fff;" runat="server" Text="Buy Now" OnClick="btnBuy_Click"   />

            </div>
        </div>
    </div>
    
</div>

</asp:Content>
