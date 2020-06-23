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
//�������� java ��
import javax.servlet.*;
import java.util.*;

//ʵ�� Filter ��
/**
 * Servlet Filter implementation class LogFilter
 */


public class SearchFilter implements Filter  {
  public void  init(FilterConfig config) throws ServletException {
      // ��ȡ��ʼ������
     
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
	  
      // ���վ������
      System.out.println("��¼��ʷ");
      try {
          //���ݿ�����
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
      // �����󴫻ع�����
      chain.doFilter(request,response);
  }
  public void destroy( ){
      /* �� Filter ʵ���� Web �����ӷ����Ƴ�֮ǰ���� */
  }
}