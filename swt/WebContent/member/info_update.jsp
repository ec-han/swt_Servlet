<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
			height: 900px;
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
		#id {
			width: 95%;
			cursor: not-allowed;
		
		}
		#yy, #mm, #dd {
			cursor: not-allowed;
			
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
		.step_addr {
			
		}
		#step_mail {
			/* display: none; */
			font-size: 13px;
			line-height: 18px;
			color: #8e8e8e;
		} 
		
		/* .error_next_box { /* 유효성 체크  */
			display: none; /* 나중에 block으로 바꿔야 함  */
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
			padding-left: 12px;
		} */
		.int_pass {
			padding-right: 40px;
		}
		.bir_wrap {
			display: table;
			width: 100%;
		}
		.bir_dd, .bir_mm, .bir_yy {
			display: table-cell;
			table-layout: fixed;
			width: 147px;
			vertical-align: middle;
		}
		.bir_mm+.bir_dd, .bir_yy+.bir_mm {
			padding-left: 10px;
		}
		/* .bir_mm {
			width: 30%;
		} */
		.join_birthday .ps_box {
			padding: 11px 14px;
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
		#wrap_email {
			
			padding: 5px;
		}
		#wrap_email > * {
			float: left;
			margin-right: 10px;
			padding-top: 10px;
			display: flex;
		}
		.ps_email {
			display: block;
			position: relative;
			width: 100%;
			height: 51px;
			/* border-bottom: 1px solid #dadada;  */
			padding: 10px 14px;
			background: transparent;
			vertical-align: top;
			box-sizing: border-box;
		}
		#mailsel {
			position: relative;
			top: 14px;
			right: 0;
			width: 50%;
		}
		#selmail {
			font-weight: 400px;
			width: 100%;
			padding: 6px 8px 5px 7px;
			background: url('images/sel_arr.gif') 100% 50% no-repeat;
			-webkit-appearance: none; 
		}
		.ps_mm {
			/* display: block; */
			position: relative;
			/* width: 30%; */
			height: 51px;
			/* border-bottom: 1px solid #dadada; */
			border: none;
			padding: 10px 14px;
			/*background: #fff;*/
			vertical-align: top;
		}
		#mm {
			width: 80%;
			padding: 6px 8px 5px 7px;
			background: url('images/sel_arr.gif') 100% 50% no-repeat;
			-webkit-appearance: none; 
		}
		#mm > option {
			border: 1px solid #dadada;
			font-weight: 400px;
		}
		
		#idemail {
			width: 44%;
		}
		#urlemail{
			width: 45%;
		}
		
		#star {
			color: #b30000;
		}
		
		
		.addr_wrap > input{
			display: block;
			position: relative;
			width: 90%; /* 자기가 가질수있는 영역의 처음부터 끝까지 100%. 얘의 영역을 알려면 얘의 부모를 봐야함.  */
			height: 29px;
			margin: 10px 14px;
			line-height: 29px;
			background: transparent;
			font-size: 15px;
			z-index: 10;
			outline: none;
			border: none;
			border-bottom: 1px solid #dadada;
		}
		#addr_btn > input{
			display: block;
			position: relative;
			height: 29px;
			margin: 10px 14px;
			line-height: 29px;
			background: transparent;
			font-size: 15px;
			z-index: 10;
			outline: none;
			background-color: #816288;
			border: 0.5px outset #dadada;
			color: white;
		}
		.chenked_btn {
			display: none;
		}
		#name {
			width: 95%;
		}
		#phone {
			width: 95%;
		}
		#dd {
			width: 84%;
		}
		.addr_wrap{
			position: relative;
		}
		/* 회원탈퇴  */
		#cancel_mem {
			text-decoration: underline;
			color: black;
			padding-top: 10px;
			position: absolute;
			top: 10px;
			font-size: 14px;
			letter-spacing: 0.7px;
		}
		.cancel_area {
			position: relative;
		}
		#cancel_mem:hover {
			font-weight: bold;
		}
	
