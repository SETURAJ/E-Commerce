<%@ Page Title="" Language="C#" MasterPageFile="~/SRC/admin.Master" AutoEventWireup="true"  CodeBehind="AddSubCategory.aspx.cs" Inherits="E_Commerce.SRC.AddSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-top:50px;" class="container" >
        <br />
        <br />
        
<h1>SubCategory</h1>
<hr />

<div class="panel panel-default">

        <div class="panel-heading" >Sub Categories </div>
       
        <div class="panel-body">
        <asp:GridView ID="GridView1" runat="server" Height="135px" Width="1085px" AutoGenerateColumns="False" DataKeyNames="SubCatID,Name,MainCatId"
            OnPreRender="GridView1_PreRender"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting"
            OnRowUpdating="GridView1_RowUpdating"
            OnRowEditing="GridView1_RowEditing"
            OnRowUpdated="GridView1_RowUpdated"
            >
            <Columns>
                <asp:BoundField DataField="SubCatID" HeaderText="ID" SortExpression="SubCatID" ConvertEmptyStringToNull="False"/>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="ShowName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>

                    </EditItemTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MainCatId">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="NameLabel" Text='<%# ctx.Categories.Find(Eval("MainCatId")).Name %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCats" runat="server" DataSourceID="LinqDataSource1" DataTextField="Name" DataValueField="CatID"></asp:DropDownList>
                        <asp:LinqDataSource runat="server" EntityTypeName="" ID="LinqDataSource1" ContextTypeName="E_Commerce.SRC.Models.EcommerceDb" TableName="Categories"></asp:LinqDataSource>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCats" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="ddlCats" runat="server" DataSourceID="LinqDataSource1" DataTextField="Name" DataValueField="CatID"></asp:DropDownList>
                        <asp:LinqDataSource runat="server" EntityTypeName="" ID="LinqDataSource1" ContextTypeName="E_Commerce.SRC.Models.EcommerceDb" TableName="Categories"></asp:LinqDataSource>

                    </FooterTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />

                <asp:TemplateField>

                    <ItemTemplate>
                        <asp:LinkButton ID="lblNew" runat="server" CausesValidation="false"
                            CommandName="Insert"
                            Text="New" Style="text-align: center;color:blue;"
                            Font-Bold="False" ForeColor="Black"
                            Height="3px" Width="49px"
                            Visible="false"
                            OnClick="lblNew_Click">  
                        </asp:LinkButton>
                    </ItemTemplate>

                </asp:TemplateField>
            </Columns>
            
            <EmptyDataTemplate>
                 <label class="col-xs-6"></label>
                <label class="col-xs-6"></label>
                <label class="col-xs-6"></label>

                <label  class="col-xs-6">SubCat Name:</label>
                <div class="col-xs-6">
                    <asp:TextBox ID="txtSubCat" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandName" runat="server" CssClass="text-danger" ErrorMessage="Enter brand" ControlToValidate="txtSubCat" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                 <asp:LinqDataSource runat="server" EntityTypeName="" ID="LinqDataSource1" ContextTypeName="E_Commerce.SRC.Models.EcommerceDb" TableName="Categories"></asp:LinqDataSource>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1" DataTextField="Name" DataValueField="CatID"></asp:DropDownList>
                <label class="col-xs-6"></label>
                <div class="col-xs-6">
                    <asp:Button ID="butAddBrand" runat="server" CssClass="btn btn-success" Text="ADD &raquo;" OnClick="butAddBrand_Click"/>
                </div>
            </EmptyDataTemplate>

        </asp:GridView>
        </div>
        </div>

        </div>
</asp:Content>
