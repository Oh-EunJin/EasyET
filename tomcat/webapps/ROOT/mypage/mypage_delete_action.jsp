<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.awt.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <!DOCTYPE html>
<html lang="utf-8">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
</head>
<body>
<%
	//Map<String, String> articles = new HashMap<String,String>();
  	PrintWriter ot = response.getWriter();
  	Map<String, Object> article = new HashMap<>();
  	String id = session.getAttribute("ss").toString();
  	String pwd2 = request.getParameter("pwd");
  	String querypwd = null;
  	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/yhpj";
		String dbId = "yhpj";
		String dbPass = "Yuhan2020!";
		conn = DriverManager.getConnection(url,dbId,dbPass);
		
		String sql = "SELECT user_password FROM user where user_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
	
 		while ( rs.next() ) {
			querypwd = rs.getString(1);
		} 
		
 		if(querypwd.equals(pwd2)){
 	 		sql = "delete from boardreply where boardreply_writer =?";
 	 		pstmt = conn.prepareStatement(sql);
 	 		pstmt.setString(1, id);
 	 		pstmt.executeUpdate();
 	 		
 	 		sql = "delete from board where board_writer =?";
 	 		pstmt = conn.prepareStatement(sql);
 	 		pstmt.setString(1, id);
 	 		pstmt.executeUpdate();
 	 		
 	 		sql = "delete from inbody where name =?";
 	 		pstmt = conn.prepareStatement(sql);
 	 		pstmt.setString(1, id);
 	 		pstmt.executeUpdate();
 	 		
 	 		sql = "delete from user where user_id = ? and user_password =?";
 	 		pstmt = conn.prepareStatement(sql);
 	 		pstmt.setString(1, id);
 	 		pstmt.setString(2, pwd2);
 	 		pstmt.executeUpdate();

			session.invalidate();
			ot.println("<script>alert('탈퇴 성공했습니다. 다음에 또 만나요'); location.href='/index.jsp';</script>");
 		}else{
 			
			ot.println("<script>alert('탈퇴에 실패했습니다. 다시 시도해주세요.'); location.href='/mypage/mypage_delete_form.jsp';</script>");
 		}

	} catch (SQLException se1) {
	    se1.printStackTrace();
	} catch (Exception ex) {
	    ex.printStackTrace();
	} finally {
	    try {
	        if (pstmt != null)
	            pstmt.close();
	    } catch (SQLException se2) {
	    }
	    try {
	        if (conn != null)
	            conn.close();
	    } catch (SQLException se) {
	        se.printStackTrace();
	    }
	}   
%>
</body>
</html>