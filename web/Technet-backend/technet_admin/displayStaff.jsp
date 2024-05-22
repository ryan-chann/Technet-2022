<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Technetuser"%>
<%@page import="java.util.List"%>
<%
   List<Technetuser> staffs = (List<Technetuser>) session.getAttribute("staff");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Total Staff</title>
        
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

            /* Staff Details Div */
            #staff-details-container{
                
                font-size: 20px;
                display:block;
                margin:auto;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                margin-top: 80px;
                width: 1000px;
            }
            

            /* staff Details Text */
            #staff-details-container b, span{
                margin-top:80px;
            }
            
            /*pagination link*/
            .page-link{
                background-color: #E3CAA5;
                color:black;
            }

            /* Footer Styles */
            #footer{
                margin: 160px 0px 0px 0px;
            }
        </style>
    </head>
    
    <body>
        <section class="container-fluid" id="staff-details-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back Arrow -->
                <div style="margin:20px 20px 20px 20px;" class="col-1" >
                    <a href="dashboard.jsp"> 
                        <i style="color:black;" onclick="myFunction()" class="fa-solid fa-arrow-left-long fa-2x" ></i>
                    </a>
                </div>
                <!-- Staff Details heading -->
                <div style="margin:20px 20px 20px 20px;" class="col-8 text-center">
                    <h2>Technet Staff</h2>
                </div>         
            </div>

            <!-- Staff Details Container -->
            <div style="margin:20px 80px 20px 80px;" class="row">
                 <table class="table table-bordered">
                <thead>
                  <tr>
                    <th scope="col">Staff ID</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Password</th>
                  </tr>
                </thead>
  <%
                    for (Technetuser staff : staffs) {

                %>
                <tr>
                    <td scope="row"><%= staff.getTechnetid() %></td>
                    <td><%= staff.getFirstname() %></td>
                    <td><%= staff.getLastname() %></td>
                    <td><%= staff.getTechnetpassword() %></td>    
                  </tr>

                <%}%>
                
            </table>

                <nav class="col text-center">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="../DisplayStaffTable">1</a></li>
                      <li class="page-item"><a class="page-link" href="../DisplayStaffTable?page=2">2</a></li>
                    </ul>
                </nav>

            </section>
        </body>
         <!-- Footer c:remove var="orders" scope="session" />-->
        <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
                <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Display All Staff)</span>
        </footer>
    </html>