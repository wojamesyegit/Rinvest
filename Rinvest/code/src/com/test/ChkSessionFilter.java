package com.test;
 
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
 
public class ChkSessionFilter implements Filter {
	@Override
	public void destroy() {
	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
	     HttpServletRequest request = (HttpServletRequest) req;
	     HttpServletResponse response = (HttpServletResponse) res;
	     HttpSession session = request.getSession(true);
	        //判断session是否过期
	        if (session.getAttribute("userID") == null) {
	            String errors = "请重新登录!";
	            
	            request.setAttribute("timeout", errors);
	            //PrintWriter out = response.getWriter();
	            //跳转至登录页面
	            //request.getRequestDispatcher("login_new.jsp").forward(request, response);
	            
                //out.println("<script language='javascript'>alert('收藏成功，可以前往用户中心查看');window.location.href='searchpage.jsp'</script>");
	            
	           	response.setCharacterEncoding("utf-8");
	           	response.setContentType("text/html;charset=UTF-8");
	           	PrintWriter out = response.getWriter();
	           	out.println("<script language='javascript'>alert('请重新登录'); window.location.href='login_new.jsp';</script>");
	        } else {
	            chain.doFilter(request, response);
	        }
 
	}
 
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
}