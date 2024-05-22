<%-- 
    Document   : order
    Created on : Mar 15, 2022, 5:45:15 PM
    Author     : bsgan
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Orders"%>
<%@page import="entity.Laptop"%>
<%@page import="java.util.List"%>

<%
   List<Orders> orders = (List<Orders>) session.getAttribute("orders");
   String orderid;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="15" />
        <title>Orders</title>
        
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

            /* Sign-in text */
            #order-details-title{
                padding-bottom: 10px;
                margin: 10px auto 20px 50px;
                color: #FFFFFF;
            }

            /* Order Details Div */
            #order-details-container{
                padding: 5px 30px 5px 30px;
                font-size: 20px;
                display:block;
                margin:auto;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: 500px;
                margin-top: 80px;
                width: 1000px;
            }
            
            #status{
                border: none;
            }
            
            button{
                background-color: #CEAB93;
            }
            
            input{
                background-color: #CEAB93;
            }

            /* Order Details Text */
            #order-details-container b, span{
                margin-top:80px;
            }
            
            #readminpass{
                margin: 0 0 0 22px;
            }
            
            /*paginatin*/
            .order-pagination{
                padding-left: 300px;
            }
            
            .order-pagination a{
                color: black;
                float: left;
                padding: 55px 16px 50px;
                text-decoration: none;
            }
            
            .order-pagination a:active{
                border-radius: 5px;
                color: white; 
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
                <!-- Back Arrow -->
                <div class="col-1" >
                    <a href="../TechnetServlet?action=dashboard&user=admin"> 
                        <i  style ="margin-top: 20px" color="black" onclick="myFunction()" class="fa-solid fa-arrow-left-long fa-2x" ></i>
                    </a>
                </div>
                <!-- Order Details heading -->
                <div class="col-8 text-center">
                    <h2 id="order-details-title">Technet Orders</h2>
                </div>         
            </div>

            <!-- Order Details Container -->
            <div class="row">
                 <table class="table table-bordered">
                <thead>
                  <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Laptop ID</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Status</th>
                    <th scope="col">Check Order</th>
                    <th scope="col">Update Status</th>
                    <th scope="col">Cancel Order</th>
                  </tr>
                </thead>

                <%
                    for (Orders order : orders) {
                       String laptop = String.valueOf(order.getLaptopid()).substring(24, 35);
                %>
                
                <tr>
                    <td scope="row"><%= order.getOrderid() %></td>
                    <td><%= laptop %></td>
                    <td><%= order.getQuantity() %></td>
                    <form action="../DisplayOrder" method="get">
                        <td>
                                <select name="status" id="status" style="background-color:#CEAB93">
                                    <option value="<%= order.getStatus() %>"><%= order.getStatus() %></option>
                                    <!-- if value same with status, will not not display again  -->
                                    <% if (!order.getStatus().equals("Pending Packing")) { %>
                                      <option value="Pending Packing">Pending Packing</option>

                                    <% } if(!order.getStatus().equals("Pending Shipping")){ %>
                                      <option value="Pending Shipping">Pending Shipping</option>

                                    <% } if(!order.getStatus().equals("Pending Delivery")){ %>
                                       <option value="Pending Delivery">Pending Delivery</option>

                                    <% } if(!order.getStatus().equals("Shipped")){ %>
                                      <option value="Shipped">Shipped</option>

                                    <% }  if(!order.getStatus().equals("Delivering")){ %>
                                      <option value="Delivering">Delivering</option>

                                    <% } if(!order.getStatus().equals("Delivered")){ %>
                                      <option value="Delivered">Delivered</option>

                                    <% }  if(!order.getStatus().equals("Received")){ %>
                                       <option value="Received">Received</option>
                                    <% } %>
                                </select>
                        </td>
                        <td>
                            <!--link to check_order page-->
                            <input type="hidden" name="orderid" value="<%= order.getOrderid() %>">
                            <input type="submit" name="orderCRUD" value="Check" >
                         </td>
                         <td>

                             <input type="hidden" name="orderid" value="<%= order.getOrderid() %>">
                             <input type="submit" name="orderCRUD" value="Update" >
                         </td>
                    </form> 
                         <td>

                              <button type="button" onclick="cancelfunciton('<%= order.getOrderid() %>')" >Cancel</button>
                         </td>                         
                  </tr>

                </tr>
                <% }%>
            </table>
            
            <script>
  
            function cancelfunciton(orderid){

                        //double comform delete
                        let text = "Are you sure you want to cancel this order ? ";
                        if (confirm(text) == true) {
                          document.location.href="../DisplayOrder?orderCRUD=cancel&orderid="+orderid;  

                        } else {
                          alert("You canceled");
                          document.location.href="../DisplayOrder?orderCRUD=display";
                        }
                    }
                    
             var massage ="${messageD}";
                if(massage){
                    function myFunction() {
                      alert("${messageD}");
                    }

                  window.onload = myFunction(); 
                 }
             
            </script>
            
            </div>
            
            <div class="center-order-pagination">
                <div class="order-pagination">

                      <a href="../DisplayOrder?orderCRUD=display">1</a>
                      <a href="../DisplayOrder?orderCRUD=display&page=2">2</a>
                      <a href="../DisplayOrder?orderCRUD=display&page=3">3</a>
                      <a href="../DisplayOrder?orderCRUD=display&page=4">4</a>
                      <a href="../DisplayOrder?orderCRUD=display&page=5">5</a>
                      <a href="../DisplayOrder?orderCRUD=display&page=6">6</a>

           </div>
            </section>
        </body>
        
         <!-- Footer c:remove var="orders" scope="session" />-->
        <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
                <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Display Order for Admin)</span>
        </footer>

    
    </html>