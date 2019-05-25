package operations;

import basis.*;

/**
 * 操作类
 * 写明各个接口的实现
 */


public class Operations {

    public static BaseOperations baseOperations;
    public static AccountDAO userOperations;

    //接口的实现
    public static void RegistOperations(){
        baseOperations=new BaseOperations() {
            @Override
            public Account getAccountById(String userId) {
                return null;
            }

            @Override
            public Address getAddressById(String addressId) {
                return null;
            }

            @Override
            public Bill getBillById(String billId) {
                return null;
            }

            @Override
            public Book getBookById(String bookId) {
                return null;
            }

            @Override
            public BookItem getBookItemById(String itemId) {
                return null;
            }

            @Override
            public Category getCategoryById(String categoryId) {
                return null;
            }

            @Override
            public Exchange getExchangeById(String exchangeId) {
                return null;
            }

            @Override
            public Order getOrderById(String orderId) {
                return null;
            }

            @Override
            public Recharge getRechargeById(String rechargeId) {
                return null;
            }

            @Override
            public Refund getRefundById(String refundId) {
                return null;
            }

            @Override
            public Service getServiceById(String serviceId) {
                return null;
            }

            @Override
            public ShopCart getShopCartById(String cartId) {
                return null;
            }

            @Override
            public Wallet getWalletById(String wallet) {
                return null;
            }

            @Override
            public Account getAccountByName(String userName) {
                return null;
            }
        };

    }

}
