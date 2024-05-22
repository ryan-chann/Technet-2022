<%-- 
    Document   : Report
    Created on : Mar 16, 2022, 2:19:52 AM
    Author     : bsgan
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

                            
<%

        Object pendPacking = session.getAttribute("pendPacking");
        Object pendShipping = session.getAttribute("pendShipping");
        Object pendDelivery = session.getAttribute("pendDelivery");
        Object shipped = session.getAttribute("shipped");
        Object delivering = session.getAttribute("delivering");
        Object delivered = session.getAttribute("delivered");
        Object received = session.getAttribute("received");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Records for Order Status</title>
        
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
            /*Default font family*/
            body{
                font-family: 'Roboto';
                background-color: #E3CAA5;
            }
            
                .row{
                padding-bottom: 30px;
            }
            
            #report{
                padding: 20px 20px 5px 20px;
                font-size: 20px;
                display:block;
                margin:auto;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: 582px;
                margin-top: 80px;
                width: 800px;
            }
            /* Order Details Div */
            .graph {
                margin-bottom:1em;
                font:normal 100%/150% arial,helvetica,sans-serif;
            }

            .graph tbody th {
                    text-align:right;
            }
            
@supports (display:grid) {

	@media (min-width:32em) {

		.graph {
			display:block;
                        width:700px;
                        height:300px;
		}

		.graph caption {
			display:block;
		}

		.graph thead {
			display:none;
		}

		.graph tbody {
			position:relative;
			display:grid;
			grid-template-columns:repeat(auto-fit, minmax(2em, 1fr));
			column-gap:2.5%;
			align-items:end;
			height:100%;
			margin:3em 0 1em 2.8em;
			padding:0 1em;
			border-bottom:2px solid rgba(0,0,0,0.5);
			background:repeating-linear-gradient(
			180deg,
			rgba(170,170,170,0.7) 0,
			rgba(170,170,170,0.7) 1px,
			transparent 1px,
			transparent 20%
		);
		}

		.graph tbody:before,
		.graph tbody:after {
			position:absolute;
			left:-3.2em;
			width:2.8em;
			text-align:right;
			font:bold 80%/120% arial,helvetica,sans-serif;
		}

		.graph tbody:before {
			content:"100%";
			top:-0.6em;
		}

		.graph tbody:after {
			content:"0%";
			bottom:-0.6em;
		}

		.graph tr {
			position:relative;
			display:block;
		}

		.graph tr:hover {
			z-index:999;
		}

		.graph th,
		.graph td {
			display:block;
			text-align:center;
		}

		.graph tbody th {
			position:absolute;
			top:-3em;
			left:0;
			width:100%;
			font-weight:normal;
			text-align:center;
                        white-space:nowrap;
			text-indent:0;
			transform:rotate(-45deg);
		}

		.graph tbody th:after {
			content:"";
		}

		.graph td {
			width:100%;
			height:100%;
			background:#F63;
			border-radius:0.5em 0.5em 0 0;
			transition:background 0.5s;
		}

		.graph tr:hover td {
			opacity:0.7;
		}

		.graph td span {
			overflow:hidden;
			position:absolute;
			left:50%;
			top:50%;
			width:0;
			padding:0.5em 0;
			margin:-1em 0 0;
			font:normal 85%/120% arial,helvetica,sans-serif;
			font-weight:bold;
			opacity:0;
			transition:opacity 0.5s;
                        color:white;
		}

		.toggleGraph:checked + table td span,
		.graph tr:hover td span {
			width:4em;
			margin-left:-2em; /* 1/2 the declared width */
			opacity:1;
		}
                
                #footer{
                    margin: 110px 0px 0px 0px;
                }
	} /* min-width:32em */
        
} /* grid only */
        </style>
    </head>
    
    <body>
        <section class="container-fluid" id="report">
            <!-- Heading row -->
            <div class="row">
                <!-- Back Arrow -->
                <div class="col-1" >
                    <a href="dashboard.jsp"> 
                        <i  style ="margin-top: 20px" color="black" class="fa-solid fa-arrow-left-long fa-2x" ></i>
                    </a>
                </div>        
            </div>
            
            <div>
                <table class="graph">
                    <thead>
                            <tr>
                                    <th scope="col">Item</th>
                                    <th scope="col">Percent</th>
                            </tr>
                    </thead>
                    
                    <tbody>
                            <tr style="height:<%= pendPacking %>%">
                                    <th scope="row">Pending Packing</th>
                                    <td><span><%= pendPacking %>%</span></td>
                            </tr>
                            <tr style="height:<%= pendShipping %>%">
                                    <th scope="row">Pending Shipping</th>
                                    <td><span><%= pendShipping %>%</span></td>
                            </tr>
                            <tr style="height:<%= pendDelivery %>%">
                                    <th scope="row">Pending Delivery</th>
                                    <td><span><%= pendDelivery %>%</span></td>
                            </tr>
                            <tr style="height:<%= shipped %>%">
                                    <th scope="row">Shipped</th>
                                    <td><span><%= shipped %>%</span></td>
                            </tr>
                            <tr style="height:<%= delivering %>%">
                                    <th scope="row">Delivering</th>
                                    <td><span><%= delivering %>%</span></td>
                            </tr>
                            <tr style="height:<%= delivered %>%">
                                    <th scope="row">Delivered</th>
                                    <td><span><%= delivered %>%</span></td>
                            </tr>
                            <tr style="height:<%= received %>%">
                                    <th scope="row">Received</th>
                                    <td><span><%= received %>%</span></td>
                            </tr>
                    </tbody>
                </table>
            </div>
  
        </section>
    </body>
    
    <!-- Footer -->
   <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
        <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Histogram for Order Status)</span>
    </footer>
        <c:remove var="pendPacking" scope="session" />
        <c:remove var="pendShipping" scope="session" />
        <c:remove var="pendDelivery" scope="session" />
        <c:remove var="shipped" scope="session" />
        <c:remove var="delivering" scope="session" />
        <c:remove var="delivered" scope="session" />
        <c:remove var="received" scope="session" />
</html>