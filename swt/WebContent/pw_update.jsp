<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<style type="text/css">
		* { 
			box-sizing: border-box; 
			font-family: 'Noto Serif KR', serif;
		}
		body, h1, ul, p, h3 {
			margin: 0;
			padding: 0;
		}
		body { background-color: #f5f6f7; }
		ul {list-style: none;}
		a { text-decoration: none; color: white; }
		input {
			outline: none;
		}
		select {
			outline: none;
		}
		button {
			outline: none;
		}
		section {
			background-color: #f5f6f7;
		}
		footer {
			background-color: #f5f6f7;
		}

		
		.swt_log { font-size: 2em; }
		.header, .container, .footer {
			width: 768px;
			margin: auto;
		}
		.header {
			background: white;
			padding-top: 62px;
			position: relative;
			
		}
		.container {
			margin: 0 auto;
			max-width: 768px;
			min-width: 460px;
			height: 550px;
			background: white;
		}
		.footer {
			height: 81px;
			text-align: center;
			padding: 0px 0px 15px;
			background: white;
			margin-top: -20px;
		}
		.n_logo {
			display: block;
			width: 240px;
			height: 44px;
			background: url('img/pc_sp_join.png') 0 -106px;
			margin: auto;
		}
		/* 회원정보 */
		.join_content {
			width: 460px;
			margin: 0 auto;
		}
		.row_group {
			overflow: hidden;
			width: 100%;
		}
		.join_title {
			margin: 19px 0 8px;
			padding-left: 5px;
			font-size: 16px;
			font-weight: 700;
			color: black;
		}
		.ps_box {
			display: block;
			position: relative;
			width: 100%;
			height: 51px;
			/* border-bottom: 1px solid #dadada; */
			border: none;
			padding: 10px 14px;
			/*background: #fff;*/
			vertical-align: top;
		}
		.int_id {
			/* padding-right: 110px; */
		}
		.int {
			display: block;
			position: relative;
			width: 95%; /* 자기가 가질수있는 영역의 처음부터 끝까지 100%. 얘의 영역을 알려면 얘의 부모를 봐야함.  */
			height: 29px;
			/* padding-right: 25px; */
			line-height: 29px;
			/* border-bottom: 1px solid #dadada; */
			border: none;
			border-bottom: 1px solid #dadada;;
			background: transparent;
			font-size: 16.5px;
			z-index: 10;
		}
		
		.step_url {
			position: absolute;
			top: 16px;
			right: 13px;
			font-size: 13px;
			line-height: 18px;
			color: #8e8e8e;
			padding-right: 30px;
		}
		
		.int_pass {
			padding-right: 40px;
		}
		
		
		.sel {
			/* background: #fff url('img/sel_arr.gif') 100% 50% no-repeat; */
			background: transparent;
			/* width: 100%; */
			height: 29px;
			font-size: 15px;
			line-height: 18px;
			color: #000;
			border: none;
			-webkit-appearance: none;
			position: relative;
		}

		/* 버튼 */
		.btn_double_area {
			margin: 30px -5px 0px;
			overflow: hidden;
			position: relative;
			padding-left: 130px;
		}
		.btn_double_area > span {
			display: block;
			width: 100%;
		}
		.btn_type {
			width: 215px;
			margin: 0 5px;
			font-size: 20px;
			font-weight: 600;
			line-height: 61px;
			display: inline-block;
			height: 61px;
			padding-top: 1px;
			text-align: center;
			color: #fff;
			border: 1px solid #816288;
			background-color: #816288;
		

		}
		.btn_type:hover {
			color: white;
		}
		#btn_cancel {
			background-color: #696D98;
			border: 1px solid #696D98;
		}
		.footer_wrap > ul {
			list-style: none;
			margin: 0 auto 9px;
		}
		.footer_wrap * {
			font-size: 12px;
			line-height: normal;
			color: #333;
		}
		.footer_wrap > ul > li {
			display: inline;
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		.footer_wrap > ul > li a:hover {
			color: #816288;
		}
		.footer_wrap > ul > li:first-child {
			border-left: 0px;
		}
		.addr_logo {
			width: 18px;
			height: 18px;
		}
		.address {
			margin: 0px auto;
			text-align: center;
		}
		.address * {
			/* font: 9px verdana; */

			font-family: 'Noto Serif KR', serif;
			font-size: 12px;
		}
		.address a {
			font-weight: bold;
		}
		.address a:hover {
			color: #816288;
		}
		.s_logo > img {
			padding-left: 170px;
			padding-right: 220px;
			margin-bottom: 60px;
			height: 147px;
		}
		
		#star {
			color: #b30000;
		}
		.pres_pw {
			width: 100%;
			border: 3px double #eee;
		}
		
		
	
