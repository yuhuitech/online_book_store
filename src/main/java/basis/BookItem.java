package basis;

import enums.ItemStatus;

import java.math.BigDecimal;

/**
 * 物品类
 */

public class BookItem {

    //物品编号
    private String itemId;

    //图书编号
    private String bookId;

    //状态
    private ItemStatus status;

    //价格
    private BigDecimal price;

    //折扣
    private BigDecimal discount;
}
