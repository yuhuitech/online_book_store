package operations;
import basis.Book;
import basis.Order;
import basis.OrderBooks;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;
import java.util.Date;

public class OrderOperation {
    public static List<Order> get(SqlSessionFactory sqlSessionFactory, String userID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            OrderDAO orderDAO = session.getMapper(OrderDAO.class);
            List<Order> orders = orderDAO.get(userID);
            session.commit();
            if (orders==null)
                return null;
            OrderBooksDAO booksDAO = session.getMapper(OrderBooksDAO.class);
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            for (Order order: orders) {
                List<OrderBooks> orderBooks = booksDAO.get(order.getOrderId());
                for (OrderBooks orderbook:orderBooks) {
                    String bookID = orderbook.getBookID();
                    Book book = bookDAO.getBook(bookID);
                    orderbook.setName(book.getName());
                    orderbook.setWriter(book.getWriter());
                    orderbook.setUrl(book.getUrl());
                    orderbook.setPrice(book.getPrice());
                }
                order.setorderBooksList(orderBooks);
            }
            session.commit();
            session.close();
            return orders;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int add(SqlSessionFactory sqlSessionFactory, String userID, String books){
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            OrderDAO orderDAO = session.getMapper(OrderDAO.class);
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            OrderBooksDAO booksDAO = session.getMapper(OrderBooksDAO.class);
            CartDAO cartDAO = session.getMapper(CartDAO.class);
            String orderID = UUID.randomUUID().toString().replace("-", "").replaceAll("[a-zA-Z]","").substring(0,10);
            Date dt = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss aa");
            String datetime =sdf.format(dt);
            String status = "shipping";
            double totalPrice = 0;
            int totalItem = 0;
            if (books.length() > 1){
                for (String book:books.split("-")) {
                    String[] book_obj = book.split(",");
                    String bookID = book_obj[0];
                    int amount = Integer.parseInt(book_obj[1]);
                    booksDAO.add(orderID,bookID,amount);
                    Book temp_book = bookDAO.getBook(bookID);
                    cartDAO.delete(userID,bookID);
                    double price = temp_book.getPrice();
                    totalPrice += price*amount;
                    totalItem += amount;
                }
                orderDAO.add(userID,orderID,datetime,status,totalItem,totalPrice);
            }
            session.commit();
            session.close();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static List<Order> getAllOrder(SqlSessionFactory sqlSessionFactory) {
            try {
                // 获取Session连接
                SqlSession session = sqlSessionFactory.openSession();
                // 获取Mapper
                OrderDAO orderDAO = session.getMapper(OrderDAO.class);
                List<Order> orders = orderDAO.getAllOrder();
                session.commit();
                if (orders == null)
                    return null;


                OrderBooksDAO booksDAO = session.getMapper(OrderBooksDAO.class);
                BookDAO bookDAO = session.getMapper(BookDAO.class);
                for (Order order : orders) {
                    List<OrderBooks> orderBooks = booksDAO.get(order.getOrderId());
                    for (OrderBooks orderbook : orderBooks) {
                        String bookID = orderbook.getBookID();
                        Book book = bookDAO.getBook(bookID);
                        orderbook.setName(book.getName());
                        orderbook.setWriter(book.getWriter());
                        orderbook.setUrl(book.getUrl());
                        orderbook.setPrice(book.getPrice());

                    }
                    order.setAccount(UserOperation.getByID(sqlSessionFactory,order.getUserId()));
                    order.setorderBooksList(orderBooks);
                }
                session.commit();
                session.close();
                return orders;
            } catch (Exception e) {
                e.printStackTrace();
            }
        return null;
    }

    public static int updateBook(SqlSessionFactory sqlSessionFactory,String orderID,
                                 String status,
                                 double totalPrice)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            OrderDAO orderDAO = session.getMapper(OrderDAO.class);
            int orders = orderDAO.changeOrder(orderID,status,totalPrice);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return orders;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }


}
