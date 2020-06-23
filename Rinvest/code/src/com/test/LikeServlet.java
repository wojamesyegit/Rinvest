package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
       
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		DbUtil db= new DbUtil();
		HttpSession session = request.getSession(true);

		String userIDKey = new String("userID");
		String userID = (String)session.getAttribute(userIDKey);
	    AddLike al =new AddLike();

	   
	    Map<String,String[]> paramMap =request.getParameterMap();
	    String  Like_query = paramMap.get("code")[0];
	    String  name = paramMap.get("name")[0] + "_"+ userID ;
    	     
	    try {
            //数据库连接
            Connection con=db.getCon();
            
            if(al.add_like(con, userID, Like_query, name)) {
            	
            	
            	 
            	 response.setCharacterEncoding("utf-8");
            	 response.setContentType("text/html;charset=UTF-8");
            	 PrintWriter out = response.getWriter();
                 out.println("<script language='javascript'>alert('收藏成功，可以前往用户中心查看');window.location.href='searchpage.jsp?wd=" + Like_query+ "';"+ "</script>");
            	 
                
            }else {
            	 PrintWriter out = response.getWriter();
            	 response.setCharacterEncoding("utf-8");
            	 response.setContentType("text/html;charset=UTF-8");
            	 out.println("<script language='javascript'>alert('失败，你可能已经收藏过这支股票了');window.location.href='searchpage.jsp?wd=" + Like_query+ "';"+ "</script>");
            }
        } catch (Exception e) {
            //e.printStackTrace();
        	//response.sendRedirect("login_new.jsp");
        	 response.setCharacterEncoding("utf-8");
        	 response.setContentType("text/html;charset=UTF-8");
        	PrintWriter out = response.getWriter();
            
        	 out.println("<script language='javascript'>alert('失败，你可能已经收藏过这支股票了');window.location.href='searchpage.jsp?wd=" + Like_query+ "';"+ "</script>");
        }
		
        //response.sendRedirect("index.jsp");
		
		
	}

}
