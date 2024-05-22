
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Login</title>
        
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
            #sign-in-technet{
                padding: 20px 0px 10px 90px;
                color: #FFFFFF;
            }
            
            /* Sign in form */
            #sign-in-container{
                display: block;
                left: 30%;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: 350px;
                margin-top: 80px;
                width: 500px;
            }
            
            /* Create gap between input fields and the container */
            #technetId, #technetPass, #RetechnetPass{
                padding: 7px 0px 10px 50px;
            }
                        
            /* Button Style */
            #Buttons{
                position: relative;                
                left: 110px;
            }

            #submitButton, #resetButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                display: inline-block;
                width: 100px;
                height: 35px;
                border-radius: 20px;
            }

            #submitButton:hover, #resetButton:hover{
                background-color: #000000;
            }
            /* To create a the size between input fields */
            #technetID{
                margin: 0 0 0 70px;
            }
            #technetpass{
                margin: 0 0 0 75px;
            }
            #retechnetpass{
                margin: 0 0 0 22px;
            }
            /* Footer Styles */
            #footer{
                margin: 114px 0px 0px 0px;
            }
        </style>
    </head>
    <body>
        <section class="container-fluid" id="sign-in-container">
            <!-- Heading row -->
            <div class="row">
                               
                <!-- SIGN-UP heading -->
                <div class="col">
                    <h2 id="sign-in-technet">TECHNET SIGN IN</h2>
                </div>         
            </div>
            <!-- Sign-up form -->
            <form method="post" action= "TechnetServlet">
                <!-- Admin ID -->
                <div class="row" id="technetId">
                    <div class="col" id="technetIDInput">
                        <label for="technetID">Technet ID: </label>
                        <input type="text" name="technetID" id="technetID" required>
                    </div>                    
                </div>
                <br/>
                
                <!-- Password -->
                <div class="row" id="technetPass">
                    <div class="col" id="technetpassInput">
                        <label for="password">Password: </label>
                        <input type="password" name="technetpass" id="technetpass" required>
                    </div>
                </div>
                <br/>
                
                <!-- Retype Password -->
                <div class="row" id="RetechnetPass">
                    <div class="col" id="retechnetPassInput">
                        <label for="password">Retype Password: </label>
                        <input type="password" name="retechnetpass" id="retechnetpass" required>
                    </div>
                </div>
                <br/>
                
                <!-- Buttons -->
                <div class="row" id="Buttons">
                    <div class="col" id="submit">
                        <input type="submit" id="submitButton" name="signIn" value="Sign-In">
                    </div>
                    <div class="col" id="reset" style="padding-right:250px;">
                        <input type="reset" id="resetButton" value="Reset">
                    </div>
                </div>
            </form>
        </section>
    </body>
    
     <!-- Footer -->
    <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color: rgb(227, 202, 165);">@AMIT3094 GUI and Web Application Programming (Technet Admin/Staff Login)</span>
    </footer>
</html>
