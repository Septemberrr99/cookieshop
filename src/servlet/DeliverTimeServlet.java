package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeliverTimeServlet")
public class DeliverTimeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取请求参数
        String deliveryTime = request.getParameter("deliveryTime");
        // 进行订单处理
        // ...
        // 返回处理结果
        response.setContentType("text/plain;charset=UTF-8");
        response.getWriter().write("订单提交成功");
    }
}








//@WebServlet(name = "DeliverTimeServlet")
//public class DeliverTimeServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        //获取用户提交的数据
//        String time = req.getParameter("delivery_time");
//        //调用其他的方法或者类来完成业务逻辑处理
//        saveTimeToDatabase(time);
//        //返回响应给用户
//        res.getWriter().println("保存成功");
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//    private void saveTimeToDatabase(String time) {
//        //加载数据库驱动
//        Class.forName("com.mysql.jdbc.Driver");
////创建数据库连接
//        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","password");
////创建预编译语句
//        PreparedStatement ps = conn.prepareStatement("insert into mytable (delivery_time) values (?)");
////设置参数
//        ps.setString(1, time);
//
////执行插入操作
//        ps.executeUpdate();
////关闭资源
//        ps.close();
//        conn.close();
//    }
//}
//
//
//public class SubmitOrderServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // 设置响应内容类型
//        response.setContentType("application/json;charset=utf-8");
//        PrintWriter out = response.getWriter();
//
//        // 获取请求数据
//        String json = request.getReader().readLine();
//        JsonObject data = new Gson().fromJson(json, JsonObject.class);
//        String deliveryTime = data.get("deliveryTime").getAsString();
//
//        // 判断是否选择了送达时间
//        if (deliveryTime.equals("")) {
//            out.print("{\"success\":false,\"msg\":\"请选择送达时间！\"}");
//            return;
//        }
//
//        // 处理订单
//        // TODO: 处理订单
//
//
//
//
//
////在servlet中接收参数
//String delivery_date = request.getParameter("delivery_date");
//        if (delivery_date == null || delivery_date.equals("")) {
//            //返回错误提示
//            response.getWriter().println("请选择送达时间"); }
//        else { //转换格式
//             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//             Date date = sdf.parse(delivery_date);
//             //写入数据库
//            Connection conn = null; PreparedStatement ps = null;
//            try { conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
//                ps = conn.prepareStatement("insert into orders (delivery_date) values (?)");
//                ps.setDate(1, new java.sql.Date(date.getTime())); ps.executeUpdate();
//                //返回成功提示
//                response.getWriter().println("下单成功");
//            }
//            catch (SQLException e) {
//                e.printStackTrace();
//            }
//            finally {
//                if (ps != null) {
//                    ps.close();
//                }
//                if (conn != null) {
//                    conn.close();
//                }
//            }
//        }
//    }
//        }