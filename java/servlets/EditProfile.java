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
import java.util.regex.Pattern;

//Import annotation
import javax.annotation.*;

//Import transaction
import javax.transaction.*;

//Import servlet classes
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "EditProfile", urlPatterns = {"/EditProfile"})
public class EditProfile extends HttpServlet {
    //init Entity Manager
    @PersistenceContext
        EntityManager entityManager;
    
    //init User Transaction with db
    @Resource
        UserTransaction userTransaction;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userProfile.jsp");
        
        if(session != null){
            //Get modify type
            String editType = request.getParameter("editType");
            
            //Request cookie
            Cookie cookie[] = request.getCookies();
            
            //Logged in user
            String userEmail = null;
            
            for(int i = 0; i < cookie.length; i++){
                if(cookie[i].getName().equals("userEmail")){
                    userEmail = cookie[i].getValue();
                }
            }
            
            //Find user in db
            Users user = entityManager.find(Users.class, userEmail);
            
            if(editType.equals("FirstName")){
                String firstName = request.getParameter("firstName");
                if(validation(firstName,"name")){
                    try{
                        user.setFirstname(firstName);

                        //Begin transaction
                        userTransaction.begin();

                        //Persist users
                        entityManager.merge(user);

                        //Commit Transaction
                        userTransaction.commit();
                        
                        Cookie userFirstName = new Cookie("userFirstName", user.getFirstname());
                        response.addCookie(userFirstName);
                        response.sendRedirect("userProfile.jsp");
                    }catch(Exception fnException){
                        System.out.println(fnException); 
                    }
                }else{
                    session.setAttribute("InvalidFirstName", "Name should not contain numberic & symbolic characters!");
                    dispatcher.forward(request,response);
                }
            }
            
            if(editType.equals("LastName")){
                String lastName = request.getParameter("lastName");
                if(validation(lastName,"name")){
                    try{
                        user.setLastname(lastName);

                        //Begin transaction
                        userTransaction.begin();

                        //Persist users
                        entityManager.merge(user);

                        //Commit Transaction
                        userTransaction.commit();
                        
                        Cookie userLastName = new Cookie("userLastName", user.getLastname());
                        response.addCookie(userLastName);
                        response.sendRedirect("userProfile.jsp");
                    }catch(Exception lnException){
                        System.out.println(lnException); 
                    } 
                }else{
                    session.setAttribute("InvalidLastName", "Name should not contain numberic & symbolic characters!");
                    dispatcher.forward(request,response); 
                }
            }
            
            if(editType.equals("PhoneNumber")){
                String phoneNumber = request.getParameter("phoneNumber");
                if(validation(phoneNumber, "phoneNumber")){
                    try{
                        user.setPhonenumber(phoneNumber);

                        //Begin transaction
                        userTransaction.begin();

                        //Persist users
                        entityManager.merge(user);

                        //Commit Transaction
                        userTransaction.commit();

                        Cookie userPhoneNumber = new Cookie("userPhoneNumber", user.getPhonenumber());
                        response.addCookie(userPhoneNumber);
                        response.sendRedirect("userProfile.jsp");
                    }catch(Exception pnException){
                        System.out.println(pnException); 
                    }
                }else{
                    session.setAttribute("InvalidPhoneNumber", "Follow xxx-xxx-xxxx format for phone number!");
                    dispatcher.forward(request,response);          
                }
            }
            
            if(editType.equals("Password")){
                String password = request.getParameter("password");
                String rePassword = request.getParameter("rePassword");
                
                if(validation(password,"password") && passwordMatchCheck(password,rePassword)){
                    try{
                        user.setUserpassword(password);

                        //Begin transaction
                        userTransaction.begin();

                        //Persist users
                        entityManager.merge(user);

                        //Commit Transaction
                        userTransaction.commit();

                        dispatcher.forward(request,response);
                        Cookie userPassword = new Cookie("userPassword", user.getUserpassword());
                        response.addCookie(userPassword);
                        response.sendRedirect("userProfile.jsp");
                    }catch(Exception pException){
                        System.out.println(pException); 
                    }
                }else{
                    session.setAttribute("InvalidPassword", "Password must match and contain at least 1 Uppercase, lowercase, numeric, symbolic, not less than 8 characters");
                    dispatcher.forward(request,response); 
                }
            }                
        }
    }
  
    private Boolean validation(String input, String type){
        //Regex
        String nameRegex = "^[a-zA-Z ]+$";
        String phoneNumberRegex = "^\\d{3}[-]\\d{3}[-]\\d{4}$";
        String phoneNumberRegex2 = "^\\d{3}[-]\\d{4}[-]\\d{4}$";
        String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
        
        if(type.equals("name")){
            return Pattern.matches(nameRegex, input);
        }else if(type.equals("phoneNumber")){
            return (Pattern.matches(phoneNumberRegex, input) || Pattern.matches(phoneNumberRegex2, input));
        }else if(type.equals("password")){
            return Pattern.matches(passwordRegex, input);
        }else{
            return false;
        }  
    }
    
    private Boolean passwordMatchCheck(String password1, String password2){
        return password1.equals(password2);
    }
}
