package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
//导入必需的 java 库
import javax.servlet.*;
import java.util.*;

//实现 Filter 类
/**
 * Servlet Filter implementation class LogFilter
 */


public class SearchFilter implements Filter  {
  public void  init(FilterConfig config) throws ServletException {
      // 获取初始化参数
     
  }
  public void  doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws java.io.IOException, ServletException {

	  
	  DbUtil db= new DbUtil();
	  HttpServletRequest httpRequest = (HttpServletRequest)request;

	  HttpSession session = httpRequest.getSession(true);
	  //HttpSession session = request.getSession(true);
	//String SearchKey = new String("Search_Query");
	//String  Like_query = request.getParameter("code");
	//String Like_query= (String)session.getAttribute(SearchKey);
	  String userIDKey = new String("userID");
	  String userID = (String)session.getAttribute(userIDKey);
	  History history =new History();
	  Map<String,String[]> paramMap =request.getParameterMap();
	  String  query_key = paramMap.get("wd")[0];
	  
      // 输出站点名称
      System.out.println("记录历史");
      try {
          //数据库连接
          Connection con=db.getCon();
          
          if(history.add_history(con, userID, query_key)) {
          	
          	
          	 
          	 response.setCharacterEncoding("utf-8");
          	 response.setContentType("text/html;charset=UTF-8");
          	 //PrintWriter out = response.getWriter();
             //out.println("<script language='javascript'>alert('history!');window.location.href='searchpage.jsp?wd=" +query_key+ "';"+ "</script>");
          	 
              
          }else {
          	 PrintWriter out = response.getWriter();
          	 response.setCharacterEncoding("utf-8");
          	 response.setContentType("text/html;charset=UTF-8");
          	 out.println("<script language='javascript'>alert('history?');window.location.href='searchpage.jsp?wd=" + query_key+ "';"+ "</script>");
          }
      } catch (Exception e) {
          //e.printStackTrace();
      	//response.sendRedirect("login_new.jsp");
      	 response.setCharacterEncoding("utf-8");
      	 response.setContentType("text/html;charset=UTF-8");
      	PrintWriter out = response.getWriter();
          
      	 out.println("<script language='javascript'>alert('history?');window.location.href='searchpage.jsp?wd=" + query_key+ "';"+ "</script>");
      }
      // 把请求传回过滤链
      chain.doFilter(request,response);
  }
  public void destroy( ){
      /* 在 Filter 实例被 Web 容器从服务移除之前调用 */
  }
}