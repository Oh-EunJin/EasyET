/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.50
 * Generated at: 2020-11-09 06:08:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class join_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
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
      out.write("    <!DOCTYPE html>\n");
      out.write("<html lang=\"utf-8\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n");
      out.write("\n");
      out.write("  <title>Welcome EasyET</title>\n");
      out.write("  <meta content=\"\" name=\"descriptison\">\n");
      out.write("  <meta content=\"\" name=\"keywords\">\n");
      out.write("\n");
      out.write("  <!-- Favicons -->\n");
      out.write("  <link href=\"/assets/img/favicon.png\" rel=\"icon\">\n");
      out.write("  <link href=\"/assets/img/apple-touch-icon.png\" rel=\"apple-touch-icon\">\n");
      out.write("\n");
      out.write("  <!-- Google Fonts -->\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- Vendor CSS Files -->\n");
      out.write("  <link href=\"/assets/vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"/assets/vendor/icofont/icofont.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"/assets/vendor/boxicons/css/boxicons.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"/assets/vendor/animate.css/animate.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"/assets/vendor/remixicon/remixicon.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"/assets/vendor/venobox/venobox.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"/assets/vendor/owl.carousel/assets/owl.carousel.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- Template Main CSS File -->\n");
      out.write("  <link href=\"/assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- =======================================================\n");
      out.write("  * Template Name: MyBiz - v2.1.0\n");
      out.write("  * Template URL: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/\n");
      out.write("  * Author: BootstrapMade.com\n");
      out.write("  * License: https://bootstrapmade.com/license/\n");
      out.write("  ======================================================== -->\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("  <!-- ======= Top Bar ======= -->\n");
      out.write("  <section id=\"topbar\" class=\"d-none d-lg-block\">\n");
      out.write("    <div class=\"container d-flex\">\n");
      out.write("      <div class=\"contact-info mr-auto\">\n");
      out.write("        <i class=\"icofont-envelope\"></i><a href=\"mailto:contact@example.com\">chk4814@naver.com</a>\n");
      out.write("        <i class=\"icofont-phone phone-icon\"></i> +82 02-2610-0600\n");
      out.write("      </div>\n");
      out.write("      <div>\n");
      out.write("      ");

      	if(session.getAttribute("ss") == null)
      	{
    	  
      out.write("\n");
      out.write("    \t  \t<a href=\"/login/login_form.jsp\" >LOGIN</a> \n");
      out.write("      \t \t<a href=\"/join/join_form.jsp\" >JOIN</a>\n");
      out.write("    \t  ");

      	}
      	else
      	{
    	  
      out.write("\n");
      out.write("    \t  \t<a href=\"/login/logout_action.jsp\" >LOGOUT</a> \n");
      out.write("      \t \t<a href=\"/mypage/mypage.jsp\" >MYPAGE</a>\n");
      out.write("    \t  ");

      	}
      
      out.write("\n");
      out.write("      \t \n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </section>\n");
      out.write("\n");
      out.write("  <!-- ======= Header ======= -->\n");
      out.write("  <header id=\"header\" class=\"d-flex align-items-center\">\n");
      out.write("    <div class=\"container d-flex align-items-center\">\n");
      out.write("\n");
      out.write("      <div class=\"logo mr-auto\">\n");
      out.write("        <h1 class=\"text-light\"><a href=\"/index.jsp\">Easy<span>ET</span></a></h1>\n");
      out.write("        <!-- Uncomment below if you prefer to use an image logo -->\n");
      out.write("        <!-- <a href=\"index.html\"><img src=\"assets/img/logo.png\" alt=\"\" class=\"img-fluid\"></a>-->\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("      <nav class=\"nav-menu d-none d-lg-block\">\n");
      out.write("        <ul>\n");
      out.write("          <li class=\"active\"><a href=\"/index.jsp\">Home</a></li>\n");
      out.write("          <li><a href=\"/health/health.jsp\">건강정보</a></li>\n");
      out.write("          <li><a href=\"/honor/honor.jsp\">명예의 전당</a></li>\n");
      out.write("          <li class=\"drop-down\"><a href=\"\">Board</a>\n");
      out.write("          \t<ul>\n");
      out.write("          \t\t<li><a href=\"/board/board_list.jsp\">소통 게시판</a></li>\n");
      out.write("          \t\t<li><a href=\"/notice/notice_list.jsp\">공지사항</a></li>\n");
      out.write("          \t</ul>\n");
      out.write("        </ul>\n");
      out.write("      </nav><!-- .nav-menu -->\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("  </header><!-- End Header -->\n");
      out.write("\n");
      out.write("  \n");
      out.write(" <style>\n");
      out.write(".contact  {\n");
      out.write("  width: 100%;\n");
      out.write("  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);\n");
      out.write("  padding: 30px;\n");
      out.write("  background: #fff;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact .form-group {\n");
      out.write("  padding-bottom: 8px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact .validate {\n");
      out.write("  display: none;\n");
      out.write("  color: red;\n");
      out.write("  margin: 0 0 15px 0;\n");
      out.write("  font-weight: 400;\n");
      out.write("  font-size: 13px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact .error-message {\n");
      out.write("  display: none;\n");
      out.write("  color: #fff;\n");
      out.write("  background: #ed3c0d;\n");
      out.write("  text-align: left;\n");
      out.write("  padding: 15px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact .error-message br + br {\n");
      out.write("  margin-top: 25px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact .sent-message {\n");
      out.write("  display: none;\n");
      out.write("  color: #fff;\n");
      out.write("  background: #18d26e;\n");
      out.write("  text-align: center;\n");
      out.write("  padding: 15px;\n");
      out.write("  font-weight: 600;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact .loading {\n");
      out.write("  display: none;\n");
      out.write("  background: #fff;\n");
      out.write("  text-align: center;\n");
      out.write("  padding: 15px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact .loading:before {\n");
      out.write("  content: \"\";\n");
      out.write("  display: inline-block;\n");
      out.write("  border-radius: 50%;\n");
      out.write("  width: 24px;\n");
      out.write("  height: 24px;\n");
      out.write("  margin: 0 10px -6px 0;\n");
      out.write("  border: 3px solid #18d26e;\n");
      out.write("  border-top-color: #eee;\n");
      out.write("  -webkit-animation: animate-loading 1s linear infinite;\n");
      out.write("  animation: animate-loading 1s linear infinite;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact  input, .contact textarea {\n");
      out.write("  border-radius: 0;\n");
      out.write("  box-shadow: none;\n");
      out.write("  font-size: 14px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact input {\n");
      out.write("  height: 44px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact textarea {\n");
      out.write("  padding: 10px 12px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact button[type=\"submit\"] {\n");
      out.write("  background: #01b1d7;\n");
      out.write("  border: 0;\n");
      out.write("  padding: 10px 24px;\n");
      out.write("  color: #fff;\n");
      out.write("  transition: 0.4s;\n");
      out.write("  border-radius: 4px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".contact  button[type=\"submit\"]:hover {\n");
      out.write("  background: #0dd3fe;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("  <main id=\"main\">\n");
      out.write("   <br><br>\n");
      out.write("  회원가입\n");
      out.write("  </main><!-- End #main -->\n");
      out.write("\n");
      out.write("  <!-- ======= Footer ======= -->\n");
      out.write("  <footer id=\"footer\">\n");
      out.write("    <div class=\"footer-top\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("\n");
      out.write("          <div class=\"col-lg-6 col-md-6\">\n");
      out.write("            <div class=\"footer-info\">\n");
      out.write("              <h3>EasyET</h3>\n");
      out.write("              <p>\n");
      out.write("                                    경기도 부천시 경인로 590 <br>\n");
      out.write("                <strong>Phone:</strong> +82 02-2610-0600<br>\n");
      out.write("                <strong>Email:</strong> chk4814@naver.com<br>\n");
      out.write("              </p>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("          <div class=\"col-lg-6 col-md-6 footer-links\">\n");
      out.write("            <h4>사이트맵</h4>\n");
      out.write("            <ul>\n");
      out.write("              <li>\n");
      out.write("              \t<a href=\"/index.jsp\">Home</a>&nbsp&nbsp\n");
      out.write("              \t<a href=\"/health/health.jsp\">건강정보</a>&nbsp&nbsp\n");
      out.write("              \t<a href=\"/honor/honor.jsp\">명예의 전당</a>&nbsp&nbsp\n");
      out.write("              \t<a href=\"/board/board_list.jsp\">소통게시판</a>&nbsp&nbsp\n");
      out.write("              \t<a href=\"/notice/notice_list.jsp\">공지사항</a>&nbsp&nbsp\n");
      out.write("              </li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("      <div class=\"copyright\">\n");
      out.write("        &copy; Copyright <strong><span>MyBiz</span></strong>. All Rights Reserved\n");
      out.write("      </div>\n");
      out.write("      <div class=\"credits\">\n");
      out.write("        <!-- All the links in the footer should remain intact. -->\n");
      out.write("        <!-- You can delete the links only if you purchased the pro version. -->\n");
      out.write("        <!-- Licensing information: https://bootstrapmade.com/license/ -->\n");
      out.write("        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/ -->\n");
      out.write("        Designed by <a href=\"https://bootstrapmade.com/\">BootstrapMade</a>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </footer><!-- End Footer -->\n");
      out.write("\n");
      out.write("  <a href=\"#\" class=\"back-to-top\"><i class=\"icofont-simple-up\"></i></a>\n");
      out.write("\n");
      out.write("  <!-- Vendor JS Files -->\n");
      out.write("  <script src=\"/assets/vendor/jquery/jquery.min.js\"></script>\n");
      out.write("  <script src=\"/assets/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("  <script src=\"/assets/vendor/jquery.easing/jquery.easing.min.js\"></script>\n");
      out.write("  <script src=\"/assets/vendor/php-email-form/validate.js\"></script>\n");
      out.write("  <script src=\"/assets/vendor/jquery-sticky/jquery.sticky.js\"></script>\n");
      out.write("  <script src=\"/assets/vendor/waypoints/jquery.waypoints.min.js\"></script>\n");
      out.write("  <script src=\"/assets/vendor/counterup/counterup.min.js\"></script>\n");
      out.write("  <script src=\"/assets/vendor/isotope-layout/isotope.pkgd.min.js\"></script>\n");
      out.write("  <script src=\"/assets/vendor/venobox/venobox.min.js\"></script>\n");
      out.write("  <script src=\"/assets/vendor/owl.carousel/owl.carousel.min.js\"></script>\n");
      out.write("\n");
      out.write("  <!-- Template Main JS File -->\n");
      out.write("  <script src=\"/assets/js/main.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
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
