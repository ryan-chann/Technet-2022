<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="entity.Laptop"%>

<%
    Object newLapID = session.getAttribute("newlaptopID");
    Object category = session.getAttribute("category");
    Object messageC = session.getAttribute("messageC");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Insert Laptop</title>
        
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
            #ReturnBut{
                padding: 20px 0px 0px 15px;

            }
            #ReturnBut a{
                color:black;
            }
            /* Sign-in text */
            #sign-in-admin{
                padding: 20px 40px 0px 0px;
                color: #FFFFFF;
            }
            
            /* Sign in form */
            #insert-product-container{
                font-size:18px;
                padding-left:50px;
                padding-right: 50px;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: 600px;
                margin-top: 80px;
                width: 80%;
                margin-bottom: 50px;
            }               

            #submitButton, #resetButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                display: inline-block;
                width: 150px;
                height: 35px;
                border-radius: 20px;
            }

            #submitButton:hover{
                background-color: blue;
            }
            
            #resetButton:hover{
                background-color: red;

            /* Footer Styles */
            #footer{
                margin: 110px 0px 0px 0px;
            }
        </style>
<script>

             var massage ="${messageC}";
                if(massage){
                    function myFunction() {
                      alert("${messageC}");
                    }

                  window.onload = myFunction(); 
                 }
            </script>
    </head>
    <body>
        <section class="container-fluid" id="insert-product-container">
            <!-- Heading row -->
            <div class="row">
                
                <!-- Back Arrow -->
                <div style="margin-top:20px;" class="col-2" id="ReturnBut">
                    <a href="cLaptopCategory.jsp"> 
                            <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                        </a>
                </div>
                               
                <!-- Insert Product heading -->
                <div class="col-9 text-center">
                    <h2 id="sign-in-admin">INSERT A LAPTOP</h2>
                </div>         
            </div>
            
            <!-- Container Row -->
            <div class="row">
            
                <!-- Laptop Details Col -->
                <div class="col-6">
            <!-- Laptop Details Header-->
            <div class="row">
                <div class="col">
                    <h4 style="margin:20px auto 20px auto;" class="text-center" id="laptop-details-header">Laptop Details</h4>
                </div>
            </div>
            
            <!-- Insert Product form -->
            <form action="../CRUDLaptop" method="Get"> 
                <!-- Laptop ID -->
                <div class="row" id="laptopid">
                    <div class="col-sm-5 col-form-label" id="label-laptopidinput">
                        <label for="laptopid">Laptop ID: </label>
                    </div>
                    <div class="col-sm-7" id="laptopidInput">
                        <span name="laptopid"><%= newLapID %></span>
                        <input type="hidden" name="laptopid" value="<%= newLapID %>">
                        
                    </div>                    
                </div>
                <br/>
                
                <!-- Laptop Category -->
                <div class="row" id="laptopcategory">
                    <div  class="col-sm-5 col-form-label" id="label-laptopcategoryInput">
                        <label for="laptopcategory">Laptop Category: </label>
                    </div>
                    <div class="col-sm-7" id="laptopcategory"> 
                        <span name="laptopcategory"><%= category %></span>
                        <input type="hidden" name="laptopcategory" value="<%= category %>">
                    </div>
                </div>
                <br/>
                
                <!-- Laptop Name -->
                <div class="row" id="laptopname">
                    <div  class="col-sm-5 col-form-label" id="label-laptopnameInput">
                        <label for="laptopname">Laptop Name: </label>
                    </div>
                    <div class="col-sm-7" id="laptopnameInput"> 
                        <input class="form-control" name="laptopname" id="laptopname" placeholder="Enter Laptop Name..." required>
                    </div>
                </div>
                <br/>
                
                <!-- Laptop Price -->
                <div class="row" id="laptopprice">
                    <div  class="col-sm-5 col-form-label" id="label-laptoppriceInput">
                        <label for="laptopprice">Laptop Price: </label>
                    </div>
                    <div class="col-sm-7" id="laptoppriceInput"> 
                        <input class="form-control" name="laptopprice" id="laptopprice" placeholder="Enter Laptop Price..." required>
                    </div>
                </div>
                <br/>
                
                
                <!-- Laptop Image -->
                <div class="row" id="laptopImage">
                    <div class="col-sm-5 col-form-label" id="label-laptopimageinput">
                        <label for="laptopImage">Laptop Image URL : </label>
                    </div>
                    <div class="col-sm-7" id="laptopImageInput">   
                        <input class="form-control" name="laptopImage" id="laptopImage" placeholder="Enter Laptop Image URL..." required>
                    </div>
                </div>
                <br/>
                </div>
                
                    
                    
                    
                    
                <!-- Specs Col -->
                <div class="col-6">
                    <!-- Laptop Specs Header-->
                    <div class="row">
                        <div class="col">
                            <h4 style="margin:20px auto 20px auto;" class="text-center" id="laptop-specs-header">Laptop Specifications</h4>
                        </div>
                    </div>

                    <!-- CPU -->
                    <div class="row" id="cpu">
                        <div  class="col-sm-5 col-form-label" id="label-cpuInput">
                            <label for="cpu">CPU: </label>
                        </div>
                        <div class="col-sm-7" id="cpuInput"> 
                            <input class="form-control" name="cpu" id="cpu" placeholder="Enter CPU..." required>
                        </div>
                    </div>
                    <br/>

                    <!-- RAM -->
                    <div class="row" id="ram">
                        <div  class="col-sm-5 col-form-label" id="label-ramInput">
                            <label for="ram">Ram: </label>
                        </div>
                        <div class="col-sm-7" id="ramInput"> 
                            <input class="form-control" name="ram" id="ram" placeholder="Enter Ram..." required>
                        </div>
                    </div>
                    <br/>

                    <!-- Storage -->
                    <div class="row" id="storage">
                        <div  class="col-sm-5 col-form-label" id="label-storageInput">
                            <label for="storage">Storage: </label>
                        </div>
                        <div class="col-sm-7" id="storageInput"> 
                            <input class="form-control" name="storage" id="storage" placeholder="Enter Storage..." required>
                        </div>
                    </div>
                    <br/>

                    <!-- Graphic Card -->
                    <div class="row" id="graphiccard">
                        <div  class="col-sm-5 col-form-label" id="label-graphiccardInput">
                            <label for="graphiccard">Graphic Card: </label>
                        </div>
                        <div class="col-sm-7" id="graphiccardInput"> 
                            <input class="form-control" name="graphiccard" id="graphiccard" placeholder="Enter Graphic Card..." required>
                        </div>
                    </div>
                    <br/>
                    </div>




                    <!-- Buttons -->
                    <div class="row text-end" id="sSubmitButton">
                        <div class="col" id="submit">
                            <input type="submit" name="crudFunction" id="submitButton"  value="Create" >
                        </div>
                    </div>
                    <div class="row text-end" id="rResetButton">
                        <div class="col" id="reset" style="margin-top:20px;">
                            <button type="reset" id="resetButton"><i class="bi bi-x-square"></i> Reset</button>
                        </div>
                    </div>
                </div>               
            </form>

        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid fixed-bottom" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Create Laptop)</span>
    </footer>
     

    <c:remove var="messageC" scope="session" />
</html>