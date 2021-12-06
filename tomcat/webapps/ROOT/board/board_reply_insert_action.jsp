<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String ss = (String) session.getAttribute("ss");
	
	int pg = Integer.parseInt(request.getParameter("pg"));
		
	//MultipartRequest BoardReply_multi = new MultipartRequest(request, encoding);
	
	//connection객체 생성
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String BoardReply_Content = request.getParameter("BoardReply_Content"); //board_detail_form에서 BoardReply_Content 받아오기

		int boardid = Integer.parseInt(request.getParameter("boardid")); //board_list에서 board_uid 받아오기
		int replycnt = Integer.parseInt(request.getParameter("replycnt"));
		replycnt += 1;
		
		
		//db연결   
		try {

			String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj?useSSL=false&;useUnicode=true&characterEncoding=utf8";
			String dbId = "yhpj"; //dbid설정
			String dbPass = "Yuhan2020!"; //db비밀번호 설정
			
			//드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver"); //Driver로 connection객체와 연결
			// connection 객체 세팅
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); //위에서 로딩한 드라이버를 가지고 connection객체에 연결

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			
			String BoardReplyInsertSQL ="INSERT INTO boardreply("
									+ 	"board_uid,"
									+ 	"boardreply_writer,"
									+ 	"boardreply_content,"
									+ 	"boardreply_good_cnt,"
									+ 	"boardreply_date)"
									+ 	"VALUES (?,?,?,0,?)";
			
			String BoardReplyCntUpdateSQL = "UPDATE board SET board_reply_cnt ="
									+	replycnt
									+	" where board_uid ="
									+	boardid;			
			
			pstmt = conn.prepareStatement(BoardReplyInsertSQL);
			
			out.println(boardid);
			pstmt.setInt(1, boardid);
			pstmt.setString(2, ss);
			pstmt.setString(3, BoardReply_Content);
			pstmt.setString(4, sdf.format(cal.getTime()));
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(BoardReplyCntUpdateSQL);
			
			pstmt.executeUpdate();
			
			response.sendRedirect("board_detail_form.jsp?boardid="+boardid+"&pg="+pg);
			
			pstmt.close();
		}

		catch (SQLException sql) {
			out.println("What?");
			out.println(sql.getMessage());
			return;
		}
%>