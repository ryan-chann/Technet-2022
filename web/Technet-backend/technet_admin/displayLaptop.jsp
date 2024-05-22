<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Laptop"%>
<%@page import="java.util.List"%>
<%
   List<Laptop> laptops = (List<Laptop>) session.getAttribute("laptop");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Laptops</title>
        
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
                padding-top: 40px;
            }


            /* laptop Details Div */
            #laptop-details-container{
                font-size: 20px;
                display:block;
                margin:auto;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                width: 1000px;
            }
            
            
            /* laptop Details Text */
            #laptop-details-container b, span{
                margin-top:80px;
            }
            
            /*pagination link*/
            .page-link{
                background-color: #E3CAA5;
                color:black;
            }


            /* Footer Styles */
            #footer{
                margin: 110px 0px 0px 0px;
            }
        </style>
    </head>
    
    <body>
        <section class="container-fluid" id="laptop-details-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back Arrow -->
                <div style="margin:20px 20px 20px 20px;" class="col-1" >
                    <a href="dashboard.jsp"> 
                        <i  style ="margin-top: 20px" color="black" onclick="myFunction()" class="fa-solid fa-arrow-left-long fa-2x" ></i>
                    </a>
                </div>
                <!-- laptop Details heading -->
                <div style="margin:35px 20px 20px 20px;" class="col-8 text-center">
                    <h2>Technet Laptops</h2>
                </div>         
            </div>

            <!-- laptop Details Container -->
            <div style="margin:20px 20px 20px 20px;" id="laptop-table" class="row">
                 <table class="table table-bordered">
                <thead>
                  <tr>
                    <th scope="col">Laptop ID</th>
                    <th scope="col">Laptop Name</th>
                    <th scope="col">Laptop Image</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                  </tr>
                </thead>
  <%
                    for (Laptop laptop : laptops) {


                %>
                <tr>
                    <td scope="row"><%= laptop.getLaptopid() %></td>
                    <td><%= laptop.getLaptopname() %></td>
                    <td><img src="<%= laptop.getLaptopimage() %>" width="100" height="100" ></td><!<!-- image in table -->
                    <td><%= laptop.getLaptopprice() %></td>
                    <td><%= laptop.getLaptopcategory() %></td>
                    
                  </tr>

                </tr>
                <% }%>
                
            </table>

                <nav class="col text-center">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="../DisplayLaptopTable">1</a></li>
                      <li class="page-item"><a class="page-link" href="../DisplayLaptopTable?page=2">2</a></li>
                      <li class="page-item"><a class="page-link" href="../DisplayLaptopTable?page=3">3</a></li>
                      <li class="page-item"><a class="page-link" href="../DisplayLaptopTable?page=4">4</a></li>
                      <li class="page-item"><a class="page-link" href="../DisplayLaptopTable?page=5">5</a></li>
                      <li class="page-item"><a class="page-link" href="../DisplayLaptopTable?page=6">6</a></li>
                    </ul>
                </nav>

            </section>
        </body>
         <!-- Footer c:remove var="orders" scope="session" />-->
        <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
                <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Display Laptop)</span>
        </footer>
         
     
    </html>