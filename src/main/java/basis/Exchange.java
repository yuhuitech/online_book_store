package basis;

import enums.ExchangeStatus;

import java.util.Date;

/**
 * 换货信息类
 */

public class Exchange {

    //换货编号，PK
    private String exchangeId;

    //订单编号，FK
    private String orderId;

    //物品编号，FK
    private String itemId;

    //新物品编号，FK
    private String newItemId;

    //申请换货时间
    private Date applyDate;

    //换货状态
    private ExchangeStatus status;


    //旧物品
    private BookItem oldItem;
    //新物品
    private BookItem newItem;
}
