/*
	Author: Ryan Chan Joon Yew
*/

package servlets;

//Import entities
import entity.Users;
import entity.Orders;
import entity.Laptop;
import entity.Paymentcard;

//Import java io
import java.io.*;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

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

import java.time.format.DateTimeFormatter;  

import java.io.PrintWriter;

@WebServlet(name = "ViewOrders", urlPatterns = {"/ViewOrders"})
public class ViewOrders extends HttpServlet {
    @PersistenceContext 
       EntityManager entityManager;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("orderEmail");
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>View Orders</title>");
            out.println("<style>");
            out.println("table {font-family: arial, sans-serif; border-collapse: collapse; width: 100%;}");
            out.println("td,th {border: 1px solid; text-align: left; padding: 8px;}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<table>"); 
            out.println("<tr>");
            out.println("<th>ORDER ID</th>"); 
            out.println("<th>LAPTOP Name</th>");
            out.println("<th>QUANTITY</th>");
            out.println("<th>PRICE</th>");
            out.println("<th>STATUS</th>"); 
            out.println("<th>ORDER DATE</th>"); 
            out.println("<th>ADDRESS</th>"); 
            out.println("</tr>"); 
            
            List<Orders> order = entityManager.createNamedQuery("Orders.findAll").getResultList();
            if(order != null){
                for(Orders orders: order){
                    if(orders.getEmail().getEmail().equals(email)){
                        out.println("<tr>");
                        out.println("<td>" + orders.getOrderid() + "</td>");
                        out.println("<td>" + orders.getLaptopid().getLaptopname() + "</td>");
                        out.println("<td>" + orders.getQuantity() + "</td>");
                        out.println("<td>" + orders.getPrice() + "</td>");
                        out.println("<td>" + orders.getStatus() + "</td>");
                        out.println("<td>" + dateFormat.format(orders.getOrderdate()) + "</td>");
                        out.println("<td>" + orders.getAddress() + "</td>");
                        out.println("</tr>"); 
                    }
                }
                out.println("<button><a href=\"userProfile.jsp\">Back</a></button>");
            }
            else{
               out.println("<h3>NO ORDER YET</h3>"); 
            }
            
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        }
    }  
}
        
    

