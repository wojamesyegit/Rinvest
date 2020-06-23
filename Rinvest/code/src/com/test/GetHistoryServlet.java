package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

//import net.sf.json.JSONArray;  
//import net.sf.json.JSONObject;

/**
 * Servlet implementation class GetLikeServlet
 */
@WebServlet("/GetHistoryServlet")
public class GetHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
		
		
		   
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
		History history =new History();
	    try {
            //数据库连接
            Connection con=db.getCon();
            List h = history.get_history(con, userID);
            if(h!= null) {
            	
            	
            	 
            	 response.setCharacterEncoding("utf-8");
            	 response.setContentType("text/html;charset=UTF-8");
            	 //PrintWriter out = response.getWriter();
                 //out.println("<script language='javascript'>alert('"+a+"\')"+";window.location.href='searchpage.jsp'</script>");
                
                 PrintWriter printWriter = response.getWriter();
                 Gson gson2=new Gson();
                 String str=gson2.toJson(h);
                 //System.out.println(str);
                 printWriter.print(str);
                 printWriter.flush();
                 printWriter.close();
                
            }else {
            	 PrintWriter out = response.getWriter();
            	 
            	 out.println("<script language='javascript'>alert('1'); window.location.href='login_new.jsp';</script>");
            }
        } catch (Exception e) {
            //e.printStackTrace();
        	//response.sendRedirect("login_new.jsp");
        	
        	PrintWriter out = response.getWriter();
            
            out.println("<script language='javascript'>alert('2');window.location.href='searchpage.jsp'</script>");
        }
	}

}
