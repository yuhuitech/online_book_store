package basis;

import java.math.BigDecimal;
import java.util.List;

/**
 * 账户钱包类
 */


public class Wallet {

    //钱包编号，PK
    private String walletId;

    //用户ID，FK
    private String userId;

    //支付密码
    private String password;

    //余额
    private BigDecimal balance;

    //账单列表
    private List<Bill> billList;

}
