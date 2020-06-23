package com.test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
 
 
public class DAO {
    /**
     * login(Connection con,User user) ��¼��֤
     * (Connection con,User user)ע�Ṧ��
  
     */
    public User login(Connection con,User user) throws Exception{
        User resultUser=null;
        String sql="select * from users where usersname=? and password=?";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1, user.getUsersname());
        pstmt.setString(2, user.getPassword());
        ResultSet rs=pstmt.executeQuery();
        if(rs.next()){
            resultUser=new User();
            resultUser.setUsersname(rs.getString("usersname"));
            resultUser.setPassword(rs.getString("password"));
        }
        return resultUser;
    }
    
    
    
    //ע�Ṧ��
    public boolean regist(Connection con,User user) throws Exception{
        boolean flag=false;
        PreparedStatement pstmt = null;
        String sql="INSERT INTO users(usersname,password)VALUES(?,?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, user.getUsersname());
        pstmt.setString(2, user.getPassword());
        if (pstmt.executeUpdate() > 0) {
            flag = true;
        }
        return flag;
    }
    
    public boolean change_pass(Connection con,User user) throws Exception{
        boolean flag=false;
        PreparedStatement pstmt = null;
        String sql="UPDATE mydatabase.users SET password = ? WHERE usersname= ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(2, user.getUsersname());
        pstmt.setString(1, user.getPassword());
        if (pstmt.executeUpdate() > 0) {
            flag = true;
        }
        return flag;
    }
 
}