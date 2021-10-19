<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="E_Commerce.SRC.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/custom/style1.css" />
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
                                        <li ><a href="signIn.aspx">Login</a></li>              

                        </ul>
                            
                    </div>
                </div>
            </div>
        </div>

        <!--signup -->
        <div class ="center-page">
            <label class="col-xs-11">Username:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="uname" runat="server" CssClass="form-control" placeholder="Enter Your UserName"></asp:TextBox>
            </div>
        
        
            <label class="col-xs-11">Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="pass1" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Your Password"></asp:TextBox>
            </div>

            <label class="col-xs-11">Confirm Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="pass2" runat="server" CssClass="form-control" TextMode="Password" placeholder="Reenter Your Password"></asp:TextBox>
            </div>

            <label class="col-xs-11">Full Name:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="fullname" runat="server" CssClass="form-control" placeholder="Enter Your Full Name"></asp:TextBox>
            </div>

            <label class="col-xs-11">E-mail:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Enter Your E-mail"></asp:TextBox>
            </div>
            <label class="col-xs-11"></label>
            <div class="col-xs-11">
                <asp:Button ID="butsignup" runat="server" CssClass="btn btn-success" Text="Signup" OnClick="Signup_Click" />
                <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
            </div>
        
        </div>
        <!--footer-->
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
