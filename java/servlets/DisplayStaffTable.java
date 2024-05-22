/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;



import entity.Technetuser;
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


public class DisplayStaffTable extends HttpServlet {

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
            }
        
        List<Technetuser> staff =  (List<Technetuser>)manager.createQuery("SELECT s FROM Technetuser s WHERE s.technetid LIKE 'S%' ORDER BY s.technetid",Technetuser.class).setFirstResult(pageNum).setMaxResults(5).getResultList();

           session.setAttribute("staff", staff);
            resp.sendRedirect("technet_admin/displayStaff.jsp");
    }
}


