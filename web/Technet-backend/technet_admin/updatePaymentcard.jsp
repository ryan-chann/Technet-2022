<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="entity.Paymentcard"%>

<%
    Paymentcard paymentcard = (Paymentcard) session.getAttribute("paymentcard");
    Object messageU = session.getAttribute("messageC");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Payment Card</title>
        
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

        
        <script>

             var massage ="${messageU}";
                if(massage){
                    function myFunction() {
                      alert("${messageU}");
                    }

                  window.onload = myFunction(); 
                 }
            </script>
            
            <style>
            /* Default font family */
            body{
                font-family: 'Roboto';
                background-color: #E3CAA5;
                font-size: 16px;
            }
            
            /* title */
            #title{
                margin-right:10%;
            }
            
            /* display payment card container */
            #update-card-container{
                padding: 30px 20px 30px 20px;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                margin-top: 135px;
                width: 40%;
            }
            
            #cardNum-display, #card-input{
                margin-top: 20px;
            }
            
            /* buttons */
            #btns{
                margin-top: 30px;
            }
       
            #submitButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                width: 100px;
                height: 35px;
                border-radius: 20px;
            }
            #submitButton:hover{
                background-color: #000000;
            }
            


            /* Footer Styles */
            #footer{
                margin: 112px 0px 0px 0px;
            }
            
            
            
            
        </style>
    </head>
    <body>
        <!-- Heading row -->
        <div class="container-fluid" id="update-card-container">
            <div class="row">
                
                <!-- Back Arrow -->
                <div class="col-2" id="ReturnBut">
                    <a style="color:black;" href="../CRUDPaymentcard?crudFunction=Search&cardnumber=<%= paymentcard.getCardnumber() %>">
                            <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                        </a>
                </div>
                               
                <!-- Insert Product heading -->
                <div class="col-9 text-center">
                    <h2 id="title">Update Card Balance</h2>
                </div>         
            </div>
        
                            <!-- update card container -->
        <div class="container-fluid">
            <!-- current card number -->
        <div id="cardNum-display" class="row">
            <div class="col-6">Card Number : </div>
            <div class="col-6"><%= paymentcard.getCardnumber() %></div>
        </div>
        <!-- update balance form -->
         <form id="card-input" action="../CRUDPaymentcard" method="get">

             <div class="row">
                 <div class="col-6">
             <label for="balance">Update Balance : </label>
                 </div>
                 <div class="col-6">
             <input class="form-control" name="balance" id="balance" placeholder="Enter Balance" required>
                 </div>
            <input type="hidden" name="cardnumber" id="cardnumber" value="<%= paymentcard.getCardnumber() %>" >
             </div>
             <!-- button -->
             <div id="btns" class="row justify-content-center">
            <input type="submit" name="crudFunction" id="submitButton"  value="Save" >
             </div>

        </form>
        </div>
        </div>
    </body>
    <!-- footer-->
        <footer class="container-fluid fixed-bottom" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Update Card Balance)</span>
    </footer>
    
    <c:remove var="messageU" scope="session" />
</html>
