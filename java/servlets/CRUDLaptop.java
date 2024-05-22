/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import entity.Laptop;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;


public class CRUDLaptop extends HttpServlet {
    @PersistenceContext
    EntityManager manager;
    
    @Resource
    UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String laptopID=req.getParameter("laptopID");
        String crudFunction= req.getParameter("crudFunction");
        String laptopCategory= req.getParameter("laptopcategory");
        if(crudFunction.equals("Category")){
            
          createCategory(session,resp,laptopID,laptopCategory);     
           
        }else if(crudFunction.equals("Create")){
            
            createLaptop(session,req,resp);
            
        }else if(crudFunction.equals("Search")){
            
            searchLaptop(session,resp,laptopID);
        
        }else if(crudFunction.equals("Update")){
              updateLaptop(session,resp,laptopID );
            

            
        }else if(crudFunction.equals("Save")){
            saveUpdateLaptop(session,req,resp,laptopID );
            
            
            
        }if(crudFunction.equals("Delete")){

            deleteLaptop(session,resp,laptopID);
        
        }
        
       
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
   public void createCategory(HttpSession session,HttpServletResponse resp, String laptopID,String laptopCategory ) throws IOException{
        Laptop laptop;
        String laptopLetter=null;
        String lapNUM;
        String newLapNUM;
        String newID;
        String newLaptopID;
        String adHaveID=null;
        int num = 1;

        if(laptopCategory.equals("Gaming Laptop")){
            laptopLetter = "LG";
        }else if(laptopCategory.equals("Business Laptop")){
            laptopLetter = "LB";
        }else{
            //error
        }
        do{
            //set format and replace empty for number
            lapNUM= String.format("%8d",num);
            newLapNUM= lapNUM.replace(' ', '0');
            //generate a new preview laptop ID
            newID=laptopLetter+newLapNUM;
             //check database
            try{
                laptop = manager.find(Laptop.class, newID);
                num++;
                //if the newID not in the database session to create new laptop page
                if(laptop == null){

                    newLaptopID=newID;
                    //session to that page and open that page
                    session.setAttribute("newlaptopID", newLaptopID);
                    session.setAttribute("category", laptopCategory);
                    resp.sendRedirect("technet_admin/createProduct.jsp");//need to send to your create

                }else{
                    adHaveID=laptop.getLaptopid();
                }
            }catch(EntityNotFoundException e){
                //error
            }
        }while(newID.equals(adHaveID));
    }
   
   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
    public void createLaptop(HttpSession session,HttpServletRequest req,HttpServletResponse resp) throws IOException{
        
        Laptop laptop = new Laptop(); 
                
        //check price valid
        Pattern patternPrice = Pattern.compile("^[0-9]+[.]{1}[0-9]{2}$", Pattern.CASE_INSENSITIVE);
        Matcher matchPrice = patternPrice.matcher(req.getParameter("laptopprice"));
        boolean matchPriceFound = matchPrice.find();
        
        Pattern patternUrl = Pattern.compile("((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)", Pattern.CASE_INSENSITIVE);
        Matcher matchUrl = patternUrl.matcher(req.getParameter("laptopImage"));
        boolean matchUrlFound = matchUrl.find();
        
        String errorPrice = "";
        String errorUrl = "";
        
        

        laptop.setLaptopid(req.getParameter("laptopid"));
        laptop.setLaptopcategory(req.getParameter("laptopcategory"));
        laptop.setLaptopimage(req.getParameter("laptopImage"));
        laptop.setLaptopname(req.getParameter("laptopname"));
        laptop.setCpu(req.getParameter("cpu"));
        laptop.setRam(req.getParameter("ram"));
        laptop.setStorage(req.getParameter("storage"));
        laptop.setGraphiccard(req.getParameter("graphiccard"));
                
        
         if(!matchPriceFound||!matchUrlFound){

            if(!matchPriceFound){
                errorPrice="the price with 0.00 format.. ";
            }
            if(!matchUrlFound ){
                errorUrl="the correct url.. ";
            }
        }else{
             try{
                BigDecimal price=new BigDecimal(req.getParameter("laptopprice"));
                laptop.setLaptopprice(price);
                
                utx.begin();
                manager.merge(laptop);
                utx.commit();

                session.setAttribute("laptop", laptop);
                session.setAttribute("messageD", "createSuccessfully");
                resp.sendRedirect("technet_admin/displayProduct.jsp");

            }catch(Exception e){
               //error
            }

        }
           
        
        if(!errorPrice.equals("")||!errorUrl.equals("")){
             session.setAttribute("messageC","Please enter "+ errorUrl + errorPrice );
             errorPrice = "";
             errorUrl = "";
            resp.sendRedirect("technet_admin/createProduct.jsp");
        
        }
        
        
        
        
       
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public void searchLaptop(HttpSession session,HttpServletResponse resp, String laptopID ) throws IOException{
        //check input validation
        Pattern patternLaptopId = Pattern.compile("^[L]{1}[G/B/g/b]{1}[0-9]{8}$", Pattern.CASE_INSENSITIVE);
        Matcher matchLaptopId = patternLaptopId.matcher(laptopID);
        boolean matchLaptopIdFound = matchLaptopId.find();
        
        //check database
        try{
            Laptop laptop = manager.find(Laptop.class, laptopID);
            if(laptop != null){
                 session.setAttribute("laptop", laptop);
                 resp.sendRedirect("technet_admin/displayProduct.jsp");
            
            }else if(!matchLaptopIdFound){
                resp.sendRedirect("technet_admin/searchProduct.jsp");
                
            }else{
                session.setAttribute("messageR", "No this Laptop ID in database.");
                resp.sendRedirect("technet_admin/searchProduct.jsp");
            
            }
        }catch(EntityNotFoundException e){
            //error
        }
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
    public void updateLaptop(HttpSession session,HttpServletResponse resp, String laptopID ) throws IOException{
    
              Laptop laptop = manager.find(Laptop.class, laptopID);
              session.setAttribute("laptopU", laptop);
              resp.sendRedirect("technet_admin/updateProduct.jsp");
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public void saveUpdateLaptop(HttpSession session,HttpServletRequest req,HttpServletResponse resp, String laptopID ) throws IOException{
    
        Laptop laptop = manager.find(Laptop.class, req.getParameter("laptopid"));
        
        //check price valid
        Pattern patternPrice = Pattern.compile("^[0-9]+[.]{1}[0-9]{2}$", Pattern.CASE_INSENSITIVE);
        Matcher matchPrice = patternPrice.matcher(req.getParameter("laptopprice"));
        boolean matchPriceFound = matchPrice.find();
        
        Pattern patternUrl = Pattern.compile("((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)", Pattern.CASE_INSENSITIVE);
        Matcher matchUrl = patternUrl.matcher(req.getParameter("laptopImage"));
        boolean matchUrlFound = matchUrl.find();
        
        String errorPrice = "";
        String errorUrl = "";
        
        if(!matchPriceFound||!matchUrlFound){

             if(!matchPriceFound){
                errorPrice="the price with 0.00 format.";
            }
            if(!matchUrlFound ){
                errorUrl="the correct url.";
            }
        }else{
            try{//((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)
                BigDecimal price=new BigDecimal(req.getParameter("laptopprice"));


                laptop.setLaptopcategory(req.getParameter("laptopcategory"));
                laptop.setLaptopimage(req.getParameter("laptopImage"));
                laptop.setLaptopname(req.getParameter("laptopname"));
                laptop.setLaptopprice(price);
                laptop.setCpu(req.getParameter("cpu"));
                laptop.setRam(req.getParameter("ram"));
                laptop.setStorage(req.getParameter("storage"));
                laptop.setGraphiccard(req.getParameter("graphiccard"));  
                utx.begin();
                manager.merge(laptop);
                utx.commit();

                session.setAttribute("laptop", laptop);
                session.setAttribute("messageD", "Update Successfully");
                resp.sendRedirect("technet_admin/displayProduct.jsp");

            }catch(Exception e){
               //error
            }
        }
        
        
        
         if(!errorPrice.equals("")||!errorUrl.equals("")){
             session.setAttribute("laptop", laptop);
             session.setAttribute("messageU","Please enter"+ errorUrl + errorPrice );
             errorPrice = "";
             errorUrl = "";
             resp.sendRedirect("technet_admin/updateProduct.jsp");
        
        }
    }
    
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    public void deleteLaptop(HttpSession session,HttpServletResponse resp, String laptopID ) throws IOException{
      
        //delete query base on laptop id
        try {
           utx.begin();
           manager.createQuery("DELETE FROM Laptop l WHERE l.laptopid = :id")
                   .setParameter("id", laptopID)
                   .executeUpdate();
          utx.commit();
           session.setAttribute("messageR", "Deleted successfully");
            resp.sendRedirect("technet_admin/searchProduct.jsp");

        } catch (Exception ex) {
            session.setAttribute("messageD", "Error delete unsuccess...");
            resp.sendRedirect("technet_admin/displayProduct.jsp");

        }
    }


    
    
    
    
   
}