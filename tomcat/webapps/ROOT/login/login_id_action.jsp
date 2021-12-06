<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <!DOCTYPE html>
<html lang="utf-8">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Welcome EasyET</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: MyBiz - v2.1.0
  * Template URL: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <%
   request.setCharacterEncoding("utf-8");
    String user_tel = request.getParameter("user_tel");
   String user_id=null;
   Connection conn = null;
   PreparedStatement pstmt = null;
   String str = "";
   ResultSet rs = null;
   String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
   String dbId = "yhpj";
   String dbPass = "Yuhan2020!";
   Class.forName ("com.mysql.jdbc.Driver"); //driver load
   conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
   String sql = "select user_id from user where user_tel = ?";
   
   String s_Search="아이디를 찾았습니다.";
   String s_id="아이디는 : ";
   boolean b_Search = true;
try{
 
 pstmt = conn.prepareStatement(sql);
 pstmt.setString(1, user_tel);
 rs=pstmt.executeQuery();
 
 while(rs.next()){
 user_id =rs.getString("user_id");
 }
 
 }
 catch(Exception e){
 e.printStackTrace();
 }
 finally{
 if(rs !=null)
   try{rs.close();}catch(SQLException sqle){}
 if(pstmt != null)
   try{pstmt.close();}catch(SQLException sqle){}
 if(conn != null)
   try{conn.close();}catch(SQLException sqle){}
}
if(user_id == null){
  user_id = "일치하는 정보가 없습니다.";
  b_Search = false;
}
if(b_Search == false){
  s_Search = "아이디를 찾지 못하였습니다.";
  s_id="";
}

%>	

</head>
<body>
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="/index.jsp">Easy<span>ET</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="/index.jsp">Home</a></li>
          <li><a href="/health/health.jsp">건강정보</a></li>
          <li><a href="/honor/honor.jsp">명예의 전당</a></li>
          <li class="drop-down"><a href="">Board</a>
              <ul>
                  <li><a href="/board/board_list.jsp">소통 게시판</a></li>
                  <li><a href="/notice/notice_list.jsp">공지사항</a></li>
              </ul>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  <main id="main">
    <br><br>
    <div class="container contact">

   <h5><% out.print(s_Search); %></h5>
   <label><% out.print(s_id);out.print(user_id); %></label><br>
   <table  width="100%" style="border: 0px;"> 
     <tr>

    <% if(b_Search ==false){%>
      <td><div class="text-center"><button type="button" onClick="location.href='/login/login_id.jsp'">다시 입력</button></div</td>
       <% } %>
    
    <%     
    %>
    <td>
      <div class="text-center"><button type="submit" onClick="self.close()">닫기</button></div>
  </td>
  </tr>
  </table>
  </div>
</div>
</main>

<!-- Vendor JS Files -->
<script src="/assets/vendor/jquery/jquery.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>
<script src="/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
<script src="/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="/assets/vendor/counterup/counterup.min.js"></script>
<script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/assets/vendor/venobox/venobox.min.js"></script>
<script src="/assets/vendor/owl.carousel/owl.carousel.min.js"></script>

<!-- Template Main JS File -->
<script src="/assets/js/main.js"></script>
</body>
<style>


  .contact  {
    width: 100%;
    box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);
    padding: 30px;
    background: #fff;
  }
  
  .contact .form-group {
    padding-bottom: 8px;
  }
  
  .contact .validate {
    display: none;
    color: red;
    margin: 0 0 15px 0;
    font-weight: 400;
    font-size: 13px;
  }
  
  .contact .error-message {
    display: none;
    color: #fff;
    background: #ed3c0d;
    text-align: left;
    padding: 15px;
  }
  
  .contact .error-message br + br {
    margin-top: 25px;
  }
  
  .contact .sent-message {
    display: none;
    color: #fff;
    background: #18d26e;
    text-align: center;
    padding: 15px;
    font-weight: 600;
  }
  
  .contact .loading {
    display: none;
    background: #fff;
    text-align: center;
    padding: 15px;
  }
  
  .contact .loading:before {
    content: "";
    display: inline-block;
    border-radius: 50%;
    width: 24px;
    height: 24px;
    margin: 0 10px -6px 0;
    border: 3px solid #18d26e;
    border-top-color: #eee;
    -webkit-animation: animate-loading 1s linear infinite;
    animation: animate-loading 1s linear infinite;
  }
  
  .contact  input, .contact textarea {
    border-radius: 0;
    box-shadow: none;
    font-size: 14px;
  }
  
  .contact input {
    height: 44px;
  }
  
  .contact textarea {
    padding: 10px 12px;
  }
  
  .contact button[type="submit"] {
    background: #01b1d7;
    border: 0;
    padding: 10px 24px;
    color: #fff;
    transition: 0.4s;
    border-radius: 4px;
  }
  .contact button[type="button"] {
    background: #1ad339;
    border: 0;
    padding: 10px 24px;
    color: #fff;
    transition: 0.4s;
    border-radius: 4px;
  }
  
  .contact  button[type="submit"]:hover {
    background: #0dd3fe;
  }
  input{
   border: 1px solid #D5D5D5;
  }
  lable{
      color: #BDBDBD;
      font-size: 10px;
  }
   table {
    border-spacing: 20px;
    border-collapse: separate;
    height: auto; /* 높이 초기화 */ 
    line-height: normal; /* line-height 초기화 */ 
    padding: .8em .5em; /* 여백 설정 */
    border: 1px solid #D5D5D5;
  }
  </style>
</html>