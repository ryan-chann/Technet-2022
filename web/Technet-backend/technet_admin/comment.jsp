<%-- 
    Document   : comment
    Created on : Apr 8, 2022, 9:02:37 AM
    Author     : NG XUAN CHENG
--%>

<%@page import="entity.Admincomment"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Technetuser"%>
<%  
    //Get the attributes
    List<Admincomment> admincomments = (List<Admincomment>) session.getAttribute("comments");
    Technetuser technetUser = (Technetuser) session.getAttribute("technetUser");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Comment</title>
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
            
            body{
                font-family: 'Roboto';
                background-color: #E3CAA5;
            }
            /* refresh button*/
            #refresh a{
                color:white;
                text-decoration: none;
            }
            
            #comment-box{
                text-align: left;
                background-color: #CEAB93;
                width: 60%;
                margin:auto;
                padding: 30px;
                margin-bottom: 350px;
                margin-top: 50px;
            }
            /* button color*/
            #comment-box button{
                background-color: #3E3E3E;
                width:150px;
                height:40px;
                border:none;
                color:white;
                margin-top:10px;
                margin-bottom:10px;
            }
            
            #comment-box button:hover{
                background-color: black;
            }
            #admin-comment{
                margin: auto;
            }
            #comment-section{
                margin: auto;
                width:97%;
                height:100px;
                border:2px solid #e5e7e8;
            }
            
            /* back arrow*/
            .fa-arrow-left-long{
                padding-top: -25px;
                padding-bottom: 25px;
            }
            
        </style>
    </head>
    <body>
        
                <div class="row" id="comment-box">
                <!-- Back Arrow -->
                <div  class="col-1" >
                    <a href="dashboard.jsp"> 
                        <i style color="black" class="fa-solid fa-arrow-left-long fa-2x" ></i>
                    </a>
                </div>
                    <form class="row" action ="../Comment" method="POST">
                        <h3 class="text-left">Post a comment</h3>
                        <!-- Post comment -->
                        <textarea class="form-control" name ="comment" id="admin-comment" rows="3" placeholder="Say Something..."></textarea>
                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <!-- Refresh Button -->
                    <div class="col-1" id="refresh">
                       <button type="refresh" class="btn btn-primary"><a href="../Comment?id=<%= technetUser.getTechnetid() %>"  id="refresh" >Refresh</a></button>
                    </div>
                    </form>
                    <!-- Scrollbox -->
                    <div style="width:10000px;height:300px;line-height:1.5em;overflow:scroll;padding:5px;">
                        <h3>Comments</h3>
                        <!-- Loop to get admin value -->
                        <%
                           for (Admincomment comments : admincomments) {
                           String commentUser = String.valueOf(comments.getTechnetid()).substring(30, 35);
                        %>
                    <!-- Display Admin Comment -->
                    <div style="background-color:white;" class="row" id="comment-section">
                        <b class="row">Technet ID : <%= commentUser %></b>

                        <b class="row">Comment : </b>
                        <span class="row"><%= comments.getComment() %></span>
                    </div>
                    <% }%> 
                </div> 
                </div>
    </body>
          <!-- Footer -->
         <footer class="container-fluid" id="footer" style="background-color:#FFFBE9;">
                <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Display Comment)</span>
        </footer>
</html>
