package controller;

import basis.Account;
import basis.ShopCart;
import operations.ShopCartOperation;
import operations.UserOperation;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class LoginAndRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String status = req.getParameter("status");//请求状态
        String name = req.getParameter("logname");
        String password = req.getParameter("logpass");
        HttpSession session = req.getSession();
        String phone;
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) getServletContext().getAttribute("SqlSessionFactory");
        Account result = null;
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
        switch (status) {
            case "0":
//login
                phone = req.getParameter("logphone");
                result = UserOperation.login(sqlSessionFactory, name, password, phone);
                break;
            case "1":
//register
                phone = req.getParameter("logphone");
                result = UserOperation.register(sqlSessionFactory, password, name, phone);
                break;
            case "2":
//logout
                session.invalidate();
                session = req.getSession();
                session.setAttribute("loginStatus", "false");
                requestDispatcher = req.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(req, resp);
                break;
        }
        if (result!=null)
        {//判断管理员身份
            if(result.getType()!=null&&!result.getType().equals("admin")) {
                session = req.getSession();
                session.setAttribute("user", result);
                session.setAttribute("loginStatus", "true");
                List<ShopCart> shopCarts = (List<ShopCart>) session.getAttribute("cartList");
                if (shopCarts.size() > 0) {
                    ShopCartOperation.addLoginUserInfo(sqlSessionFactory, shopCarts, result.getUserId());
                }
                requestDispatcher = req.getRequestDispatcher("index.jsp");
            }else {
                requestDispatcher = req.getRequestDispatcher("BookIntroPage.html");
            }
        }
        else
        {
            session = req.getSession();
            session.setAttribute("user", name);
            session.setAttribute("loginStatus","false");
            requestDispatcher = req.getRequestDispatcher("login.html");
        }
        requestDispatcher.forward(req,resp);
    }
}
