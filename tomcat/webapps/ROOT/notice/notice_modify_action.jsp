<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileNotFoundException"%>

<%
	request.setCharacterEncoding("UTF-8");

	String ss = session.getAttribute("ss").toString();
	int noticeid = Integer.parseInt(request.getParameter("noticeid"));
		
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	if(ss == null)
	{
		response.sendRedirect("index.jsp");
	}
	
	String Notice_Title = request.getParameter("Notice_Title");
	String Notice_Content = request.getParameter("Notice_Content");

	
%>
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

		String NoticeModifySQL = "UPDATE notice SET "
					   	+ 	 "notice_title=?"
						+	 ", notice_content=? "
						+	 "WHERE notice_uid=" 
						+	  noticeid;
	
			pstmt = conn.prepareStatement(NoticeModifySQL);
			pstmt.setString(1, Notice_Title);
			pstmt.setString(2, Notice_Content);
			
			pstmt.executeUpdate();
			pstmt.close();
		
			response.sendRedirect("notice_detail_form.jsp?noticeid="+noticeid+"&pg="+pg);

		}catch(Exception e){
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