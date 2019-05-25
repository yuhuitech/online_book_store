package basis;

import enums.RefundStatus;

import java.util.Date;

/**
 * 退款信息类
 */

public class Refund {

    //退款编号，PK
    private String refundId;

    //订单编号，FK
    private String orderId;

    //物品编号，FK
    private String itemId;

    //申请退款时间
    private Date applyDate;

    //退款状态
    private RefundStatus status;

    //物品
    private BookItem bookItem;
}
