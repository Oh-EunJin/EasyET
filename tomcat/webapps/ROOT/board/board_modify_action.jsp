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

<%-- 업로드 위해 필요한 2가지, 두 번째 import는 파일 이름 중복을 막아줌(중복되는 파일명 뒤에 (2) 붙여줌) --%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	request.setCharacterEncoding("UTF-8");

	String ss = session.getAttribute("ss").toString();
	
	int boardid = Integer.parseInt(request.getParameter("boardid"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	if(ss == null)
	{
		response.sendRedirect("index.jsp");
	}
	
	String Board_Title_Modify = request.getParameter("Board_Title_Modify");
	String Board_Content_Modify = request.getParameter("Board_Content_Modify");

	
	String SavePath = application.getRealPath("BoardSavePath");

	int max = 1024 * 1024 * 80; //업로드 받을 이미지의 최대 크기 10Mb로 용량 제한
	String encoding = "UTF-8"; //인코딩

	MultipartRequest Board_Modify_multi = null;
	Board_Modify_multi = new MultipartRequest(request, SavePath, max, encoding, new DefaultFileRenamePolicy());

	String sqlGetMaxBoardImgID = "SELECT MAX(boardimg_uid) FROM boardimg where board_uid="+boardid;

	 String BoardModifySQL = "UPDATE board SET "
					   	+ 	 "board_title=?"
						+	 ", board_content=? "
						+	 "WHERE board_uid=" 
						+	  boardid;

/*   		String BoardImgModifySQL = "UPDATE boardimg SET "
				+	"boardimg_uid = ? "
				+	", boardimg_originalname = ? "
				+	", boardimg_changename = ? "
				+	", boardimg_savepath = ? "
		 		+	"WHERE board_uid = "
				+	boardid; 
 */
				
			 	String BoardImgModifySQL = "INSERT INTO boardimg("
						+ " board_uid,"
						+ " boardimg_uid,"
						+ " boardimg_originalname,"
						+ " boardimg_changename,"
						+ " boardimg_savepath"
						+ "		)"
						+ " VALUES("+boardid+",?,?,?,?)";
 				
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
		String dbId="yhpj";
		String dbPass="Yuhan2020!"; 
		
		Class.forName ("com.mysql.jdbc.Driver");

		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);

			
		// Boardimg ID를 일치시키기 위해 현재 존재하는 ID의 최대값 사용 ================================================================================
				pstmt = conn.prepareStatement(sqlGetMaxBoardImgID);
				rs = pstmt.executeQuery();

				int MaxBID = 0;
				if (rs.next()) {
					MaxBID = rs.getInt(1) + 1;
				}
				rs.close();
				pstmt.close();
		
			pstmt = conn.prepareStatement(BoardModifySQL);
			pstmt.setString(1, Board_Modify_multi.getParameterValues("Board_Title_Modify")[0]);
			pstmt.setString(2, Board_Modify_multi.getParameterValues("Board_Content_Modify")[0].replaceAll("\r\n","<br/>"));

			pstmt.executeUpdate();
			
 			// BoardImgModify 정보 입력==============================================================================================================
			
			//첨부사진 파일 부분 (각각의 갯수를 체크하기 위해 사용)
			Enumeration<?> en = Board_Modify_multi.getFileNames();
			
			// 첨부사진의 갯수를 계산
			int BCnt = 0;
			while (en.hasMoreElements()) {
			String name = (String) en.nextElement();
				if (name.indexOf("BoardImgModifyFile") != -1) {
					BCnt++;
					continue;
				}
			}
			
			for(int i=0; i<BCnt;i++)
			{	
				
				pstmt = conn.prepareStatement(BoardImgModifySQL);  
			 	pstmt.setInt(1, MaxBID);
				pstmt.setString(2, Board_Modify_multi.getOriginalFileName("BoardImgModifyFile"+(i+1)));
				pstmt.setString(3, Board_Modify_multi.getFilesystemName("BoardImgModifyFile"+(i+1)));
				pstmt.setString(4, SavePath); 
				
				pstmt.executeUpdate();
			} 
			pstmt.close();
				response.sendRedirect("board_detail_form.jsp?boardid="+boardid+"&pg="+pg);
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