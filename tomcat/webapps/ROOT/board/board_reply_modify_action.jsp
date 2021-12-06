<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String ss = session.getAttribute("ss").toString();
	
	int boardid = Integer.parseInt(request.getParameter("boardid"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	if(ss == null)
	{
		response.sendRedirect("index.jsp");
	}
	
	String BoardReply_Content = request.getParameter("boardreplycontent");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
		String dbId="yhpj";
		String dbPass="Yuhan2020!"; 
		
		Class.forName ("com.mysql.jdbc.Driver");

		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			String sql = "UPDATE boardreply set "
					+	 "boardreply_content = "
					+	  BoardReply_Content
					+	 " where board_uid = "
					+	  boardid ;			
			
			pstmt.executeUpdate(sql);
			
			out.println("<script>");
			out.println("alert('해당 댓글이 수정되었습니다.')");
			out.println("location.href='board_list.jsp';");
			out.println("</script>");
		
			}catch(Exception e){//에러가 났을 때 나오는 메시지
		e.printStackTrace();
	}finally{
		if(pstmt != null)
		{
			try{pstmt.close();}catch(Exception e){}
		}
		if(conn != null)
		{
			try{pstmt.close();}catch(Exception e){}
		}
	}
%>
</body>
</html>