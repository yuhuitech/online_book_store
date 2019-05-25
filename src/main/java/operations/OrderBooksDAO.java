package operations;
import basis.OrderBooks;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderBooksDAO {
    List<OrderBooks> get(@Param("orderID") String orderID);

    int add(
            @Param("orderID") String orderID,
            @Param("bookID") String bookID,
            @Param("amount") int amount);

    int delete(@Param("bookID") String bookID);
}
