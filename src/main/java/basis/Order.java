package basis;

import java.util.Date;
import java.util.List;

/**
 * 订单类
 */


public class Order {
    //订单编号
    private String orderId;
    //用户编号
    private String userId;
    private String userName;
    //下单日期
    private String orderDate;
    //状态
    private String status;
    //商品数
    private int totalItem;
    //总价
    private double totalPrice;
    //订单下所有商品列表
    private List<OrderBooks> orderBooksList;
    private Account account;

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    //地址编号
    private String addressId;
    //运单编号
    public  String         getOrderId() {
        return orderId;
    }public void           setOrderId(String orderId) {
        this.orderId = orderId;
    }public String         getUserId() {
        return userId;
    }public void           setUserId(String userId) {
        this.userId = userId;
    }public String           getOrderDate() {
        return orderDate;
    }public void           setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }public String    getStatus() {
        return status;
    }public void           setStatus(String status) {
        this.status = status;
    }public int            getTotalItem() {
        return totalItem;
    }public void           setTotalItem(int totalItem) {
        this.totalItem = totalItem;
    }public double     getTotalPrice() {
        return totalPrice;
    }public void           setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }public List<OrderBooks> getorderBooksList() {
        return orderBooksList;
    }public void           setorderBooksList(List<OrderBooks> orderBooksList) {
        this.orderBooksList = orderBooksList;
    }public String         getAddressId() {
        return addressId;
    }public void           setAddressId(String addressId) {
        this.addressId = addressId;
    }public String         getExpress() {
        return express;
    }public void           setExpress(String express) {
        this.express = express;
    }public Address        getAddress() {
        return address;
    }public void           setAddress(Address address) {
        this.address = address;
    }private String express;
    //地址
    private Address address;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
