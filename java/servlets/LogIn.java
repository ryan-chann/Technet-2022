/*
	Author: Ryan Chan Joon Yew
*/
package servlets;

//Import entities
import entity.Users;

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

@WebServlet(name = "LogIn", urlPatterns = {"/LogIn"})
public class LogIn extends HttpServlet {
    @PersistenceContext 
           EntityManager entityManager;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
        PrintWriter out = response.getWriter();
        
        //Get Session
        HttpSession session = request.getSession();
        
        //Init dispatcher
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LogIn.jsp");
        
        //Get parameter from user
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        //If session is not empty
        if(session != null){
            //If email and password is not empty
            if(email != null && password != null){
                try{
                   //Assign user object with entity manager by email input
                   Users user = entityManager.find(Users.class, email);
                   
                   //If user exist
                   if(user != null){
                       //Get user details from database
                       String validateEmail = user.getEmail();
                       String validatePassword = user.getUserpassword();
                       
                       //If user's credentials matches with database
                       if(email.equals(validateEmail) && password.equals(validatePassword)){
                           //Create credentials cookies
                           Cookie userEmail = new Cookie("userEmail", user.getEmail());
                           Cookie userFirstName = new Cookie("userFirstName", user.getFirstname());
                           Cookie userLastName = new Cookie("userLastName", user.getLastname());
                           Cookie userPhoneNumber = new Cookie("userPhoneNumber", user.getPhonenumber());
                           Cookie userPassword = new Cookie("userPassword", user.getUserpassword());
                           
                           //Add cookies
                           response.addCookie(userEmail);
                           response.addCookie(userFirstName);
                           response.addCookie(userLastName);
                           response.addCookie(userPhoneNumber);
                           response.addCookie(userPassword);
                           
                           //Finally redirect to homepage
                           response.sendRedirect("index.jsp");
                       }else{ //User does not match with database
                           
                           Cookie clearUserEmail = new Cookie("userEmail", "");
                           Cookie clearUserPassword = new Cookie("userPassword", "");
                           
                           response.addCookie(clearUserEmail);
                           response.addCookie(clearUserPassword);
                           
                           //Use session to define error message
                           session.setAttribute("InvalidLogIn", "Invalid credentials!");
                           dispatcher.forward(request,response);
                       }
                   }else{
                       session.setAttribute("InvalidLogIn", "User not found!");
                       dispatcher.forward(request,response);
                   }
                }catch(Exception exception){
                    System.out.println(exception);
                }
            }
        }
    }    
}
