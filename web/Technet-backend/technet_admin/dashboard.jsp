<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Technetuser"%>
<% 
  //Get the attributes
  Technetuser technetUser = (Technetuser) session.getAttribute("technetUser");
  Object penPacking = session.getAttribute("penPacking");
  Object penShipping = session.getAttribute("penShipping");
  Object penDelivery = session.getAttribute("penDelivery"); 
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Admin Dashboard</title>
        
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
            #d1, #d2, #d3, #d4, #d5, #d6, #d7,#d8,#d9,#d10{
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
                margin-left: 5.5px; 
            }
            #d5{
                margin-left: 11px; 
            }
            #d6{
                margin-left: 11px; 
            }
            #d7{
                margin-left: 17px; 
            }
            #d8{
                margin-left: 9px; 
            }  
            #d9{
                margin-left: 5px; 
            } 
            #d10{
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
            .menu-technet ul ul { 
                display: none;
            }
            .menu-technet ul ul li a { 
                color: #ffffff; 
                text-decoration: none;  
                display: block; 
                padding-left: 35px; 
                position: relative;
            }
            .menu-technet a:hover { 
                background: #E3CAA5;
            }
            #menu-child-lists{
                font-size: 13px;
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
        <script>            
            $(document).ready(function() {
              //  function to open / close menu items
              $(".menu-technet a").click(function() {
                var link = $(this);
                var closest_ul = link.closest("ul");
                var parallel_active_links = closest_ul.find(".active")
                var closest_li = link.closest("li");
                var link_status = closest_li.hasClass("active");
                var count = 0;

                closest_ul.find("ul").slideUp(function() {
                  if (++count == closest_ul.find("ul").length)
                  parallel_active_links.removeClass("active");
                });

                if (!link_status) {
                  closest_li.children("ul").slideDown();
                  closest_li.addClass("active");
                }
              })
            })
            
        </script>
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
                      <a href="../TechnetServlet?action=profile&staffID=<%= technetUser.getTechnetid() %>&user=admin "> <i class="fa-solid fa-id-badge" id="icon"></i><b id="d2"> Profile</b></a>
                    </li>
                    <li class="menu-technet-child">
                      <a href="#"><i class="fa-solid fa-id-card" id="icon"></i><b id="d3">Manage staffs</b></a>
                        <ul>
                           <li><a href="../DisplayStaffTable" id="menu-child-lists"><b>My Staff</b></a></li>
                           <li><a href="../TechnetServlet?action=create" id="menu-child-lists"><b>Create Staff</b></a></li>
                           <li><a href="searchStaff.jsp" id="menu-child-lists"><b>Modify Staff</b></a></li>
                        </ul>
                    </li>
                    <li class="menu-technet-child">
                        <a href="#"><i class="fa-solid fa-gears" id="icon"></i><b id="d4"> Maintain product</b></a>
                        <ul>
                            <li><a href="../DisplayLaptopTable" id="menu-child-lists"><b>Technet Products</b></a></li>
                            <li><a href="cLaptopCategory.jsp" id="menu-child-lists"><b>Insert New Product</b></a></li>
                            <li><a href="searchProduct.jsp" id="menu-child-lists"><b>Search Product</b></a></li>
                        </ul>
                    </li>
                    <li class="menu-technet-child">
                        <a href="#"><i class="fa-solid fa-credit-card" id="icon"></i><b id="d5">Payment Card</b></a>
                        <ul>
                            <li><a href="../CRUDPaymentcard?crudFunction=DisplayAll" id="menu-child-lists"><b>Payment Card</b></a></li>
                            <li><a href="createPaymentcard.jsp" id="menu-child-lists"><b>Insert New Payment Card</b></a></li>
                            <li><a href="searchPaymentcard.jsp" id="menu-child-lists"><b>Search Payment Card</b></a></li>
                        </ul>
                    </li>
                    <li class="menu-technet-child">
                      <a href="../DisplayOrder?orderCRUD=display"><i class="fa-solid fa-cart-shopping" id="icon"></i><b id="d6">Manage orders</b></a>
                    </li>
                    <li class="menu-technet-child">
                      <a href="../DisplayOrder?orderCRUD=report&reportType=Final Report"><i class="fa-solid fa-file-lines" id="icon"></i><b id="d7">Reporting</b></a>
                    </li>
                    <li class="menu-technet-child">
                      <a href="../DisplayOrder?orderCRUD=report&reportType=Order Report"><i class="fa-solid fa-chart-column" id="icon"></i><b id="d8"> Records</b></a>
                    </li>
                    <li class="menu-technet-child">
                        <a href="../Comment?id=<%= technetUser.getTechnetid() %>"><i class="fa-solid fa-comments" id="icon"></i><b id="d9"> Comments</b></a>
                    </li>
                    <li class="menu-technet-child">
                      <a href="../TechnetServlet?action=logout "><i class="fa-solid fa-arrow-right-from-bracket" id="icon"></i><b id="d10"> Log Out</b></a>
                    </li>
                  </ul>
                </div>
              </div>
            <!--/. Side navigation links bar -->
            
            <div class="col-md-10" style="background-color: #E5E5E5;">
                <h1 id="dashTitle" style="text-align: center;">WELCOME BACK! <%= technetUser.getFirstname() %></h1>
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
            <span class="d-block text-center align-middle py-3" style="color:#F4FCD9;">@AMIT3094 GUI and Web Application Programming (Admin Mainpage)</span>
    </footer>
</html>
