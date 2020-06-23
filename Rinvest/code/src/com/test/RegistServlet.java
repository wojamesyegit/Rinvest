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
@WebServlet("/Regist")
public class RegistServlet extends HttpServlet{
 
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
    	
    	//获取注册用户名
    	HttpSession session = req.getSession(true);
    	session.invalidate();
        String usersname=req.getParameter("usersname");
        //获取注册用户密码
        String password=req.getParameter("password");
        
        DbUtil db= new DbUtil();
        User user=new User(usersname,password);
        DAO dao=new DAO();
        try {
            //数据库链接
            Connection con=db.getCon();
            
            if(dao.regist(con,user)) {
            	PrintWriter out = resp.getWriter();
                resp.setContentType("text/html;charset=UTF-8");
                out.println("<script language='javascript'>alert('Success!'); window.location.href='login_new.jsp';</script>");
                
               
            }else {
            	resp.setCharacterEncoding("utf-8");
           	    resp.setContentType("text/html;charset=UTF-8");
                PrintWriter out = resp.getWriter();
                out.println("<script language='javascript'>alert('这个用户名已经被注册了!'); window.location.href='regist_new.html';</script>");
                //resp.sendRedirect("regist_new.html");
       
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.setCharacterEncoding("utf-8");
       	    resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script language='javascript'>alert('这个用户名已经被注册了!'); window.location.href='regist_new.html';</script>");
            //resp.sendRedirect("regist_new.html");
        }
    
    }
}