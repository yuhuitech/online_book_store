package operations;

import basis.Book;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class BookOperations {

    public static double getPrice(SqlSessionFactory sqlSessionFactory, String bookID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            double price = bookDAO.getPrice(bookID);
            session.commit();
            session.close();
            // 显示插入之后User信息
            if (price<0)
                return 0;
            return price;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static String getTitle(SqlSessionFactory sqlSessionFactory, String bookID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            String title = bookDAO.getTitle(bookID);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return title;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "null";
    }
    public static String getWriter(SqlSessionFactory sqlSessionFactory, String bookID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            String writer = bookDAO.getWriter(bookID);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return writer;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "null";
    }

    public static List<Book> getBooks(SqlSessionFactory sqlSessionFactory)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            List<Book> books = bookDAO.getBooksAll();
            List<Book> result = new ArrayList<>();
            for (Book book:books) {
                if (book.getQuantity() > 0){
                    result.add(book);
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

    public static List<Book> getBooks(SqlSessionFactory sqlSessionFactory,String id, String title,
                                      double price, String publishDate, int inventory,
                                      String category, String writer)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            List<Book> books = bookDAO.getBooks(id,title,price,publishDate,inventory,category,writer);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return books;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int updateBook(SqlSessionFactory sqlSessionFactory,String id, String title,
                                      double price, String publishDate, int inventory,
                                      String category, String writer)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            int books = bookDAO.changeBook(id,title,price,publishDate,inventory,category,writer);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return books;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static int addBook(SqlSessionFactory sqlSessionFactory,String id, String title,
                                 double price, String publishDate, int inventory,
                                 String category, String writer)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            int books = bookDAO.addBook(id,title,price,publishDate,inventory,category,writer);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return books;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static Book getBook(SqlSessionFactory sqlSessionFactory, String bookID)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            Book book = bookDAO.getBook(bookID);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return book;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int deleteBook(SqlSessionFactory sqlSessionFactory,String id)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            BookDAO bookDAO = session.getMapper(BookDAO.class);
            CartDAO cartDAO = session.getMapper(CartDAO.class);
            OrderBooksDAO orderBooksDAO = session.getMapper(OrderBooksDAO.class);
            int books = bookDAO.deleteBook(id);
            cartDAO.delete("",id);
            orderBooksDAO.delete(id);
            session.commit();
            session.close();
            // 显示插入之后User信息
            return books;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
