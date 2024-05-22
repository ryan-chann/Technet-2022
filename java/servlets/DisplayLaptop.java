/*
	Author: Ryan Chan Joon Yew
*/
package servlets;

//Import entities
import entity.Laptop;

//Import java io
import java.io.*;


//Import java persistence
import javax.persistence.*;

//Import Java utility
import java.util.*;
import java.util.regex.*;


//Import servlet classes
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "DisplayLaptop", urlPatterns = {"/DisplayLaptop"})
public class DisplayLaptop extends HttpServlet {
    @PersistenceContext 
           EntityManager entityManager;
     
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
       
        try{
            HttpSession session = request.getSession();
            PrintWriter out = response.getWriter();
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/displayLaptop.jsp");

            if(session != null){
                //Search Bar
                String searchQuery = request.getParameter("searchQuery");
                //Get Laptop Query String
                String laptopSearchQuery = request.getParameter("getLaptopQuery");
                List<Laptop> laptop = null;
                
                if(searchQuery != null ){
                    laptop = findLaptopByName(searchQuery);
                    session.setAttribute("laptop",laptop);
                }else if(laptopSearchQuery != null ){
                    laptop = findLaptopByCategory(laptopSearchQuery);
                    session.setAttribute("laptop", laptop);
                }else{
                    session.setAttribute("laptop", "");
                }


                //Set Pagination number
                String page = request.getParameter("paginationPage");
                String paginationSize = request.getParameter("pageSize");

                if(page != null && !page.isEmpty()){
                    int pageInt = Integer.parseInt(page);

                    if(pageInt == 0){
                        session.setAttribute("page", 1);
                    }else{
                       session.setAttribute("page", pageInt);
                    }
                }else{
                    session.setAttribute("page", 1);
                }

                //Learn More ID
                String learnMoreID = request.getParameter("laptopIDSearch");
                Cookie learnMoreCookie = new Cookie("learnMoreID", learnMoreID);
                Cookie deleteLearnMore = new Cookie("learnMoreID", "");

                if(learnMoreID != null && !learnMoreID.isEmpty() && !("0".equals(learnMoreID))){
                    response.addCookie(learnMoreCookie);
                    learnMoreCookies(learnMoreID, response);
                    response.sendRedirect("learnMoreLaptop.jsp");
                }else if( laptop !=null){

                    response.addCookie(deleteLearnMore);
                    dispatcher.forward(request,response);
                    
                }else{
                    out.println("<html>");
                    out.println("<script>");
                    out.println("alert('No this Laptop in our database');");
                    //Back index page
                    out.println("location='index.jsp';");
                    out.println("</script>");
                    out.println("</html>");
                
                }
                                
            }
        }catch(Exception exception){
            System.out.println(exception);
        }   
    }
    
    private List<Laptop> findLaptopByCategory(String laptopCategory){
        List<Laptop> category = entityManager.createNamedQuery("Laptop.findByLaptopcategory").setParameter("laptopcategory", laptopCategory).getResultList();
        
        return category;
    }
    
    private List<Laptop> findLaptopByName(String laptopName){
        List<Laptop> name = entityManager.createNamedQuery("Laptop.findAll").getResultList();
        //List<Laptop> name = entityManager.createNamedQuery("Laptop.findByLaptopcategory").setParameter("laptopcategory", laptopCategory).getResultList();
        
        List<Laptop> laptopList = new ArrayList<Laptop>();
        
        for(Laptop laptop: name){
            
            if(laptop.getLaptopname().contains(laptopName)||laptop.getLaptopname().contains(laptopName.toUpperCase())){
                laptopList.add(laptop);
            }
           
        }
        if (laptopList.isEmpty()){
            laptopList = null;
        
        }
        return laptopList;
    }
    
    private void learnMoreCookies(String ID, HttpServletResponse response){
        Laptop laptop = entityManager.find(Laptop.class,ID);
        Cookie learnMoreName = new Cookie("learnMoreName", laptop.getLaptopname());
        Cookie learnMoreImage = new Cookie("learnMoreImage", laptop.getLaptopimage());
        Cookie learnMorePrice = new Cookie("learnMorePrice", laptop.getLaptopprice().toString());
        Cookie learnMoreCpu = new Cookie("learnMoreCpu", laptop.getCpu());
        Cookie learnMoreRam  = new Cookie("learnMoreRam", laptop.getRam());
        Cookie learnMoreStorage = new Cookie("learnMoreStorage", laptop.getStorage());
        Cookie learnMoreGraphicCard= new Cookie("learnMoreGraphicCard", laptop.getGraphiccard());
        
        response.addCookie(learnMoreName);
        response.addCookie(learnMoreImage);
        response.addCookie(learnMorePrice);
        response.addCookie(learnMoreCpu);
        response.addCookie(learnMoreRam);
        response.addCookie(learnMoreStorage);
        response.addCookie(learnMoreGraphicCard);
    }

    private CharSequence toupper(String laptopName) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}