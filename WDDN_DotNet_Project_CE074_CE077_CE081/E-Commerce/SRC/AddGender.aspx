<%@ Page Title="" Language="C#" MasterPageFile="~/SRC/admin.Master" AutoEventWireup="true" CodeBehind="AddGender.aspx.cs" Inherits="E_Commerce.SRC.AddGender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class ="center-page">
        <br />    
        <br />    
        <h2>Add Gender</h2>
            <label class="col-xs-11"></label>
            <label class="col-xs-11"></label>
            <label class="col-xs-11"></label>

            <label class="col-xs-11">GenderName:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtBox" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ErrorMessage="Enter Value" ControlToValidate="txtBox" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        
        
           

          
            <label class="col-xs-11"></label>
            <div class="col-xs-11">
                <asp:Button ID="butAdd" runat="server" CssClass="btn btn-success" Text="Add &raquo;" OnClick="butAdd_Click"    />     
            </div>
        </div>

</asp:Content>
