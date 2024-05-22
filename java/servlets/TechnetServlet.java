package servlets;

import entity.*;
import java.io.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.transaction.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name = "TechnetServlet", urlPatterns = {"/TechnetServlet"})
public class TechnetServlet extends HttpServlet {
    @PersistenceContext EntityManager manager;
    @Resource UserTransaction transaction;
    
    //Do post methods
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        PrintWriter out = resp.getWriter();
        Technetuser technetUser;
        String profile =null;
        try{
            if (session != null) {
                //Click Sign in on technet user login page
                if (req.getParameter("signIn") != null) {
                    technetUser = manager.find(Technetuser.class, req.getParameter("technetID").toUpperCase());
                    isLogin(req, resp, session, technetUser);
                }
                //Click Create on create staff page
                else if(req.getParameter("create") != null){
                    isCreate(req, resp, session, (Technetuser)req.getSession().getAttribute("technetStaff"));
                }
                //Click Search on search staff page
                else if (req.getParameter("search") != null) {
                    technetUser = manager.find(Technetuser.class, req.getParameter("staffID").toUpperCase());
                    isSearch(resp, session, technetUser, req.getParameter("staffID").toUpperCase());
                }
                //Click Update on update staff page /update profile page
                else if (req.getParameter("update") != null) { 
                    if(req.getParameter("profile")==null){
                        profile ="";
                        
                    }else {
                        profile =req.getParameter("profile");
                        
                    }
                    isUpdate(req, resp, session, (Technetuser)req.getSession().getAttribute("technetStaff"), profile);
                    
                }
                //Click delete on staff details page
                else if(req.getParameter("delete") != null){
                    isDelete(req, resp, session, (Technetuser)req.getSession().getAttribute("technetStaff"));
                }
            }
        }catch (IndexOutOfBoundsException e) {
            out.print("<html>");
            out.print("<body>");
            out.println("alert('Something Is Wrong !! Please Try Again');");
            out.println("location='technet_admin/searchStaff.jsp';");
            out.print("</html>");
        }
        catch (NullPointerException e) {
            out.println("<html>");
            out.println("<script>");
            if (req.getParameter("search") != null) {
               out.println("alert('Staff Record Not Found');");
               out.println("location='technet_admin/searchStaff.jsp';"); 
            }
            else if (req.getParameter("signIn") != null) {
               out.println("alert('Invalid Technet ID ! Please Try Again');");
               out.println("location='index.jsp';");
            }
            
            out.println("</script>");
            out.println("</html>");
        }
        finally{
            if (out != null) {
                out.close();
            }
        }
    }

    //Do get methods
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        
        //Get the parameters for the pages
        String action = req.getParameter("action");
        String currentUser = req.getParameter("user");
        
        //If create a new staff
        if (action.equals("create")) {
            //Find the staff ID didn't used in database
            findLatestStaffID(resp, session);
        }
        //Else back to main page while updated status of the order(s)
        else if(action.equals("dashboard")){
            //Get the latest summary of order(s)
            findSummaryOrders(session);
            
            //Back main page for admin/staff
            if (currentUser.equals("admin")) {
                resp.sendRedirect("technet_admin/dashboard.jsp");
            }
            else if (currentUser.equals("staff")) {
                resp.sendRedirect("technet_staff/dashboard.jsp");
            }
        }
        //Else display current admin/staff 's profile details
        else if(action.equals("profile")){
            
            //Get the current login user
            Technetuser technetUser = manager.find(Technetuser.class, req.getParameter("staffID").toUpperCase());
            
            //Go to display profile
            isProfile(resp, session, technetUser, req.getParameter("staffID").toUpperCase(),currentUser);

        } 
        //Else logout
        else if(action.equals("logout")){
            //Logout the system
            resp.sendRedirect("index.jsp");
        }
    }
    
    //Technet User Sign In
    protected void isLogin(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Technetuser technetUser) throws IOException{
        PrintWriter out = resp.getWriter();
        //Check the validation of input in sign in page
        validationLogin(out, req.getParameter("technetID"), req.getParameter("technetpass"), req.getParameter("retechnetpass"));
        
        //If record found
        if (technetUser.getTechnetid().equals(req.getParameter("technetID")) && technetUser.getTechnetpassword().equals(req.getParameter("technetpass"))) {
            
            //Find the summary orders will display in admin/staff main page
            findSummaryOrders(session);
            
            //If user is admin
            if (Character.toUpperCase(req.getParameter("technetID").charAt(0)) == 'A') {
                resp.sendRedirect("technet_admin/dashboard.jsp");
                //Set the attribute of current login admin
                session.setAttribute("technetUser", technetUser);
                
            //If user is staff
            }else if (Character.toUpperCase(req.getParameter("technetID").charAt(0)) == 'S') {
                resp.sendRedirect("technet_staff/dashboard.jsp");
                //Set the attribute of current login staff
                session.setAttribute("technetStaff", technetUser);
            }
        }
        //Record not found
        else{
            out.print("<html>");
            out.print("<body>");
            out.println("<script>");
            out.println("alert('Invalid Technet ID ! Please Try Again');");
            out.println("location='index.jsp';");
            out.println("</script>");
            out.print("</body>");
            out.print("</html>");
        }
    }
    
    //Create a new staff
    protected void isCreate(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Technetuser technetUser) throws ServletException, IOException{
        PrintWriter out = resp.getWriter();
        
        //Check the validation of input
        if(checkValidation(out, req.getParameter("firstname"), req.getParameter("lastname"), req.getParameter("staffpass"),req.getParameter("restaffpass"))){
            try{

                //Get the inputs
                technetUser.setFirstname(req.getParameter("firstname"));
                technetUser.setLastname(req.getParameter("lastname"));
                technetUser.setTechnetpassword(req.getParameter("staffpass"));

                transaction.begin();
                //Insert the staff details
                manager.persist(technetUser);
                transaction.commit();

                //Set the attribute of the new staff record
                session.setAttribute("technetStaff", technetUser);

                //If successful insert staff details
                out.println("<html>");
                out.println("<script>");
                //Display a dialog box for inform user successful insert
                out.println("alert('You had successful inserted record of Staff "+ technetUser.getTechnetid()+ "');");

                //Go back main page
                out.println("location='technet_admin/searchStaff.jsp';");
                out.println("</script>");
                out.println("</html>");

            }catch(Exception e){
                //Dialog box for unsuccessful create and prompt user enter again, back to create staff page
                out.println("<html>");
                out.println("<script>");
                out.println("alert('Unable Insert Staff Record "+ technetUser.getTechnetid()+ " ! Please Try Again');");
                out.println("location='technet_admin/createStaff.jsp';");
                out.println("</script>");
                out.println("</html>");
            }
            finally{
                if (out != null) {
                    out.close();
                }
            } 
        }
    }
    
    //Search staff details
    protected void isSearch(HttpServletResponse resp, HttpSession session, Technetuser technetUser, String staffID) throws ServletException, IOException {
       
        //If staff ID found
        if (technetUser.getTechnetid().equals(staffID)) {
            //Set the attribute of the staff had found
            session.setAttribute("technetStaff", technetUser);
            
            //Go to staff details page
            resp.sendRedirect("technet_admin/staffDetails.jsp");
        }
    }

    //Update staff details /current user profile details
    protected void isUpdate(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Technetuser technetUser,String profile) throws ServletException, IOException{
        PrintWriter out = resp.getWriter();

        //Check the validation of input
        if (checkValidation2(out, req.getParameter("firstname"), req.getParameter("lastname"), req.getParameter("staffpass"), req.getParameter("restaffpass"),profile)) {
            try{
                //Get the inputs
                technetUser.setFirstname(req.getParameter("firstname").toUpperCase());
                technetUser.setLastname(req.getParameter("lastname").toUpperCase());
                technetUser.setTechnetpassword(req.getParameter("staffpass"));

                transaction.begin();
                //Modify the staff details
                manager.merge(technetUser);
                transaction.commit();

                //If successful modify staff details
                out.println("<html>");
                out.println("<script>");
                if(profile.equals("staffProfile")){
                    //Display a dialog box for inform user successful modify
                    out.println("alert(' " + technetUser.getTechnetid() + ". You had successful modify your profile');");
                    out.println("location='technet_staff/displayProfile.jsp';");

                }else if(profile.equals("adminProfile")){
                    //Display a dialog box for inform user successful modify

                    out.println("alert(' " + technetUser.getTechnetid() + ". You had successful modify your profile');");
                    //Go back admin Profile page
                    out.println("location='technet_admin/displayProfile.jsp';");

                }else{
                    //Display a dialog box for inform user successful modify
                    out.println("alert('You had successful updated record of Staff "+ technetUser.getTechnetid() +"');");
                    //Go back staff details page
                    out.println("location='technet_admin/staffDetails.jsp';");
                }
                    out.println("</script>");
                    out.println("</html>");            
            }
            catch(Exception e){

                //Dialog box for unsuccessful modify and prompt user enter again, back to update staff page
                out.println("<html>");
                out.println("<script>");
                if(profile.equals("staffProfile")){
                    out.println("alert('Unable Update Record , Staff "+ technetUser.getTechnetid()+ " ! Please Try Again');");
                    out.println("location='technet_staff/updateProfile.jsp';");

                }else if(profile.equals("adminProfile")){
                    out.println("alert('Unable Update Record , Admin "+ technetUser.getTechnetid()+ " ! Please Try Again');");
                    out.println("location='technet_admin/updateProfile.jsp';");

                }else{
                    out.println("alert('Unable Update Staff Record "+ technetUser.getTechnetid()+ " ! Please Try Again');");
                    //Go back staff details page
                     out.println("location='technet_admin/updateStaff.jsp';");
                }
                out.println("</script>");
                out.println("</html>");
            }
            finally{
                if (out != null) {
                    out.close();
                }
            }   

            //Set the attribute of latest staff record
            session.setAttribute("technetStaff", technetUser);
        }
    }
        
    //Delete staff record
    protected void isDelete(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Technetuser technetUser) throws ServletException, IOException{
        PrintWriter out = resp.getWriter();
        
        try{
            transaction.begin();
            //If record found
            technetUser = manager.find(Technetuser.class, technetUser.getTechnetid());
            
            //Delete staff record
            manager.remove(technetUser);
            transaction.commit();
            
            //If successful delete staff details
            out.println("<html>");
            out.println("<script>");
            //Display a dialog box for inform user successful delete
            out.println("alert('You had successful deleted record of Staff "+ technetUser.getTechnetid() +"');");
            
            //Go back search staff page
            out.println("location='technet_admin/searchStaff.jsp';");
            out.println("</script>");
            out.println("</html>");
            
            //Set the attribute of staff record
            session.setAttribute("technetStaff", technetUser);            
        }
        catch(Exception e){
            //Dialog box for unsuccessful delete and prompt user click again, back to staff details page
            out.println("<html>");
            out.println("<script>");
            out.println("alert('Unable Delete Staff Record "+ technetUser.getTechnetid()+ " ! Please Try Again');");
            out.println("location='technet_admin/staffDetails.jsp';");
            out.println("</script>");
            out.println("</html>");
        }
        finally{
            if (out != null) {
                out.close();
            }
        }   
    }
    
    //Display Staff or Admin Profile
    protected void isProfile(HttpServletResponse resp, HttpSession session, Technetuser technetUser, String staffID,String currentUser) throws ServletException, IOException {
                    
        //If staff ID found
        if (technetUser.getTechnetid().equals(staffID)) {
                
            //Set the attribute of the staff had found
            session.setAttribute("technetStaff", technetUser);

            if (currentUser.equals("admin")) {
                //Go to admin Profile
            resp.sendRedirect("technet_admin/displayProfile.jsp");
            }
            else if (currentUser.equals("staff")) {
                //Go to staff Profile
            resp.sendRedirect("technet_staff/displayProfile.jsp");
            }   
        }        
    }
    
    //Use to find the staff ID didn't used in database
    protected void findLatestStaffID(HttpServletResponse resp, HttpSession session)throws ServletException, IOException {
         //Define variables will use 
            String staffID = "", ID;
            int num = 0;
            boolean findOut = false;

            do{
                //Set default staff ID to S000, and every looping will get a new staff ID 
                //SXXX, X = integer
                if (staffID.length() != 4) {
                    ID = String.format("%3d", num);
                    //Replace the blank to 0
                    staffID = "S" + ID.replace(' ','0');
                }

                //If staff ID not equal to S000 will start do checking
                if (!staffID.equals("S000")) {
                    try{
                        //Find the staff ID, if exist, will loop to find a non-exist staff ID
                        Technetuser technetUser = manager.find(Technetuser.class, staffID);
                        if (technetUser.getTechnetid().equals(staffID)) {
                            //Set variable to false to perform looping
                            findOut = false;
                        }
                    }catch(NullPointerException e){
                        //Set variable to true to stop looping
                        findOut = true;

                        //Create a record for new staff ID
                        Technetuser technetUser = new Technetuser(staffID);

                        //Set the attribute, so the new staff ID can be use in create staff page
                        session.setAttribute("technetStaff", technetUser);
                        resp.sendRedirect("technet_admin/createStaff.jsp");
                    }
                }
                
                //Index will plus 1
                num++;

                //Reset the value of staff ID to get new staff ID
                staffID ="";

            }while(!findOut); //While variable is false will continue looping
    }
    
    //Find the short summary of orders
    protected void findSummaryOrders(HttpSession session){
        //Define the variable
        int penPacking, penShipping, penDelivery;
        
        //Define the default value to 0
        penPacking = penShipping = penDelivery = 0;
        
        //Get all records in orders table
        List<Orders> totalOrders = manager.createNamedQuery("Orders.findAll").getResultList();
        
        for(Orders technetOrders : totalOrders){
            //Use order status for switch
            switch (technetOrders.getStatus()) {
                //If order's status is pending packing 
                case "Pending Packing":
                    //Total value + 1
                    penPacking++;
                    break;
                    
                //If order's status is pending shipping 
                case "Pending Shipping":
                    //Total value + 1
                    penShipping++;
                    break;
                
                //If order's status is pending delivery
                case "Pending Delivery":
                    //Total value + 1
                    penDelivery++;
                    break;
                //error
                default:
                    break;
            }
        }
        //Set the attribute of pending packing, shipping and delivery
        session.setAttribute("penPacking", penPacking);
        session.setAttribute("penShipping", penShipping);
        session.setAttribute("penDelivery", penDelivery);
    }
    
    //Validation of technet user sign in
    protected void validationLogin(PrintWriter out, String technetID, String password, String password2){
        //If user inputs are wrong
        if (!checkID(technetID) && !checkPassword(password, password2)) {
            out.print("<html>");
            out.print("<body>");
            out.println("<script>");
            out.println("alert('Invalid Input ! Please Try Again');");
            out.println("location='index.jsp';");
            out.println("</script>");
            out.print("</body>");
            out.print("</html>");
        }
        //If passwords does not match
        else if (!checkPassword(password, password2)) {
            out.println("<html>");
            out.println("<script>");
            out.println("alert('Passwords Must Match ! Please Try Again');");
            out.println("location='index.jsp';");
            out.println("</script>");
            out.println("</html>");
        }
        
        //If invalid technet ID
        else if (!checkID(technetID)) {
            out.print("<html>");
            out.print("<body>");
            out.println("<script>");
            out.println("alert('Invalid Technet ID ! Please Try Again');");
            out.println("location='index.jsp';");
            out.println("</script>");
            out.print("</body>");
            out.print("</html>");
        }
    }
    
    //Validation of create staff
    protected boolean checkValidation(PrintWriter out, String firstNm, String lastNm, String password, String password2) throws IOException{
        
        //If user inputs are wrong        
        if (!checkPassword(password, password2) && !checkName(firstNm, lastNm)) {
            out.println("<html>");
            out.println("<script>");
            out.println("alert('Invalid Input ! Please Try Again');");
            //Back create staff page
            out.println("location='technet_admin/createStaff.jsp';");
            out.println("</script>");
            out.println("</html>");
            
            return false;
        }
        //If passwords does not match
        else if (!checkPassword(password, password2)) {
            out.println("<html>");
            out.println("<script>");
            out.println("alert('Passwords Must Match ! Please Try Again');");
            //Back create staff page
            out.println("location='technet_admin/createStaff.jsp';");
            out.println("</script>");
            out.println("</html>");
            
            return false;
        }
        //If invalid names
        else if (!checkName(firstNm, lastNm)) {
            out.println("<html>");
            out.println("<script>");
            out.println("alert('Invalid Name ! Please Try Again');");
            //Back create staff page
            out.println("location='technet_admin/createStaff.jsp';");
            out.println("</script>");
            out.println("</html>");
            
            return false;
        }
        
        return true;
    }
    
    //Validation of update staff
    protected boolean checkValidation2(PrintWriter out, String firstNm, String lastNm, String password, String password2,String profile) throws IOException{
        
        //If user inputs are wrong        
        if (!checkPassword(password, password2) && !checkName(firstNm, lastNm)) {
            out.println("<html>");
            out.println("<script>");
            out.println("alert('Invalid Input ! Please Try Again');");
            //if the update request not from profile, means it is from upfatestaff
            if(profile.equals("staffProfile")){
                //Back staff updateProfile page                
                out.println("location='technet_staff/updateProfile.jsp';");
            }else if(profile.equals("adminProfile")){ 
                //Back admin update profil page                
                out.println("location='technet_admin/updateProfile.jsp';");
            }else{
                //Back update staff page
                 out.println("location='technet_admin/updateStaff.jsp';");
            }
            out.println("</script>");
            out.println("</html>");
            
            return false;
        }
        //If passwords does not match
        else if (!checkPassword(password, password2)) {
            out.println("<html>");
            out.println("<script>");
            out.println("alert('Passwords Must Match ! Please Try Again');");
            //if the update request not from profile, means it is from upfatestaff
            if(profile.equals("staffProfile")){
                //Back staff updateProfile page                
                out.println("location='technet_staff/updateProfile.jsp';");
            }else if(profile.equals("adminProfile")){ 
                //Back admin update profil page                
                out.println("location='technet_admin/updateProfile.jsp';");
            }else{
                //Back update staff page
                 out.println("location='technet_admin/updateStaff.jsp';");
            }
            out.println("</script>");
            out.println("</html>");
            
            return false;
        }
        //If invalid names
        else if (!checkName(firstNm, lastNm)) {
            out.println("<html>");
            out.println("<script>");
            out.println("alert('Invalid Name ! Please Try Again');");
             //if the update request not from profile, means it is from upfatestaff
            if(profile.equals("staffProfile")){
                //Back staff updateProfile page                
                out.println("location='technet_staff/updateProfile.jsp';");
            }else if(profile.equals("adminProfile")){ 
                //Back admin update profil page                
                out.println("location='technet_admin/updateProfile.jsp';");
            }else{
                //Back update staff page
                 out.println("location='technet_admin/updateStaff.jsp';");
            }
            out.println("</script>");
            out.println("</html>");
            
            return false;
        }
        
        return true;
    }
    
    //Check is passwords match
    protected boolean checkPassword(String password, String password2){
        if (password.equals(password2)) {
            return true;
        }
        return false;
    }
    
    //Check format of names
    protected boolean checkName(String firstNm, String lastNm){
        String name = "^[a-z A-Z]+$";
        
        if (firstNm.matches(name) && lastNm.matches(name)) {
            return true;
        }
        return false;
    }
    
    //Check format of ID
    protected boolean checkID(String technetID){
        String ID = "^[a-z A-Z 0-9]+$";
        if (technetID.matches(ID)) {
            return true;
        }
        return false;
    }
}
