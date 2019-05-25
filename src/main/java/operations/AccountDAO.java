package operations;

import basis.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户操作接口
 */

public interface AccountDAO {

    Account loginByID(@Param("userId") String IdNum,
              @Param("password") String password);

    Account loginByPhone(@Param("phone") String phoneNum,
                  @Param("password") String password);

    int register(@Param("userId") String IdNum,
                 @Param("userName") String name,
                 @Param("password") String password,
                 @Param("phone") String phone);

    Account getByID(@Param("userId") String IdNum);

    List<Account> getAll();


}
