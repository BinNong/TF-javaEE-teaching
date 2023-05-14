package com.tf.mybatis.mvc.dao;

import com.tf.mybatis.mvc.pojo.Account;

public interface AccountDao {
    Account selectByActno(String actno);
    int updateAct(Account account);
}
