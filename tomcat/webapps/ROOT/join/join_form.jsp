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
</head>

<body>
  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-none d-lg-block">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-envelope"></i><a href="mailto:contact@example.com">chk4814@naver.com</a>
        <i class="icofont-phone phone-icon"></i> +82 02-2610-0600
      </div>
      <div>
      <%
      	if(session.getAttribute("ss") == null)
      	{
    	  %>
    	  	<a href="/login/login_form.jsp" >LOGIN</a> 
      	 	<a href="/join/join_form.jsp" >JOIN</a>
    	  <%
      	}
      	else
      	{
    	  %>
    	  	<a href="/login/logout_action.jsp" >LOGOUT</a> 
      	 	<a href="/mypage/mypage.jsp" >MYPAGE</a>
    	  <%
      	}
      %>
      </div>
    </div>
  </section>
  <!-- ======= Header ======= -->
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




  
  <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  
  <script>
function idCheck(){
	var form1 = document.joinform;
	var regex_tel = /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;
    var regex_email = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
	
	if(!form1.id.value){
		alert("아이디를 적어주세요");
		form1.id.focus();
		return false;
	}
	if(!regex_email.test(form1['id'].value))
	{
		alert("아이디를 이메일형식(example@naver.com)으로 적어주세요");
		form1.id.focus();
		return false;
	}
	
	var user_id = form1.id.value;
	var url = "/join/idcheck.jsp?id=" + user_id;
	window.open(url, "IdCheck", "toolbar=no, location=no, status=no, menubar=no, scrollbar=no, resizable=no, width=600, height=180");
	return;
}

function check_id() {
	var check = document.joinform;
	
	var regex_tel = /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;
	var regex_pw = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

	
	if(check['join_name'].value == "사용가능한 아이디 입니다.")
	{   
		if(check['user_pw'].value != "")
		{
			if(regex_pw.test(check['user_pw'].value) == true)
			{
				if(check['user_pw'].value == check['user_pw_ck'].value)
				{
					if(check['user_name'].value != "")
					{
						if(check['user_tel'].value != "")
						{
							if(regex_tel.test(check['user_tel'].value) == true)
							{
								if(check['user_address'].value != "")
								{
									if(check['user_promise'].value != "")
									{
										return true;
									}
									else
									{
										alert("나의 다짐을입력해주세요.");
								    	check['user_promise'].focus();
									    return false;
									}
								}
								else
								{
									alert("거주지를 입력해주세요.");
							    	check['user_address'].focus();
								    return false;
								}
							}
							else
							{
								alert("휴대폰 번호를 정확히 입력해주세요(000-0000-0000)");
						    	check['user_tel'].focus();
							    return false;
							}
						}
						else
						{
							alert("휴대폰 번호를 입력해주세요(000-0000-0000)");
					    	check['user_tel'].focus();
						    return false;
						}
					}
					else
					{
						alert("이름을 입력해주세요.");
				    	check['user_name'].focus();
					    return false;
					}
				}
				else
				{
					alert("비밀번호가 일치하지 않습니다.");
					check['user_pw'].value = "";
					check['user_pw_ck'].value = "";
			    	check['user_pw'].focus();
				    return false;
				}
			}
			else
			{
				alert("비밀번호를 정확히 입력해주세요(8~20자의 영문,숫자,특수문자 조합입니다.)");
		    	check['user_pw'].focus();
			    return false;
			}
		}
		else
		{
			alert("비밀번호를 입력해주세요(8~20자의 영문,숫자,특수문자 조합입니다.)");
	    	check['user_pw'].focus();
		    return false;
		}
	}
	else
	{
		alert("ID 중복체크를 확인해주세요");
    	check['id'].focus();
	    return false;
	}
	
}
</script>

 


  <main id="main">
   <br><div id="out"></div><br>
   <div class="container contact" align="center">
   <div class="col-lg-6"><h2>회원가입</h2></div>
 기본 정보 입력
 <hr>
 <form name="joinform" method="post" onsubmit="return check_id();" action="/join/join_action.jsp" >
 <table style="border: 0px;">
 <tr>
 <td>아이디 입력</td><td><input type="email" name="id" size="70" placeholder="아이디를 입력해 주세요." class="form-control input-shadow" style="width: 88.4%; display:inline; "><input type="button" onclick="idCheck()" value="중복확인"><br>
 <input type="text" name="join_name" readonly="readonly" style="border: 0px; background-color: white; width:210px; height: 33px;" class="form-control input-shadow">
 </td>
 </tr>
 <tr>
 <td>비밀번호 입력</td><td><input type="password" name="user_pw" size="70" placeholder="비밀번호를 입력해 주세요." class="form-control input-shadow"></td>
 </tr>
  <tr>
 <td></td><td><input type="password" name="user_pw_ck" size="70" placeholder="비밀번호를 재확인해 주세요." class="form-control input-shadow"></td>
 </tr>
  <tr>
 <td></td><td><lable>8~20자의 영문,숫자,특수문자 조합입니다.</lable></td>
 </tr>
 <tr>
  <td>이 름</td><td><input type="text" name="user_name" size="70" placeholder="이름을 입력해 주세요." maxlength="13" class="form-control input-shadow"></td>
  </tr>
  <tr>
   <td>휴대폰 번호</td><td><input type="text" name="user_tel" size="70" placeholder="000-0000-0000" maxlength="13" class="form-control input-shadow"></td>
  </tr>
  <tr>
    <td>거주지</td><td><input type="text" name="user_address" size="70" placeholder="거주지를 입력해 주세요." class="form-control input-shadow"></td>
  </tr>
  <tr>
  <td>나의 다짐</td><td><input type="text" name="user_promise" size="70" placeholder="나의 다짐입력" maxlength="50" class="form-control input-shadow"></td>
  </tr>
      <tr>
 <td></td><td><lable>ID/PW 분실 시 가입정보를 통해 찾을 수 있으므로 정확히 입력해 주시기 바랍니다.</lable></td>
 </tr>
  </tr>
  <tr>
  </tr>
  <tr>
  <td></td>
  <td><div class="text-right"><button type="submit">가입완료</button></div></td>
  </tr>
  </table>
  
  </form>
  
  </div>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-6 col-md-6">
            <div class="footer-info">
              <h3>EasyET</h3>
              <p>
                                    경기도 부천시 경인로 590 <br>
                <strong>Phone:</strong> +82 02-2610-0600<br>
                <strong>Email:</strong> chk4814@naver.com<br>
              </p>
            </div>
          </div>

          <div class="col-lg-6 col-md-6 footer-links">
            <h4>사이트맵</h4>
            <ul>
              <li>
              	<a href="/index.jsp">Home</a>&nbsp&nbsp
              	<a href="/health/health.jsp">건강정보</a>&nbsp&nbsp
              	<a href="/honor/honor.jsp">명예의 전당</a>&nbsp&nbsp
              	<a href="/board/board_list.jsp">소통게시판</a>&nbsp&nbsp
              	<a href="/notice/notice_list.jsp">공지사항</a>&nbsp&nbsp
              </li>
            </ul>
          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>MyBiz</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

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