<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileNotFoundException"%>


<%-- charset과 pageEncoding = UTF-8 사용 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String ss = session.getAttribute("ss").toString();
  	//String id = request.getParameter("id");
	int noticeid = Integer.parseInt(request.getParameter("noticeid"));
	  
	request.setCharacterEncoding("UTF-8"); //한글깨지지말라고
	//int pg = Integer.parseInt(request.getParameter("pg"));

	if(ss == null)
	{
		response.sendRedirect("index.jsp");
	}
	
%>
<%

	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
		String dbId = "yhpj";
		String dbPass = "Yuhan2020!"; 

		Class.forName("com.mysql.jdbc.Driver"); 
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); 

		String sqlNotice = "delete from noticeimg where notice_uid="+noticeid;
		String sqlNoticeImg = "delete from notice where notice_uid="+noticeid;
			
		
		pstmt= conn.prepareStatement(sqlNotice);
		pstmt.executeUpdate();
		pstmt.close();
			
		pstmt= conn.prepareStatement(sqlNoticeImg);
		pstmt.executeUpdate();
		
		out.println("<script>");
		out.println("alert('해당 공지사항이 삭제되었습니다.')");
		out.println("location.href='notice_list.jsp';");
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