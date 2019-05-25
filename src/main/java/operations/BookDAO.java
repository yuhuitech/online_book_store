package operations;

import basis.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDAO {

    double getPrice(@Param("bookID") String bookID);

    String getTitle(@Param("bookID") String bookID);

    String getWriter(@Param("bookID") String bookID);

    List<Book> getBooksAll();

    List<Book> getBooks(@Param("bookID") String bookID,
                        @Param("title") String title,
                        @Param("price") double price,
                        @Param("publishDate") String publishDate,
                        @Param("inventory") int inventory,
                        @Param("category") String category
            ,@Param("writer") String writer);

    int changeBook(@Param("bookID") String bookID,
                        @Param("title") String title,
                        @Param("price") double price,
                        @Param("publishDate") String publishDate,
                        @Param("inventory") int inventory,
                        @Param("category") String category
            ,@Param("writer") String writer);

    int addBook(@Param("bookID") String bookID,
                   @Param("title") String title,
                   @Param("price") double price,
                   @Param("publishDate") String publishDate,
                   @Param("inventory") int inventory,
                   @Param("category") String category
            ,@Param("writer") String writer);

    Book getBook(@Param("bookID") String bookID);

    int deleteBook(@Param("bookID") String bookID);

}
