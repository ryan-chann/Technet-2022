<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="entity.Laptop"%>

<%
    Laptop laptop = (Laptop) session.getAttribute("laptopU");
        Object messageU = session.getAttribute("messageU");
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
            
            /* Sign-in text */
            #sign-in-admin{
                padding: 20px 40px 0px 0px;
                color: #FFFFFF;
            }
            #ReturnBut{
                padding: 20px 0px 0px 15px;

            }
            #ReturnBut a{
                color:black;
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

             var massage ="${messageU}";
                if(massage){
                    function myFunction() {
                      alert("${messageU}");
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
                    <a href="../CRUDLaptop?crudFunction=Search&laptopID=<%= laptop.getLaptopid() %>"> 
                            <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                        </a>
                </div>
                               
                <!-- Insert Product heading -->
                <div class="col-9 text-center">
                    <h2 id="sign-in-admin"><%= laptop.getLaptopid() %>'s LAPTOP Update</h2>
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
                        <span name="laptopid"><%= laptop.getLaptopid() %></span>
                        <input type="hidden" name="laptopid" value="<%= laptop.getLaptopid() %>">
                        
                    </div>                    
                </div>
                <br/>
                
                <!-- Laptop Category -->
                <div class="row" id="laptopcategory">
                    <div  class="col-sm-5 col-form-label" id="label-laptopcategoryInput">
                        <label for="laptopcategory">Laptop Category: </label>
                    </div>
                    <div class="col-sm-7" id="laptopcategory"> 
                        <span name="laptopcategory"><%= laptop.getLaptopcategory() %></span>
                        <input type="hidden" name="laptopcategory" value="<%= laptop.getLaptopcategory() %>">
                    </div>
                </div>
                <br/>
                
                <!-- Laptop Name -->
                <div class="row" id="laptopname">
                    <div  class="col-sm-5 col-form-label" id="label-laptopnameInput">
                        <label for="laptopname">Laptop Name: </label>
                    </div>
                    <div class="col-sm-7" id="laptopnameInput"> 
                        <input type="text" class="form-control" name="laptopname" id="laptopname" value="<%= laptop.getLaptopname() %>" >
                    </div>
                </div>
                <br/>
                
                <!-- Laptop Price -->
                <div class="row" id="laptopprice">
                    <div  class="col-sm-5 col-form-label" id="label-laptoppriceInput">
                        <label for="laptopprice">Laptop Price: </label>
                    </div>
                    <div class="col-sm-7" id="laptoppriceInput"> 
                        <input type="text"  class="form-control" name="laptopprice" id="laptopprice" value="<%= laptop.getLaptopprice() %>" >
                    </div>
                </div>
                <br/>
                
                
                <!-- Laptop Image -->
                <div class="row" id="laptopImage">
                    <div class="col-sm-5 col-form-label" id="label-laptopimageinput">
                        <label for="laptopImage">Laptop Image URL : </label>
                    </div>
                    <div class="col-sm-7" id="laptopImageInput">   
                        <input type="text"  class="form-control" name="laptopImage" id="laptopImage" value="<%= laptop.getLaptopimage() %>">
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
                            <input type="text"  class="form-control" name="cpu" id="cpu" value="<%= laptop.getCpu() %>">
                        </div>
                    </div>
                    <br/>

                    <!-- RAM -->
                    <div class="row" id="ram">
                        <div  class="col-sm-5 col-form-label" id="label-ramInput">
                            <label for="ram">Ram: </label>
                        </div>
                        <div class="col-sm-7" id="ramInput"> 
                            <input type="text"  class="form-control" name="ram" id="ram" value="<%= laptop.getRam() %>">
                        </div>
                    </div>
                    <br/>

                    <!-- Storage -->
                    <div class="row" id="storage">
                        <div  class="col-sm-5 col-form-label" id="label-storageInput">
                            <label for="storage">Storage: </label>
                        </div>
                        <div class="col-sm-7" id="storageInput"> 
                            <input type="text"  class="form-control" name="storage" id="storage" value="<%= laptop.getStorage() %>">
                        </div>
                    </div>
                    <br/>

                    <!-- Graphic Card -->
                    <div class="row" id="graphiccard">
                        <div  class="col-sm-5 col-form-label" id="label-graphiccardInput">
                            <label for="graphiccard">Graphic Card: </label>
                        </div>
                        <div class="col-sm-7" id="graphiccardInput"> 
                            <input type="text"  class="form-control" name="graphiccard" id="graphiccard" value="<%= laptop.getGraphiccard() %>">
                        </div>
                    </div>
                    <br/>
                    </div>




                    <!-- Buttons -->
                    <div class="row text-end" id="sSubmitButton">
                        <div class="col" id="submit">
                            <input type="submit" name="crudFunction" id="submitButton"  value="Save" >
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
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Update Laptop)</span>
    </footer>
    <c:remove var="laptop" scope="session" />
    <c:remove var="messageU" scope="session" />
</html>