</style>
</head>
<body>
<header>
		<div class="header">
			<h1 class="swt_logo">
				<a href="index.swt" class="s_logo">
					<img alt="로고 이미지 "src="images/mylogo_6.png">
				</a>
			</h1>
		</div>
	</header>

	<section>
		<form class="join_form" id="join_frm" method="POST" action="infoUpdatePlay.swt">
			<div class="container">
				<div class="join_content">
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<i class="fas fa-asterisk" id="star"></i>
								<label for="id">아이디</label>
							</h3>
							<span class="ps_box int_id">
								<input type="text" id="id" name="id" class="int" maxlength="15" readonly="readonly" value="${sessionScope.loginUser.id}">
								<span class="step_url" id="error_id"></span>
								<!-- <span class="step_url">@naver.com</span> -->
							</span>
						</div>
						
					</div>
						
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<i class="fas fa-asterisk" id="star"></i>
								<label for="name">이름</label>
							</h3>
							<span class="ps_box">
								<input type="text" id="name" name="name" class="int" maxlength="10" value="${sessionScope.loginUser.name}" >
								<span class="step_url"></span>
							</span>
						</div>

						<div class="join_row join_birthday">
							<h3 class="join_title">
								<label for="yy">생년월일</label>
							</h3>
						</div>
						<div class="bir_wrap">
							<div class="bir_yy">
								<span class="ps_box">
									<input type="text" id="yy" name="yy" placeholder="년(4자,Year)" class="int" maxlength="4" readonly="readonly" value="${sessionScope.loginUser.bir_yy}">
									<span class="step_url"></span> 
								</span>
							</div>
							<div class="bir_mm">
								<span class="ps_mm">
									<select id="mm" class="sel" name="mm" disabled="disabled">
										<option>월(Month)</option>
										<option value="1">01(Jan.)</option>
										<option value="2">02(Feb.)</option>
										<option value="3">03(Mar.)</option>
										<option value="4">04(Apr.)</option>
										<option value="5">05(May)</option>
										<option value="6">06(Jun)</option>
										<option value="7">07(Jul.)</option>
										<option value="8">08(Aug.)</option>
										<option value="9">09(Sep.)</option>
										<option value="10">10(Oct.)</option>
										<option value="11">11(Nov.)</option>
										<option value="12">12(Dec.)</option>
									</select>
								</span>
							</div>
							<div class="bir_dd">
								<span class="ps_box">
									<input type="text" id="dd" name="dd" placeholder="일(Day)" class="int" maxlength="2" readonly="readonly" value="${sessionScope.loginUser.bir_dd}">
									<span class="step_url"></span>
								</span>
							</div>
						</div>
						<div class="daumaddr">
							<h3 class="join_title">
								<i class="fas fa-asterisk" id="star"></i>
								<label for="addr">주소</label>
							</h3>
						
							<span class="addr_wrap">
								<input type="text" class="addrbtn" name="zipcode" id="sample6_postcode" placeholder="우편번호" readonly="readonly" value="${sessionScope.loginUser.zipcode}">
							</span>
						
						
							<span id="addr_btn">
								<input type="button" id="addr_btn2" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</span>
						
							<span class="addr_wrap">
								<input type="text" class="addrbtn" id="sample6_address" name="addr1" placeholder="주소" readonly="readonly" value="${sessionScope.loginUser.addr1}">
								
								<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" value="${sessionScope.loginUser.addr2}">
								<span class="step_addr"></span> 
								
							</span>
							
						</div>
						<div class="join_row">
							<h3 class="join_title">
								<i class="fas fa-asterisk" id="star"></i>
								<label for="phone">휴대전화</label>
							</h3>
							<span class="ps_box int_id">
								<input type="text" id="phone" name="phone" class="int" maxlength="11" placeholder="- 제외하고 입력" value="${sessionScope.loginUser.phone}">
								<span class="step_url"></span>
							</span>
							<h3 class="join_title">
								<label for="email">이메일</label>
							</h3>
							<div id="wrap_email">
								<span class="ps_box int_id">
									<input type="text" id="email" name="email" class="int" placeholder="ex)id@email.com" value="${sessionScope.loginUser.email}">
									<span class="step_url"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="btn_double_area">
						<span>
							<a href="#" class="btn_type" id="btn_cancel">취소</a>
							<a href="#" class="btn_type" id="btn_update">회원수정</a>	
						</span>
					</div>
					<div class="cancel_area">
						<span><a href="${path}/dropMember.swt" id="cancel_mem">회원탈퇴</a></span>
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
						<a href="index.swt">
							<img class="addr_logo" alt="S.W.T 로고" src="images/logoswt_trans.png">
						</a>
					</span>
					<span>Copyright</span>
					<span>ⓒ</span>
					<span>
						<strong><a href="index.swt">S.W.T Corp.</a></strong>
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
		
			//우편번호, 주소 클릭시 다음주소API 창 출력
			$('.addrbtn').click(function(){
				var zipcode = $('.addrbtn').eq(0).val();
				var addr = $('.addrbtn').eq(1).val();
//				alert(zipcode+","+addr);
				if(zipcode == ""|| addr == ""){
					$('#addr_btn2').click();
				}
				
			});
			
			$('#sample6_detailAddress').blur(function(){
				var dAddr = $(this).val();
				if(dAddr==""||dAddr.length==0){
					$(this).next().text("필수입력 정보입니다").css("display","block").css("color","#b30000").css("font-size","13px").css("padding-left","15px");
					return false;
				}
			});
			/* // 1. input(#id)에 값을 입력 후 blur()하면 이벤트 발생
			$("#id").blur(function(){
				// 2. input(#id) value값을 가져와 memId에 담음 
				var memId = $.trim($("#id").val());
				// 3. joinValidate의 checkId() 함수를 실행, memId를 매개변수로 보냄 
				// 7. checkId() 함수를 실행 후 결과값(code, desc)을 변수 checkResult에 담음 
				var checkResult  = joinValidate.checkId(memId); // code, desc를 가져와서 변수에 담음 
				
				if(checkResult.code != 0) { 
					// 8-1(실패). code값이 0이 아닌 경우 => 유효한 값 아님 
					// 			  경고 메시지 출력!
					$(this).next().text(checkResult.desc).css('display','block').css('color','#b30000');
					return false;
				} else { 
					// 8-2(성공). code값이 0인 경우 => 유효한 값 
					//			 중복값인지 Ajax(에이젝스)로 검증 시작!
					// 9. ajaxCheck() 메서드 실행, memId를 매개변수로 보냄 
					// 31. ajaxCheck(memId)의 return값이 1이면 return true; (유효성체크완료, 사용가능한 아이디) 
					if(ajaxCheck(memId)=="1"){
						return true;
					}
				}
				return false; // if(ajaxCheck(memId)=="1") 제외하고는 return false;해서 종료
				
				
			}); */
			
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
			// 비번이랑 아이디랑 생년월일이랑 같은지 체크해주는것도 좋음 여기서는 안 하지만...
			
			var val = "${sessionScope.loginUser.bir_mm}";
			/* alert(val); */
			$('#mm').val(val).prop("selected",true);
			
			
			
		//이름 1널값체크2중간에공백체크3length 4자제한 4. 멋진이름이네
		$("#name").blur(function(){
				var name = $.trim($(this).val());
				var regEmpty = /\s/g; // 공백 문자 
				var nameReg = RegExp(/^[가-힣]{2,4}$/);
				if(name == ""||name.length==0){
					$(this).next().text("필수입력 정보입니다").css("display","block").css("color","#b30000");
					return false;
				} else if(name.match(regEmpty)) {
					$(this).next().text("이름은 공백없이 입력해주세요").css("display","block").css("color","#b30000");
					return false;
				} else if(!nameReg.test(name)) {
					$(this).next().text("이름은 표준한글만 입력가능합니다").css("display","block").css("color","#b30000");
					return false;
				} else if(name.length<2||name.length>4) {
					$(this).next().text("이름은 공백없이 2자 이상~4자 이하만 가능합니다").css("display","block").css("color","#b30000");
					return false;
				} else {
					$(this).next().text("멋진 이름이네요").css("display","block").css("color","dodgerblue");
					$("#yy").select();
				}
				
			});
		
		/* 숫자만 들어오게 일수랑 달은 1~31 년은 
		2월은 28일까지만 
		년도도 2019년 new 데이터 현재년도 계속 받아와서 그거보다 크지 않게 
		1900년도부터  */
		
		$("#phone").blur(function(){
			var regEmpty = /\s/g; // 공백 문자 
			var phone = $.trim($(this).val());
			var phoneReg = RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);
			if(phone==''||phone.length==0){
				$(this).next().css('display','block').text('필수입력 정보입니다').css('color','#b30000');
				phone.val('');
				phone.focus();
				return false;
			} else if(phone.match(regEmpty)) {
				$(this).next().text("공백없이 입력해주세요").css("display","block").css("color","#b30000");
				phone.select();
				return false;
			} else if(isNaN(phone)) {
				// isNaN : 숫잔지 아닌지 판단. 숫자가 아닌 값이 들어오면 true 
				$(this).next().css('display','block').text('숫자만 입력해주세요').css('color','#b30000');
				phone.select();
				return false;
			} else if(!phoneReg.test(phone)) {
				$(this).next().css('display','block').text('유효하지 않은 휴대폰 번호입니다').css('color','#b30000');
				phone.select();
				return false;
			} else {
				$(this).next().css('display','block').text('좋은 휴대폰 번호네요').css('color','dodgerblue');
				// 포트폴리오 낼 땐 말장난 치면 안됨. 폰트체도 깔끔하고 가독성 높은걸로. 귀여운거X
			}
		});
		
		$("#email").blur(function(){
			var email = $.trim($("#email").val());
			var regEmpty = /\s/g; // 공백 문자 
			var regEmail = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
			if(email==''||email.length==0) {
				$(this).next().css("display","block").text('필수입력 정보입니다').css('color','#b30000');
				return false;
			} else if(email.match(regEmpty)){
				$(this).next().css("display","block").text('공백없이 입력해주세요').css('color','#b30000');
				return false;
			} else if(!regEmail.test(email)){
				$(this).next().css("display","block").text('올바른 값을 입력해주세요').css('color','#b30000');
				return false;
			} else{
				$(this).next().css("display","block").text('샤이니한 이메일이네요').css('color','dodgerblue');
			}  
		});
		
		//change함수: 값(value)이 변화 됐을 때 적용
		//메일 주소 선택 값 입력 
		$('#selmail').change(function(){
			//input(키보드 입력값) select(선택값)는 val로 가져와야함. 나머지는 text로 가져 옴 
			var selmail = $(this).val();
			//alert(selmail);
			if(selmail == 'directVal'){
				//그전에 값이 있을 땐 지워줘야함 
				$('#email_url').val("");
				$('#email_url').focus();
				$('#email_url').removeAtrr('readonly');
			} else {
				$('#email_url').val(selmail);
				$('#email_url').prop('readonly',true);
				$('#email_url').blur();
			}
			//alert(selmail);
		});
		
		// 이메일 분할해서 받을 경우 가져오는 법(난 분할 안 하고 한줄로 받았으니 안해도 됨)
		/* var email = "${sessionScope.loginUser.email}";
		var index = email.indexOf('@');
		var emailid = email.substring(0, index);
		var emailurl = email.substring(index+1); */
		
		$("#btn_update").click(function(){
			$("#join_frm").submit;
		});
		
		
	});
		
		// 다음 지도 api
		 function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
	
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
	
					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if(data.userSelectedType === 'R'){
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if(data.buildingName !== '' && data.apartment === 'Y'){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if(extraAddr !== ''){
							extraAddr = ' (' + extraAddr + ')';
						}
						
					} 
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
		}
	</script>
</body>
</html>