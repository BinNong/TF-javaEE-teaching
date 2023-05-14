package com.tf.mybatis.mvc.web;

import com.tf.mybatis.mvc.exception.AppException;
import com.tf.mybatis.mvc.exception.MoneyNotEnoughException;
import com.tf.mybatis.mvc.service.AccountService;
import com.tf.mybatis.mvc.service.impl.AccountServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/transfer")
public class AccountServlet extends HttpServlet {
    private AccountService accountService = new AccountServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        // 1. 接收用户参数
        String fromAct = req.getParameter("fromAct");
        String toAct = req.getParameter("toAct");
        Double money = Double.valueOf(req.getParameter("money"));

        // 2. 开始转账
        try {
            accountService.transfer(fromAct, toAct, money);
        } catch (MoneyNotEnoughException e) {
            resp.getWriter().println(e.getMessage()); // 调用视图
        } catch (AppException e) {
            resp.getWriter().println(e.getMessage()); // 调用视图
        }
        // 3. 展示结果
        resp.getWriter().println("转账成功");
    }
}
