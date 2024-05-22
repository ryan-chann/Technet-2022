<!--
	Author: Ryan Chan Joon Yew
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="#" type="image" sizes="16x16">
        
        <title>Log In</title>
        
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
           
        <!--Load Bootstrap Stylesheet-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
             
        <!--Load Fontawesome-->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.0.0/css/all.min.css"/>
        
        <!-- Load JQuery -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
        
        <!--Load Fontawesome script -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.0.0/js/all.min.js"></script>
        
        <!--Load Bootstrap scripts-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        <style>
            /* Default font family */
                body{
                    font-family: 'Roboto';
                }
                
                #space{
                    height:50px;
                }
                
                /* Log In container */
                #log-in-container{
                    display: block;
                    left: 30%;
                    background-color: #F5B517;
                    border-style: none;
                    border-radius: 40px;
                    height: 300px;
                    margin: auto;
                    width: 700px;
                }
                
                /* Back Icon */
                #back-arrow{
                    padding: 25px 0px 0px 25px;
                }

                #back-arrow button{
                    background-color: #F5B517;
                    border: none;
                }
                
                /* Log In Text */
                #log-in-text-2{
                    padding: 20px 0px 0px 220px;
                    color: #FFFFFF;
                }
                
                #sPassword, #sEmail{
                    padding: 5px 0px 10px 50px;
                }
                
                #emailInput label{
                    padding:0px 30px 0px 0px;
                } 
                
                #email, #password{
                    width: 90%;
                }
                
                /* Button Style */
                #sSubmitButton{
                    position: relative;
                    top: 15px;
                    left: 280px;
                }

                #submitButton{
                    background-color: #3E3E3E;
                    border-style:none;
                    color: #FFFFFF;
                    display: inline-block;
                    width: 100px;
                    height: 35px;
                    border-radius: 20px;
                }

                #submitButton:hover{
                    background-color: #000000;
                }
                
                #errorMessage{
                    color: red;
                    display:block;
                    margin:auto;
                    text-align: center;
                }
        </style>
    </head>
    
    <body>
        <!-- Include header -->
        <jsp:include page = "header.jsp"/>
        
        <div id="space"></div>
        
        <!-- Error Message -->
        <div id="errorMessage">
            <%
                if(session.getAttribute("InvalidLogIn") != null){
                    String invalidLogIn = (String)session.getAttribute("InvalidLogIn");
                    out.print("<p>" + invalidLogIn + "</p>");
                }
            %>
        </div>
        
        <section class="container-fluid" id="log-in-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back arrow -->
                <div class="col-1" id="back-arrow">
                    <button onclick="history.back()"> 
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </button>
                </div>
                
                <!-- SIGN-UP heading -->
                <div class="col">
                    <h2 id="log-in-text-2">LOG IN</h2>
                </div>         
            </div>
            
            <!-- Log-in form-->
            <form method="post" action="LogIn">
                <!-- Email -->
                <div class="row" id="sEmail">
                    <div class="col" id="emailInput">
                        <label for="email">Email</label>
                        <input type="text" name="email" id="email" value="" required>  
                    </div>
                </div>
                
                <!-- Password -->
                <div class="row" id="sPassword">
                    <div class="col" id="passwordInput">
                        <label for="email">Password</label>
                        <input type="password" name="password" id="password" value="" required>  
                    </div>
                </div>
                
                <!-- Log-In Button -->
                <div class="row" id="sSubmitButton">
                    <div class="col" id="submit">
                        <input type="submit" id="submitButton" value="Login" required>
                    </div>
                </div>
            </form>
        </section>
        
        <!-- Include footer -->
        <jsp:include page="footer.jsp"/>
        
        <%
            session.invalidate();
        %>
    </body>
</html>
