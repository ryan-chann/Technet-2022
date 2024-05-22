<%-- 
    Document   : check_order
    Created on : Apr 5, 2022, 3:41:17 PM
    Author     : bsgan
--%>

<%@page import="entity.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Orders order = (Orders) session.getAttribute("order");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        
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
                background-color: #E3CAA5;
            }
            
            
            #ReturnBut{
                padding: 20px 0px 10px 15px;

            }
            #ReturnBut a{
                color:black;
            }
            
            /* Sign-in text */
            #order-details-title{
                padding: 20px 0px 10px 50px;
                color: #FFFFFF;
            }
            
            /* Order Details Div */
            #order-details-container{
                padding: 5px 30px 5px 50px;
                font-size: 20px;
                display:block;
                margin:auto;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: 500px;
                margin-top: 60px;
                width: 600px;
            }
            
            /*Table*/
            #name-td{
                text-align: right;
                padding: 10px 10px 0px 10px;
                width:250px;
                height:10px;
                
            }
            #infor_td{
                text-align: left;
                padding: 10px 10px 0px 10px;
                width:350px;
                height:10px;
            }
            
            /* Order Details Text */
            #order-details-container b, span{
                margin-top:80px;
            }
            
            #readminpass{
                margin: 0 0 0 22px;
            }
            /* Footer Styles */
            #footer{
                margin: 110px 0px 0px 0px;
            }
        </style>
    </head>
    <body>
        <section class="container-fluid" id="order-details-container">
            
            
            
            <!-- Heading row -->
            <div class="row">
                <!-- Back arrow -->
                <div class="col-1" id="ReturnBut">
                    <a href="displayOrder.jsp">
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
               
                <!-- Order Details heading -->
                <div class="col">
                    <h2 id="order-details-title"><%= order.getOrderid()%> ORDER DETAILS</h2>
                </div>        
            </div>
            
            <% String laptop = String.valueOf(order.getLaptopid()).substring(24, 35); %>
            <!-- Order Details Container -->
            <table id="order-details">
                <tr>
                    <td id="name-td">Order ID :</td>
                    <td id="infor_td"><%= order.getOrderid()%></td>
                </tr>
                <tr>
                    <td id="name-td">Email :</td>
                    <td id="infor_td"><%= order.getEmail() %></td>
                </tr>
                <tr>
                    <td id="name-td">laptop ID :</td>
                    <td id="infor_td"><%= laptop %></td>
                </tr>
                <tr>
                    <td id="name-td">Shipping Address :</td>
                    <td id="infor_td"><%= order.getAddress()%></td>
                </tr>
                <tr>
                    <td id="name-td" >Order Status :</td>
                    <td id="infor_td"><%= order.getStatus()%></td>
                </tr>
                <tr>
                    <td id="name-td">Quantity :</td>
                    <td id="infor_td"><%= order.getQuantity()%></td>
                </tr>
                <tr>
                    <td id="name-td">Order Date :</td>
                    <td id="infor_td"><%= order.getOrderdate()%></td>
                </tr>
                <tr>
                    <td id="name-td">Price :</td>
                    <td id="infor_td">RM<%= order.getPrice()%></td>
                </tr>
            </table>
                

        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Check Order for Staff)</span>
    </footer>
</html>
