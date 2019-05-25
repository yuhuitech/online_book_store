package basis;

import java.util.List;

/**
 * 图书类别类
 */


public class Category {

    //类别号
    private int categoryId;

    //类名
    private String name;

    //描述
    private String description;

    public int getCategoryId(){
        return categoryId;
    }

    public void setCategoryId(int categoryId){
        this.categoryId = categoryId;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }
    //该类别下所有书
    //private List<Book> bookList;
}
