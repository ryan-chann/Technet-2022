
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Technetuser"%>
<%
    Technetuser technetStaff = (Technetuser) session.getAttribute("technetStaff");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Staff</title>
        
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
            
            /* createStaff form head */
            
            #csReturnBut{
                padding: 20px 0px 10px 15px;

            }
            #csReturnBut a{
                color:black;
            }
            #createStaff{
                padding: 20px 0px 10px 30px;
                color: #FFFFFF;
 
            }
            
            /* createStaff form */
            #createStaff-container{
                display: block;
                left: 30%;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: 470px;
                margin-top: 100px;
                width: 450px;
            }
            
            /* Create gap between input fields and the container */
            #staffId,#firstName,#lastName,#eMail,#phoneNum,#staffPass, #RestaffPass{
                padding: 4px 0px 4px 40px;
            }
                        
            /* Button Style */
            #sSubmitButton{
                position: relative;
                left: 80px;
            }

            #submitButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                display: inline-block;
                width: 100px;
                height: 30px;
                border-radius: 20px;
            }

            #submitButton:hover, #resetButton:hover{
                background-color: #000000;
            }
            /* To create a the size between input fields */
            
            #staffId{
                margin-top: 15px;
            }
            #firstname{
                margin-left: 67.5px;
            }
            #lastname{
                margin-left: 68px;
            }
            #staffpass{
                margin-left: 75px;
            }
            #restaffpass{
                margin-left: 22.5px;
            }
            
            /*set placeholder font size*/
            
            ::placeholder {
                font-size: 13px;
            }
            
            /* Footer Styles */
            #footer{
                margin: 87px 0px 0px 0px;
            }
        </style>
        
        
    </head>
    <body>
        <section class="container-fluid" id="createStaff-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back arrow -->
                <div class="col-1" id="csReturnBut">
                    <a href="dashboard.jsp"> 
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
                
                <!-- CREATE STAFF heading -->
                <div class="col">
                    <h2 id="createStaff">INSERT NEW STAFF </h2>
                </div>         
            </div>
            
            <!-- CREATE STAFF form -->
            <form method="post" action="../TechnetServlet">
                <!-- Staff ID -->
                <div class="row" id="staffId">
                    <div class="col">
                        <label for="staffID">Technet Staff ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= technetStaff.getTechnetid() %></label>
                        <!-- user ID auto generate in database and display -->
                    </div>                    
                </div>
                <br/>
                
                <!-- First Name -->
                <div class="row" id="firstName">
                    <div class="col" id="firstnameInput">
                        <label for="firstname">First Name: </label>
                        <input type="text" name="firstname" id="firstname" placeholder="Enter you first name">
                    </div>
                </div>
                <br/>
                
                <!-- Last Name -->
                <div class="row" id="lastName">
                    <div class="col" id="lastnameInput">
                        <label for="lastname">Last Name: </label>
                        <input type="text" name="lastname" id="lastname" placeholder="Enter you last name">
                    </div>
                </div>
                <br/>
                
                
                <!-- Password -->
                <div class="row" id="staffPass">
                    <div class="col" id="staffpassInput">
                        <label for="staffpass">Password: </label>
                        <input type="password" name="staffpass" id="staffpass" placeholder="Enter password">
                    </div>
                </div>
                <br/>
                
                <!-- Retype Password -->
                <div class="row" id="RestaffPass">
                    <div class="col" id="restaffPassInput">
                        <label for="restaffpass">Retype Password: </label>
                        <input type="password" name="restaffpass" id="restaffpass" placeholder="Re Enter password">
                    </div>
                </div>
                <br/>
                
                <!-- CREATE Button -->
                <div class="row" id="sSubmitButton" >
                    <div class="col" id="submit" style="padding:10px 0px 0px 100px">
                        <input type="submit" id="submitButton"  name="create" value="Create" required>
                    </div>
                </div>
            </form>
        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Create Staff)</span>
    </footer>
     
     
</html>