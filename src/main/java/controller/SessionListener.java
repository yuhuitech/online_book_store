package controller;

import basis.ShopCart;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;
import java.util.List;

public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();
        if(session.getAttribute("user")!=null)
            session.setAttribute("loginStatus","true");
        else
            session.setAttribute("loginStatus","false");
        List<ShopCart> tempCart = new ArrayList<>();
        session.setAttribute("cartList", tempCart);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();
        session.removeAttribute("user");
    }
}
