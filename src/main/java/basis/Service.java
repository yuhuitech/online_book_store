package basis;

/**
 * 售后类
 */


public class Service {

    //售后编号，PK
    private String serviceId;

    //用户编号，FK
    private String userId;

    //换货编号，FK
    private String exchangeId;

    //退款编号，FK
    private String refundId;

    //换货
    private Exchange exchange;
    //退款
    private Refund refund;
}
