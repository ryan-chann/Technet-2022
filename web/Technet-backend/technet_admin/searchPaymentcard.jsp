<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
    
    Object messageR = session.getAttribute("messageR");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Payment Card</title>
        
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

        <!-- error message -->
        <script>
             var massage ="${messageR}";
                if(massage){
                    function myFunction() {
                      alert("${messageR}");
                    }

                  window.onload = myFunction(); 
                 }
            
            
        </script>
        
        <style>
        /* Default font family */
            body{
                font-family: 'Roboto';
                background-color: #E3CAA5;
                padding-top: 100px;
            }
            
            /* title */
            #title{
                margin-left:80px;
            }

            /* Search Payment Cards Container */
            #search-container{
                font-size: 20px;
                display:block;
                margin:auto;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                width: 40%;
                padding: 20px 20px 20px 20px;
            }
            
            /* width of input text */
            #cardnumber{
                width: 50%;
            }
            
            /* create space between content */
            #input-1, #btns {
                margin-top: 20px;
            }
            
            /* button styling */
            #submitButton{
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

            /* Footer Styles */
            #footer{
                margin: 160px 0px 0px 0px;
            }
            </style>
    </head>
    <body>
        
        <!-- search card container -->
        <div id="search-container" class="container-fluid">
            <div class="row">
                <!-- Back arrow -->
                <div class="col-1" id="dpReturnBut">
                    <a style="color:black;" href="dashboard.jsp"> 
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
                
                <!-- search card title -->
                <div class="col">
                    <h2 id="title">Search Payment Card </h2>
                </div>         
            </div>
            
            <div class="row" id="search-box">
                <!-- search card form -->
                <form action="../CRUDPaymentcard" method="get">
                    <div id="input-1" class="row">
                        <!-- input field -->
                    <label class="col-6" for="cardnumber">Enter Card Number : </label>
                    <input class=" col-6 form-control" name="cardnumber" id="cardnumber" placeholder="eg. (XXXX-XXXX-XXXX-XXXX)" required>
                    </div>
                    <!-- button -->
                    <div id="btns" class="row justify-content-center">
                    <input type="submit" id="submitButton"  name="crudFunction" value="Search" required>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <!-- footer -->
    <footer class="container-fluid fixed-bottom" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Search Payment Card)</span>
    </footer>
    <c:remove var="messageR" scope="session" />
</html>


