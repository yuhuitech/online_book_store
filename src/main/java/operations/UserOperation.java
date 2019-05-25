package operations;

import basis.Account;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;
import java.util.UUID;

public class UserOperation {

    //支持电话号和账号登录
    public static Account login(SqlSessionFactory sqlSessionFactory, String id, String password,String phone)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            AccountDAO accountDAO = session.getMapper(AccountDAO.class);
            Account account = accountDAO.loginByID(id,password);
            session.commit();
            // 显示插入之后User信息
            if (account==null)
            {
                session = sqlSessionFactory.openSession();
                accountDAO = session.getMapper(AccountDAO.class);
                account = accountDAO.loginByPhone(id,password);
                session.commit();
            }
            if (account==null)
            {
                return null;
            }
            session.close();
            return account;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Account register(SqlSessionFactory sqlSessionFactory, String password, String name, String phone)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            AccountDAO accountDAO = session.getMapper(AccountDAO.class);
            String temp = UUID.randomUUID().toString().replace("-", "").replaceAll("[a-zA-Z]","").substring(0,10);
            accountDAO.register(temp ,name,password,phone);
            session.commit();
            Account account = accountDAO.loginByID(temp,password);
            session.commit();
            session.close();
            return account ;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static Account getByID(SqlSessionFactory sqlSessionFactory, String id)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            AccountDAO accountDAO = session.getMapper(AccountDAO.class);
            Account account = accountDAO.getByID(id);
            session.commit();
            session.close();
            return account ;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Account> getAll(SqlSessionFactory sqlSessionFactory)
    {
        try {
            // 获取Session连接
            SqlSession session = sqlSessionFactory.openSession();
            // 获取Mapper
            AccountDAO accountDAO = session.getMapper(AccountDAO.class);
            List<Account> accounts = accountDAO.getAll();
            session.commit();
            session.close();
            return accounts ;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
