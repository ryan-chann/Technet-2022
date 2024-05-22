/*
	Author: Ryan Chan Joon Yew
*/

//Define package
package servlets;

//Import entities
import entity.Users;
import entity.Orders;
import entity.Laptop;
import entity.Paymentcard;

//Import java io
import java.io.*;
import java.io.PrintWriter;

//Import math
import java.math.BigDecimal;

//Import java persistence
import javax.persistence.*;

//Import Java utility
import java.util.*;

//Import annotation
import javax.annotation.*;

//Import transaction
import javax.transaction.*;

//Import servlet classes
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

//Define WebServlet 3.0
@WebServlet(name = "Purchase", urlPatterns = {"/Purchase"})
public class Purchase extends HttpServlet {
    //Init PrintWriter
    PrintWriter out = null;
    
    //init Entity Manager
    @PersistenceContext
        EntityManager entityManager;
    
    //init User Transaction with db
    @Resource
        UserTransaction userTransaction;
    
    //Override doPost
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Get session
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/learnMoreLaptop.jsp");
        out = response.getWriter();
        
        if(session != null){
            if(request.getParameter("email") != null){
                //Get user email
                String email = request.getParameter("email");

                //Get laptop price
                String laptopPrice = request.getParameter("laptopPrice");

                //Get laptop ID
                String laptopId = request.getParameter("laptopId");

                //Get Address
                String address = request.getParameter("address");

                //Get PaymentCard
                String paymentCard = request.getParameter("paymentCard");

                //Get purchase quantity
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                //Create new laptop instance
                Laptop laptop = new Laptop(laptopId);

                //Create new user instance
                Users user = new Users(email);

                //Create new date instance
                Date date = new Date();

                //Calculate Total Price
                double totalPrice = calculateTotalPrice(Double.parseDouble(laptopPrice), quantity);

                try{
                    if(validateCard(paymentCard) && enoughMoney(paymentCard, totalPrice)){
                        Orders newOrder = new Orders(generateID(), quantity, "Pending Packing", date, address, BigDecimal.valueOf(totalPrice), laptop, user);

                        userTransaction.begin();

                        entityManager.persist(newOrder);

                        userTransaction.commit();

                        double balance = deductBalance(paymentCard, totalPrice);

                        session.setAttribute("DisplayCardBalance", "Your card's balance (after purchase): RM " + balance);
                        session.setAttribute("Message", "Yes");

                        response.sendRedirect("userProfile.jsp");
                    }else{
                        if(!validateCard(paymentCard)){
                            session.setAttribute("InvalidCard", "Card does not exist in database");
                            session.setAttribute("Message", "Yes");
                            response.sendRedirect("userProfile.jsp");
                        }else if(!enoughMoney(paymentCard, totalPrice)){
                            session.setAttribute("DisplayCardBalance", "Card does not have enough money!");
                            session.setAttribute("Message", "Yes");
                            response.sendRedirect("userProfile.jsp");
                        }    
                    }
                    dispatcher.forward(request,response);
                }catch(Exception exception){
                    out.print(exception);
                }
            }else{
                response.sendRedirect("LogIn.jsp");
            }
        }
    }
    
    private String generateID(){
        String id = new String();
        int index = 1;
        List<Orders> orders = entityManager.createNamedQuery("Orders.findAll").getResultList();
        
        if(orders == null){
            id = "O1";
        }else{
            for(Orders order: orders){
                index++;
            }
            id = "O" + index;
        }
        return id;
    }
    
    private Boolean validateCard(String cardID){
        List<Paymentcard> cards = entityManager.createNamedQuery("Paymentcard.findAll").getResultList();
        Boolean status = false;
        
        for(Paymentcard card: cards){
            if(card.getCardnumber().equals(cardID)){
                status = true;
            }
        }
        return status;
    }
    
    private double deductBalance(String cardID, double amount){
        Paymentcard card = entityManager.find(Paymentcard.class, cardID);
        double cardBalance = card.getBalance().doubleValue(); 
        double balance = cardBalance - amount;
        
        card.setBalance(BigDecimal.valueOf(balance));
           
        try{
           //Begin transaction
            userTransaction.begin();

            //Persist users
            entityManager.merge(card);

            //Commit Transaction
            userTransaction.commit(); 
            
        }catch(Exception updateBalanceException){

        }
        
        return balance;
    }
    
    private Boolean enoughMoney(String cardID, double amount){
        Paymentcard card = entityManager.find(Paymentcard.class, cardID);
        double cardBalance = card.getBalance().doubleValue(); 
        if(cardBalance >= amount){
            return true;
        }else{
            return false;
        }  
    }
    
    private double calculateTotalPrice(double laptopPrice, int quantity){
        return laptopPrice * quantity;   
    }
}
