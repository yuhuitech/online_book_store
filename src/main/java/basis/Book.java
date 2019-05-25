package basis;

import java.util.Date;
import java.util.List;


/**
 * 图书类
 */
public class Book {

    //图书编号,PK
    private String bookId;

    //类编号
    private String categoryId;

    //类编号
    private double price;

    //书名
    private String name;

    //书名
    private String writer;

    //描述
    private String description;

    //图片url,图片的url暂定以图书编号为名字，放在一个文件夹中。
    private String url;

    //上架日期
    private String date;

    //剩余数量
    private int quantity;

    //图书物品列表
    private List<BookItem> bookItemList;

    public String getDate() {
        return date;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public List<BookItem> getBookItemList() {
        return bookItemList;
    }

    public String getBookId() {
        return bookId;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public String getDescription() {
        return description;
    }

    public String getName() { return name; }

    public String getUrl() {
        return url;
    }

    public String getWriter() {
        return writer;
    }

    public void setBookItemList(List<BookItem> bookItemList) {
        this.bookItemList = bookItemList;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
}


