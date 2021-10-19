<%@ Page Title="" Language="C#" MasterPageFile="~/SRC/user.Master" AutoEventWireup="true" CodeBehind="Thanks.aspx.cs" Inherits="E_Commerce.SRC.Thanks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />
    <br />
    <br />
    <h1>Thanks for shopping from our website </h1>
    <br />
    <h1>To continue shopping </h1>
    <asp:Button ID="products" runat="server" Text="Shop Now" OnClick="products_Click" />

</asp:Content>
