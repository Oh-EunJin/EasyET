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
	String what = request.getParameter("what");
	String id = (String) session.getAttribute("ss");
	
	PreparedStatement pstmt=null;
	
	String driverName="com.mysql.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
	String dbId="yhpj";
	String dbPass="Yuhan2020!";
	ResultSet rs = null;
	
	String sql = null;
	int getcnt = 0;
	
	request.setCharacterEncoding("UTF-8");
	
	String BoardReplyGoodCntUpdateSQL = null;
	%>

	
	<%
	if(session.getAttribute("ss") == null)
	{
		%>
		<script>
			alert("추천을 하려면 로그인이 필요합니다.");
			location.href="/login/login_form.jsp"
		</script>
		<%
	}
	else
	{
		try{
			Class.forName(driverName); 
			Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
			sql = "select board_good_cnt from board where board_uid=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1,boardid);
		 	rs = pstmt.executeQuery();
		 	
		 	if(rs.next())
		 	{
		 		getcnt = rs.getInt(1);
		 	}
			
			if(what.equals("insert"))
			{
				BoardReplyGoodCntUpdateSQL = "update board set board_good_cnt = ? where board_uid = ?";
				pstmt= conn.prepareStatement(BoardReplyGoodCntUpdateSQL);
				pstmt.setInt(1,getcnt + 1);
			 	pstmt.setInt(2,boardid);
			 	pstmt.executeUpdate();
			 	
			 	BoardReplyGoodCntUpdateSQL = "insert into board_good(uid,name) values(?,?)";
				pstmt= conn.prepareStatement(BoardReplyGoodCntUpdateSQL);
			 	pstmt.setInt(1,boardid);
			 	pstmt.setString(2,id);
			 	pstmt.executeUpdate();
			}
			else
			{
				BoardReplyGoodCntUpdateSQL = "update board set board_good_cnt = ? where board_uid = ?";
				pstmt= conn.prepareStatement(BoardReplyGoodCntUpdateSQL);
				pstmt.setInt(1,getcnt - 1);
			 	pstmt.setInt(2,boardid);
			 	pstmt.executeUpdate();
			 	
			 	BoardReplyGoodCntUpdateSQL = "delete from board_good where uid=? and name=?";
				pstmt= conn.prepareStatement(BoardReplyGoodCntUpdateSQL);
			 	pstmt.setInt(1,boardid);
			 	pstmt.setString(2,id);
			 	pstmt.executeUpdate();
			}
			
			

			response.sendRedirect("board_detail_form.jsp?boardid="+boardid+"&pg="+pg);
			
			out.println("<script>");
			out.println("alert('해당 게시글이 삭제되었습니다.')");
			out.println("location.href='board_detail_form.jsp';");
			out.println("</script>");
			
		}catch(ClassNotFoundException e){
			out.println("Where is your mysql jdbc driver?");
			e.printStackTrace();
			return;
		}
	}
	
%>
		
</body>
</html>