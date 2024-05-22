/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;
import entity.Orders;
import entity.Laptop;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.*;

/**
 *
 * @author bsgan
 */
public class DisplayOrder_Staff extends HttpServlet {

     @PersistenceContext
    EntityManager manager;
     
     @Resource UserTransaction rtx;
     
     
     //report variable
     private double pendPacking = 0;
     private double pendShipping = 0;
     private double pendDelivery = 0;
     private double shipped = 0 ;
     private double delivering = 0 ;
     private double delivered = 0 ;
     private double received = 0 ;
     
     private int yearNum = 0;
     private int monthNum = 0;  
     private double totalReEarn =0 ;
     
     //doGet method to get the data
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        
             //order display
        String orderCRUD = req.getParameter("orderCRUD");
        String reportType= req.getParameter("reportType");
        String page = req.getParameter("page");

        String orderID = req.getParameter("orderid");
        String status = req.getParameter("status");//update
        int pageNum =0;
        
        //pagination
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
                                                                                                         //start from 5    //count after 5->6 5,6,7,8,9,10,11 
        List<Orders> orders =  (List<Orders>)manager.createQuery("SELECT o FROM Orders o ORDER BY o.orderid",Orders.class).setFirstResult(pageNum).setMaxResults(5).getResultList();

        if(orderCRUD.equals("display")){
            
            displayStatus(session,resp,orders);
        
        }else if(orderCRUD.equals("Check")){
            
            checkStatus(session,resp,orderID);

        }else if(orderCRUD.equals("Update")){
            
            updateStatus(session,resp,orderID,status);
        
        }
    }
  
    public void displayStatus(HttpSession session,HttpServletResponse resp, List<Orders> orders ) throws IOException{ 
        
        session.setAttribute("orders", orders);
        resp.sendRedirect("technet_staff/displayOrder.jsp");
    
    }
    
    public void checkStatus(HttpSession session,HttpServletResponse resp, String orderID ) throws IOException{ 
        
        Orders order = manager.find(Orders.class, orderID);
        session.setAttribute("order", order);
        resp.sendRedirect("technet_staff/check_order.jsp");
    
    }  
    
    public void updateStatus(HttpSession session,HttpServletResponse resp,String orderID, String status ) throws IOException{

        try{
            //Get the inputs
            Orders order = manager.find(Orders.class, orderID);
                        order.setStatus(status);
            
            rtx.begin();
            
            manager.merge(order);
            rtx.commit();
            
            List<Orders> orders = (List<Orders>)manager.createQuery("SELECT o FROM Orders o ORDER BY o.orderid",Orders.class).setFirstResult(0).setMaxResults(5).getResultList();
            session.setAttribute("orders", orders);
            resp.sendRedirect("technet_staff/displayOrder.jsp");
        }
        catch(Exception e){
            //error
        }
    
    }
}