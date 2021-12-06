/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.50
 * Generated at: 2020-11-19 17:33:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.oreilly.servlet.MultipartRequest;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.util.*;
import java.io.*;

public final class board_005freply_005finsert_005faction_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
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
