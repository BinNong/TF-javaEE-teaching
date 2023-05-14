<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/21
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" import="java.io.*,java.util.*" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.util.concurrent.locks.*" %>    <%-- 设置显示编码 --%>
<html>
<head>
    <title>java EE</title>
</head>
<body>
<%! // 定义一些操作的公共方法
    public BigInteger get(String path) throws Exception {   // 简化起见，抛出异常
        if (this.getServletContext().getAttribute("count") == null) { // 没有属性的时候
            this.getServletContext().setAttribute("count", new BigInteger("0"));
            File file = new File(path);
            if (file.exists()) {    // 文件存在
                Scanner scanner = new Scanner(file);
                if (scanner.hasNext()) {
                    BigInteger bi = new BigInteger(scanner.next());
                    // 因为我们必须防止用户有可能无限制刷新，会造成数据的重复读取
                    this.getServletContext().setAttribute("count", bi);
                }
                scanner.close();
            }
        }
        return (BigInteger) this.getServletContext().getAttribute("count");
    }
    public void save(String path, BigInteger num) throws Exception {
        Lock lock = new ReentrantLock(); // 定义互斥锁
        lock.lock(); // 同步锁定
        File file = new File(path);
        PrintWriter out = new PrintWriter(file);
        out.print(num); // 数据输出
        out.close();
        this.getServletContext().setAttribute("count", num);
        lock.unlock();
    }
%>
<%
    String filePath = this.getServletContext().getRealPath("/uv/") + "count.txt";
    BigInteger current = get(filePath); // 获取当前的访问量

    current = current.add(new BigInteger("1")); // 实现数据自增
    save(filePath, current);

%>
<h2>当前访问量：<%=current%></h2>
</body>
</html>