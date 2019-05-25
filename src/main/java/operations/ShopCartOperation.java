package operations;

import basis.ShopCart;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.ArrayList;
import java.util.List;

public class ShopCartOperation {

    public static List<ShopCart> get(SqlSessionFactory sqlSessionFactory, String userID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            CartDAO cartDAO = session.getMapper(CartDAO.class);
            List<ShopCart> shopCarts = cartDAO.get(userID);
            List<ShopCart> result = new ArrayList<>();
            session.commit();
            if (shopCarts==null)
                return null;
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            for (ShopCart shopcart:shopCarts) {
                if(bookDAO.getBook(shopcart.getBookID()).getQuantity() > 0){
                    double price =
                            bookDAO.getPrice(shopcart.getBookID());
                    shopcart.setPricePerCommodity(price);
                    String title = bookDAO.getTitle(shopcart.getBookID());
                    shopcart.setBookName(title);
                    String writer = bookDAO.getWriter(shopcart.getBookID());
                    shopcart.setBookWriter(writer);
                    result.add(shopcart);
                }
            }
            session.commit();
            session.close();
            // 显示插入之后User信息
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int getByBookId(SqlSessionFactory sqlSessionFactory, String userID, String bookID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            CartDAO cartDAO = session.getMapper(CartDAO.class);
            int shopCarts = cartDAO.getByBookId(bookID,userID);
            session.commit();
            session.close();
            return shopCarts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static int add(SqlSessionFactory sqlSessionFactory, String userID, String bookID, int amount)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            CartDAO cartDAO = session.getMapper(CartDAO.class);
            int carts = cartDAO.add(userID,bookID,amount);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return carts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int alterAmounts(SqlSessionFactory sqlSessionFactory, String userID, int amount, String bookID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            CartDAO cartDAO = session.getMapper(CartDAO.class);
            int carts = cartDAO.alterAmounts(userID,bookID,amount);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return carts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int alterState(SqlSessionFactory sqlSessionFactory, String userID, String state, String bookID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            CartDAO cartDAO = session.getMapper(CartDAO.class);
            int carts = cartDAO.alterState(userID,bookID,state);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return carts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int addAmounts(SqlSessionFactory sqlSessionFactory, String userID, int amount, String bookID){
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            CartDAO cartDAO = session.getMapper(CartDAO.class);
            int carts = cartDAO.addAmounts(userID,bookID,amount);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return carts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int delete(SqlSessionFactory sqlSessionFactory, String userID, String bookID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            CartDAO cartDAO = session.getMapper(CartDAO.class);
            int carts = cartDAO.delete(userID,bookID);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return carts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static void addLoginUserInfo(SqlSessionFactory sqlSessionFactory,List<ShopCart>shopCarts, String userID)
    {
        for(int i = 0; i<shopCarts.size(); i++)
        {
            shopCarts.get(i).setUserID(userID);
            int status = add(sqlSessionFactory,userID,shopCarts.get(i).getBookID(),
                    shopCarts.get(i).getTotalItem());
            if(status<0)
            {
                alterAmounts(sqlSessionFactory,userID,
                        shopCarts.get(i).getTotalItem(),shopCarts.get(i).getBookID());
            }
        }
    }

}
