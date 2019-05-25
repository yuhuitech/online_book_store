package basis;

import java.util.List;

/**
 * 购物车
 */


public class ShopCart {


    //购物车编号
    private String bookID;

    //购物车编号
    private String bookName;

    //购物车编号
    private String bookWriter;

    //用户编号
    private String userID;

    //商品danjia
    private double pricePerCommodity;

    //商品数
    private int totalItem;

    //商品在购物车的状态
    private String state;

    //购物车内所有商品
    private List<BookItem> bookItemList;

    public String getUserID() {
        return userID;
    }

    public int getTotalItem() {
        return totalItem;
    }

    public List<BookItem> getBookItemList() {
        return bookItemList;
    }

    public String getBookID() {
        return bookID;
    }

    public void setUserID(String userId) {
        this.userID = userId;
    }

    public void setBookItemList(List<BookItem> bookItemList) {
        this.bookItemList = bookItemList;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public void setTotalItem(int totalItem) {
        this.totalItem = totalItem;
    }

    public double getPricePerCommodity() {
        return pricePerCommodity;
    }

    public void setPricePerCommodity(double pricePerCommodity) {
        this.pricePerCommodity = pricePerCommodity;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookWriter() {
        return bookWriter;
    }

    public void setBookWriter(String bookWriter) {
        this.bookWriter = bookWriter;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public ShopCart makeTempCart(String bookID,String bookName,String bookWriter,
                          String userID,double pricePerCommodity,int totalItem){
        this.setBookWriter(bookWriter);
        this.setBookName(bookName);
        this.setUserID(userID);
        this.setBookID(bookID);
        this.setPricePerCommodity(pricePerCommodity);
        this.setBookWriter(bookWriter);
        this.setTotalItem(totalItem);
        return this;
    }
}

