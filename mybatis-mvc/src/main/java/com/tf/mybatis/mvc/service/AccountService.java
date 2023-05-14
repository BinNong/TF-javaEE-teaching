package com.tf.mybatis.mvc.service;

import com.tf.mybatis.mvc.exception.AppException;
import com.tf.mybatis.mvc.exception.MoneyNotEnoughException;

public interface AccountService {
    void transfer(String fromAct, String toAct, Double money) throws MoneyNotEnoughException, AppException;
}
