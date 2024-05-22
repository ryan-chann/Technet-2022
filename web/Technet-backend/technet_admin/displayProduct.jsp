<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="entity.Laptop"%>

<%
    Laptop laptop = (Laptop) session.getAttribute("laptop");
    Object messageD = session.getAttribute("messageD");
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Update Laptop</title>
        
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
            
            /* displayLaptop table head */
            
            #dpReturnBut{
                padding: 20px 0px 0px 15px;

            }
            #dpReturnBut a{
                color:black;
            }
            #displayLaptop{
                padding: 20px 0px 0px 160px;
                color: #FFFFFF;
            }
            
            /* displayLaptop table */
            #displayLaptop-container{
                display: block;
                left: 30%;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: 410px;
                margin-top: 135px;
                width: 850px;
            }
            
            /* Design product detail table */

            #product-details-table,#product-details-table th,#product-details-table td {
              border: 1px solid;
              border-collapse: collapse;

            }
            
            #product-details-table{
            
                width:95%;
                margin:auto;
            
            }
            #product-image{
                text-align:center;

            }
            #product-name{
                font-size:23px;
                text-align:left;

            }
            
            #product-id-category{
                font-size:19px;
                text-align:left;

            }
            #left-row{
                width:320px;
            }
            #right-row{
                width:320px;
            }
            #product-specific{
                height: 40px;
            }

            #product-price{
                font-size:18px;
                text-align: right;
                height: 50px;

            }
            /*set product table text more viewable*/
            #product-name th,#product-id-category th{
                padding-left: 5px;
            }
            #product-specific td{
                padding-left: 10px;
            }
            #product-price th{
                padding-right: 10px;
            }

            
            /* Button Style */
            #sFunctionButton{
                position: relative;

                left: 285px;
            }
       
            /* button style*/
            #functionButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                display: inline-block;
                width: 100px;
                height: 35px;
                border-radius: 20px;
            }
            #functionButton:hover{
                background-color: #000000;
            }
            
            
            /* button style*/
            #deleteButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                display: inline-block;
                width: 100px;
                height: 35px;
                border-radius: 20px;
            }
            #deleteButton:hover{
                background-color: #000000;
            }


            /* Footer Styles */
            #footer{
                margin: 112px 0px 0px 0px;
            }
            
            
            
            
        </style>
        

        
    </head>
    <body>
        <section class="container-fluid" id="displayLaptop-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back arrow -->
                <div class="col-1" id="dpReturnBut">
                    <a href="searchProduct.jsp"> 
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
                
                <!-- UPDATE LAPTOP heading -->
                <div class="col">
                    <h2 id="displayLaptop"><%= laptop.getLaptopid() %>'s Laptop Detail</h2>
                </div>         
            </div>
            <br>
            
            <!--display Laptop -->
                <table id="product-details-table">
                    <!-- product Image area -->
                    <tr id="product-image">
                        <td rowspan="5">
                            <img src="<%= laptop.getLaptopimage() %>" width="180" height="180" >

                        </td>
                    </tr>
                    <!-- product name -->
                    <tr id="product-name">
                        <th colspan="2"><%= laptop.getLaptopname() %></th>
                    </tr>

                    <tr id="product-id-category">
                        <!-- product ID -->
                        <th id="left-row"><%= laptop.getLaptopid() %></th>
                        
                        <!-- product Category -->
                        <th id="right-row"><%= laptop.getLaptopcategory() %> Laptop</th>
                        
                    </tr>


                    <tr id="product-specific">
                        <!-- product CPU -->
                        <td id="left-row"><%= laptop.getCpu() %></td>
                        
                        <!-- product RAM -->
                        <td id="right-row"><%= laptop.getRam() %></td>
                        
                    </tr>
                    <tr id="product-specific">
                        <!-- product Storage -->
                        <td id="left-row"><%= laptop.getStorage() %></td>
                        
                        <!-- product Graphic Card -->
                        <td id="right-row"><%= laptop.getGraphiccard() %></td>
                        
                    </tr>

                    <!-- product price -->
                    <tr id="product-price">
                        <th colspan="3">RM<%= laptop.getLaptopprice() %></th>
                    </tr>
                </table>
                
            <br>
            <!--  Button -->
            <div class="row" id="sFunctionButton">
                <div class="col">
                    <form action="../CRUDLaptop" method="Get"> 
                       <input type="hidden"  name="laptopID"  value="<%= laptop.getLaptopid() %>">
                       <input type="submit" name="crudFunction" id="functionButton"  value="Update">
                    </form>
                </div>
                <div class="col" style="padding-right:520px;">
                    <input type="button" id="deleteButton" value="Delete">
                </div>
            </div>
            
            <script>
            
            $(document).ready(function() {
                $("#deleteButton").click(function() {
                    //double comform delete
                    let text = "Are you sure you want to delete this <%= laptop.getLaptopid() %> product ? ";
                    if (confirm(text) == true) {
                      document.location.href="../CRUDLaptop?crudFunction=Delete&laptopID=<%= laptop.getLaptopid() %>";  

                    } else {
                      alert("You canceled");

                    }
                });
             });

             var massage ="${messageD}";
                if(massage){
                    function myFunction() {
                      alert("${messageD}");
                    }

                  window.onload = myFunction(); 
                 }
             
            </script>
            

        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Display Laptop)</span>
    </footer>
    <!-- clean up session  --> 
    <c:remove var="laptop" scope="session" />
    <c:remove var="messageD" scope="session" />
</html>