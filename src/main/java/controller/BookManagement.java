package controller;

import basis.Book;
import operations.BookOperations;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
@MultipartConfig
public class BookManagement extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.setCharacterEncoding("utf-8");
        String status = req.getParameter("status");
        String bookID = req.getParameter("bookID");
        String bookTitle = req.getParameter("title");
        String priceString = req.getParameter("price");
        double price;
        if (priceString != null && !priceString.equals(""))
            price = Double.parseDouble(priceString);
        else
            price = -1;
        String publishDate = req.getParameter("publishDate");
        String inventoryString = req.getParameter("inventory");
        int inventory;
        if (inventoryString != null && !inventoryString.equals(""))
            inventory = Integer.parseInt(inventoryString);
        else
            inventory = -1;
        String category = req.getParameter("category");
        String writer = req.getParameter("writer");
        Part part = req.getPart("photo");
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) getServletContext().getAttribute("SqlSessionFactory");
        List<Book> books = null;
        int statusCode;
        switch (status) {
            case "0"://0：查找
                books = BookOperations.getBooks(sqlSessionFactory, bookID, bookTitle, price, publishDate, inventory, category, writer);
                if (books != null) {
                    req.setAttribute("status", "querySuccess");
                } else {
                    req.setAttribute("status", "queryFailed");
                }
                break;
            case "1"://update
                statusCode = BookOperations.updateBook(sqlSessionFactory, bookID, bookTitle, price, publishDate, inventory, category, writer);
                books = BookOperations.getBooks(sqlSessionFactory, "", "", -1, "", -1, "", "");
                if (statusCode > 0) {
                    req.setAttribute("status", "updateSuccess");
                } else {
                    req.setAttribute("status", "updateFailed");
                }
                break;
            case "2"://删除书籍
                statusCode = BookOperations.deleteBook(sqlSessionFactory, bookID);
                books = BookOperations.getBooks(sqlSessionFactory, "", "", -1, "", -1, "", "");
                if (statusCode > 0) {
                    req.setAttribute("status", "deleteSuccess");
                } else {
                    req.setAttribute("status", "deleteFailed");
                }
                break;
            case "3"://插入记录
                if (bookTitle.equals("") || price == -1 || price < 0 || inventory < 0) {
                    statusCode = 0;
                } else {
                    if (bookID.equals("")) {
                        bookID = UUID.randomUUID().toString().replace("-", "").replaceAll("[a-zA-Z]", "").substring(0, 10);
                    }
                    statusCode = BookOperations.addBook(sqlSessionFactory, bookID, bookTitle, price, publishDate, inventory, category, writer);
                    books = BookOperations.getBooks(sqlSessionFactory, "", "", -1, "", -1, "", "");
                }
                if (statusCode > 0) {
                    req.setAttribute("status", "insertSuccess");
                    part.write(this.getServletContext().getRealPath("/img/temp") + "/" + bookID + ".jpg");
                } else {
                    req.setAttribute("status", "insertFailed");
                }
                break;
        }
        session.setAttribute("lists", books);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("BookResult.jsp");
        requestDispatcher.forward(req, resp);
    }


}
