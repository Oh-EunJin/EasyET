<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileNotFoundException"%>

<%-- 업로드 위해 필요한 2가지, 두 번째 import는 파일 이름 중복을 막아줌(중복되는 파일명 뒤에 (2) 붙여줌) --%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%
	String ss = session.getAttribute("ss").toString();
  	//String id = request.getParameter("id");
	  
	request.setCharacterEncoding("UTF-8"); //한글깨지지말라고
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	String SavePath = application.getRealPath("BoardSavePath");

	int max = 1024 * 1024 * 80; //업로드 받을 이미지의 최대 크기 10Mb로 용량 제한
	String encoding = "UTF-8"; //인코딩

	MultipartRequest Board_multi = null;
	Board_multi = new MultipartRequest(request, SavePath, max, encoding, new DefaultFileRenamePolicy());
%>
<%
	String sqlGetMaxBoardID = "SELECT MAX(board_uid) FROM board";
	
	String sqlInsertBoard = "INSERT INTO board("
			+ " board_uid,"
			+ " board_writer,"
			+ " board_title,"
			+ " board_content,"
			+ " board_date,"
			+ " board_look_cnt,"
			+ " board_reply_cnt,"
			+ " board_good_cnt)"
			+ " VALUES(?,?,?,?,?,?,?,?)";
	
	
	String sqlInsertBoardImg = "INSERT INTO boardimg("
			+ " board_uid,"
			+ " boardimg_uid,"
			+ " boardimg_originalname,"
			+ " boardimg_changename,"
			+ " boardimg_savepath"
			+ "		)"
			+ " VALUES(?,?,?,?,?)";
	
	//connection객체 생성
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	

	//db연결   
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
		String dbId = "yhpj"; //dbid설정
		String dbPass = "Yuhan2020!"; //db비밀번호 설정

		//드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver"); //Driver로 connection객체와 연결
		// connection 객체 세팅
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); //위에서 로딩한 드라이버를 가지고 connection객체에 연결


		// Board ID를 일치시키기 위해 현재 존재하는 ID의 최대값 사용 ================================================================================
		pstmt = conn.prepareStatement(sqlGetMaxBoardID);
		rs = pstmt.executeQuery();

		int MaxBID = 0;
		if (rs.next()) {
			MaxBID = rs.getInt(1) + 1;
		}
		rs.close();
		pstmt.close();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		
		// Board 정보 입력 ==============================================================================================================
		pstmt = conn.prepareStatement(sqlInsertBoard);
		pstmt.setInt(1, MaxBID);
		pstmt.setString(2, ss);
		pstmt.setString(3, Board_multi.getParameterValues("Board_Title")[0]);
		pstmt.setString(4, Board_multi.getParameterValues("Board_Content")[0].replaceAll("\r\n","<br/>"));
		pstmt.setString(5, sdf.format(cal.getTime()));
		pstmt.setInt(6, 0);
		pstmt.setInt(7, 0);
		pstmt.setInt(8, 0);
		
		pstmt.executeUpdate();
		pstmt.close();
		
		
		// BoardImg 정보 입력==============================================================================================================
		
		//첨부사진 파일 부분 (각각의 갯수를 체크하기 위해 사용)
		Enumeration<?> en = Board_multi.getFileNames();
		
		// 첨부사진의 갯수를 계산
		int BCnt = 0;
		while (en.hasMoreElements()) {
		String name = (String) en.nextElement();
			if (name.indexOf("BoardImgFile") != -1) {
				BCnt++;
				continue;
			}
		}
		
		for(int i=0; i<BCnt;i++)
		{
			pstmt = conn.prepareStatement(sqlInsertBoardImg);  
			pstmt.setInt(1, MaxBID);
			pstmt.setInt(2, i + 1);
			pstmt.setString(3, Board_multi.getOriginalFileName("BoardImgFile"+(i+1)));
			pstmt.setString(4, Board_multi.getFilesystemName("BoardImgFile"+(i+1)));
			pstmt.setString(5, SavePath);
			
			pstmt.executeUpdate();
			
			pstmt.close();
		}
		response.sendRedirect("board_detail_form.jsp?boardid="+MaxBID+"&pg="+pg);
	}

	catch (SQLException sql) {
		sql.printStackTrace();
		System.out.println(sql.getMessage());
		
	}
	finally {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			
		} catch (SQLException sql) {
			System.out.println(sql.getMessage());
		}
	}
	
%>