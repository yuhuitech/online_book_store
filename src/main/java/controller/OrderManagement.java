package controller;

import basis.Account;
import basis.Order;
import basis.ShopCart;
import operations.OrderOperation;
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
import java.util.List;


public class OrderManagement extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account user = (Account) req.getSession().getAttribute("user");
        HttpSession session = req.getSession();
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) req.getServletContext().getAttribute("SqlSessionFactory");
        List<ShopCart> shopCarts = new ArrayList<>();
        List<ShopCart> result = new ArrayList<>();
        List<Order> orders = new ArrayList<>();
        String userID = null;
        if(user!=null)
            userID = user.getUserId();
        RequestDispatcher requestDispatcher = null;
        if ((session.getAttribute("loginStatus")).equals("false")) {
            List<ShopCart> tempCart = (List<ShopCart>) session.getAttribute("cartList");
        }else {
            shopCarts = ShopCartOperation.get(sqlSessionFactory, userID);
            for (ShopCart item:shopCarts) {
                if (item.getState().equals("checked")){
                    result.add(item);
                }
            }
            session.setAttribute("cartList", result);
            session.setAttribute("loginStatus", "true");
        }
        requestDispatcher = req.getRequestDispatcher("ordering.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account user = (Account) req.getSession().getAttribute("user");
        HttpSession session = req.getSession();
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) req.getServletContext().getAttribute("SqlSessionFactory");
        int operation = Integer.parseInt(req.getParameter("operation"));
        String userID = null;
        if(user!=null)
            userID = user.getUserId();
        switch (operation){
            case 3:{
                String books = req.getParameter("books");
                OrderOperation.add(sqlSessionFactory,userID,books);
            }
        }
    }
}
