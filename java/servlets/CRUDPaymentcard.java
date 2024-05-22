
package servlets;

import entity.Paymentcard;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;


@WebServlet(name = "CRUDPaymentcard", urlPatterns = {"/CRUDPaymentcard"})
public class CRUDPaymentcard extends HttpServlet {
    @PersistenceContext
    EntityManager manager;
    
    @Resource
    UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String cardnumber=req.getParameter("cardnumber");
        String crudFunction= req.getParameter("crudFunction");
        String balance= req.getParameter("balance");
        
        if(crudFunction.equals("Create")){
            createPaymentcard(session, req, resp );
           
        }       
        else if(crudFunction.equals("Search")){
            searchPaymentcard(session,resp,cardnumber);
           
            
        }else if(crudFunction.equals("Update")){
            updatePaymentcard(session,resp,cardnumber );
            

            
        }else if(crudFunction.equals("Save")){
            saveUpdatePaymentcard(session,req,resp,cardnumber );
            
            
            
        }if(crudFunction.equals("Delete")){

            deletePaymentcard(session,resp, cardnumber);
        
        }if(crudFunction.equals("DisplayAll")){
            List<Paymentcard> paymentcard =  (List<Paymentcard>)manager.createQuery("SELECT c FROM Paymentcard c",Paymentcard.class).getResultList();     
            session.setAttribute("paymentcard", paymentcard);
            resp.sendRedirect("technet_admin/displayAllCard.jsp");
        
        }
    }

    //Insert New Payment Card==============================================================================================
    public void createPaymentcard(HttpSession session,HttpServletRequest req,HttpServletResponse resp ) throws IOException{
            Paymentcard paymentcard=new Paymentcard();
            PrintWriter out = resp.getWriter();
            List<Paymentcard> paymentcardList = new ArrayList<Paymentcard>();
        //check cardnumber format validation
            Pattern patternCardnumber = Pattern.compile("^[0-9]{4}[-]{1}[0-9]{4}[-]{1}[0-9]{4}[-]{1}[0-9]{4}$", Pattern.CASE_INSENSITIVE);
            Matcher matchCardnumber = patternCardnumber.matcher(req.getParameter("cardnumber"));
            boolean matchCardnumberFound = matchCardnumber.find();

        //check balance format validation
            String balance = req.getParameter("balance");
            
            //pattern 1, two decimal places
            Pattern patternBalance = Pattern.compile("^[0-9]+[.]{1}[0-9]{2}$", Pattern.CASE_INSENSITIVE);
            Matcher matchBalance = patternBalance.matcher(balance);
            boolean matchBalanceFound = matchBalance.find();
        
            //pattern 2, psotive digit only
            Pattern patternBalance2 = Pattern.compile("^[0-9]+$", Pattern.CASE_INSENSITIVE);
            Matcher matchBalance2 = patternBalance2.matcher(balance);
            boolean matchBalanceFound2 = matchBalance2.find();

            String errorCard = "";
            String errorBalance = "";       

            paymentcard.setCardnumber(req.getParameter("cardnumber"));


             if(matchBalanceFound||matchCardnumberFound||matchBalanceFound2){
                if(matchBalanceFound2){
                    balance = balance + ".00";
                }
                 
                 
                 //check database compare data
                 List<Paymentcard> paymentcards = manager.createNamedQuery("Paymentcard.findAll").getResultList(); 
        
        
                    for(Paymentcard paymentcarded: paymentcards){
                        if(paymentcarded.getCardnumber().contains(req.getParameter("cardnumber"))){
                            paymentcardList.add(paymentcarded);
                        }
                    }
                    if (paymentcardList.isEmpty()){

                            try{

                            BigDecimal balances=new BigDecimal(balance);
                            paymentcard.setBalance(balances);
    
                            utx.begin();
                            manager.merge(paymentcard);
                            utx.commit();

                            session.setAttribute("paymentcard", paymentcard);
                            
                            session.setAttribute("messageD", "Successfully created a new payment card.");
                            resp.sendRedirect("technet_admin/displayPaymentcard.jsp");

                        }catch(Exception e){
                           //error
                        }
                    }else{
                        session.setAttribute("messageC","This Card Number is already in database.");
                        resp.sendRedirect("technet_admin/createPaymentcard.jsp");
                    }

                
            }else {
                 
                    //error message for format validation
                if(!matchBalanceFound||!matchBalanceFound2){
                    errorBalance=" Balance, ->format 0.00 or only digit.";
                }
                 if(!matchCardnumberFound){
                    errorCard=" Card Number, ->format 0000-0000-0000-0000.";
                }
             }
            if(!errorBalance.equals("")||!errorCard.equals("")){
                 session.setAttribute("messageC","Please enter the correct "+errorCard + errorBalance);
                 errorBalance = "";
                 errorCard="";
                resp.sendRedirect("technet_admin/createPaymentcard.jsp");

            }
    }


    //Search Payment Card==============================================================================================
    private void searchPaymentcard(HttpSession session, HttpServletResponse resp, String cardnumber) throws IOException{
       PrintWriter out = resp.getWriter();
       //input format validation
        Pattern patternCardnumber = Pattern.compile("^[0-9]{4}[-]{1}[0-9]{4}[-]{1}[0-9]{4}[-]{1}[0-9]{4}$", Pattern.CASE_INSENSITIVE);
        Matcher matchCardnumber = patternCardnumber.matcher(cardnumber);
        boolean matchCardnumberFound = matchCardnumber.find();
        
        //check database and error messages
        try{
            Paymentcard paymentcard = manager.find(Paymentcard.class, cardnumber);
            if(paymentcard != null){
                 session.setAttribute("paymentcard", paymentcard);

                 resp.sendRedirect("technet_admin/displayPaymentcard.jsp");
                 
            }else if(!matchCardnumberFound){
                out.print("<html>");
                out.print("<body>");
                out.println("<script>");
                out.println("alert('Invalid Card Number Format ! Should follow 0000-0000-0000-0000 ');");
                out.println("location='technet_admin/searchPaymentcard.jsp';");
                out.println("</script>");
                out.print("</body>");
                out.print("</html>");
                
                
            }else{
               out.print("<html>");
                out.print("<body>");
                out.println("<script>");
                out.println("alert('This card does not exists, Please create a new one.');");
                out.println("location='technet_admin/searchPaymentcard.jsp';");
                out.println("</script>");
                out.print("</body>");
                out.print("</html>");
            
            }
        }catch(EntityNotFoundException e){
            //error
        }
            
    }

    //Update Card Balance==============================================================================================
    private void updatePaymentcard(HttpSession session, HttpServletResponse resp, String cardnumber) throws IOException {
              Paymentcard paymentcard = manager.find(Paymentcard.class, cardnumber);
              resp.sendRedirect("technet_admin/updatePaymentcard.jsp");
    }


    //Save Card Balance==============================================================================================
    private void saveUpdatePaymentcard(HttpSession session, HttpServletRequest req, HttpServletResponse resp, String cardnumber) throws IOException {
      Paymentcard paymentcard=new Paymentcard();
            PrintWriter out = resp.getWriter();
           
        //validate card number format
        //validate balance format
            String balance = req.getParameter("balance");
            
            Pattern patternBalance = Pattern.compile("^[0-9]+[.]{1}[0-9]{2}$", Pattern.CASE_INSENSITIVE);
            Matcher matchBalance = patternBalance.matcher(balance);
            boolean matchBalanceFound = matchBalance.find();
        
        
            Pattern patternBalance2 = Pattern.compile("^[0-9]+$", Pattern.CASE_INSENSITIVE);
            Matcher matchBalance2 = patternBalance2.matcher(balance);
            boolean matchBalanceFound2 = matchBalance2.find();


            String errorBalance = "";  
            

            paymentcard.setCardnumber(req.getParameter("cardnumber"));
            //check database for data

            if(matchBalanceFound||matchBalanceFound2){
                if(matchBalanceFound2){
                    balance = balance + ".00";
                }

               
                try{

                    BigDecimal balances=new BigDecimal(balance);
                    paymentcard.setBalance(balances);

                    utx.begin();
                    manager.merge(paymentcard);
                    utx.commit();

                    session.setAttribute("paymentcard", paymentcard);

                    session.setAttribute("messageD", "Successfully update the balance.");
                    resp.sendRedirect("technet_admin/displayPaymentcard.jsp");

                }catch(Exception e){
                   //error
                }
               
            }else{
                 
                  errorBalance=" Balance, ->format 0.00 or only digit.";
             }
        
        
        
         if(!errorBalance.equals("")){
                 session.setAttribute("messageU","Please enter the correct "+ errorBalance);
                 errorBalance = "";

                resp.sendRedirect("technet_admin/updatePaymentcard.jsp");

            }
    
    }
    
    //Delete Payment Card==============================================================================================
    private void deletePaymentcard(HttpSession session, HttpServletResponse resp, String cardnumber) throws IOException {
        
        //delete query base on card number
        try {
           utx.begin();
           manager.createQuery("DELETE FROM Paymentcard c WHERE c.cardnumber = :cardNum")
                   .setParameter("cardNum", cardnumber)
                   .executeUpdate();
          utx.commit();
           session.setAttribute("messageR", "Deleted successfully");
            resp.sendRedirect("technet_admin/searchPaymentcard.jsp");

        } catch (Exception ex) {
            session.setAttribute("messageD", "Error delete unsuccess...");
            resp.sendRedirect("technet_admin/displayProduct.jsp");

        }
    }

}
 