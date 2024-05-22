<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="entity.Paymentcard"%>

<%
    Object messageC = session.getAttribute("messageC");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert a New Payment Card</title>
        
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
            /*error message*/

             var massage ="${messageC}";
                if(massage){
                    function myFunction() {
                      alert("${messageC}");
                    }

                  window.onload = myFunction(); 
                 }
            </script>
            <style>
        /* Default font family */
            body{
                font-family: 'Roboto';
                background-color: #E3CAA5;
                padding-top: 70px;
            }
            
            /* title */
            #title{
                margin-right:50px;
            }

            /*text input width */
            #input-1 input, #input-2 input{
                width: 50%;
            }

            /* Create Payment Cards Div */
            #card-container{
                font-size: 20px;
                display:block;
                margin:auto;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                width: 40%;
                padding: 20px 20px 20px 20px;
            }
            
            /*create space between content*/
            #input-1, #input-2, #btns{
                margin-top: 30px;
            }
            
            /* buttons styling */
            #submitButton, #resetButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                display: inline-block;
                width: 150px;
                height: 35px;
                border-radius: 20px;
                margin-right:20px;
            }
            
            #submitButton:hover{
                background-color: blue;
            }
            
            #resetButton:hover{
                background-color: red;
            }
            /* Footer Styles */
            #footer{
                margin: 160px 0px 0px 0px;
            }
            </style>
    </head>
    <body>
        <div id="card-container" class="container-8">
                <!-- Back arrow -->
                <div class="row">
                <div class="col-1" id="dpReturnBut">
                    <a style="color:black;" href="dashboard.jsp"> 
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
                
                <!-- create payment card heading -->
                <div class="col">
                    <h2 class="text-center" id="title">Create Payment Card</h2>
                </div>
                </div>
           
                <!-- create payment card form -->
         <form id="create-card-form" action="../CRUDPaymentcard" method="get">
             <!-- label and input field -->
             <div id="input-1" class="row">
                 <label class="col-6" for="cardnumber">Card Number : </label>
                 <input class="col-6 form-control" id="cardnumber" name="cardnumber" placeholder="eg. (1234-5678-8765-4321)" required>
             </div>
             <div id="input-2" class="row">
                 <label class="col-6" for="balance">Card Balance : </label>
            <input class="col-6 form-control" name="balance" id="balance" placeholder="Enter Balance" required>
             </div>
             <!-- buttons -->
             <div id="btns" class="row justify-content-center">
                 <input class="col-6" type="submit" name="crudFunction" id="submitButton"  value="Create" >
            <input class="col-6" type="reset" name="crudFunction" id="resetButton"  value="Reset" >
             </div>
        </form>
                 </div>
        
    </body>
    <!-- footer-->
    <footer class="container-fluid fixed-bottom" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Create Payment Card)</span>
    </footer>
    
    <c:remove var="messageC" scope="session" />
</html>
