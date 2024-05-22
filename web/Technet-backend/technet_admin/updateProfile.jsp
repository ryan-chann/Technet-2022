
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Technetuser"%>
<% 
  Technetuser technetAdmin = (Technetuser) session.getAttribute("technetUser");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Profile</title>
        
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
            
            /* updateStaff form head */
            
            #usReturnBut{
                padding: 20px 0px 10px 15px;

            }
            #usReturnBut a{
                color:black;
            }
            #updateStaff{
                padding: 20px 0px 10px 50px;
                color: #FFFFFF;
            }
            
            /* updateStaff form */
            #updateStaff-container{
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
            #staffId,#firstName,#lastName,#staffPass, #RestaffPass{
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
                margin-left: 32.2px;
            }
            #lastname{
                margin-left: 33px;
            }
            #staffpass{
                margin-left: 39.5px;
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
        <section class="container-fluid" id="updateStaff-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back arrow -->
                <div class="col-1" id="usReturnBut">
                    <a href="displayProfile.jsp"> 
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
                
                <!-- UPDATE STAFF heading -->
                <div class="col">
                    <h2 id="updateStaff">Modify Your Profile</h2>
                </div>        
            </div>
            
            <!-- UPDATE STAFF form -->
            <form method="post" action="../TechnetServlet">
                <!-- Staff ID -->
                <div class="row" id="staffId">
                    <div class="col">
                        <label for="staffID">Your Technet ID :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= technetAdmin.getTechnetid() %></label>
                        <!-- Staff ID cant modify ,ID get from database-->
                    </div>                    
                </div>
                <br/>
                
                
                <!-- First Name -->
                <div class="row" id="firstName">
                    <div class="col" id="firstnameInput">
                        <label for="firstname">New First Name: </label>
                        <input type="text" name="firstname" id="firstname" value="<%= technetAdmin.getFirstname() %>" required>
                    </div>
                </div>
                <br/>
                
                <!-- Last Name -->
                <div class="row" id="lastName">
                    <div class="col" id="lastnameInput">
                        <label for="lastname">New Last Name: </label>
                        <input type="text" name="lastname" id="lastname" value="<%= technetAdmin.getLastname() %>" required>
                    </div>
                </div>
                <br/>
                
                
                <!-- Password -->
                <div class="row" id="staffPass">
                    <div class="col" id="staffpassInput">
                        <label for="staffpass">New Password: </label>
                        <input type="password" name="staffpass" id="staffpass" placeholder="Enter new password" required>
                    </div>
                </div>
                <br/>
                
                <!-- Retype Password -->
                <div class="row" id="RestaffPass">
                    <div class="col" id="restaffPassInput">
                        <label for="restaffpass">Retype Password: </label>
                        <input type="password" name="restaffpass" id="restaffpass" placeholder="Re Enter password" required>
                    </div>
                </div>
                <br/>
                
                <!-- UPDATE Button -->
                <div class="row" id="sSubmitButton" >
                    <div class="col" id="submit" style="padding:10px 0px 0px 100px">
                         <input type="hidden" name="profile" value="adminProfile">
                        <input type="submit" id="submitButton" name="update" value="Update" required>
                    </div>
                </div>
            </form>
        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Update Admin Profile)</span>
    </footer>
     
     
</html>