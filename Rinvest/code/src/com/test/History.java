package com.test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;
 
 
public class History {
    /**
     * login(Connection con,User user) ��¼��֤
     * (Connection con,User user)ע�Ṧ��
  
     */
    public boolean add_history(Connection con, String  usersname , String  query_key) throws Exception{
        
    	boolean flag=false;
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String time = df.format(new Date());
        String sql="INSERT INTO query_history(usersname,time,query_key)VALUES(?,?,?)";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1,usersname);
        pstmt.setString(2, time);
        pstmt.setString(3, query_key);
        
        if (pstmt.executeUpdate() > 0) {
            flag = true;
        }
        return flag;
        
        
    }
    
    
    @SuppressWarnings("rawtypes")
	private static List convertList(ResultSet rs) throws SQLException{
    	@SuppressWarnings("rawtypes")
		List list = new ArrayList();
    	ResultSetMetaData md = rs.getMetaData();//��ȡ����
    	int columnCount = md.getColumnCount();//��ȡ�е�����
    	while (rs.next()) {
    	Map rowData = new HashMap();//����Map
    	for (int i = 1; i <= columnCount; i++) {
    	rowData.put(md.getColumnName(i), rs.getObject(i));//��ȡ������ֵ
    	}
    	list.add(rowData);
    	}
    	return list;
    	}
    //ע�Ṧ��
    public List get_history(Connection con, String  usersname) throws Exception{
    	//String[] stringArr = {"",""};
    	//List<String> list = Arrays.asList(stringArr);
        PreparedStatement pstmt = null;
        String sql="select time, query_key from query_history where usersname=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, usersname);
        ResultSet rs=pstmt.executeQuery();
        List list=convertList(rs);
        
        return list;
    }
    
    
 
}