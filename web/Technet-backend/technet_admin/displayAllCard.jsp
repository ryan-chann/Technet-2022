<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Paymentcard"%>
<%@page import="java.util.List"%>
<%
   List<Paymentcard> paymentcards = (List<Paymentcard>) session.getAttribute("paymentcard");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Payment Cards</title>
        
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
                padding-top: 70px;
            }


            /* Payment Cards Details Div */
            #card-details-container{
                font-size: 20px;
                display:block;
                margin:auto;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                width: 70%;
                padding-bottom: 20px;
            }
            
            
            /* Payment Cards Details Text */
            #card-details-container b, span{
                margin-top:80px;
            }
            /* Footer Styles */
            #footer{
                margin: 160px 0px 0px 0px;
            }
        </style>
    </head>
    
    <body>
        <section class="container-fluid" id="card-details-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back Arrow -->
                <div style="margin:20px 20px 20px 20px;" class="col-1" >
                    <a href="dashboard.jsp"> 
                        <i  style ="margin-top: 20px" color="black" onclick="myFunction()" class="fa-solid fa-arrow-left-long fa-2x" ></i>
                    </a>
                </div>
                <!-- Payment Cards Details heading -->
                <div style="margin:35px 20px 20px 20px;" class="col-8 text-center">
                    <h2>Payment Cards</h2>
                </div>         
            </div>

            <!-- Payment Cards Details Container -->
            <div style="margin:20px 20px 20px 20px;" id="card-table" class="row">
                 <table class="table table-bordered">
                <thead>
                  <tr>
                    <th scope="col">Payment Card</th>
                    <th scope="col">Balance</th>
                    
                  </tr>
                </thead>
  <%
                    for (Paymentcard paymentcard : paymentcards) {


                %>
                <tr>
                    <td scope="row"><%= paymentcard.getCardnumber() %></td>
                    <td><%= paymentcard.getBalance() %></td>
                    
                    
                  </tr>

                </tr>
                <% }%>
                
            </table>

                

            </section>
        </body>
         <!-- Footer-->
        <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
                <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Display All Payment Cards)</span>
        </footer>
         
     
    </html>