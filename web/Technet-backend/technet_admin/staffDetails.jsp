<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Technetuser"%>
<% 
  Technetuser technetStaff = (Technetuser) session.getAttribute("technetStaff");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Staff Details</title>
        
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
                padding-top: 50px;
                height: auto;
            }
            
            #returnButton a{
                color:black;
            }
            
            /* Heading text */
            #staff-details-title{
                color: #FFFFFF;
            }
            
            /* Staff icon */
            
            #staff-icon{
                margin-top:20px;
                margin-bottom: 20px;
            }
            
            /* Staff Details  */
            #staff-details-container{
                padding:20px 30px 20px 30px;
                display:block;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: auto;
                width: 450px;
            }
            
            /* Button Styling */
            
            #buttons{
                margin-left: 40px;
            }
            
            #updateButton, #delButton{
                margin-top: 20px;
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                display: inline-block;
                width: 120px;
                height: 40px;
                border-radius: 20px;
            }
            
            #updateButton{
                padding-top:10px;
                text-decoration: none;
                text-align:center;
            }

            #updateButton:hover{
                background-color: blue;
            }
            
            #delButton:hover{
                background-color: red;
            }
            /* Footer Styles */
            #footer{
                margin: 110px 0px 0px 0px;
            }
            
            #staff-details-table td{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <section class="container-fluid" id="staff-details-container">
            <!-- Heading row -->
            <div class="row">
                
                <!-- Back Arrow -->
                <div class="col-2" id="returnButton">
                    <a href="searchStaff.jsp"> 
                            <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
                               
                <!-- Staff Details heading -->
                <div class="col-8 text-center">
                    <h2 id="staff-details-title"><%= technetStaff.getTechnetid() %>'s STAFF DETAILS</h2>
                </div>       
            </div>
            
            <!<!-- Staff Icon -->
            <div class="row">
                <div class="col text-center">
                    <h1 id="staff-icon" style="font-size:70px;"><i class="bi bi-person-badge"></i></h1>
                </div>
            </div>
            <form method="post" action="../TechnetServlet">
            <!-- Staff Details table-->
            <div class="row">
            <div class="col" id="staff-details">
                <table id="staff-details-table" class="table table-borderless">
                    <tody>
                        <tr>
                            <th scope="col">Staff ID :</th>
                            <td scope="col"><%= technetStaff.getTechnetid() %></td>
                        </tr>
                        <tr>
                            <th scope="col">First Name :</th>
                            <td scope="col"><%= technetStaff.getFirstname() %></td>
                        </tr>
                        <tr>
                            <th scope="col">Last Name :</th>
                            <td scope="col"><%= technetStaff.getLastname() %></td>
                        </tr>
                        <tr>
                            <th scope="col">Password :</th>
                            <td scope="col"><%= technetStaff.getTechnetpassword() %></td>
                        </tr>
                    </tbody>
                </table>
                </div>
            </div>
                
                <!-- Buttons -->
                <div class="row text-center" id="buttons">
                    <div class="col-5 text-center" id="update">
                        <!-- Hyperlink to pass current id to update staff page-->
                        <a href="updateStaff.jsp" id="updateButton"><i class="bi bi-pencil-square"></i> Update</a>
                    </div>
                    <div class="col-5 text-center" id="delete">
                        <button id="delButton" name="delete"><i class="bi bi-trash3-fill"></i> Delete</button>
                    </div>
                </div> 
                
                </form>
        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid fixed-bottom" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Staff Details)</span>
    </footer>
</html>