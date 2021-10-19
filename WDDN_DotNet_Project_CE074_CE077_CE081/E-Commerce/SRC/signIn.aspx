<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signIn.aspx.cs" Inherits="E_Commerce.SRC.signIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
                             <li ><a href="signup.aspx">SignUp</a></li>
                                                        

                        </ul>
                            
                    </div>
                </div>
            </div>
        </div>
            </div>
        <!--signin start--->
        
        <div class ="center-page">
            <h2>Login Form</h2>
            <label class="col-xs-11"></label>
            <label class="col-xs-11"></label>
            <label class="col-xs-11"></label>

            <label class="col-xs-11">Username:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtuname" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatoruser" runat="server" CssClass="text-danger" ErrorMessage="Enter username" ControlToValidate="txtuname" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        
        
            
            <label class="col-xs-11">Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" placeholder="" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorpassword" runat="server" CssClass="text-danger" ErrorMessage="Enter Valid Password" ControlToValidate="txtpass" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            

            <label class="col-xs-11">Remember me&nbsp 
             <asp:CheckBox ID="CheckBox1" runat="server" />
            </label>
            <label class="col-xs-11"></label>
            <div class="col-xs-11">
                <asp:Button ID="butlogin" runat="server" CssClass="btn btn-success" Text="Login &raquo;" OnClick="butlogin_Click"  />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SRC/signup.aspx">SignUp</asp:HyperLink>
                
            </div>

            <label class="col-xs-11"></label>
            <label class="col-xs-11"></label>
            <label class="col-xs-11"></label>
            <!--forgot password-->
            <div class="col-xs-11">
                <asp:HyperLink ID="forgotpass" runat="server" NavigateUrl="~/SRC/forgotpass.aspx">Forgot Password</asp:HyperLink>
            </div>

            <label class="col-xs-11"></label>
            <label class="col-xs-11"></label>
            <label class="col-xs-11"></label>

            <div class="col-xs-11">
                
                <asp:Label ID="lblerror" runat="server" CssClass="text-danger"></asp:Label>
            </div>
            
        
        </div>



        <!--signin ends--->
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
