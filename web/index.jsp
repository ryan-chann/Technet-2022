<!--
	Author: Ryan Chan Joon Yew
-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="#" type="image" sizes="16x16">
        
        <title>Homepage</title>
        
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
           
        <!--Load Bootstrap Stylesheet-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        
        
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
        
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
            }
            
            #log-in-text,#sign-up-text{
                color:black;
            }
            
            .banner-images{
                width:1000px;
                height:300px;
            }
            
            .header-span-hyperlink{
                text-decoration: none;
            }
        </style>
        <script>
            window.addEventListener( "pageshow", function ( event ) {
              var historyTraversal = event.persisted || 
                                     ( typeof window.performance !== "undefined" && 
                                          window.performance.navigation.type === 2 );
              if ( historyTraversal ) {
                // Handle page restore.
                window.location.reload();
              }
            });
        </script>
    </head>
    
    <body>
        <!-- 6 Element Header -->
        <header class="container-fluid" id="header" style="background-color:#F5B517;">
            <!-- Define Row -->
            <section class="row py-3">
                <!-- Column 1: Logo -->
                <div class="col-2">
                    <a href="index.jsp">
                        <img src="./img/technet_logo.png" alt="Technet logo" style="width:140px;height:35px;">
                    </a>
                </div>

                <!-- Column 2: Search Bar -->
                <div class="col input-group" style="padding:0px">
                      <form action="DisplayLaptop">
                      <div class="form-outline">
                        <input type="text" class="form-control" name="searchQuery" aria-label="Default" placeholder="Search..." style="width:550px;"/>
                      </div>    
                </div>
                
                <div class="col search function" style="padding:0px">
                      <button type="submit" class="btn btn-secondary" >
                        <i class="fas fa-search"></i>
                      </button>
                      </form>
                </div>
                
                <%
                try{
                    if(request.getCookies() != null){
                            Cookie cookie = null;
                            Cookie userEmail = null;
                            Cookie userPass = null;
                            Cookie[] cookies = null;


                            cookies = request.getCookies();


                            if(cookies != null){                  
                                for(int i = 0; i < cookies.length; i++){
                                    cookie = cookies[i];
                                    if(cookies[i].getName().equals("userEmail")){
                                        userEmail = cookies[i];
                                    }
                                    if(cookies[i].getName().equals("userPassword")){
                                        userPass = cookies[i];
                                    }
                                }
                            }
                        if((userEmail == null || userEmail.getValue().equals("")) && (userPass== null || userPass.getValue().equals(""))){           
                %>
                <!-- Column 4: Log-in -->
                <div class="col-1 d-block my-auto" id="log-in">
                    <a href="LogIn.jsp" class="header-span-hyperlink">
                        <span id="log-in-text">LOG-IN</span>
                    </a>
                </div> 

                <!-- Column 5: Sign-up -->
                <div class="col-1 d-block my-auto" id="sign-up">
                    <a href="SignUp.jsp" class="header-span-hyperlink">
                        <span id="sign-up-text">SIGN-UP</span>
                    </a>
                </div>
                <%
                        }else{
                %>
                <!-- Column 3: Profile -->
                <div class="col-1 d-block my-auto ">
                    <a href="userProfile.jsp">
                        <i class="fa-solid fa-user fa-xl" style="color:black;"></i>
                    </a>
                </div> 
                <%
                        }
                    }   
                }catch(NullPointerException nullException){
  
                }
                %>
            </section>
        </header>
        
        <section>
            <!-- Image Carousel Section -->
            <div class="pt-5" style="margin-bottom:100px;">
                <div id="img-carousel">
                  <div><img src="./img/banner.png" class="img-fluid d-block mx-auto banner-images" alt="Best laptop deals around"></div>
                  <div><img src="./img/business_laptop_0.png" class="img-fluid d-block mx-auto banner-images" alt="Business Laptop"></div>
                  <div><img src="./img/gaming_laptop_0.png" class="img-fluid d-block mx-auto banner-images" alt="Gaming Laptop"></div>
                </div>
            </div>
            <form method="get" action="DisplayLaptop">
                <!-- Call to action image section -->
                <div class="container-fluid" style="margin-bottom:10px;">
                    <div class="row">
                        <div class="col">
                            <div>
                                <button id="BusinessLaptopCTA">
                                    <img src="./img/business_laptop_1.jpg" class="img-fluid d-block mx-auto" alt="Business Laptop">
                                </button>
                            </div>
                        </div>

                        <div class="col">
                            <div>
                                <button id="GamingLaptopCTA">
                                    <img src="./img/gaming_laptop_1.jpg" class="img-fluid d-block mx-auto" alt="Gaming Laptop">
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="getLaptopQuery" name="getLaptopQuery" value="">
            </form>
        </section>

        <!-- Footer -->
        <footer class="container-fluid" style="background-color:#3E3E3E;">
            <span class="d-block text-center align-middle py-3" style="color:white;">@AMIT3094 GUI and Web Application Programming (RCXJSLBSXCWT)</span>
        </footer>
        
        <script>
            $(document).ready(function(){
              $('#img-carousel').slick({
                slidesToShow: 1,
                dots: true,
                centerMode: true
              });
            });
            
            document.getElementById("BusinessLaptopCTA").addEventListener("click", function(){
                document.getElementById("getLaptopQuery").value = "Business Laptop";
            });

            document.getElementById("GamingLaptopCTA").addEventListener("click", function(){
                document.getElementById("getLaptopQuery").value = "Gaming Laptop";
            });
        </script>
    </body>
</html>