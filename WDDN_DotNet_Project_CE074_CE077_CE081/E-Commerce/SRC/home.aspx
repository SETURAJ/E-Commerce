<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="E_Commerce.SRC.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Commerce</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <meta charset="UTF-8"/>
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
<style>
            
    
</style>   


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
                            <li class="active"><a href="home.aspx">Home</a></li>
                            <li ><a href="aboutus.aspx">About</a></li>
                            <li ><a href="aboutus.aspx">Contact Us</a></li>
                            
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
                            <li><button id="btnCart" class="btn btn-primary navbar-btn" type="button">
                                Cart 
                                <span class="badge" id="pCount" runat="server">0</span>

                                </button>

                            </li>
                             <li ><a href="signup.aspx">SignUp</a></li>
                             <li ><a href="signIn.aspx">Login</a></li>                       
                            

                        </ul>
                            
                    </div>
                </div>
            </div>
            <!--image slider--->

            <div class="container">
                <h2>Carousel Example</h2>  
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
  
                <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

   
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="../Images/Slider/1.jpg" alt="Slider Image" style="width:100%; height:450px"/>
                            
                    </div>

                    <div class="item">
                        <img src="../Images/Slider/2.jpg" alt="Slider Image" style="width:100%; height:450px"/>
                    </div>
    
                    <div class="item">
                        <img src="../Images/Slider/3.jpg" alt="Slider Image" style="width:100%; height:450px"/>
                    </div>
                </div>

  
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
                </div>
        </div>


            <!--image slider End --->

        </div>
        <!--Middle Contents Start-->
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <img class="img-circle " src="../Images/Shopping/phone1.jpg" alt="Phones" width="140px" height="140"px /> 
                    <h2>Phones</h2>
                    <p>Buy the latest IPhone</p>
                    <p><a class="btn btn-default" href="#" role="button">View More &raquo</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle " src="../Images/Shopping/purse.jpg" alt="Purses" width="140px" height="140"px /> 
                    <h2>Purses</h2>
                    <p>Buy the luxury purses from Louis Vuitton</p>
                    <p><a class="btn btn-default" href="#" role="button">View More &raquo</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle " src="../Images/Shopping/dior.jpg" alt="Phones" width="140px" height="140"px /> 
                    <h2>Perfumes</h2>
                    <p>Buy the Dior perfumes for the fresh and floral notes</p>
                    <p><a class="btn btn-default" href="#" role="button">View More &raquo</a></p>
                </div>
            </div>
        </div>
        <!--Middle Contents End-->
        <footer>
            <div class="container ">
                <p class="pull-right">
                   <a href="home.aspx">Back to Top</a>
                </p>
                <p>
                    <a href="home.aspx">Home&nbsp&nbsp</a>
                    <a href="aboutus.aspx">&nbsp&nbsp About us</a>
                </p>
            </div>
        </footer>
    </form>
   
</body>
</html>