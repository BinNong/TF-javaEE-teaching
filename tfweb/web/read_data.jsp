<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/12
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %> <%-- JDBC程序包 --%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
  public static final String DBDRIVER = "com.mysql.jdbc.Driver";
  public static final String DBURL = "jdbc:mysql://localhost:3306/tf";
  public static final String USER = "root";
  public static final String PASSWORD = "123456";
%>
<%
  String sql = "SELECT deptno,dname,loc FROM dept";
  Class.forName(DBDRIVER); // 加载驱动
  Connection conn = DriverManager.getConnection(DBURL, USER, PASSWORD); // 连接数据库
  PreparedStatement pstmt = conn.prepareStatement(sql); // 创建数据库操作对象
  ResultSet rs = pstmt.executeQuery();
%>
<table border="1" width="100%">
  <thead><tr><td>部门编号</td><td>部门名称</td><td>部门位置</td></tr></thead>
  <tbody>
  <%
    while (rs.next()) { // 迭代结果集
      long deptno = rs.getLong(1);
      String dname = rs.getString(2);
      String loc = rs.getString(3);
  %>
  <tr>
    <td><%=deptno%></td>
    <td><%=dname%></td>
    <td><%=loc%></td>
  </tr>
  <%
    }
    conn.close(); // 在WEB中如果没有关闭数据库连接，就再也关不上了，除非重新启动服务器
  %>
  </tbody>
</table>
</body>
</html>
