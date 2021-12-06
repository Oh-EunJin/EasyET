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

<script >

function jumpMenu(frm){
	location.href=frm.jump.options[frm.jump.selectedIndex].value;
	frm.jump.selectedIndex.selected;
}

function input_Text(){
	var totalbodywater = document.getElementById('totalbodywater').value;
	var protein = document.getElementById('protein').value;
	var mineral = document.getElementById('mineral').value;
	var bodyfat = document.getElementById('bodyfat').value;
	var weight = document.getElementById('weight').value;
	weight.value = Number(totalbodywater.value) + Number(protein.value) + Number(mineral.value) + Number(bodyfat.value);
}

function Chking() {
    var f = eval("document.inbody_form");
    if(f.totalbodywater.value && f.protein.value && f.mineral.value && f.bodyfat.value) {
        f.weight.value = (parseFloat(f.totalbodywater.value) + parseFloat(f.protein.value) + parseFloat(f.mineral.value) + parseFloat(f.bodyfat.value)).toFixed(2);
    } else {
        return false;
    }
}



function inbodyCheck() {
    var inbody = document.inbody_form;
    
    var regex = /^[0-9]*$/;
    var regex_integer = /^[0-9]*[.][0-9]*$/
    
 
    
    if(inbody['height'].value != "")
    {
    	if(regex.test(inbody['height'].value) == true || regex_integer.test(inbody['height'].value) == true)
    	{
    		if(inbody['age'].value != "")
    		{
    			if(regex.test(inbody['age'].value) == true)
    			{
    				if(inbody['totalbodywater'].value != "")
    				{
    					if(regex.test(inbody['totalbodywater'].value) == true || regex_integer.test(inbody['totalbodywater'].value) == true)
    					{
    						if(inbody['protein'].value != "")
    						{
    							if(regex.test(inbody['protein'].value) == true || regex_integer.test(inbody['protein'].value) == true)
    							{
    								if(inbody['mineral'].value != "")
    								{
    									if(regex.test(inbody['mineral'].value) == true || regex_integer.test(inbody['mineral'].value) == true)
    									{
    										if(inbody['bodyfat'].value != "")
    										{
    											if(regex.test(inbody['bodyfat'].value) == true || regex_integer.test(inbody['bodyfat'].value) == true)
    											{
    												if(inbody['weight'].value != "")
    												{
    													if(regex.test(inbody['weight'].value) == true || regex_integer.test(inbody['weight'].value) == true)
    													{
    														if(inbody['skeletal_muscle_mass'].value != "")
    	    												{
    															if(regex.test(inbody['skeletal_muscle_mass'].value) == true || regex_integer.test(inbody['skeletal_muscle_mass'].value) == true)
    															{
    																return true;
    															}
    															else
    															{
    																alert("골격근량은 정수나 소수만 가능합니다.");
        	    	    	    	    	    	    	    	inbody['skeletal_muscle_mass'].focus();
        	    	    	    	    	    	    		    return false;
    															}
    	    												}
    														else
    														{
    															alert("골격근량을 입력해주세요. 골격근량은 정수나 소수만 가능합니다.");
    	    	    	    	    	    	    	    	inbody['skeletal_muscle_mass'].focus();
    	    	    	    	    	    	    		    return false;
    														}
    													}
    													else
    													{
    														alert("체중은 정수나 소수만 가능합니다.");
        	    	    	    	    	    	    	inbody['weight'].focus();
        	    	    	    	    	    		    return false;
    													}
    												}
    												else
    												{
    													alert("체중을 입력해주세요. 체중은 정수나 소수만 가능합니다.");
    	    	    	    	    	    	    	inbody['weight'].focus();
    	    	    	    	    	    		    return false;
    												}
    											}
    											else
    											{
    												alert("체지방량은 정수나 소수만 가능합니다.");
        	    	    	    	    	    	inbody['bodyfat'].focus();
        	    	    	    	    		    return false;
    											}
    										}
    										else
    										{
    											alert("체지방량을 입력해주세요. 체지방량은 정수나 소수만 가능합니다.");
    	    	    	    	    	    	inbody['bodyfat'].focus();
    	    	    	    	    		    return false;
    										}
    									}
    									else
    									{
    										alert("무기질은 정수나 소수만 가능합니다.");
        	    	    	    	    	inbody['mineral'].focus();
        	    	    	    		    return false;
    									}
    								}
    								else
    								{
    									alert("무기질을 입력해주세요. 무기질은 정수나 소수만 가능합니다.");
    	    	    	    	    	inbody['mineral'].focus();
    	    	    	    		    return false;
    								}
    							}
    							else
    							{
    								alert("단백질은 정수나 소수만 가능합니다.");
        	    	    	    	inbody['protein'].focus();
        	    	    		    return false;
    							}
    						}
    						else
    						{
    							alert("단백질을 입력해주세요. 단백질은 정수나 소수만 가능합니다.");
    	    	    	    	inbody['protein'].focus();
    	    	    		    return false;
    						}
    					}
    					else
    					{
    						alert("체수분은 정수나 소수만 가능합니다.");
        	    	    	inbody['totalbodywater'].focus();
        	    		    return false;
    					}
    				}
    				else
    				{
    					alert("체수분을 입력해주세요. 체수분은 정수나 소수만 가능합니다.");
    	    	    	inbody['totalbodywater'].focus();
    	    		    return false;
    				}
    			}
    			else
    			{
    				alert("나이는 정수만 가능합니다.");
        	    	inbody['age'].focus();
        		    return false;
    			}
    		}
    		else
    		{
    			alert("나이를 입력해주세요. 나이는 정수만 가능합니다.");
    	    	inbody['age'].focus();
    		    return false;
    		}
    	}
    	else
    	{
    		alert("키는 정수나 소수만 가능합니다.");
    		inbody['height'].focus();
    	    return false;
    	}
    }
    else
    {
    	alert("키를 입력해주세요. 키는 정수나 소수만 가능합니다.");
    	inbody['height'].focus();
	    return false;
    }
}
</script>

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
  