</style>
</head>
<body>
<header>
		<div class="header">
			<h1 class="swt_logo">
				<a href="#" class="s_logo">
					<img alt="로고 이미지 "src="images/mylogo_6.png">
				</a>
			</h1>
		</div>
	</header>

	<section>
		<form class="join_form" id="join_frm" method="POST" action="memberPlay.swt">
			<div class="container">
				<div class="join_content">
					<div class="row_group">
						<div class="join_row">
							<div class="pres_pw">
								<h3 class="join_title">
									<i class="fas fa-asterisk" id="star"></i>
									<label for="pw_now">현재 비밀번호</label>
								</h3>
								<span class="ps_box int_pass">
									<input type="password" id="pw_now" name="pw_now" class="int" maxlength="20">
									<span class="step_url"></span>
								</span>
								<span class="error_next_box">필수정보입니다.</span>
							</div>
							
							<h3 class="join_title">
								<i class="fas fa-asterisk" id="star"></i>
								<label for="pswd1">새 비밀번호</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" id="pswd1" name="pswd1" class="int" maxlength="20">
								<span class="step_url"></span>
							</span>
							<span class="error_next_box">필수정보입니다.</span>

							<h3 class="join_title">
								<i class="fas fa-asterisk" id="star"></i>
								<label for="pswd2">새 비밀번호 재확인</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" id="pswd2" name="pswd2" class="int" maxlength="20">
								<span class="step_url"></span>
							</span>
							<span class="error_next_box">필수정보입니다.</span>

						</div>
						
					</div>
				</div>
					<div class="btn_double_area">
						<span>
							<a href="#" class="btn_type" id="btn_cancel">취소</a>
							<a href="#" class="btn_type">저장하기</a>	
						</span>
					</div>
					
				</div>
			</div>
		</form>
	</section>

	<footer>
		<div class="footer">
			<div class="footer_wrap">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
				
				<div class="address">
					<span>
						<a href="index.html">
							<img class="addr_logo" alt="S.W.T 로고" src="images/logoswt_trans.png">
						</a>
					</span>
					<span>Copyright</span>
					<span>ⓒ</span>
					<span>
						<strong><a href="#">S.W.T Corp.</a></strong>
					</span>
					<span>All Rights Reserved.</span>
				</div>

			</div>
		</div>
	</footer>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/validation.js"></script> 
	<script type="text/javascript">
	$(document).ready(function(){
			$('.btn_type').click(function(){
				$('#join_frm').submit();
			});
		
			// Ajax를 활용하여 입력한 비밀번호와 현재 유저의 비밀번호가 일치하는지 확인
			$("#pw_now").blur(function(){
				var nowPw = $("#pw_now").val(); // 입력한 비밀번호 
				var nowId = "${sessionScope.loginUser.id}";
				if(nowPw != null || nowPw.length != 0) {
					$.ajax({
						url: 'pwCheck.swt',
						type: 'POST',
						dataType: 'json',
						data: 'id='+nowId+'&pw='+nowPw,
						success: function(data) {
							
						},
						error: function(){
							alert("System Error!!!");
						}
					});
				}
			});
			
			$("#pswd1").blur(function(){
				var memPw = $.trim($("#pswd1").val());
				var memRpw = $.trim($("#pswd2").val());
				var checkResult  = joinValidate.checkPw(memPw,memRpw); // code, desc를 가져와서 변수에 담음 
				
				if(checkResult.code != 0) { //실패했을때
					$(this).next().text(checkResult.desc).css('display','block').css('color','#b30000');
					return false;
				} else { // code = 0일때. 즉, 성공했을때 success
					$(this).next().text(checkResult.desc).css('display','block').css('color','dodgerblue');
					return true;
				}
				return false;
			});
			
			$("#pswd2").blur(function(){
				var pw = $.trim($("#pswd1").val());
				var rpw = $.trim($(this).val());
				var regEmpty = /\s/g; // 공백 문자
				var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 비밀번호 체크
				
				
				if(rpw == ""||rpw.length==0){
					$(this).next().text("필수입력 정보입니다").css("display","block").css("color","#b30000");
					return false;
				} else if(rpw.match(regEmpty)) {
					$(this).next().text("공백없이 입력해주세요").css("display","block").css("color","#b30000");
					return false;
				} else if(!pwReg.test(pw)) {
					$(this).next().text("올바른 비밀번호(4~12자)를 입력해주세요").css("display","block").css("color","#b30000");
					return false;
				} else if(pw != rpw){
					$(this).next().text("입력하신 비밀번호와 일치하지 않습니다").css("display","block").css("color","#b30000");
					return false;
				} else {
					$(this).next().text("사용가능한 비밀번호 입니다").css("display","block").css("color","dodgerblue");
					
				}
				
			});
		
		});
	</script>
</body>
</html>