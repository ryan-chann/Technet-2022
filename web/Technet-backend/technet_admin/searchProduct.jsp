<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
    
    Object messageR = session.getAttribute("messageR");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Update Staff</title>
       
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
           
            /* search product form head */
            #spReturnBut{
                padding: 20px 0px 10px 15px;

            }
            #spReturnBut a{
                color:black;
            }
            #searchLaptop{
                padding: 20px 0px 10px 50px;
                color: #FFFFFF;
            }
           
            /* searchLaptop form */
            #searchLaptop-container{
                display: block;
                left: 30%;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: 250px;
                margin-top: 220px;
                width: 400px;
            }
           
            /* Create gap between input fields and the container */
            #productID{
                padding: 4px 0px 0px 30px;
            }
                       
            /* Button Style */
            #sSubmitButton{
                position: relative;
                left: 50px;
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

            #submitButton:hover{
                background-color: #000000;
            }
            
            /* To create a the size between input fields */
            #productid{
                margin: 30px;
            }
               
            /*set placeholder font size*/
            ::placeholder {
                font-size: 13px;
            }

            /* Footer Styles */
            #footer{
                margin: 187px 0px 0px 0px;
            }

        </style>
        
        <script>
            const productIdPattern = new RegExp(/^[L]{1}[G/B]{1}[0-9]{8}$/);
            let errorMessage = ""; 
            
            var massage ="${messageR}";
                if(massage){
                    function myFunction() {
                      alert("${messageR}");
                    }

                  window.onload = myFunction(); 
                 }
            
            
           
            function checkLaptopId(productid){
                //If first does not match the requirement
                if(!productIdPattern.test(productid)){
                    errorMessage = errorMessage.concat("Please enter the valid Laptop ID.\n\n");
                }
            }
            
            $(document).ready(function() {
                $("#submitButton").click(function() {
                    //If not complete enter all text fields
                    if (!$("#productid").val()) {
                        alert('Please enter the product id !!!');
                        location.reload();
                    }
                    else {
                        //Check validation
                        init();
                    }
                });
             });
            
            
            function init(){            
               
                productID = document.getElementById("productid").value;
               
                    checkLaptopId(productID);
                    if(errorMessage.length > 0){
                        alert(errorMessage);
                        errorMessage = "";
                        location.reload();
                    }else{
                        //check database and session productid to display.jsp
                    }
            }
            
            
            
            
            
            
            
        </script>
       
       
    </head>
    <body>
        <section class="container-fluid" id="searchLaptop-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back arrow -->
                <div class="col-1" id="spReturnBut">
                    <a href="dashboard.jsp">
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
               
                <!-- UPDATE STAFF heading -->
                <div class="col">
                    <h2 id="searchLaptop">Search Laptop</h2>
                </div>        
            </div>
           
            <!-- SEARCH PRODUCT form -->
            <form action="../CRUDLaptop" method="Get"> 
               
                <!-- Laptop ID -->
                <div class="row" id="productID">
                    <div class="col" id="productIDInput">
                        <label for="productid">Laptop Id:</label>
                        <input type="text"  name="laptopID"  id="productid" placeholder="Enter L (B/G)00000000: ">
                    </div>             
                </div>
                <br/>
               
                <!-- SEARCH Button -->
                <div class="row" id="sSubmitButton" >
                    <div class="col" id="submit" style="padding:0px 0px 0px 100px">
                        <input type="submit" name="crudFunction" id="submitButton"  value="Search" required>
                    </div>
                   
                </div>
            </form>
        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Search Laptop)</span>
    </footer>
    <!-- clean up session --> 
        <c:remove var="messageR" scope="session" />
</html>