<script >
function jumpMenu(frm){
	location.href=frm.jump.options[frm.jump.selectedIndex].value;
	frm.jump.selectedIndex.selected;
}
</script>
  
  <%
  	//session.setAttribute("ss","test@naver.com");
	String ss = session.getAttribute("ss").toString();
	String myid = null;
	String myname = null;
	
	String date = request.getParameter("date");
	//int member_uid = Integer.parseInt(request.getParameter("uid"));
	//String updateIdentify_1 = ss.replaceAll("@", "");
	//String updateIdentify_2 = updateIdentify_1.replace(".", "");
	//String table_name = updateIdentify_2 + "_member_inbody";
	
	
	//이건 인바디변수
	int inbody_uid = 0;
	String name = null;
	int sex = 0;
	int age = 0;
	Timestamp check_date = new Timestamp(System.currentTimeMillis());
	float totalbodywater = 0;
	float protein = 0;
	float mineral = 0; 
	float bodyfat = 0;
	float height = 0;
	float weight = 0;
	float skeletal_muscle_mass = 0; 
	float bmi = 0; 
	float percentbodyfat = 0; 
	int leftarm_muscle = 0; 
	int rightarm_muscle = 0; 
	int leftleg_muscle = 0; 
	int rightleg_muscle = 0; 
	int center_muscle = 0;
	int leftarm_fat = 0;
	int leftleg_fat = 0;
	int rightarm_fat = 0;
	int rightleg_fat = 0;
	int center_fat = 0;
	
	Timestamp today = new Timestamp(System.currentTimeMillis());
	Timestamp getdatefromboard = new Timestamp(System.currentTimeMillis());
	getdatefromboard = Timestamp.valueOf("1900-01-01 00:00:00.0");
	java.text.SimpleDateFormat today_date_format = new java.text.SimpleDateFormat("yyyy-MM-dd");
