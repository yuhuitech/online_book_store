package operations;
import basis.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDAO {
    List<Order> get(@Param("userID") String userID);

    int add(@Param("userID") String userID,
            @Param("orderID") String orderID,
            @Param("date") String date,
            @Param("status") String status,
            @Param("totalItem") int totalItem,
            @Param("totalPrice") double totalPrice);

    List<Order> getAllOrder();

    int changeOrder(
                    @Param("orderID") String orderID,

                    @Param("status") String status,

                    @Param("totalPrice") double totalPrice);
}