<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="E_Commerce.SRC.forgotpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
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
            <!--navbar starts-->
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
         <div class="container">
             <div class="form-horizontal ">
                 <h2>Recover Password</h2>
                 <hr />
                 <h3>Please enter your email, we will send you the recovery link</h3>
                
                 <div class="form-group">
                    <asp:Label ID="Lblemail" CssClass="col-md-2 control-label" runat ="server" Text="E-mail Address"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtemail" CssClass=" form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" CssClass="text-danger"  runat="server" ErrorMessage="Enter your email" ControlToValidate="txtemail" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                 </div>

                 <div class="form-group">
                     <div class="col-md-2"></div>
                     <div class="col-md-6">
                        <asp:Button ID="btnresetpass" CssClass="btn btn-default" runat="server" Text="Send" OnClick="btnresetpass_Click" />  
                     </div>
                     <label class="col-md-6"></label>
                     <label class="col-md-6"></label>
                     <div class="col-md-6">
                         <asp:Label ID="lblresetmsg" CssClass="text-success" runat="server" ></asp:Label>

                     </div>
                 </div>

             </div>
         </div>
    </form>
    <!--footer-->
    <footer class="footer-pos">
            <div class="container ">
               
                <p>
                    <a href="home.aspx">Home&nbsp&nbsp</a>
                    <a href="aboutus.aspx">&nbsp&nbsp About us</a>
                </p>
            </div>
        </footer>
</body>
</html>
