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
	
	String SavePath = application.getRealPath("NoticeSavePath");

	int max = 1024 * 1024 * 80; //업로드 받을 이미지의 최대 크기 10Mb로 용량 제한
	String encoding = "UTF-8"; //인코딩

	MultipartRequest Notice_multi = null;
	Notice_multi = new MultipartRequest(request, SavePath, max, encoding, new DefaultFileRenamePolicy());
%>
<%
	String sqlGetMaxNoticeID = "SELECT MAX(notice_uid) FROM notice";
	
	String sqlInsertNotice = "INSERT INTO notice("
			+ " notice_uid,"
			+ " notice_name,"
			+ " notice_title,"
			+ " notice_content,"
			+ " notice_date,"
			+ " notice_look_cnt)"
			+ " VALUES(?,?,?,?,?,?)";
	
	
	String sqlInsertNoticeImg = "INSERT INTO noticeimg("
			+ " notice_uid,"
			+ " noticeimg_uid,"
			+ " noticeimg_originalname,"
			+ " noticeimg_changename,"
			+ " noticeimg_savepath"
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


		// Notice ID를 일치시키기 위해 현재 존재하는 ID의 최대값 사용 ================================================================================
		pstmt = conn.prepareStatement(sqlGetMaxNoticeID);
		rs = pstmt.executeQuery();

		int MaxNID = 0;
		if (rs.next()) {
			MaxNID = rs.getInt(1) + 1;
		}
		rs.close();
		pstmt.close();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		
		// Notice 정보 입력 ==============================================================================================================
		pstmt = conn.prepareStatement(sqlInsertNotice);
		pstmt.setInt(1, MaxNID);
		pstmt.setString(2, ss);
		pstmt.setString(3, Notice_multi.getParameterValues("Notice_Title")[0]);
		pstmt.setString(4, Notice_multi.getParameterValues("Notice_Content")[0].replaceAll("\r\n","<br/>"));
		pstmt.setString(5, sdf.format(cal.getTime()));
		pstmt.setInt(6, 0);
		
		pstmt.executeUpdate();
		pstmt.close();
		
		
		// NoticeImg 정보 입력==============================================================================================================
		
		//첨부사진 파일 부분 (각각의 갯수를 체크하기 위해 사용)
		Enumeration<?> en = Notice_multi.getFileNames();
		
		// 첨부사진의 갯수를 계산
		int NCnt = 0;
		while (en.hasMoreElements()) {
		String name = (String) en.nextElement();
			if (name.indexOf("NoticeImgFile") != -1) {
				NCnt++;
				continue;
			}
		}
		
		for(int i=0; i<NCnt;i++)
		{
			pstmt = conn.prepareStatement(sqlInsertNoticeImg);  
			pstmt.setInt(1, MaxNID);
			pstmt.setInt(2, i + 1);
			pstmt.setString(3, Notice_multi.getOriginalFileName("NoticeImgFile"+(i+1)));
			pstmt.setString(4, Notice_multi.getFilesystemName("NoticeImgFile"+(i+1)));
			pstmt.setString(5, SavePath);
			
			pstmt.executeUpdate();
			
			pstmt.close();
		}
		response.sendRedirect("notice_detail_form.jsp?noticeid="+MaxNID+"&pg="+pg);
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