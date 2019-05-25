package basis;

import enums.AccountStatus;

import java.util.List;

/**
 * 基本用户类
 */



public class Account{

    //用户ID，PK
    private String userId;

    //用户状态(冻结、正常)
    private AccountStatus status;

    //用户类型(普通用户、管理员)
    private String type;

    //账户名
    private String userName;

    //密码
    private String password;

    //电话号码
    private String tel;

    //电子邮箱
    private String email;


    //地址列表
    private List<Address> addressList;
    //订单列表
    private List<Order> orderList;
    //售后列表
    private List<Service> serviceList;
    //充值列表
    private List<Recharge> rechargeList;
    //钱包
    private Wallet wallet;
    //购物车
    private ShopCart shopCart;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
