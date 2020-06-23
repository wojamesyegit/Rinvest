package com.test;

 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.DAO;
import com.test.DbUtil;
import com.test.User;
 
@WebServlet("/Login")
public class LoginServlet extends HttpServlet{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, 
    		HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
 
    @Override
    protected void doPost(HttpServletRequest req, 
    		HttpServletResponse resp) throws ServletException, IOException {
    
    
        /**
         * 接收前台传来的值 账号和密码
         */
        String usersname=req.getParameter("usersname");
        
        String password=req.getParameter("password");
        
        DbUtil db= new DbUtil();
        User user=new User(usersname,password);
        DAO dao=new DAO();
        try {
            //数据库连接
            Connection con=db.getCon();
            
            if(dao.login(con, user)!=null) {
            	
            	 HttpSession session = req.getSession(true);
             
                 String userIDKey = new String("userID");
                 String userID = user.getUsersname();
                 session.setAttribute(userIDKey, userID);
                 
                resp.sendRedirect("index_login.jsp");
            }else {
            	HttpSession session = req.getSession(true);
            	session.setAttribute("loginMsg", "账号或密码输入错误！");
               
                //PrintWriter out = resp.getWriter();
                //resp.setContentType("text/html;charset=UTF-8");
                //out.println("<script  charset=UTF-8 language='javascript'>alert('用户名或密码为空，请重新输入'); window.location.href='login_new.jsp';</script>");
                resp.sendRedirect("login_new.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}