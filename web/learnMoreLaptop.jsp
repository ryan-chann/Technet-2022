<!--
	Author: Ryan Chan Joon Yew
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        Cookie cookies[] = request.getCookies();

        String id = new String();
        String image = new String();
        String name = new String();
        String price = new String();
        String cpu = new String();
        String ram = new String();
        String storage = new String();
        String graphicCard = new String();
        String email = null;

        for(int index = 0; index < cookies.length; index++){
            if(cookies[index].getName().equals("learnMoreID")){
                id = cookies[index].getValue();
            }else if(cookies[index].getName().equals("learnMoreImage")){
                image = cookies[index].getValue();
            }else if(cookies[index].getName().equals("learnMoreName")){
                name = cookies[index].getValue();
            }else if(cookies[index].getName().equals("learnMorePrice")){
                price = cookies[index].getValue();
            }else if(cookies[index].getName().equals("learnMoreCpu")){
                cpu = cookies[index].getValue();
            }else if(cookies[index].getName().equals("learnMoreRam")){
                ram = cookies[index].getValue();
            }else if(cookies[index].getName().equals("learnMoreStorage")){
                storage = cookies[index].getValue();
            }else if(cookies[index].getName().equals("learnMoreGraphicCard")){
                graphicCard = cookies[index].getValue();
            }else if(cookies[index].getName().equals("userEmail")){
                email = cookies[index].getValue();
            }
        }

        if(email != null || !email.equals("")){  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        
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
            body{
                    font-family: 'Roboto',sans-serif;
            }

            #log-in-text,#sign-up-text{
                    color:black;
            }
            
            .header-span-hyperlink{
                    text-decoration: none;
            }
            
            #order-box{
                background-color: #F5B517;
                width: 90%;
                margin:auto;
                padding: 30px;
                margin-bottom: 350px;
                margin-top: 50px;
            }
            
            #order-box span{
                margin-bottom: 5px;
            }
            
            #order-box quantity{
            margin-top: 0px;    
            }
            
            #product-img-box{
                padding:10px;
                float: left;
                width:50%;
                height:500px;
            }
            
            #order-details{ 
                padding:10px;
                text-align:left;
            }
            
            #quantity{
                width:100px;
                height:50px;
                margin-bottom:10px;
            }
            
            #quantity::-webkit-inner-spin-button{
                opacity:1;
            }
            
            #add-to-cart{
                background-color: #3E3E3E;
                width:200px;
                height:50px;
                border:none;
                color:white;
            }
            
            #buy-now{
                background-color: #3E3E3E;
                width:200px;
                height:50px;
                border:none;
                color:white;
            }
            
            #add-to-cart:hover, #buy-now:hover{
                background-color: black;
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
    
    <center>
        <div id="order-box">
            <h1 id="product-name"><%= name %></h1>
            
            <div id="product-img-box">
                <img id="product-image" src="<%= image %>" alt="Product Image" style="width:385px; height:350px"/>
            </div>
            
            <form action="Purchase" id="order-details" method="post">
                <h2>RM <%= price %></h2>
                <h3>Specifications</h3>
                
                <div id="order-specs">
                    <span>--> <%= cpu %></span>
                    <br>
                    <span>--> <%= ram %></span>
                    <br>
                    <span>--> <%= graphicCard %></span>
                    <br>
                    <span>--> <%= storage %></span>
                    <br>
                </div>
                
                <h3>Quantity</h3>
                
                <input id="quantity" name="quantity" type="number" min="1" max="3" value="1"><br>
                <button id="buy-now" type="button"> Buy Now </button>
                
                <div id="modal-container">
                    <div id="modal-content">
                        <div class="row">
                            <span id="modal-close">&times;</span>
                        </div>

                        <div id="modal-form">               
                            <div class="row" id="paymentCardRow">
                                <div class="col-3">
                                    <span>PAYMENT CARD:</span>
                                </div>

                                <div class="col">
                                    <input type="text" name="paymentCard" id="paymentCard" value="" required>
                                </div>
                            </div>

                            <div class="row" id="addressRow">
                                <div class="col-3">
                                    <span>ADDRESS:</span>
                                </div>

                                <div class="col">
                                    <input type="text" name="address" id="address" value="" required>
                                </div>
                            </div>
                            
                            <div class="row">
                                <input type="hidden" name="laptopId" id="address" value="<%= id %>">
                                <input type="hidden" name="laptopPrice" id="address" value="<%= price %>">
                                <input type="hidden" name="email" id="email" value="<%= email %>">
                                <button type="submit" class="black-button" id="purchase">Purchase</button> 
                            </div>
                        </div>
                    </div>
                </div>  
            </form>
        </div>
    </center>
    

    <!-- Footer -->
    <jsp:include page="footer.jsp" />
    
    <script>
        var modal = document.getElementById("modal-container");
        var closeModal = document.getElementById("modal-close");
        var openPurchaseModal = document.getElementById("buy-now");
        
        openPurchaseModal.onclick = function(){
            modal.style.display = "block";
        };
        
        closeModal.onclick = function(){
            modal.style.display = "none";
        };
    </script>
    </body>
    <%
        }else{
            response.sendRedirect("LogIn.jsp");
        }
    }catch(NullPointerException nullException){
        response.sendRedirect("LogIn.jsp");
    }
    %>
</html>