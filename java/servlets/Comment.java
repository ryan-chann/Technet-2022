
package servlets;

import entity.Admincomment;
import entity.Technetuser;

import java.io.*;
import java.util.*;
import javax.annotation.*;
import javax.persistence.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;


public class Comment extends HttpServlet {

    @PersistenceContext EntityManager manager;
    @Resource UserTransaction utx;     

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
        
        int num = 0;
        String commentID = "", newcommentID = "";
        char commentType = 'C';
        boolean findID = false;
        
        do{
            //Set the default Comment ID to C000, and each loop will get a new Comment ID
            if (commentID.length() != 4) {
                commentID = commentType + String.format("%3d", num).replace(' ', '0');
            }
            //If the comment id is not equal to C000 will start to check
            if (!commentID.equals("C000")) {
               //check database
               try{
                   Admincomment technetComment = manager.find(Admincomment.class, commentID);
                   if (technetComment.getCommentid().equals(commentID)) {
                      findID = false; 
                   }
               }catch(NullPointerException e){
                   findID = true;
                   newcommentID = commentID;
               }
            }
            num++;
            commentID = "";
        //if false will continue loop,if true will stop loop
        }while(!findID); 
        
        Admincomment technetComment = new Admincomment(newcommentID,req.getParameter("comment"),new Technetuser((String)req.getSession().getAttribute("id")));
        try{
            
            utx.begin();
            manager.persist(technetComment);
            utx.commit();

        }catch(Exception e){
           //error
        } 
        //Returns the value
        if (req.getSession().getAttribute("id").toString().charAt(0) == 'A') {
            resp.sendRedirect("technet_admin/comment.jsp");  
        }else if (req.getSession().getAttribute("id").toString().charAt(0) == 'S') {
            resp.sendRedirect("technet_staff/comment.jsp");            
        } 
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // Select Technet ID from database
        List<Admincomment> comments = manager.createQuery("SELECT s FROM Admincomment s ORDER BY s.commentid DESC ").getResultList();     
        session.setAttribute("comments", comments);
        session.setAttribute("id", req.getParameter("id"));
        //if Technet ID equals to A,get data to admin comment page
        if (req.getParameter("id").charAt(0) == 'A') {
            resp.sendRedirect("technet_admin/comment.jsp");
        //if Technet ID equals to S,get data to staff comment page
        }else if (req.getParameter("id").charAt(0) == 'S') {
            resp.sendRedirect("technet_staff/comment.jsp");            
        }
    }
} 