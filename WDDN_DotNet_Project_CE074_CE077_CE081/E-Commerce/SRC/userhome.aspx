<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userhome.aspx.cs" Inherits="E_Commerce.SRC.userhome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/custom/style1.css" />
    <script>
        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href ="Cart.aspx"
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="navbar navbar-default  navbar-fixed-top"  role="navigation" >
                <div class="container" >
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>

                        </button>
                        <a class="navbar-brand" href="home.aspx"><span><img src="../Images/logo1.jpg" alt="E-commerce" height="30" /></span>E-commerce</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li ><a href="home.aspx">Home</a></li>
                            <li ><a href="aboutus.aspx">About</a></li>
                            <li ><a href="#">Contact Us</a></li>
                            <li ><a href="#">Blog</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b>
                                    <ul class="dropdown-menu">
                                        
                                         <li> <a href="Products.aspx">All Products</a></li>
                                            <li role="separator" class="divider"></li>
                                        <li class ="dropdown-header ">MEN</li>
                                            <li role="separator" class="divider"></li>
                                            <li><a href="#">Clothes</a></li>
                                            <li><a href="#">Shoes</a></li>
                                            <li><a href="#">Accessories</a></li>
                                            <li role="separator" class="divider"></li>
                                         
                                        <li class ="dropdown-header ">WOMEN</li>
                                            <li role="separator" class="divider"></li>                                            
                                            <li><a href="#">Clothes</a></li>
                                            <li><a href="#">Shoes</a></li>
                                            <li><a href="#">Accessories</a></li>
                                    </ul>
                                </a>
                            </li>
                             <li><button id="btnCart" class="btn btn-primary navbar-btn" type="button">
                                Cart 
                                <span class="badge" id="pCount" runat="server">6</span>

                                </button>

                            </li>
                             <li>
                                 <asp:Button ID="btnsignin" CssClass="btn btn-default navbar-btn " runat="server" Text="SignIn" OnClick="btnsignin_Click" />             
                                 <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn " runat="server" Text="Sign Out"  OnClick="butlogin_Click"/>
                                 &nbsp<asp:Label ID="lblsuc" runat="server" CssClass="text-success"></asp:Label>
                                
                             </li>

                        </ul>
                            
                    </div>
                </div>
            </div>


        </div>
       <footer class="footer-pos">
            <div class="container ">
               
                <p>
                    <a href="home.aspx">Home&nbsp&nbsp</a>
                    <a href="aboutus.aspx">&nbsp&nbsp About us</a>
                </p>
            </div>
        </footer>
    </form>
</body>
</html>
