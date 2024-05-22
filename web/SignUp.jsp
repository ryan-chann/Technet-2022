<!--
	Author: Ryan Chan Joon Yew
-->

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="#" type="image" sizes="16x16">

        <title>Sign Up | TechNet</title>

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
                }
                
                #space{
                    height:50px;
                }
            /* Sign Up form */
                #sign-up-container{
                    display: block;
                    left: 30%;
                    background-color: #F5B517;
                    border-style: none;
                    border-radius: 40px;
                    height: 500px;
                    margin: auto;
                    width: 515px;
                }

                /* Back Icon */
                #back-arrow{
                    padding: 25px 0px 0px 25px;
                }

                #back-arrow button{
                    background-color: #F5B517;
                    border: none;
                }
                /* Sign-up text */
                #sign-up-text-2{
                    padding: 20px 0px 0px 140px;
                    color: #FFFFFF;
                }

                /* Create gap between input fields and the container */
                #flName, #sPhoneNumber, #sEmail, #sPassword, #sRePassword{
                    padding: 5px 0px 10px 50px;
                }

                /* To create a gap between first name and last name input field */
                #firstNameInput{
                    margin: 0px 10px 0px 0px;
                }

                /* Input field length for single input in a row */
                #phoneNumber, #email, #password, #rePassword{
                    width: 90%;
                }

                /* Button Style */
                #sSubmitButton{
                    position: relative;
                    top: 15px;
                    left: 200px;
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
       <jsp:include page = "header.jsp" />
       <div id="space"></div>
        <!-- Error Message -->
        <div id="errorMessage">
            <%
                if(session.getAttribute("InvalidFirsttName") != null){
                    String invalidFirstName = (String)session.getAttribute("InvalidFirstName");
                    out.print("<p>" + invalidFirstName + "</p>");
                }
                
                if(session.getAttribute("InvalidLastName") != null){
                    String invalidLastName = (String)session.getAttribute("InvalidLastName");
                    out.print("<p>" + invalidLastName + "</p>");
                }
                
                if(session.getAttribute("InvalidPhoneNumber") != null){
                    String invalidPhoneNumber = (String)session.getAttribute("InvalidPhoneNumber");
                    out.print("<p>" + invalidPhoneNumber + "</p>");
                    
                }
                
                if(session.getAttribute("InvalidEmail") != null){
                    String invalidEmail = (String)session.getAttribute("InvalidEmail");
                    out.print("<p>" + invalidEmail + "</p>");
                }
                
                if(session.getAttribute("InvalidPassword") != null){
                    String invalidPassword = (String)session.getAttribute("InvalidPassword");
                    out.print("<p>" + invalidPassword + "</p>");
                }
                
                if(session.getAttribute("PasswordNotMatch") != null){
                   String passwordNotMatch = (String)session.getAttribute("PasswordNotMatch");
                   out.print("<p>" + passwordNotMatch + "</p>");
                }
                
                if(session.getAttribute("InvalidTransaction") != null){
                   String invalidTransaction = (String)session.getAttribute("InvalidTransaction");
                   out.print("<p>" + invalidTransaction + "</p>");
                }
            %>
        </div>
        <section class="container-fluid" id="sign-up-container">
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
                    <h2 id="sign-up-text-2">SIGN UP</h2>
                </div>         
            </div> 
            <!-- Sign-up form -->
            <form method="post" action="CreateUser">
                <!-- First Name & Last Name -->
                <div class="row" id="flName">
                    <div class="col-5" id="firstNameInput">
                        <label for="firstName">First Name</label>
                        <input type="text" name="firstName" id="firstName" value="" required>
                    </div>
                    <div class="col-5">
                        <label for="lastName">Last Name</label>
                        <input type="text" name="lastName" id="lastName" value="" required>
                    </div>
                </div>
                
                <!-- Phone Number -->
                <div class="row" id="sPhoneNumber">
                    <div class="col" id="phoneNumberInput">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="text" name="phoneNumber" id="phoneNumber" value="" required>
                    </div>
                </div>
                
                <!-- Email -->
                <div class="row" id="sEmail">
                    <div class="col" id="emailInput">
                        <label for="email">Email Address</label>
                        <input type="text" name="email" id="email" value="" required>
                    </div>
                </div>
                
                <!-- Password -->
                <div class="row" id="sPassword">
                    <div class="col" id="passwordInput">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" value="">
                    </div>
                </div>
                
                <!-- Retype Password -->
                <div class="row" id="sRePassword">
                    <div class="col" id="rePasswordInput">
                        <label for="password">Retype Password</label>
                        <input type="password" name="rePassword" id="rePassword" value="" required>
                    </div>
                </div>
                
                <!-- Sign-up Button -->
                <div class="row" id="sSubmitButton">
                    <div class="col" id="submit">
                        <input type="submit" id="submitButton" value="Sign-Up" required>
                    </div>
                </div>
            </form>
        </section>
        
        <!-- Footer -->
        <jsp:include page="footer.jsp"/>
        
        <%
            session.invalidate();
        %>
    </body>
</html>
