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


@WebServlet(name = "CreateUser", urlPatterns = {"/CreateUser"})
public class CreateUser extends HttpServlet {
    @PersistenceContext 
       EntityManager entityManager;
    
    @Resource
        UserTransaction userTransaction;
        
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SignUp.jsp");
        
        if(session != null){
            //First Name
            String firstName = request.getParameter("firstName");
            
            //Last Name
            String lastName = request.getParameter("lastName");
            
            //Phone Number
            String phoneNumber = request.getParameter("phoneNumber");
            
            //Email Address
            String emailAddress = request.getParameter("email");
            
            //Password
            String password = request.getParameter("password");
            
            //rePassword
            String rePassword = request.getParameter("rePassword");
            
            //Regex
            String nameRegex = "^[a-zA-Z ]+$";
            String phoneNumberRegex = "^\\d{3}[-]\\d{3}[-]\\d{4}$";
            String phoneNumberRegex2 = "^\\d{3}[-]\\d{4}[-]\\d{4}$";
            String emailRegex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
            String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
            
            //Validation
            Boolean firstNameValid = Pattern.matches(nameRegex, firstName);
            Boolean lastNameValid = Pattern.matches(nameRegex, lastName);
            Boolean phoneNumberValid = (Pattern.matches(phoneNumberRegex, phoneNumber) || Pattern.matches(phoneNumberRegex2, phoneNumber));
            Boolean emailValid = Pattern.matches(emailRegex, emailAddress);
            Boolean passwordValid = Pattern.matches(passwordRegex, password);
            Boolean passwordMatch = rePassword.equals(password);
            
            if(firstNameValid && lastNameValid && phoneNumberValid && emailValid && passwordValid && passwordMatch){
                try{
                   Users insertUser = new Users(emailAddress, firstName, lastName, phoneNumber, password);

                   //Begin transaction
                   userTransaction.begin();

                   //Persist users
                   entityManager.persist(insertUser);

                   //Commit Transaction
                   userTransaction.commit();

                   response.sendRedirect("LogIn.jsp");

                }catch(Exception exception){
                    session.setAttribute("InvalidTransaction", "Error in creating new user!");
                    dispatcher.forward(request,response);  
                }
            }else{
                if(!firstNameValid){
                    session.setAttribute("InvalidFirstName", "Name should not contain numberic & symbolic characters!");
                }
                
                if(!lastNameValid){
                    session.setAttribute("InvalidLastName", "Name should not contain numberic & symbolic characters!");
                }
                
                if(!phoneNumberValid){
                    session.setAttribute("InvalidPhoneNumber", "Follow xxx-xxx-xxxx format for phone number!");
                }
                
                if(!emailValid){
                    session.setAttribute("InvalidEmail", "Invalid Email Address");
                }
                
                if(!passwordValid){
                    session.setAttribute("InvalidPassword", "Password must contain at least 1 Uppercase, lowercase, numberic, symbolic character and not less than 8 characters!");
                }else{
                    if(!passwordMatch){
                        session.setAttribute("PasswordNotMatch", "Password does not match");
                    }
                } 
               dispatcher.forward(request,response);  
            }
        }
    }
}
