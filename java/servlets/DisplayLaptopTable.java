/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import entity.Laptop;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DisplayLaptopTable extends HttpServlet {

         @PersistenceContext
    EntityManager manager;

   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();   
        
        String page = req.getParameter("page");
         int pageNum =0;
        
        if(page == null){
                pageNum=0;
            }else if(page.equals("2")){
                pageNum=5;
            }else if(page.equals("3")){
                pageNum=10;
            }else if(page.equals("4")){
                pageNum=15;
            }else if(page.equals("5")){
                pageNum=20;
            }else if(page.equals("6")){
                pageNum=25;
            }
        
        List<Laptop> laptop =  (List<Laptop>)manager.createQuery("SELECT l FROM Laptop l ORDER BY l.laptopid",Laptop.class).setFirstResult(pageNum).setMaxResults(5).getResultList();     
            session.setAttribute("laptop", laptop);
            resp.sendRedirect("technet_admin/displayLaptop.jsp");


    }



}


