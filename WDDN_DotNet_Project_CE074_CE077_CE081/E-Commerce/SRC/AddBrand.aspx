<%@ Page Title="" Language="C#" MasterPageFile="~/SRC/admin.Master" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="E_Commerce.SRC.AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    <div style="margin-top:50px;" class="container" >
        <br />
        <br />
        
<h1>Brands</h1>
<hr />

<div class="panel panel-default">

        <div class="panel-heading" >All Brands </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BrandID,Name" CssClass="panel-group table"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting"
            OnRowUpdating="GridView1_RowUpdating"
            OnRowEditing="GridView1_RowEditing"
            OnRowUpdated="GridView1_RowUpdated"
            OnPreRender="GridView1_PreRender">

            <Columns >

                <asp:BoundField DataField="BrandID" HeaderText="BrandID" SortExpression="BrandID"  
                    ConvertEmptyStringToNull="False" />
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>

                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtBrand" runat="server"></asp:TextBox>
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
                            OnClick="GridViewInsert">  
                        </asp:LinkButton>
                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>
            <EmptyDataTemplate>

                <label class="col-xs-6"></label>
                <label class="col-xs-6"></label>
                <label class="col-xs-6"></label>

                <label class="col-xs-6">BrandName:</label>
                <div class="col-xs-6">
                    <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandName" runat="server" CssClass="text-danger" ErrorMessage="Enter brand" ControlToValidate="txtBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>






                <label class="col-xs-6"></label>
                <div class="col-xs-6">
                    <asp:Button ID="butAddBrand" runat="server" CssClass="btn btn-success" Text="ADD &raquo;" OnClick="butAddBrand_Click"/>
                </div>

            </EmptyDataTemplate>

        </asp:GridView>

            </div>






    </div>


</asp:Content>
