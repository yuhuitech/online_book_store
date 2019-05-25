package controller;

import basis.Account;
import basis.Order;
import operations.OrderOperation;
import operations.UserOperation;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UserManagement extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) req.getServletContext().getAttribute("SqlSessionFactory");
        List<Account> users = UserOperation.getAll(sqlSessionFactory);
        session.setAttribute("UserLists", users);
        RequestDispatcher requestDispatcher;
        requestDispatcher = req.getRequestDispatcher("UserResult.jsp");
        requestDispatcher.forward(req, resp);
    }
}
