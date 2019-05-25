package operations;

import basis.*;

/**
 * 基本操作接口
 */



public interface BaseOperations {

    //通过id获取一些基本类
    Account getAccountById(String userId);
    Address getAddressById(String addressId);
    Bill getBillById(String billId);
    Book getBookById(String bookId);
    BookItem getBookItemById(String itemId);
    Category getCategoryById(String categoryId);
    Exchange getExchangeById(String exchangeId);
    Order getOrderById(String orderId);
    Recharge getRechargeById(String rechargeId);
    Refund getRefundById(String refundId);
    Service getServiceById(String serviceId);
    ShopCart getShopCartById(String cartId);
    Wallet getWalletById(String wallet);

    /**
     * @param userName 给出一个用来查找的用户名
     * @return 通过用户名找到一个Account并将其返回
     */
    Account getAccountByName(String userName);
}
