<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="entity.Paymentcard"%>



<%

    Paymentcard paymentcard = (Paymentcard) session.getAttribute("paymentcard");
    Object messageD = session.getAttribute("messageD");
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Display Payment card</title>
        
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
                font-size: 16px;
            }
            
            /* title */
            #title{
                margin-left:80px;
                margin-right: 80px;
            }
            
            /* display payment card container */
            #displayCard-container{
                padding: 30px 20px 30px 20px;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                margin-top: 135px;
                width: 40%;
            }
            
            #card-details-container{
                margin-left:30px;
            }
            
            /* buttons */
            #btns{
                margin-top: 30px;
                margin-left: 30px;
            }
       
            #update-btn{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                width: 100px;
                height: 35px;
                margin-left: 70px;
                border-radius: 20px;
            }
            #update-btn:hover{
                background-color: #000000;
            }
            
            #deleteButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                width: 100px;
                height: 35px;
                border-radius: 20px;
            }
            #deleteButton:hover{
                background-color: #000000;
            }


            /* Footer Styles */
            #footer{
                margin: 112px 0px 0px 0px;
            }
            
            
            
            
        </style>
        

        
    </head>
    <body>
        <section class="container-fluid" id="displayCard-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back arrow -->
                <div class="col-1" id="dpReturnBut">
                    <a style="color:black;" href="dashboard.jsp"> 
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
                
                <!-- search card title -->
                <div class="col">
                    <h2 id="title">Payment Card Details</h2>
                </div>         
            </div>
            
            <!--card details container -->
            <div id="card-details-container" class="container-fluid">
                <!-- card details -->
            <div class="row justify-content-center">
            <div style="margin-top:20px;" class="col">
                <b>Card Number :</b>
            </div>
                <div style="margin-top:20px;" class="col"><%= paymentcard.getCardnumber() %></div>
            </div>
            <div class="row">
            <div style="margin-top:20px;" class="col">
                <b>Balance :</b>
            </div>
                <div style="margin-top:20px;" class="col"><%= paymentcard.getBalance() %></div>
            </div>
            </div>
            <!-- buttons -->
            <div class="row" id="btns">
                <div class="col-6">
                    <form action="../CRUDPaymentcard" method="Get"> 
                       <input type="hidden"  name="cardnumber"  value="<%= paymentcard.getCardnumber() %>">
                       <input type="submit" name="crudFunction" id="update-btn"  value="Update">
                    </form>
                </div>
                <div class="col-6">
                    <input type="button" id="deleteButton" value="Delete">
                </div>
            </div>
            
                       <!-- validation -->
            <script>
            
            $(document).ready(function() {
                $("#deleteButton").click(function() {
                    //double comform delete
                     let text = "Are you sure you want to delete card -> <%= paymentcard.getCardnumber() %> ? ";
                    if (confirm(text) == true) {
                      document.location.href="../CRUDPaymentcard?crudFunction=Delete&cardnumber=<%= paymentcard.getCardnumber() %>";  

                    } else {
                      alert("You canceled");

                    }
                });
             });

             var massage ="${messageD}";
                if(massage){
                    function myFunction() {
                      alert("${messageD}");
                    }

                  window.onload = myFunction(); 
                 }
             
            </script>
            

        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid fixed-bottom" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Display Payment Card)</span>
    </footer>
    <!-- clean up session  --> 
    <c:remove var="laptop" scope="session" />
    <c:remove var="messageD" scope="session" />
</html>