<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	int boardid = Integer.parseInt(request.getParameter("boardid"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	PreparedStatement pstmt=null;
	
	String driverName="com.mysql.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
	String dbId="yhpj";
	String dbPass="Yuhan2020!";
	
	request.setCharacterEncoding("UTF-8");
	
	try{
		Class.forName(driverName); 
		Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String BoardReplyLookCntUpdateSQL = "UPDATE board SET board_look_cnt = board_look_cnt+"
				+	1
				+	" WHERE board_uid ="
				+	boardid;
		
		pstmt= conn.prepareStatement(BoardReplyLookCntUpdateSQL);
		pstmt.executeUpdate();
		
		response.sendRedirect("board_detail_form.jsp?boardid="+boardid+"&pg="+pg);
		
	}catch(ClassNotFoundException e){
		out.println("Where is your mysql jdbc driver?");
		e.printStackTrace();
		return;
	}
%>
		
</body>
</html>