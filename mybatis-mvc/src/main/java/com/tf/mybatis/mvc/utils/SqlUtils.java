package com.tf.mybatis.mvc.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;


public class SqlUtils {
    private static final SqlSessionFactory sqlSessionFactory;
    private static final ThreadLocal<SqlSession> local = new ThreadLocal<SqlSession>();

    private SqlUtils() {}
    static {
        SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
        try {
            sqlSessionFactory =
                    sqlSessionFactoryBuilder.build(Resources.getResourceAsStream("mybatis-config.xml"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
    public static SqlSession openSession(){
        SqlSession sqlSession = local.get();
        if (sqlSession==null) {
            sqlSession = sqlSessionFactory.openSession();
            local.set(sqlSession);
        }
        return sqlSession;
    }
}
