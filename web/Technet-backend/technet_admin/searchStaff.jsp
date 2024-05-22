<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technet Search Staff</title>
        
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
                padding-bottom: 100px;
            }
            
            #returnButton a{
                color:black;
            }
            
            /* Search Staff text */
            #search-staff-admin{
                color: #FFFFFF;
                margin-bottom: 60px;
                margin-right: 30px;
            }
            
            /* Search Staff form */
            #search-staff-container{
                padding: 30px;
                font-size: 20px;
                display: block;
                left: 30%;
                background-color: #CEAB93;
                border-style: none;
                border-radius: 40px;
                height: 310px;  
                width: 500px;
                margin-top:150px;
            }
            /* Button Style */
            #sSubmitButton{
                margin-top: 30px;
                position: relative;

            }

            #submitButton{
                background-color: #3E3E3E;
                border-style:none;
                color: #FFFFFF;
                display: inline-block;
                height: 35px;
                border-radius: 20px;
                width: 200px;
                margin: auto;
            }

            #submitButton:hover{
                background-color: #000000;
            }

            /* Footer Styles */
            #footer{
                margin: 110px 0px 0px 0px;
            }
            
            .icon-input-btn{
                position: relative;
                display: inline-block;
            }
            .icon-input-btn input[type="submit"]{
                padding-left: 2em;
            }
            .icon-input-btn .fa{
                display: inline-block;
                position: absolute;
                left: 0.65em;
                top: 30%;
            }
        </style>
    </head>
    <body>
        <section class="container-sm align-middle" id="search-staff-container">
            <!-- Heading row -->
            <div class="row">
                <!-- Back Arrow -->
                <div class="col-2" id="returnButton">
                    <a href="dashboard.jsp"> 
                            <i class="fa-solid fa-arrow-left-long fa-2x"></i>
                    </a>
                </div>
                               
                <!-- Search Staff heading -->
                <div class="col text-center">
                    <h3 id="search-staff-admin">TECHNET SEARCH STAFF</h3>
                </div>       
            </div>
            
            <!-- Search form -->
            <form method="post" action="../TechnetServlet">
                <!-- Admin ID -->
                <div class="form-group row" id="staffIDInput">
                        <label class="col-sm-5 col-form-label" for="staffID">Search a Staff : </label>
                        <div class="col-sm-7">
                        <input class="form-control" type="text" name="staffID" id="staffID" placeholder="Enter Staff ID..." required>                
                        </div>
                        </div>
                <br/>
                
                <!-- Search Button -->
                <div class="row" id="sSubmitButton">
                    <div class="col text-center" id="submit">
                        <button type="submit" id="submitButton" name="search" ><i class="bi bi-search"></i> Search</button>
                    </div>
                </div>
            </form>
        </section>
    </body>
     <!-- Footer -->
    <footer class="container-fluid fixed-bottom" id="footer" style="background-color:#FFFBE9;">
            <span class="d-block text-center align-middle py-3" style="color:"#rgb(227,202,165);">@AMIT3094 GUI and Web Application Programming (Search Staff)</span>
    </footer>
</html>