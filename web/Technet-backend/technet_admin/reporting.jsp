<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%

        Object pendPacking = session.getAttribute("pendPacking");
        Object pendShipping = session.getAttribute("pendShipping");
        Object pendDelivery = session.getAttribute("pendDelivery");
        Object shipped = session.getAttribute("shipped");
        Object delivering = session.getAttribute("delivering");
        Object delivered = session.getAttribute("delivered");
        Object received = session.getAttribute("received");
        
        Object totalOrdered = session.getAttribute("totalOrdered");
        Object totalReEarn = session.getAttribute("totalReEarn");
        Object yearNum = session.getAttribute("yearNum");
        Object monthNum = session.getAttribute("monthNum");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Report</title>
        
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
            #return-print-buttoncontaner{
                float:left;
                padding: 0px 0px 0px 40px;
                
            }
             /* search product form head */

            #ReturnBut a{
                color:black;
            }
            

            #aprintButton{
                position: relative;
                left: 1200px;
            }

            #printButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                display: inline-block;
                width: 100px;
                height: 30px;
                border-radius: 20px;
            }

            #printButton:hover{
                background-color: #000000;
            }
            

            
            /* displayReport table */
            #displayReport-container{
                display: block;
                left: 30%;
                background-color: #FFFFFF;
                border-style: none;
                height: 620px;
                margin-top: 19px;
                width: 437px;
            }
            
            /* Design report detail table */
            
            #report-details-table{
            
                width:95%;
                margin:auto;
                padding :30px 0px 0px 0px;
            
            }

            #report-name {

                text-align:center;
                padding :20px 0px 10px 0px;

            }
            
            #report-status{
                font-size:17px;
                text-align:left;
                height: 30px;

            }
            #left-row{
                width:250px;
                font-size:15px;
                padding-left:30px;
            }
            #right-row{
                width:390px;
                font-size:13px;
                text-align: center;
            }


            #report-total{
                width:500px;
                font-size:17px;
                text-align:left;
                height: 50px;

            }
            #total-right-row{
                text-align:Right;
                font-size:17px;
            }
           
            
            
            /* Footer Styles */
            #footer{
                margin: 18px 0px 0px 0px;
            }
            
            
            
            
        </style>
        

        
    </head>
    <body>
        
        
            <div class="row" id="return-print-buttoncontaner">
                <!-- Back arrow -->
                <div class="col-1" id="ReturnBut">
                    <a href="dashboard.jsp">
                        <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
               
                <!-- print report -->
                <div class="row" id="aprintButton" >
                        <input type="submit" name="crudFunction" id="printButton" onclick="window.print();return false;"  value="Print" >

                </div>      
            </div>
        
        <section class="container-fluid" id="displayReport-container">
            <div id="report-name"><h4><b>Technet Sdn.Bhd Reporting</b></h4></div>

                    <hr>
            <!--display report -->
                <table id="report-details-table">

                

                        <tr id="report-status">
                            <th colspan="2">Status</th>
                        </tr>


                        <tr>
                            <td id="left-row">Pending Packing</td>
                            <td id="right-row"><%= pendPacking %></td>
                        </tr>
                        <tr>
                            <td id="left-row">Pending Shipping</td>
                            <td id="right-row"><%= pendShipping %></td>
                        </tr>
                        <tr>
                            <td id="left-row">Pending Delivery</td> 
                            <td id="right-row"><%= pendDelivery %></td>
                        </tr>
                        <tr>
                            <td id="left-row">Shipped</td>
                            <td id="right-row"><%= shipped %></td> 
                        </tr>
                        <tr>
                            <td id="left-row">Delivering</td>
                            <td id="right-row"><%= delivering %></td> 
                        </tr>
                        <tr>
                            <td id="left-row">Delivered</td>
                            <td id="right-row"><%= delivered %></td>
                        </tr>                    
                        <tr>
                            <td id="left-row">Received</td>
                            <td id="right-row"><%= received %></td>
                        </tr>



                        <tr id="report-total"><th colspan="2"></th></tr>
                        <tr id="report-total">
                            <th >Order in this month ></th>
                            <td id="total-right-row"><%= monthNum %></td>
                        </tr>
                        <tr id="report-total">
                            <th >Order in this year ></th>
                            <td id="total-right-row"><%= yearNum %> </td>
                        </tr>
                        <tr id="report-total">
                            <th >Total order ></th>
                            <td id="total-right-row"><%= totalOrdered %></td>
                        </tr>
                        <tr id="report-total">
                            <th >Earn in received ></th>
                            <td id="total-right-row">RM<%= totalReEarn %></td>
                        </tr>
                    

                </table>       
            

        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Technet Reporting)</span>
    </footer>
    <!-- clean up session  -->
        <c:remove var="pendPacking" scope="session" />
        <c:remove var="pendShipping" scope="session" />
        <c:remove var="pendDelivery" scope="session" />
        <c:remove var="shipped" scope="session" />
        <c:remove var="delivering" scope="session" />
        <c:remove var="delivered" scope="session" />
        <c:remove var="received" scope="session" />
        <c:remove var="totalOrdered" scope="session" />
        <c:remove var="totalReEarn" scope="session" />
        <c:remove var="yearNum" scope="session" />
        <c:remove var="monthNum" scope="session" />



</html>