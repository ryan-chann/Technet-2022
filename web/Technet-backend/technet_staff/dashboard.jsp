
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Technetuser"%>
<% 
  //Get the attributes
  Technetuser technetUser = (Technetuser) session.getAttribute("technetStaff");
  Object penPacking = session.getAttribute("penPacking");
  Object penShipping = session.getAttribute("penShipping");
  Object penDelivery = session.getAttribute("penDelivery");   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Staff Dashboard</title>
        
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>

        <!--Load Bootstrap Stylesheet-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!--Load Fontawesome-->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.0.0/css/all.min.css"/>

        <!-- Load JQuery -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

        <!-- Load Owl Carousel -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

        <!--Load Fontawesome script -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.0.0/js/all.min.js"></script>

        <!--Load Bootstrap scripts-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <style>
            /* Default font family */
            body{
                font-family: 'Roboto';                
            }
            
            /*  css styles*/
            #dashTitle{
                width: 890px;
                font-size: 40px;
                height: 46px;
                margin-top: 70px; 
            }
            #dashNavOption{                
                width: 200px;
                height: 526px;
                background:  #CEAB93;                
            }
            
            /*Icons css style*/
            #icon{
                margin: 20px 10px 0 20px;
                color: #000000;
            }
            #d1, #d2, #d3,#d4, #d5{
                color: #E5E5E5;
                font-size: 15px;
            }
            #d1{
                margin-left: 11px; 
            }
            #d2{
                margin-left: 13px; 
            }
            #d3{
                margin-left: 11px; 
            } 
            #d4{
                margin-left: 5px; 
            } 
            #d5{
                margin-left: 9px; 
            } 
            /*Dashboard bar list*/
            .menu-technet * { 
                margin: 0; 
                padding: 0;
            }
            .menu-technet li a{ 
                list-style: none; 
                text-decoration: none;
            }
            
            /*Pending boxes css*/
            #pendingBox1, #pendingBox2, #pendingBox3{
                width: 140px;
                height: 80px;
                left: 335px;
                top: 195px;
                background: white;
                border-radius: 20px;   
                font-size: 8px;
                color: #C4C4C4;
                padding-top: 5px; 
            }
            
            #pendingValue{
                font-size: 35px;
                color: #CEAB93;
                text-align: center;
            }
        </style>
    </head>    
    <body>
        <div class="row">
            
            <!-- Side navigation links bar-->
            <div class="col-md-6" id="dashNavOption">
                <div id="accordian" class="menu-technet">
                  <ul class="menu">
                    <li class="menu-technet-child">
                      <a href="dashboard.jsp"><i class="fa-solid fa-house-chimney" id="icon"></i><b id="d1">Dashboard</b></a>
                    </li>
                    <li class="menu-technet-child">
                      <a href="../TechnetServlet?action=profile&staffID=<%= technetUser.getTechnetid() %>&user=staff "> <i class="fa-solid fa-id-badge" id="icon"></i><b id="d2"> Profile</b></a>
                    </li>
                    <li class="menu-technet-child">
                      <a href="../DisplayOrder_Staff?orderCRUD=display"><i class="fa-solid fa-cart-shopping" id="icon"></i><b id="d3">Manage orders</b></a>
                    </li>
                    <li class="menu-technet-child">
                        <a href="../Comment?id=<%= technetUser.getTechnetid() %>"><i class="fa-solid fa-comments" id="icon"></i><b id="d4"> Comments</b></a>
                    </li>
                    <li class="menu-technet-child">
                      <a href="../TechnetServlet?action=logout "><i class="fa-solid fa-arrow-right-from-bracket" id="icon"></i><b id="d5"> Log Out</b></a>
                    </li>
                  </ul>
                </div>
              </div>
            <!--/. Side navigation links bar -->
            
            <div class="col-md-10" style="background-color: #E5E5E5;">
                <h1 id="dashTitle" style="text-align: center;">WELCOME BACK! <%= technetUser.getTechnetid() %></h1>
                <br/><br/>
                
                <!-- Display the pending status -->
                <div class="row">
                    <div class="col-md-4" id="pendingBox1" style="margin-left: 190px;">Pending Packing
                        <div id="pendingValue"><%= penPacking %></div>
                    </div>
                    <div class="col-md-4" id="pendingBox2"style="margin-left: 70px;">Pending Shipping
                        <div id="pendingValue"><%= penShipping %></div>                     
                    </div>
                        
                    <div class="col-md-4" id="pendingBox3"style="margin-left: 70px;">Pending Delivery
                        <div id="pendingValue"><%= penDelivery %></div>                    
                    </div>                        
                </div>
            </div>
        </div>       
        
    </body>
      <!-- Footer -->
    <footer class="container-fluid" id="footer" style="background-color:#C5D8A4;">
            <span class="d-block text-center align-middle py-3" style="color:#F4FCD9;">@AMIT3094 GUI and Web Application Programming (Staff Mainpage)</span>
    </footer>
</html>
