<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recoverpass.aspx.cs" Inherits="E_Commerce.SRC.recoverpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Recovery</title>
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
        <div class="container">
             <div class="form-horizontal ">
                 <br />
                 <br />
                 <br />

                 <h2>Reset Password</h2>
                 <hr />
                 <h3></h3>
                 <div class="form-group">
                    <asp:Label ID="lblmsg" CssClass="col-md-2 control-label" runat ="server"  Visible="False" Font-Bold="True" Font-Size="X-Large"></asp:Label>

                 </div>
                
                 <div class="form-group">
                    <asp:Label ID="lblnewpass" CssClass="col-md-2 control-label" runat ="server" Text="Enter new password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtnewpass" CssClass=" form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorpass" CssClass="text-danger"  runat="server" ErrorMessage="Enter your new password" ControlToValidate="txtnewpass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                 </div>

                 <div class="form-group">
                    <asp:Label ID="lblconfirmpass" CssClass="col-md-2 control-label" runat ="server" Text="Confrim new password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtconfirmpass" CssClass=" form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorconfirmpass" CssClass="text-danger"  runat="server" ErrorMessage="Enter your new password" ControlToValidate="txtconfirmpass" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidatorpass" runat="server" ErrorMessage="Password not matched" ForeColor="Red" ControlToCompare="txtnewpass" ControlToValidate="txtconfirmpass"></asp:CompareValidator>
                    </div>
                 </div>
                  
                 <div class="form-group">
                     <div class="col-md-2"></div>
                     <div class="col-md-6">
                        <asp:Button ID="btnresetpass" CssClass="btn btn-default" runat="server" Text="Reset" Visible="False" OnClick="btnresetpass_Click"/>  
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
