<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	int boardid = Integer.parseInt(request.getParameter("boardid"));
	int boardreplyid = Integer.parseInt(request.getParameter("boardreplyid"));
	int pg = Integer.parseInt(request.getParameter("pg"));

	PreparedStatement pstmt=null;
	
	String driverName="com.mysql.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
	String dbId="yhpj";
	String dbPass="Yuhan2020!";
	
	try{
		Class.forName(driverName); 
		Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String BoardReplyDeletesql = "DELETE FROM boardreply WHERE boardreply_uid = ?";
		pstmt= conn.prepareStatement(BoardReplyDeletesql);
		pstmt.setInt(1, boardreplyid);
		pstmt.executeUpdate();

		String BoardReplyCntUpdateSQL = "UPDATE board SET board_reply_cnt = board_reply_cnt-1"
				+	" where board_uid ="
				+	boardid;
		pstmt= conn.prepareStatement(BoardReplyCntUpdateSQL);
		pstmt.executeUpdate();
		
		out.println("<script>");
		out.println("alert('해당 게시글이 삭제되었습니다.')");
		out.println("</script>");
		
		response.sendRedirect("board_detail_form.jsp?boardid="+boardid+"&pg="+pg);
	}catch(ClassNotFoundException e){
		out.println("Where is your mysql jdbc driver?");
		e.printStackTrace();
		return;
	}

%>
</body>
</html>