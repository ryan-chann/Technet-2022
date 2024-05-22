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
public class DisplayOrder extends HttpServlet {

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
        //decimal number format
        DecimalFormat df=new DecimalFormat("0.00");
        


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
            
        
        //pagination 
        if(orderCRUD.equals("display")){
           
            session.setAttribute("orders", orders);
            resp.sendRedirect("technet_admin/displayOrder.jsp");
            
            
            //if 2-> +5
            
            //displayStatus(session,resp,orders);
        
        }else if(orderCRUD.equals("Check")){
                        
            checkStatus(session,resp,orderID);


            
        }else if(orderCRUD.equals("Update")){
            
            updateStatus(session,resp,orderID,status);


            
        }else if(orderCRUD.equals("cancel")){

            deleteStatus(session,resp,orderID);
        
        }else if(orderCRUD.equals("report")){
            
              orders = manager.createNamedQuery("Orders.findAll").getResultList();
            
            for (Orders order : orders) {
                order.getStatus();

                switch (order.getStatus()) {
                    case "Pending Packing":
                        pendPacking++;
                        break;
                    case "Pending Shipping":
                        pendShipping++;
                        break;
                    case "Pending Delivery":
                        pendDelivery++;
                        break;
                    case "Shipped":
                        shipped++;
                        break;
                    case "Delivering":
                        delivering++;
                        break;
                    case "Delivered":
                        delivered++;
                        break;
                    case "Received":
                        received++;
                        BigDecimal bd=order.getPrice();
                        totalReEarn += bd.doubleValue();
                        break;

                //error
                    default:
                        break;
                }
                
                SimpleDateFormat fty = new SimpleDateFormat ("yyyy");
                SimpleDateFormat ftm = new SimpleDateFormat ("MM");
                Date date = order.getOrderdate();
                String yearS= fty.format(date);
                String monthS= ftm.format(date);
                int orderYear = Integer.valueOf(yearS);
                int orderMonth = Integer.valueOf(monthS);



                LocalDate currentdate = LocalDate.now();
                int currentYear = currentdate.getYear();
                int currentMonth = currentdate.getMonthValue();

                if(orderYear==currentYear){
                    yearNum++;
                    if(orderMonth==currentMonth){
                        monthNum++;
                    }

                }
            }
            if(reportType.equals("Order Report")){
                
                orderRecord(session,resp, df,orders);

            }else if(reportType.equals("Final Report")){
                 finalReport(session,resp,df,orders);
                 
            }
        
        }
        

    }
  
    public void displayStatus(HttpSession session,HttpServletResponse resp, List<Orders> orders ) throws IOException{ 
        
        session.setAttribute("orders", orders);
        resp.sendRedirect("technet_admin/displayOrder.jsp");
    
    }
    
    public void checkStatus(HttpSession session,HttpServletResponse resp, String orderID ) throws IOException{ 
        
        Orders order = manager.find(Orders.class, orderID);
        session.setAttribute("order", order);
        resp.sendRedirect("technet_admin/check_order.jsp");
    
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
            
            resp.sendRedirect("technet_admin/displayOrder.jsp");
        }
        catch(Exception e){
            //error
        }
    
    }
    
    public void deleteStatus(HttpSession session,HttpServletResponse resp, String orderID ) throws IOException{
      
        //delete query base on laptop id
        try {
             rtx.begin();
             manager.createQuery("DELETE FROM Orders o WHERE o.orderid = :id")
                   .setParameter("id", orderID)
                   .executeUpdate();
            rtx.commit();
            
            List<Orders> orders = (List<Orders>)manager.createQuery("SELECT o FROM Orders o ORDER BY o.orderid",Orders.class).setFirstResult(0).setMaxResults(5).getResultList();
            session.setAttribute("orders", orders);
            resp.sendRedirect("technet_admin/displayOrder.jsp");
        } catch (Exception ex) {
            //error

        }
    }
    
    
    public void orderRecord(HttpSession session,HttpServletResponse resp,DecimalFormat df, List<Orders> orders) throws IOException{ 
                
       pendPacking =(pendPacking/orders.size())*100 ;
       pendShipping = (pendShipping/orders.size())*100;
       pendDelivery = (pendDelivery/orders.size())*100;
       shipped = (shipped/orders.size())*100 ;
       delivering = (delivering/orders.size())*100 ;
       delivered = (delivered/orders.size())*100 ;
       received = (received/orders.size())*100 ;
       
       session.setAttribute("pendPacking", df.format(pendPacking));
       session.setAttribute("pendShipping", df.format(pendShipping));
       session.setAttribute("pendDelivery", df.format(pendDelivery));
       session.setAttribute("shipped", df.format(shipped));
       session.setAttribute("delivering", df.format(delivering));
       session.setAttribute("delivered", df.format(delivered));
       session.setAttribute("received", df.format(received));
       
       pendPacking =0 ;
       pendShipping =0;
       pendDelivery = 0;
       shipped = 0 ;
       delivering = 0 ;
       delivered = 0 ;
       received = 0 ;
       
       resp.sendRedirect("technet_admin/record.jsp");
    }
    
    public void finalReport(HttpSession session,HttpServletResponse resp, DecimalFormat df,List<Orders> orders) throws IOException{ 
       
        
       session.setAttribute("pendPacking",(int) pendPacking);
       session.setAttribute("pendShipping",(int) pendShipping);
       session.setAttribute("pendDelivery", (int)pendDelivery);
       session.setAttribute("shipped", (int)shipped);
       session.setAttribute("delivering", (int)delivering);
       session.setAttribute("delivered", (int)delivered);
       session.setAttribute("received", (int)received);
       session.setAttribute("totalOrdered", orders.size());
       session.setAttribute("totalReEarn", df.format(totalReEarn));
       session.setAttribute("yearNum", yearNum);
       session.setAttribute("monthNum", monthNum);
       pendPacking =0 ;
       pendShipping =0;
       pendDelivery = 0;
       shipped = 0 ;
       delivering = 0 ;
       delivered = 0 ;
       received = 0 ;
       totalReEarn=0;
       yearNum=0;
       monthNum=0;
       

        resp.sendRedirect("technet_admin/reporting.jsp");
    }
}