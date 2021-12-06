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
	String id = (String) session.getAttribute("ss");
	String what = request.getParameter("what");

	//int boardreply_good_cnt = Integer.parseInt(request.getParameter("boardreply_good_cnt")); 
	//boardreply_good_cnt += 1;
	
	PreparedStatement pstmt=null;
	
	String driverName="com.mysql.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
	String dbId="yhpj";
	String dbPass="Yuhan2020!";
	ResultSet rs = null;
	
	String BoardReplyGoodCntUpdateSQL = null;
	
	String sql = null;
	int getcnt = 0;
	
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
			
			sql = "select boardreply_good_cnt from boardreply where board_uid=? and boardreply_uid=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1,boardid);
			pstmt.setInt(2,boardreplyid);
		 	rs = pstmt.executeQuery();
		 	
		 	if(rs.next())
		 	{
		 		getcnt = rs.getInt(1);
		 	}
		 	
		 	if(what.equals("insert"))
		 	{
		 		BoardReplyGoodCntUpdateSQL = "update boardreply set boardreply_good_cnt = ? where board_uid = ? and boardreply_uid=?";
		 		pstmt= conn.prepareStatement(BoardReplyGoodCntUpdateSQL);
		 		pstmt.setInt(1,getcnt + 1);
		 		pstmt.setInt(2,boardid);
		 		pstmt.setInt(3,boardreplyid);
		 		pstmt.executeUpdate();
		 		
		 		BoardReplyGoodCntUpdateSQL = "insert into reply_good(board_uid,reply_uid,name) values(?,?,?)";
		 		pstmt= conn.prepareStatement(BoardReplyGoodCntUpdateSQL);
		 		pstmt.setInt(1,boardid);
		 		pstmt.setInt(2,boardreplyid);
		 		pstmt.setString(3,id);
		 		pstmt.executeUpdate();
		 	}
		 	else
		 	{
		 		BoardReplyGoodCntUpdateSQL = "update boardreply set boardreply_good_cnt = ? where board_uid = ? and boardreply_uid=?";
		 		pstmt= conn.prepareStatement(BoardReplyGoodCntUpdateSQL);
		 		pstmt.setInt(1,getcnt - 1);
		 		pstmt.setInt(2,boardid);
		 		pstmt.setInt(3,boardreplyid);
		 		pstmt.executeUpdate();
		 		
		 		BoardReplyGoodCntUpdateSQL = "delete from reply_good where board_uid=? and reply_uid=? and name=?";
		 		pstmt= conn.prepareStatement(BoardReplyGoodCntUpdateSQL);
		 		pstmt.setInt(1,boardid);
		 		pstmt.setInt(2,boardreplyid);
		 		pstmt.setString(3,id);
		 		pstmt.executeUpdate();
		 	}
			
			
			
			response.sendRedirect("board_detail_form.jsp?boardid="+boardid+"&pg="+pg);
		}catch(ClassNotFoundException e){
			out.println("Where is your mysql jdbc driver?");
			e.printStackTrace();
			return;
		}
	}
	
	

%>
</body>
</html>