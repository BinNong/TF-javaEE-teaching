package com.tf.mybatis.mvc.service.impl;

import com.tf.mybatis.mvc.dao.AccountDao;
import com.tf.mybatis.mvc.exception.AppException;
import com.tf.mybatis.mvc.exception.MoneyNotEnoughException;
import com.tf.mybatis.mvc.pojo.Account;
import com.tf.mybatis.mvc.service.AccountService;
import com.tf.mybatis.mvc.utils.SqlUtils;
import org.apache.ibatis.session.SqlSession;

public class AccountServiceImpl implements AccountService {
    //面向接口编程
    private AccountDao accountDao = SqlUtils.openSession().getMapper(AccountDao.class);

    /**
     * 转账实现
     *
     * @param fromAct
     * @param toAct
     * @param money
     */
    public void transfer(String fromAct, String toAct, Double money) throws MoneyNotEnoughException, AppException {
        // 1.查看余额是否充足
        Account fromAccount = accountDao.selectByActno(fromAct);
        if (fromAccount.getBalance() < money) {
            throw new MoneyNotEnoughException("余额不足，无法转账");
        }

        // 2.开始转账
        Account toAccount = accountDao.selectByActno(toAct);
        fromAccount.setBalance(fromAccount.getBalance() - money);
        toAccount.setBalance(toAccount.getBalance() + money);

        //3. 同步数据库
        int cnt = accountDao.updateAct(fromAccount);
        cnt += accountDao.updateAct(toAccount);

        //4. 检车是否更新成功
        if (cnt!=2) {
            throw new AppException("App故障");
        }

        SqlUtils.openSession().commit();
        SqlUtils.openSession().close();
    }
}
