package basis;

/**
 * 钱包明细类
 */

public class Bill {

    //账单号，PK
    private String billId;

    //钱包编号，FK
    private String walletId;

    //订单编号，FK
    private String orderId;

    //退款编号，FK
    private String refundId;

    //充值编号，FK
    private String rechargeId;

    //订单
    private Order order;

    //退款
    private Refund refund;

    //充值
    private Recharge recharge;
}