%>
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
</style>
  

  <main id="main">
  <br><br>
  	<div class="container contact">
  	<form name="inbody_form" method="post" action="/health/health_action.jsp" onsubmit="return inbodyCheck();">
  		<div class="row content">
  			<div class="col-lg-6"><h2>InBody 작성하기</h2></div></div><br><br>
  				
                   <table class="table table-hover table-striped" style="width: 100%">
                    	<tr>
                    		<td>아이디<br><input type="text" id="inbody_uid" name="inbody_uid" class="form-control input-shadow" value="<%=ss %>" readonly="readonly"></td>
                    		<td>신장(cm)<br><input type="text" id="height" name="height" class="form-control input-shadow" placeholder="cm"></td>
                    		<td>연령<br><input type="text" id="age" name="age" class="form-control input-shadow"></td>
                    		<td>성별<br>
                    			<select name="sex" class="form-control input-shadow">
            						<option value="1" >남성</option>
            						<option value="2" >여성</option>
            					</select>
                    		</td>
                    		<td>검사일시<br><input type="text" id="check_date" name="check_date" class="form-control input-shadow" value="<%=check_date %>" readonly="readonly"></td>
                    	</tr>
                    </table><hr><br>
                    <h4>체성분분석</h4>
                    <table class="table table-hover table-striped">
                    	<tr>
                    		<td>체수분(L)</td><td><input type="text" id="totalbodywater" name="totalbodywater" class="form-control input-shadow" onKeyPress="Chking();" onKeyUp="Chking();"></td>
                    	</tr>
                    	<tr>
                    		<td>단백질(kg)</td><td><input type="text" id="protein" name="protein" class="form-control input-shadow" onKeyPress="Chking();" onKeyUp="Chking();"></td>
                    	</tr>
                    	<tr>
                    		<td>무기질(kg)</td><td><input type="text" id="mineral" name="mineral" class="form-control input-shadow" onKeyPress="Chking();" onKeyUp="Chking();"></td>
                    	</tr>
                    	<tr>
                    		<td>체지방량(kg)</td><td><input type="text" id="bodyfat" name="bodyfat" class="form-control input-shadow" onKeyPress="Chking();" onKeyUp="Chking();"></td>
                    	</tr>
                    	
                    </table><hr><br>
                    <h4>골격근 지방 분석</h4>
                    <table class="table table-hover table-striped">
                    	<tr>
                    		<td></td><td>측정치</td>
                    	</tr>
                    	<tr>
                    		<td>체중(kg)</td><td><input type="text" id="weight" name="weight" class="form-control input-shadow" onclick="input_Text();"></td>
                    	</tr>
                    	<tr>
                    		<td>골격근량(kg)</td><td><input type="text" id="skeletal_muscle_mass" name="skeletal_muscle_mass" class="form-control input-shadow"></td>
                    	</tr>
                    </table><hr><br>
                    <h4>부위별 분석</h4>
                    <table class="table table-hover table-striped">
                    	<tr>
                    		<td colspan="2" align="center">부위별근육분석</td>
                    		<td colspan="2" align="center">부위별체지방분석</td>
                    	</tr>
                    	<tr>
                    		<td>왼팔근육
                    			<select name="leftarm_muscle" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    		<td align="right">오른팔근육
                    			<select name="rightarm_muscle" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    		<td>왼팔지방
                    			<select name="leftarm_fat" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    		<td align="right">오른팔지방
                    			<select name="rightarm_fat" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td colspan="2" align="center">복부근육
                    			<select name="center_muscle" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    		<td colspan="2" align="center">복부지방
                    			<select name="center_fat" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>왼다리근육
                    			<select name="leftleg_muscle" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    		<td align="right">오른다리근육
                    			<select name="rightleg_muscle" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    		<td>왼다리지방
                    			<select name="leftleg_fat" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    		<td align="right">오른다리지방
                    			<select name="rightleg_fat" class="form-control input-shadow">
            						<option value="0">평균이하</option>
            						<option value="1">평균</option>
            						<option value="2">평균이상</option>
            					</select>
                    		</td>
                    	</tr>
                    </table>
                   
                        	
                    <hr>
                    
                    <div class="text-center"><button type="submit">작성완료</button></div>
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

</html>