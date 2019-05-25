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

public class OrderManager extends HttpServlet {

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
        if ((session.getAttribute("loginStatus")).equals("false")){ }
        else {
            orders = OrderOperation.get(sqlSessionFactory,userID);
            session.setAttribute("orderList", orders);
            session.setAttribute("loginStatus", "true");
        }
        requestDispatcher = req.getRequestDispatcher("myorderlist.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) req.getServletContext().getAttribute("SqlSessionFactory");
        List<Order> orders;

        String status = req.getParameter("status");
        String orderID = req.getParameter("orderID");
        String statusNow = req.getParameter("statusNow");
        String totalPrice = req.getParameter("totalPrice");

        switch (status) {
            case "0"://0：查找
                orders = OrderOperation.getAllOrder(sqlSessionFactory);
                if (orders != null) {
                    req.setAttribute("status", "querySuccess");
                    session.setAttribute("orderListResult", orders);
                } else {
                    req.setAttribute("status", "queryFailed");
                }
                break;
            case "1"://update
                int statusCode = OrderOperation.updateBook(sqlSessionFactory, orderID, status, Double.parseDouble(totalPrice));
                orders = OrderOperation.getAllOrder(sqlSessionFactory);
                if (statusCode > 0) {
                    req.setAttribute("status", "updateSuccess");
                    session.setAttribute("orderListResult", orders);
                } else {
                    req.setAttribute("status", "updateFailed");
                }
                break;
            case "3":
            {
                List<Order> ordersNow = (List<Order>)session.getAttribute("orderListResult");
                for(int i = 0; i<ordersNow.size(); i++)
                {
                    if(ordersNow.get(i).getOrderId().equals(orderID))
                    {
                        session.setAttribute("orderBookListResult", ordersNow.get(i).getorderBooksList());
                        break;
                    }
                }
                RequestDispatcher requestDispatcher;
                requestDispatcher = req.getRequestDispatcher("OrderBookResult.jsp");
                requestDispatcher.forward(req, resp);
            }
            break;
        }
        RequestDispatcher requestDispatcher;
        requestDispatcher = req.getRequestDispatcher("OrderResult.jsp");
        requestDispatcher.forward(req, resp);
    }
}
