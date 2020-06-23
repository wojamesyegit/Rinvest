package com.test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import com.test.StringUtil;
import com.test.DbUtil;
import com.test.User;
import com.test.DAO;
@WebServlet("/LoginServletZ")
public class LoginServletZ {

	public LoginServletZ() {
		// TODO Auto-generated constructor stub
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        this.doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        System.out.println(userName+"--"+password);

        if(StringUtil.isEmpty(password)||StringUtil.isEmpty(userName)){

            //session
            HttpSession session=request.getSession();
            session.setAttribute("error", "不能为空");          
            response.sendRedirect(request.getContextPath()+"/index.jsp");
            System.out.println("kong");
            return ;
        }

        User user = new User(userName, password);
        DbUtil db= new DbUtil();
 
        DAO dao=new DAO();
        try {
            Connection con = db.getCon();
            User curr_user = dao.login(con, user);
            if(null==curr_user){
                HttpSession session=request.getSession();
                session.setAttribute("error", "错误");
                session.setAttribute("userName", userName);
                session.setAttribute("password", password);
                response.sendRedirect(request.getContextPath()+"/index.jsp");
                System.out.println("error");
            }else{
                // 
                HttpSession session=request.getSession();
                session.setAttribute("currentUser", "登陆成功");
           
                response.sendRedirect(request.getContextPath()+"/main.jsp");
                System.out.println("yes");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
