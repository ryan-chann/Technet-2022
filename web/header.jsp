<!--
	Author: Ryan Chan Joon Yew
-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="#" type="image" sizes="16x16">
        
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
        
        <!--Load Bootstrap Stylesheet-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
             
        <!--Load Fontawesome-->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.0.0/css/all.min.css"/>
        
        <!-- Load JQuery -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
        
        <!--Load Fontawesome script -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.0.0/js/all.min.js"></script>
        
        <!--Load Bootstrap scripts-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        <style>
            body{
                font-family: 'Roboto';
            }
            
            #header{
                margin: 0px 0px 0px 0px;
            }
            
            #log-in-text,#sign-up-text{
                color:black;
            }
                 
            .header-span-hyperlink{
                text-decoration: none;
            }
            
            button{
                padding-left: -300px;

            }      
        </style>
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
                <div class="col input-group" style="padding: 0px;">
                      <form action="DisplayLaptop">
                      <div class="form-outline">
                        <input type="text" class="form-control" name="searchQuery" aria-label="Default" placeholder="Search..." style="width:550px;"/>
                      </div>
                </div>
               <div class="col" style="padding: 0px;">
                      <button type="submit" class="btn btn-secondary">
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
    </body>
</html>