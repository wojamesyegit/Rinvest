package com.test;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//�������� java ��
import javax.servlet.*;
import java.util.*;

//ʵ�� Filter ��
/**
 * Servlet Filter implementation class LogFilter
 */


public class LogFilter implements Filter  {
  public void  init(FilterConfig config) throws ServletException {
      // ��ȡ��ʼ������
      String site = config.getInitParameter("Site"); 

      // �����ʼ������
      System.out.println("��վ����: " + site); 
  }
  public void  doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws java.io.IOException, ServletException {

      // ���վ������
      System.out.println("վ����ַ��http://www.raybu.top");

      // �����󴫻ع�����
      chain.doFilter(request,response);
  }
  public void destroy( ){
      /* �� Filter ʵ���� Web �����ӷ����Ƴ�֮ǰ���� */
  }
}