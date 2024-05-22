<!--
	Author: Ryan Chan Joon Yew
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entity.Laptop"%>

<%-- JSP Init variable --%>
<%
    //Get 2 parameter from URL
    List<Laptop> laptops = (List<Laptop>) session.getAttribute("laptop");
    Integer pageRequested = (Integer)session.getAttribute("page");
    Integer learnMore = (Integer)session.getAttribute("learnMore");
    
    
    //Quantity of laptops to display in a page
    final int LAPTOPPP = 4;
    
    //Define pagination Size
    int paginationSize = getPaginationSize(getLaptopCount(laptops));
    
    int loopStartingIndex;
    int loopCondition;
    
    if(paginationSize == 0){
        loopStartingIndex = 0;
        loopCondition = getLaptopCount(laptops);
    }else{
        loopStartingIndex = indexLoop(pageRequested) - 4;
        loopCondition = loopCondition(getLaptopCount(laptops), pageRequested, paginationSize);
    }

%>

<%-- JSP Functions --%>
<%!
    private int getLaptopCount(List<Laptop> laptops){
        return laptops.size();
    }

    private int getPaginationSize(int laptopCount){
        double tempDouble = (double)laptopCount / 4;

        int paginationSize = 0;
        if((tempDouble - (int)tempDouble) == 0){
            paginationSize = (int)tempDouble;
        }else if((tempDouble - (int)tempDouble) != 0){
            paginationSize = (int)tempDouble + 1;
        }
        return paginationSize;
    }
    
    private int indexLoop(Integer pageRequested){
        return pageRequested * 4;
    }

    private int loopCondition(int laptopCount, Integer pageRequested, int paginationSize){
        double tempDouble = (double)laptopCount / 4;
        
        if((tempDouble % 1 != 0) && pageRequested > paginationSize - 1){
            return laptopCount;
        }else if(tempDouble % 1 == 0){
            return pageRequested * 4;
        }else{
            return pageRequested * 4;
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="#" type="image" sizes="16x16">
        
        <title><%= laptops.get(0).getLaptopcategory() %></title>
        
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
            /* Body styles */
                .product-frame{
                    background-color: #F5B517;
                }

                .product-image{
                    padding: 20px 0px 20px 20px;
                }

                .product-description{
                    border-left: 2px dotted #000000;
                    padding: 5px 0px 0px 25px;
                }

                .product-image, .product-description{
                    margin: 0px 0px 50px 0px;
                }
            
            /* Pagination Styles */
                .product-pagination{
                    display: inline-block;
                }

                .center-product-pagination{
                    text-align: center;
                }
            
            /* Button Styles */
                .product-filter div, .learnMore-btn{
                    position: relative;
                    transform: translateY(50%);
                }

                .product-filter button, .learnMore-btn, .product-pagination button{
                    background-color: #000000;
                    color: #FFFFFF;
                }

                .product-filter button:hover, .learnMore-btn:hover, .product-pagination button:hover{
                    background-color: #414A4C;
                }
                
                .product-pagination button{
                    display: inline-block;
                    border-radius: 20px;
                    border-style: none;
                    padding: 8px 16px;
                    margin: 0px 5px 0px 0px;
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
        <jsp:include page = "header.jsp" />
        
        <form method="get" action="DisplayLaptop">
        <!-- Filter buttons -->
        <section class="container-fluid">
            <div class="row product-filter">
                <div class="col-2">
                    <button id="fGamingLaptop">Gaming Laptop</button>
                </div>
                
                <div class="col-2">
                    <button id="fBusinessLaptop">Business Laptop</button>
                </div>
            </div>
        </section>
        
        </br>
        <section class="container-fluid product-frame">
            <div class="row">
            <% 
                try{
                    for(int index = loopStartingIndex; index < loopCondition; index++){
                        String laptopID = laptops.get(index).getLaptopid();
            %>
                <div class="col product-image">
                    <img src="<%= laptops.get(index).getLaptopimage()%>" width="171" height="139">
                </div>
                
                <div class="col product-description">
                    <h3 style="font-weight:bold;"><%= laptops.get(index).getLaptopname()%></h3>
                    <br>
                    <span>RM <%= laptops.get(index).getLaptopprice()%></span>
                    <br>
                    <br>
                    <button class="learnMore-btn" onclick="laptopInfo('<%= laptopID %>')">Learn More</button>
                </div>
                <%
                        if(index != 0 && (index + 1) % 2 == 0){
                            out.print("<div class=\"w-100\"></div>");
                        }
                    }
                }catch(ArrayIndexOutOfBoundsException laptopException){
                %>
                <script>
                    history.back();
                </script>
                <%
                }
                %>
            </div>
            <div class="center-product-pagination">
                <div class="product-pagination">
                        <% 
                            if(!(paginationSize <= 1)){
                                out.print("<button id=\"back\">&laquo;</button>");
                            }

                            //index+1
                            for(int index = 0; index < paginationSize; index++){
                                out.print("<button class=\"page\" onclick=\"setPage(" + (index+1) + ")\">" + (index + 1) + "</button>");
                            }
                            
                            if(paginationSize >= 2){
                                out.print("<button id=\"next\">&raquo;</button>");
                            }
                        %> 
                </div>
            </div>
        </section>  
            
        <!-- Hidden inputs -->
        <div> 
            <span style="display: none;" id="pSize"><%=paginationSize%></span>
            <input type="hidden" id="getLaptopQuery" name="getLaptopQuery" value="">
            <input type="hidden" id="paginationPage" name="paginationPage" value="<%= pageRequested %>">
            <input type="hidden" id="laptopIDSearch" name="laptopIDSearch" value="0">
            <input type="hidden" id="paginationSize" name="pageSize" value="<%=paginationSize%>">
        </div>
        </form>
            <div style="height: 50px; background-color: #F5B517;"></div>
            
        <!-- Footer -->
        <jsp:include page="footer.jsp" />
        
        <script>
            var paginationSize = parseInt(document.getElementById("pSize").innerHTML);
            
            document.getElementById("fBusinessLaptop").addEventListener("click", function(){
                document.getElementById("getLaptopQuery").value = "Business Laptop";
                document.getElementById("paginationPage").value = 1;
            });

            document.getElementById("fGamingLaptop").addEventListener("click", function(){
                document.getElementById("getLaptopQuery").value = "Gaming Laptop";
                document.getElementById("paginationPage").value = 1;
            });
            
            function laptopInfo(id){
                document.getElementById("laptopIDSearch").value = id;
            }
            
            if(document.getElementById("back") !== null){
                document.getElementById("back").addEventListener("click", function(){
                    var index = document.getElementById("paginationPage").value;
                    index--;
                    document.getElementById("paginationPage").value = index;
                    document.getElementById("getLaptopQuery").value = "<%= laptops.get(0).getLaptopcategory() %>";
                });
            }
            
            if(document.getElementById("next") !== null){
                document.getElementById("next").addEventListener("click", function(){
                    var index = document.getElementById("paginationPage").value;
                    
                    if(index < paginationSize){
                        index++;
                        document.getElementById("paginationPage").value = index;
                        document.getElementById("getLaptopQuery").value = "<%= laptops.get(0).getLaptopcategory() %>";
                    }else{
                        document.getElementById("paginationPage").value = index;
                        document.getElementById("getLaptopQuery").value = "<%= laptops.get(0).getLaptopcategory() %>";
                    }
                });
            }
            
            function setPage(page){
                document.getElementById("paginationPage").value = page;
                document.getElementById("getLaptopQuery").value = "<%= laptops.get(0).getLaptopcategory() %>";
            }
        </script>
    </body>
    <%
            session.invalidate();
    %>
</html>
