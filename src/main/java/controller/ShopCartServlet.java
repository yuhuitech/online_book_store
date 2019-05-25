package controller;



import basis.Account;
import basis.Book;
import basis.ShopCart;
import operations.BookOperations;
import operations.ShopCartOperation;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ShopCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account user = (Account) req.getSession().getAttribute("user");
        HttpSession session = req.getSession();
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) req.getServletContext().getAttribute("SqlSessionFactory");
        String userID = null;
        if(user!=null)
            userID = user.getUserId();
        List<ShopCart> shopCarts = new ArrayList<>();
        if ((session.getAttribute("loginStatus")).equals("false")) {
            List<ShopCart> tempCart = (List<ShopCart>) session.getAttribute("cartList");
        }else {
            shopCarts = ShopCartOperation.get(sqlSessionFactory, userID);
            session.setAttribute("cartList", shopCarts);
            session.setAttribute("loginStatus", "true");
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("cart.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account user = (Account) req.getSession().getAttribute("user");
        HttpSession session = req.getSession();
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) req.getServletContext().getAttribute("SqlSessionFactory");
        String amounts;
        String bookID;
        String userID = null;
        if(user!=null)
            userID = user.getUserId();
        List<ShopCart> shopCarts = new ArrayList<>();
        bookID = req.getParameter("bookID");
        amounts = req.getParameter("amounts");
        String status = req.getParameter("status");//请求状态
        //请求状态中，0为查询，1为添加，2为修改，3为删除
        switch (status) {
            case "0": {
                if ((session.getAttribute("loginStatus")).equals("false")) {
                    List<ShopCart> tempCart = (List<ShopCart>) session.getAttribute("cartList");
                }else {
                    shopCarts = ShopCartOperation.get(sqlSessionFactory, userID);
                    session.setAttribute("cartList", shopCarts);
                    session.setAttribute("loginStatus", "true");
                }
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("cart.jsp");
                requestDispatcher.forward(req, resp);
            }
            break;
            case "1": {
                if ((session.getAttribute("loginStatus")).equals("false")) {
                    List<ShopCart> tempCart = (List<ShopCart>) session.getAttribute("cartList");
                    Book book = BookOperations.getBook(sqlSessionFactory, bookID);
                    ShopCart shopCart = new ShopCart();
                    shopCart.makeTempCart(bookID, book.getName(), book.getWriter(),
                            null, book.getPrice(), Integer.parseInt(amounts));
                    tempCart.add(shopCart);
                } else {
                    int amount = ShopCartOperation.getByBookId(sqlSessionFactory,userID,bookID);
                    if(amount > 0){
                        ShopCartOperation.addAmounts(sqlSessionFactory, userID, Integer.parseInt(amounts), bookID);
                    }else{
                        ShopCartOperation.add(sqlSessionFactory, userID, bookID, Integer.parseInt(amounts));
                    }
                }
            }
            break;
            case "2": {
                if ((session.getAttribute("loginStatus")).equals("false")) {
                    List<ShopCart> tempCart = (List<ShopCart>) session.getAttribute("cartList");
                    for (int i = 0; i < tempCart.size(); i++) {
                        if (tempCart.get(i).getBookID().contains(bookID)) {
                            tempCart.get(i).setTotalItem(Integer.parseInt(amounts));
                            break;
                        }
                    }
                } else {
                    ShopCartOperation.alterAmounts(sqlSessionFactory, userID, Integer.parseInt(amounts),  bookID);
                }
            }
            break;
            case "3":{
                if ((session.getAttribute("loginStatus")).equals("false")) {
                    List<ShopCart> tempCart = (List<ShopCart>) session.getAttribute("cartList");
                    for (int i = 0; i < tempCart.size(); i++) {
                        if (tempCart.get(i).getBookID().contains(bookID)) {
                            tempCart.remove(i);
                            break;
                        }
                    }
                } else {

                    ShopCartOperation.delete(sqlSessionFactory, userID, bookID);
                }
            }
            break;
            case "4": {
                String state = req.getParameter("state");
                ShopCartOperation.alterState(sqlSessionFactory, userID, state, bookID);

            }
            break;
        }
    }
}
