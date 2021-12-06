/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.50
 * Generated at: 2020-11-19 17:33:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Enumeration;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.io.File;
import java.io.FileNotFoundException;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public final class board_005finsert_005faction_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.sql");
    _jspx_imports_packages.add("javax.naming");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Calendar");
    _jspx_imports_classes.add("java.util.Enumeration");
    _jspx_imports_classes.add("com.oreilly.servlet.multipart.DefaultFileRenamePolicy");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("java.io.File");
    _jspx_imports_classes.add("java.io.FileNotFoundException");
    _jspx_imports_classes.add("com.oreilly.servlet.MultipartRequest");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

	String ss = session.getAttribute("ss").toString();
  	//String id = request.getParameter("id");
	  
	request.setCharacterEncoding("UTF-8"); //한글깨지지말라고
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	String SavePath = application.getRealPath("BoardSavePath");

	int max = 1024 * 1024 * 80; //업로드 받을 이미지의 최대 크기 10Mb로 용량 제한
	String encoding = "UTF-8"; //인코딩

	MultipartRequest Board_multi = null;
	Board_multi = new MultipartRequest(request, SavePath, max, encoding, new DefaultFileRenamePolicy());

      out.write('\n');

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
	

    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
