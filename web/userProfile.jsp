<!--
	Author: Ryan Chan Joon Yew
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    try{
        if(request.getCookies() != null){
            Cookie cookie = null;
            Cookie userEmail = null;
            Cookie userFirstName = null;
            Cookie userLastName = null;
            Cookie userPhoneNumber = null;
            Cookie userPass = null;
            Cookie[] cookies = null;
            cookies = request.getCookies();

            if(cookies != null){                  
                for(int i = 0; i < cookies.length; i++){
                    cookie = cookies[i];
                    if(cookies[i].getName().equals("userEmail")){
                        userEmail = cookies[i];
                    }
                    if(cookies[i].getName().equals("userPassword")){
                        userPass = cookies[i];
                    }
                    if(cookies[i].getName().equals("userFirstName")){
                        userFirstName = cookies[i];
                    }
                    if(cookies[i].getName().equals("userLastName")){
                        userLastName = cookies[i];
                    }
                    if(cookies[i].getName().equals("userPhoneNumber")){
                        userPhoneNumber = cookies[i];
                    }
                }
            }
        if((userEmail != null || !userEmail.getValue().equals("")) && (userPass != null || !userPass.getValue().equals(""))){           
%>
<html>
    <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="icon" href="#" type="image" sizes="16x16">

            <title>Profile | Technet</title>

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
                body{
                    font-family: 'Roboto';
                }
                
                #space{
                    height:50px;
                }
                    
                /* Container styles */
                #user-profile-container{
                    display: block;
                    left: 30%;
                    background-color: #F5B517;
                    border-style: none;
                    border-radius: 40px;
                    height: 500px;
                    margin: auto;
                    width: 700px;  
                }
                
                .black-button{
                    background-color: #3E3E3E;
                    border-style:none;
                    color: #FFFFFF;
                    display: inline-block;
                    width: 100px;
                    height: 35px;
                    border-radius: 20px;  
                }
                
                .black-button:hover{
                    background-color: #000000;
                }
                
                /* Modal container (Tint background) */
                #modal-container{
                    display: none;
                    position: fixed; /* Fixed position */
                    z-index: 2; /* Stays on top of other elements */
                    background-color: rgba(0,0,0,0.8); /* Tint percentage */
                    overflow: auto; /* Enable scrolling */
                    width: 100%; /* Tint the whole background */
                    height: 100%; /* Tint the whole background */
                    top: 0; /* Stays on top of the page */
                    left: 0; /* Stays on the left side of the page */
                    padding-top: 100px; /* Position of the content*/
                }
                
                /* Modal content */
                #modal-container #modal-content{
                    background-color: #F5B517;
                    margin: auto;
                    padding: 20px;
                    border: 1px solid #888;
                    border-radius: 40px;
                    width: 60%;
                }
                
                #modal-container #modal-close{
                    color: #000000;
                    float: left;
                    width: 40px;
                    font-size: 40px;
                    font-weight: bold;
                }
                
                #modal-container #modal-close:hover, #modal-close:focus{
                    color: #FFFFFF;
                    text-decoration: none;
                    cursor: pointer;
                }

                
                #modal-container #modal-form{
                    padding: 0px 0px 0px 70px;
                }
                
                #modal-container #modal-form input{
                    width: 80%;
                }
                
                #modal-form div{
                    padding: 0px 0px 10px 0px;
                }
                
                #update-button{
                   width:20%;
                   margin: 0px 0px 0px 230px;
                }
                
                /* Back Icon */
                #back-arrow{
                    padding: 25px 0px 0px 25px;
                }
                
                #back-arrow button{
                    background-color: #F5B517;
                    border: none;
                }
                
                /* Profile text */
                #profile{
                    margin: 0px 0px 20px 0px;
                }
                
                #profile h2{
                    padding: 20px 0px 0px 220px;
                    color: #FFFFFF; 
                }
                
                #information div{
                    margin: 0px 0px 15px 0px;
                }
                
                #purchase{
                    width:20%;
                    margin: 0px 0px 0px 230px;
                }

                #message p{
                    text-align:center;
                }
            
            </style>
    </head>
    <body>
        <jsp:include page = "header.jsp" />
        <div id="space"></div>
        
        <!-- Message -->
        <div id="message">
            <%
                if(session.getAttribute("Message") != null){
                    if(session.getAttribute("DisplayCardBalance") != null){
                        String message = (String)session.getAttribute("DisplayCardBalance");
                        out.print("<p>" + message + "</p>");
                    }else if(session.getAttribute("InvalidCard") != null){
                        String message = (String)session.getAttribute("InvalidCard");
                        out.print("<p>" + message + "</p>");
                    } 
                }
                if(session.getAttribute("InvalidFirstName") != null){
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
            %>
        </div>
        
        <!-- Container -->
        <section id="user-profile-container" class="container-fluid">
            <div class="row">
                <!-- Back arrow -->
                <div class="col-1" id="back-arrow">
                    <button onclick="history.back()"> 
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </button>
                </div>
                <div class="col" id="profile">
                    <h2>PROFILE</h2>
                </div>
            </div>
            
            <section id="information">
                <!-- Email -->
                <div class="row">
                    <span class="col-3">EMAIL ADDRESS:</span>
                    <span class="col-6"><%= userEmail.getValue() %></span>
                </div>
                
                <!-- First Name -->
                <div class="row">
                    <span class="col">FIRST NAME:</span>
                    <span class="col-6"><%= userFirstName.getValue() %></span>
                    <button class="col-3 black-button" id="openFNM">Edit</button>
                </div>

                <!-- Last Name -->
                <div class="row">
                    <span class="col">LAST NAME:</span>
                    <span class="col-6"><%= userLastName.getValue() %></span>
                    <button class="col-3 black-button" id="openLNM">Edit</button>
                </div>

                <!-- Phone Number -->
                <div class="row">
                    <span class="col">PHONE NUMBER:</span>
                    <span class="col-6"><%= userPhoneNumber.getValue() %></span>
                    <button class="col-3 black-button" id="openPNM">Edit</button>
                </div>
                
                <form action="ViewOrders" method="get">
                    <div class="row">
                        <input type="hidden" name="orderEmail" id="orderEmail" value="<%= userEmail.getValue() %>">
                        <button id="viewOrder" class="black-button" type="submit">
                            <span>VIEW ORDERS</span>
                        </button>
                    </div>
                </form>
                    
                <div class="row">
                    <button id="openPM" class="black-button">
                        <span style="color:red">CHANGE PASSWORD</span>
                    </button>
                </div>
                     
                <div class="row">
                    <button class="black-button" id="log-out">
                        <span>LOG OUT</span>
                    </button>
                </div>
            </section>
        </section>
        
        <div id="modal-container">
            <div id="modal-content">
                <div class="row">
                    <span id="modal-close">&times;</span>
                </div>
                
                <div id="modal-form">               
                    <form method="post" action="EditProfile">
                        <div class="row" id="firstNameRow">
                            <div class="col-3">
                                <span>FIRST NAME:</span>
                            </div>
                            
                            <div class="col">
                                <input type="text" name="firstName" id="firstName" value="">
                            </div>
                        </div>

                        <div class="row" id="lastNameRow">
                            <div class="col-3">
                                <span>LAST NAME:</span>
                            </div>
                            
                            <div class="col">
                                <input type="text" name="lastName" id="lastName" value="">
                            </div>
                        </div>

                        <div class="row" id="phoneNumberRow">
                            <div class="col-3">
                                <span>PHONE NUMBER:</span>
                            </div>
                            
                            <div class="col">
                                <input type="text" name="phoneNumber" id="phoneNumber" value="">
                            </div>
                        </div>
                        
                        <div class="row" id="passwordRow">
                            <div class="col">
                                <span>Password:</span>
                            </div>
                            
                            <div class="col">
                                <input type="password" name="password" id="password" value="">
                            </div>
                            
                            <div class="col">
                                <span>Re-enter Password:</span>
                            </div>
                            
                            <div class="col">
                                <input type="password" name="rePassword" id="rePassword" value="">
                            </div>
                        </div>
                        
                        <div class="row">
                            <input type="hidden" name="editType" id="editType" value="">
                            <button type="submit" class="black-button" id="update-button">Edit</button> 
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page = "footer.jsp" />
        
        <script>
            var modal = document.getElementById("modal-container");
            var openFirstNameModal = document.getElementById("openFNM");
            var openLastNameModal = document.getElementById("openLNM");
            var openPhoneNumberModal = document.getElementById("openPNM");
            var openPasswordModal = document.getElementById("openPM");
            var closeModal = document.getElementById("modal-close");
            var firstNameRow = document.getElementById("firstNameRow");
            var lastNameRow = document.getElementById("lastNameRow");
            var phoneNumberRow = document.getElementById("phoneNumberRow");
            var passwordRow = document.getElementById("passwordRow");
            var logOut = document.getElementById("log-out");
            var editType = document.getElementById("editType");
            var viewOrder = document.getElementById("viewOrder");

            openFirstNameModal.onclick = function(){
                modal.style.display = "block";
                firstNameRow.style.display = "block";
                lastNameRow.style.display = "none";
                phoneNumberRow.style.display = "none";
                passwordRow.style.display = "none";
                editType.value = "FirstName";
            };

            openLastNameModal.onclick = function(){
                modal.style.display = "block";
                firstNameRow.style.display = "none";
                lastNameRow.style.display = "block";
                phoneNumberRow.style.display = "none";
                passwordRow.style.display = "none";
                editType.value = "LastName";
            };

            openPhoneNumberModal.onclick = function(){
                modal.style.display = "block";
                firstNameRow.style.display = "none";
                lastNameRow.style.display = "none";
                phoneNumberRow.style.display = "block";
                passwordRow.style.display = "none";
                editType.value = "PhoneNumber";
            };
            
            openPasswordModal.onclick = function(){
                modal.style.display = "block";
                firstNameRow.style.display = "none";
                lastNameRow.style.display = "none";
                phoneNumberRow.style.display = "none";
                passwordRow.style.display = "block";
                editType.value = "Password";
            }

            closeModal.onclick = function(){
                modal.style.display = "none";
            };
            
            
            logOut.onclick = function(){
                document.cookie = "userEmail= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
                document.cookie = "userPassword= ; expires = Thu, 01 Jan 1970 00:00:00 GMT"; 
                document.cookie = "userFirstName= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
                document.cookie = "userLastName= ; expires = Thu, 01 Jan 1970 00:00:00 GMT"; 
                document.cookie = "userPhoneNumber= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
                location.replace("index.jsp");
            };
        </script>
    </body>
</html>
<%
    session.invalidate();    
    }else{
            response.sendRedirect("index.jsp");
        }
    }
}catch(NullPointerException nullException){
    response.sendRedirect("logIn.jsp");
}
%>
