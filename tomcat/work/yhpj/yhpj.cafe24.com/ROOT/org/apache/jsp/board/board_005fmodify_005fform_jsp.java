/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.50
 * Generated at: 2020-12-03 11:19:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.Normalizer.Form;
import java.sql.*;

public final class board_005fmodify_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.text.Normalizer.Form");
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
      out.write("<!-- 작성 시작 -->\n");

		request.setCharacterEncoding("UTF-8");
		//String login = (String)session.getAttribute("Login");
		//String userid = (String)session.getAttribute("UserID");
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//로그인이 안돼있는 경우 index 페이지로 돌아감 
		if(session.getAttribute("ss") == null)
		{
			response.sendRedirect("index.jsp");
		}
		
		int boardid = Integer.parseInt(request.getParameter("boardid")); //BoardList에서 board_uid 받아오기
		String boardtitle = request.getParameter("boardtitle");
		String boardcontent = request.getParameter("boardcontent");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String driverName = "com.mysql.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj?useSSL=false&;useUnicode=true&characterEncoding=utf8";
		String dbId = "yhpj"; //dbid설정
		String dbPass = "Yuhan2020!"; //db비밀번호 설정
		
		//드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver"); //Driver로 connection객체와 연결
		// connection 객체 세팅
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); //위에서 로딩한 드라이버를 가지고 connection객체에 연결


      out.write("\n");
      out.write("<!-- 작성 끝 -->\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"utf-8\">\n");
      out.write("<head>\n");
      out.write("<meta charset=\"utf-8\">\n");
      out.write("<meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n");
      out.write("<title>Welcome EasyET</title>\n");
      out.write("<meta content=\"\" name=\"descriptison\">\n");
      out.write("<meta content=\"\" name=\"keywords\">\n");
      out.write("<!-- 작성 시작 -->\n");
      out.write("<script src=\"//code.jquery.com/jquery.min.js\" ></script>\n");
      out.write("<!-- 이미지 미리보기 할 때 필요한 script -->\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("\t\t\t//첨부파일 동적 추가하는 부분============================================================================================================================\n");
      out.write("\t\t\tBoardImgModify_cnt = 0;\n");
      out.write("\t\t\t function BoardImgModify_AddItem()\n");
      out.write("\t\t\t {\n");
      out.write("\t\t\t\t BoardImgModify_cnt++;\n");
      out.write("\t\t\t\t BoardImgModifydiv = document.createElement('BoardImgModifydiv'); //div id값 받아오는 부분\n");
      out.write("\t\t\t\t BoardImgModifydiv.className = 'row';\n");
      out.write("\t\t\t\t BoardImgModifydiv.innerHTML += \"<br><br>\" + \"사진 #\"\n");
      out.write("\t\t\t\t \t+ BoardImgModify_cnt\n");
      out.write("\t\t\t\t\t+ \"<img name=BoardImgModify id=BoardImgModify\"+ BoardImgModify_cnt +\" src='' style='width:70%;align-content:center;'/>\"\n");
      out.write("\t\t\t\t\t+ \"&nbsp;&nbsp;\"\n");
      out.write("\t\t\t\t\t+ \"<input type=file name=BoardImgModifyFile\"+ BoardImgModify_cnt + \" id=BoardImgModifyPreview\"+ BoardImgModify_cnt +\" accept='.jpeg, .jpg, .jpe, .jfif, .PNG, .png, .img' />\"\n");
      out.write("\t\t\t\t\t+ \"&nbsp;&nbsp;\"\n");
      out.write("\t\t\t\t\t+ \"<input type=button value='X' onclick='BoardImgModify_removeRow(this)' style='align:right; font-weight:bold; font-size:10px; height:30px' class='btn btn-primary btn-fill' /> <br><br><hr>\";\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\tdocument.getElementById('BoardImgModifydiv').appendChild(BoardImgModifydiv); //Input 값 유지시켜주는 부분\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t$(function() {\n");
      out.write("\t\t\t\t\t\t$('#BoardImgModifyPreview' + BoardImgModify_cnt).on('change', function() {\n");
      out.write("\t\t\t\t\t\t\tReadBoardImgModifyURL(this);\n");
      out.write("\t\t\t\t\t\t}); \n");
      out.write("\t\t\t\t\t});\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\t\tfunction ReadBoardImgModifyURL(input) {\n");
      out.write("\t\t\t\t\t\tif (input.files && input.files[0]) {\n");
      out.write("\t\t\t\t\t\t\tvar reader = new FileReader();\n");
      out.write("\t\t\t\t\t\t\treader.onload = function(e) {\n");
      out.write("\t\t\t\t\t\t\t\t$('#BoardImgModify'+ BoardImgModify_cnt).attr('src', e.target.result);\n");
      out.write("\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t\treader.readAsDataURL(input.files[0]);\n");
      out.write("\t\t\t\t\t\t}\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t }\n");
      out.write("\t\t\t //Board 동적으로 추가한 행 삭제\n");
      out.write("\t\t\t function BoardImgModify_removeRow(input)\n");
      out.write("\t\t\t {\n");
      out.write("\t\t\t\t document.getElementById('BoardImgModifydiv').removeChild(input.parentNode);\n");
      out.write("\t\t\t\t BoardImgModify_cnt--;\n");
      out.write("\t\t\t }\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t // DB에서 행 삭제\n");
      out.write("/* \t\t\t function BoardImgModify_removeRow_DB()\n");
      out.write("\t\t\t {\n");
      out.write("\t\t\t\t var div = document.getElementById('BoardImgSel');\n");
      out.write("\t\t\t\t var btn = document.getElementById('BoardImgDelBtn');\n");
      out.write("\t\t\t\t \n");
      out.write("\t\t\t\t\tvar boardimgid = document.getElementById('BoardImgSel').val();\n");
      out.write("\t\t\t\t\t\t\t\t\t\t$('#BoardImgSel')\n");
      out.write("\t\t\t\t\tString BoardImgDelsql = \"delete from boardimg where board_uid=\"+boardid;\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\tpstmt= conn.prepareStatement(BoardImgDelsql);\n");
      out.write("\t\t\t\t\tpstmt.executeUpdate();\n");
      out.write("\t\t\t\t\tpstmt.close();\n");
      out.write("\t\t\t\t \n");
      out.write("\t\t\t\t \tdiv.btn.remove();\n");
      out.write("\t\t\t } \n");
      out.write("\t\t\t \n");
      out.write("*/\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t// 등록 시 빈칸 검사============================================================================================================================\n");
      out.write("\t\t\t function WriteCheck()\n");
      out.write("\t\t\t {\n");
      out.write("\t\t\t\tvar form = document.BoardModifyForm;\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\tif(!form.Board_Title_Modify.value)\n");
      out.write("\t\t\t\t\t{\n");
      out.write("\t\t\t\t\t\talert(\"제목을 입력해 주세요\");\n");
      out.write("\t\t\t\t\t\tform.Board_Title_Modify.focus();\n");
      out.write("\t\t\t\t\t\treturn false;\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t}else if(!form.Board_Content_Modify.value)\n");
      out.write("\t\t\t\t\t{\n");
      out.write("\t\t\t\t\t\talert(\"내용을 입력해 주세요\");\n");
      out.write("\t\t\t\t\t\tform.Board_Content_Modify.focus();\n");
      out.write("\t\t\t\t\t\treturn false;\n");
      out.write("\t\t\t\t\t}else if(form.Board_Title_Modify.value.match(\"시발\") || form.Board_Title_Modify.value.match(\"꺼져\") || form.Board_Title_Modify.value.match(\"개새\") )\n");
      out.write("\t\t\t\t\t {  \n");
      out.write("\t\t\t\t\t\t alert(\"제목 욕설 금지\");\n");
      out.write("\t\t\t\t\t\t document.getElementById(\"Board_Title_Modify\").value='';\n");
      out.write("\t\t\t\t\t\t form.Board_Title_Modify.focus();\n");
      out.write("\t\t\t\t\t\t return false;\n");
      out.write("\t\t\t\t\t}else if(form.Board_Content_Modify.value.match(\"시발\") || form.Board_Content_Modify.value.match(\"꺼져\") || form.Board_Content_Modify.value.match(\"개새\"))\n");
      out.write("\t\t\t\t\t {  \n");
      out.write("\t\t\t\t\t\t alert(\"본문 욕설 금지\");\n");
      out.write("\t\t\t\t\t\t document.getElementById(\"Board_Content_Modify\").value='';\n");
      out.write("\t\t\t\t\t\t form.Board_Content_Modify.focus();\n");
      out.write("\t\t\t\t\t\t return false;\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\treturn true;\n");
      out.write("\t\t\t\t\t \n");
      out.write("\t\t\t }\n");
      out.write("\t\t</script>\n");
      out.write("<!-- 작성 끝 -->\n");
      out.write("<!-- Favicons -->\n");
      out.write("<link href=\"/assets/img/favicon.png\" rel=\"icon\">\n");
      out.write("<link href=\"/assets/img/apple-touch-icon.png\" rel=\"apple-touch-icon\">\n");
      out.write("\n");
      out.write("<!-- Google Fonts -->\n");
      out.write("<link\n");
      out.write("\thref=\"https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i\"\n");
      out.write("\trel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<!-- Vendor CSS Files -->\n");
      out.write("<link href=\"/assets/vendor/bootstrap/css/bootstrap.min.css\"\n");
      out.write("\trel=\"stylesheet\">\n");
      out.write("<link href=\"/assets/vendor/icofont/icofont.min.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"/assets/vendor/boxicons/css/boxicons.min.css\"\n");
      out.write("\trel=\"stylesheet\">\n");
      out.write("<link href=\"/assets/vendor/animate.css/animate.min.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"/assets/vendor/remixicon/remixicon.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"/assets/vendor/venobox/venobox.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"/assets/vendor/owl.carousel/assets/owl.carousel.min.css\"\n");
      out.write("\trel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<!-- Template Main CSS File -->\n");
      out.write("<link href=\"/assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<!-- =======================================================\n");
      out.write("  * Template Name: MyBiz - v2.1.0\n");
      out.write("  * Template URL: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/\n");
      out.write("  * Author: BootstrapMade.com\n");
      out.write("  * License: https://bootstrapmade.com/license/\n");
      out.write("  ======================================================== -->\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<!-- ======= Top Bar ======= -->\n");
      out.write("\t<section id=\"topbar\" class=\"d-none d-lg-block\">\n");
      out.write("\t\t<div class=\"container d-flex\">\n");
      out.write("\t\t\t<div class=\"contact-info mr-auto\">\n");
      out.write("\t\t\t\t<i class=\"icofont-envelope\"></i><a href=\"mailto:chk4814@naver.com\">chk4814@naver.com</a>\n");
      out.write("\t\t\t\t<i class=\"icofont-phone phone-icon\"></i> +82 02-2610-0600\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div>\n");
      out.write("\t\t\t\t");

      	if(session.getAttribute("ss") == null)
      	{
    	  
      out.write("\n");
      out.write("\t\t\t\t<a href=\"/login/login_form.jsp\">LOGIN</a> <a\n");
      out.write("\t\t\t\t\thref=\"/join/join_form.jsp\">JOIN</a>\n");
      out.write("\t\t\t\t");

      	}
      	else
      	{
    	  
      out.write("\n");
      out.write("\t\t\t\t<a href=\"/login/logout_action.jsp\">LOGOUT</a> <a\n");
      out.write("\t\t\t\t\thref=\"/mypage/mypage.jsp\">MYPAGE</a>\n");
      out.write("\t\t\t\t");

      	}
      
      out.write("\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</section>\n");
      out.write("\n");
      out.write("\t<!-- ======= Header ======= -->\n");
      out.write("\t<header id=\"header\" class=\"d-flex align-items-center\">\n");
      out.write("\t\t<div class=\"container d-flex align-items-center\">\n");
      out.write("\n");
      out.write("\t\t\t<div class=\"logo mr-auto\">\n");
      out.write("\t\t\t\t<h1 class=\"text-light\">\n");
      out.write("\t\t\t\t\t<a href=\"/index.jsp\">Easy<span>ET</span></a>\n");
      out.write("\t\t\t\t</h1>\n");
      out.write("\t\t\t\t<!-- Uncomment below if you prefer to use an image logo -->\n");
      out.write("\t\t\t\t<!-- <a href=\"index.html\"><img src=\"assets/img/logo.png\" alt=\"\" class=\"img-fluid\"></a>-->\n");
      out.write("\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t<nav class=\"nav-menu d-none d-lg-block\">\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li class=\"active\"><a href=\"/index.jsp\">Home</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"/health/health.jsp\">건강정보</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"/honor/honor.jsp\">명예의 전당</a></li>\n");
      out.write("\t\t\t\t\t<li class=\"drop-down\"><a href=\"\">Board</a>\n");
      out.write("\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"/board/board_list.jsp\">소통게시판</a></li>\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"/notice/notice_list.jsp\">공지사항</a></li>\n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</nav>\n");
      out.write("\t\t\t<!-- .nav-menu -->\n");
      out.write("\n");
      out.write("\t\t</div>\n");
      out.write("\t</header>\n");
      out.write("\t<!-- End Header -->\n");
      out.write("\n");
      out.write("\t<main id=\"main\">\n");
      out.write("\t\t<!-- 작성 시작 -->\n");
      out.write("\t\t<div class=\"space-30\"></div>\n");
      out.write("\t\t<div class=\"container tim-container\"\n");
      out.write("\t\t\tstyle=\"width: 70%; align: center; margin-top: 10px;\">\n");
      out.write("\t\t\t<form name=\"BoardModifyForm\" action=\"board_modify_action.jsp?boardid=");
      out.print(boardid);
      out.write("&pg=");
      out.print(pg);
      out.write("\"\n");
      out.write("\t\t\t\tmethod=\"post\" onSubmit=\"return WriteCheck(this);\" enctype=\"multipart/form-data\">\n");
      out.write("\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t<div class=\"col-md-12 col-sm-24\">\n");
      out.write("\t\t\t\t\t\t<div align=\"center\">\n");
      out.write("\t\t\t\t\t\t\t<h1 style=\"font-style: bold;\">수정중</h1>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"row\" style=\"margin-top: 20px;\">\n");
      out.write("\t\t\t\t\t<div class=\"col-md-2 col-sm-4\">\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-default\"\n");
      out.write("\t\t\t\t\t\t\tstyle=\"border: none; color: #1f50ab; font-weight: bold; font-size: 20px;\"\n");
      out.write("\t\t\t\t\t\t\tdisabled=\"disabled\">제목</button>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"col-md-10 col-sm-20\">\n");
      out.write("\t\t\t\t\t\t<input type=text id=\"Board_Title_Modify\" name=\"Board_Title_Modify\" \n");
      out.write("\t\t\t\t\t\t\tclass=\"form-control\" value=\"");
      out.print(boardtitle);
      out.write("\">\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t<div class=\"col-md-2 col-sm-4\">\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-default\"\n");
      out.write("\t\t\t\t\t\t\tstyle=\"border: none; color: #1f50ab; font-weight: bold; font-size: 20px;\"\n");
      out.write("\t\t\t\t\t\t\tdisabled=\"disabled\">내용</button>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"col-md-10 col-sm-20\">\n");
      out.write("\t\t\t\t\t\t<textarea name=\"Board_Content_Modify\" id=\"Board_Content_Modify\"\n");
      out.write("\t\t\t\t\t\t\tcols=\"100\" rows=\"20\" style=\"resize: none; letter-spacing: 1px;\"\n");
      out.write("\t\t\t\t\t\t\tclass=\"form-control\">");
      out.print( boardcontent );
      out.write("</textarea>\t\t\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t<div class=\"row\"></div>\n");
      out.write("\t\t\t\t<div class=\"row\"></div>\n");
      out.write("\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t<div class=\"col-md-2 col-sm-4\">\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-default\"\n");
      out.write("\t\t\t\t\t\t\tstyle=\"border: none; color: #1f50ab; font-weight: bold; font-size: 20px;\"\n");
      out.write("\t\t\t\t\t\t\tdisabled=\"disabled\">사진첨부</button>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t<!-- 여기 시작 -->\n");
      out.write("\t\t\t\t\t<div class=\"panel-group\">\n");
      out.write("\t\t\t\t\t\t<div class=\"panel-heading\">\n");
      out.write("\t\t\t\t\t\t\t\t<h4 class=\"panel-title\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<a data-target=\"#collapseFour\" href=\"#collapseFour\"\n");
      out.write("\t\t\t\t\t\t\t\t\t\tdata-toggle=\"gsdk-collapse\"> </a>\n");
      out.write("\t\t\t\t\t\t\t\t</h4>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"panel-body\" id=\"BoardImgSel\" >\n");
      out.write("\t\t\t\t\t\t\t\t\t");

										String BoardImgSQL = "SELECT * FROM boardimg WHERE board_uid=?";
	
										pstmt = conn.prepareStatement(BoardImgSQL);
										pstmt.setInt(1, boardid);
										
										rs = pstmt.executeQuery();
									while (rs.next()) {
										Integer BoardImg_Id = rs.getInt("boardimg_uid");
										String BoardImg_ChangeName = rs.getString("boardimg_changename");
										String BoardImg_SavePath = rs.getString("boardimg_savepath");
									
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t<!-- <div id=\"circle\"> -->\n");
      out.write("\t\t\t\t\t\t\t\t\t<center><img src=\"\\BoardSavePath\\");
      out.print( BoardImg_ChangeName );
      out.write("\" style=\"width:50%; height:auto;\"/></center> <hr>\n");
      out.write("\t\t\t\t\t\t\t\t\t<!-- <input type=button id=\"BoardImgDelBtn\" value='X' onclick='BoardImgModify_removerow_DB(this)' style='align:right; font-weight:bold; font-size:10px; height:30px' class='btn btn-primary btn-fill' /> <br><br><hr>\n");
      out.write("\t\t\t\t\t\t\t\t\t -->\t\n");
      out.write("\t\t\t\t\t\t\t\t\t");

										} //BoardImg 닫는부분
									
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"space-30\"></div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t<!-- 여기 끝 -->\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t<div class=\"col-md-10 col-sm-20\">\n");
      out.write("\t\t\t\t\t\t<div id=\"BoardImgModifydiv\" style=\"align:center;\"></div>\n");
      out.write("\t\t\t\t\t\t<input type=\"button\" value=\"파일 추가하기\" onclick=\"BoardImgModify_AddItem()\"\n");
      out.write("\t\t\t\t\t\t\tclass=\"btn btn-primary btn-round\">\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t<div class=\"col-md-12 col-sm-24\">\n");
      out.write("\t\t\t\t\t\t<hr>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"row\"></div>\n");
      out.write("\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t<div class=\"col-md-12 col-sm-24\" style=\"text-align: center;\">\n");
      out.write("\t\t\t\t\t\t<input type=\"submit\" value=\"수정완료\" class=\"btn btn-success\" />\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"row\"></div>\n");
      out.write("\t\t\t\t<div class=\"row\"></div>\n");
      out.write("\t\t\t</form>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t\t<!-- 작성 끝 -->\n");
      out.write("\t</main>\n");
      out.write("\t<!-- End #main -->\n");
      out.write("\n");
      out.write("\t<!-- ======= Footer ======= -->\n");
      out.write("\t<footer id=\"footer\">\n");
      out.write("\t\t<div class=\"footer-top\">\n");
      out.write("\t\t\t<div class=\"container\">\n");
      out.write("\t\t\t\t<div class=\"row\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t<div class=\"col-lg-6 col-md-6\">\n");
      out.write("\t\t\t\t\t\t<div class=\"footer-info\">\n");
      out.write("\t\t\t\t\t\t\t<h3>EasyET</h3>\n");
      out.write("\t\t\t\t\t\t\t<p>\n");
      out.write("\t\t\t\t\t\t\t\t경기도 부천시 경인로 590 <br> <strong>Phone:</strong> +82\n");
      out.write("\t\t\t\t\t\t\t\t02-2610-0600<br> <strong>Email:</strong> chk4814@naver.com<br>\n");
      out.write("\t\t\t\t\t\t\t</p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t<div class=\"col-lg-6 col-md-6 footer-links\">\n");
      out.write("\t\t\t\t\t\t<h4>사이트맵</h4>\n");
      out.write("\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"/index.jsp\">Home</a>&nbsp;&nbsp; <a\n");
      out.write("\t\t\t\t\t\t\t\thref=\"/health/health.jsp\">건강정보</a>&nbsp;&nbsp; <a\n");
      out.write("\t\t\t\t\t\t\t\thref=\"/honor/honor.jsp\">명예의 전당</a>&nbsp;&nbsp; <a\n");
      out.write("\t\t\t\t\t\t\t\thref=\"/board/board_list.jsp\">소통게시판</a>&nbsp;&nbsp; <a\n");
      out.write("\t\t\t\t\t\t\t\thref=\"/notice/notice_list.jsp\">공지사항</a>&nbsp;&nbsp;</li>\n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<div class=\"copyright\">\n");
      out.write("\t\t\t\t&copy; Copyright <strong><span>MyBiz</span></strong>. All Rights\n");
      out.write("\t\t\t\tReserved\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"credits\">\n");
      out.write("\t\t\t\t<!-- All the links in the footer should remain intact. -->\n");
      out.write("\t\t\t\t<!-- You can delete the links only if you purchased the pro version. -->\n");
      out.write("\t\t\t\t<!-- Licensing information: https://bootstrapmade.com/license/ -->\n");
      out.write("\t\t\t\t<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/ -->\n");
      out.write("\t\t\t\tDesigned by <a href=\"https://bootstrapmade.com/\">BootstrapMade</a>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</footer>\n");
      out.write("\t<!-- End Footer -->\n");
      out.write("\n");
      out.write("\t<a href=\"#\" class=\"back-to-top\"><i class=\"icofont-simple-up\"></i></a>\n");
      out.write("\n");
      out.write("\t<!-- Vendor JS Files -->\n");
      out.write("\t<script src=\"/assets/vendor/jquery/jquery.min.js\"></script>\n");
      out.write("\t<script src=\"/assets/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\t<script src=\"/assets/vendor/jquery.easing/jquery.easing.min.js\"></script>\n");
      out.write("\t<script src=\"/assets/vendor/php-email-form/validate.js\"></script>\n");
      out.write("\t<script src=\"/assets/vendor/jquery-sticky/jquery.sticky.js\"></script>\n");
      out.write("\t<script src=\"/assets/vendor/waypoints/jquery.waypoints.min.js\"></script>\n");
      out.write("\t<script src=\"/assets/vendor/counterup/counterup.min.js\"></script>\n");
      out.write("\t<script src=\"/assets/vendor/isotope-layout/isotope.pkgd.min.js\"></script>\n");
      out.write("\t<script src=\"/assets/vendor/venobox/venobox.min.js\"></script>\n");
      out.write("\t<script src=\"/assets/vendor/owl.carousel/owl.carousel.min.js\"></script>\n");
      out.write("\n");
      out.write("\t<!-- Template Main JS File -->\n");
      out.write("\t<script src=\"/assets/js/main.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
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