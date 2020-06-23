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

/**
 * Servlet implementation class ChangePassServlet
 */
@WebServlet("/ChangePassServlet")
public class ChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest req,
	    		HttpServletResponse resp) throws ServletException, IOException {
	    
	    
	        /**
	         * ����ǰ̨������ֵ �˺ź�����
	         */
	    	
	    	//��ȡע���û���
	    	HttpSession session = req.getSession(true);
	    	String userIDKey = new String("userID");
	   	    String userID = (String)session.getAttribute(userIDKey);
	    	//session.invalidate();
	        String pass=req.getParameter("password");
	        //��ȡע���û�����
	        String new_pass=req.getParameter("new_pass");
	        
	        DbUtil db= new DbUtil();
	        User user=new User(userID,new_pass);
	        User user0 =new User(userID,pass);
	        DAO dao=new DAO();
	        try {
	            //���ݿ�����
	            Connection con=db.getCon();
	            if(dao.login(con, user0)!=null) {
	            	
	            	if(dao.regist(con,user)) {
		            	PrintWriter out = resp.getWriter();
		                resp.setContentType("text/html;charset=UTF-8");
		                out.println("<script language='javascript'>alert('Success!'); window.location.href='login_new.jsp';</script>");
		                
		               
		            }else {
		            	PrintWriter out = resp.getWriter();
		                resp.setContentType("text/html;charset=UTF-8");
		            	out.println("<script language='javascript'>alert('Change Fail...'); window.location.href='login_new.jsp';</script>");
		                //resp.sendRedirect("regist_new.html");
		            	
		       
		            }
		            
	             
	                
	            }else {
	            	
	            	session.setAttribute("loginMsg", "ԭ�����������");
	            	resp.sendRedirect("user_center.jsp");
	                //PrintWriter out = resp.getWriter();
	                //resp.setContentType("text/html;charset=UTF-8");
	                //out.println("<script  charset=UTF-8 language='javascript'>alert('�û���������Ϊ�գ�����������'); window.location.href='login_new.jsp';</script>");
	                //resp.sendRedirect("login_new.jsp");
	            }
	            
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    
	    }
}
