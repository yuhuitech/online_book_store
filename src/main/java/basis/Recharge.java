package basis;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 充值信息类
 */

public class Recharge {

    //充值编号，PK
    private String rechargeId;

    //用户编号，FK
    private String userId;

    //充值金额
    private BigDecimal price;

    //充值时间
    private Date date;
}
