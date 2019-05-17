<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입 동의</title>
<!-- favicon -->
<link rel="icon" type="image/png" href="images/logoswt_trans.png"> 
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR');
		* {
			font-family: 'Noto Serif KR', serif;
		}
		body, h1, ul, p, h3 {
			margin: 0;
			padding: 0;
		}
		body { background: #e9eaee; }
		.swt_log { font-size: 2em; }
		.header, .container, .footer {
			width: 768px;
			margin: auto;
			box-sizing: border-box;

		}
		
		.header {
			height: 169px;
			padding-top: 62px;
			position: relative;
		}
		.n_logo > img {
			display: inline-block;
		    position: absolute;
		    top: 30px;
		    left: 195px;
		    height: 130px;
		    margin: 0 auto;
		    box-sizing: border-box;
		}
		.container {
			position: relative;
		
		}
		.footer {
			height: 81px;
			text-align: center;
			padding: 30px 0px 15px;
		/* 	border: 1px solid mediumseagreen;
		 */
		}
		
		
		.lang {
			position: absolute;
			top: 14px;
			right: 0;
		}
		.langselect {
			font-size: 12px;
			font-weight: 400px
			height: 30px;
			padding: 6px 8px 5px 7px;
			min-width: 98px;
			color:#333;
			border: 3px double #dee2e6;
		}
		.lang>select {
			background: url('${path}/images/sel_arr.gif') 100% 50% no-repeat;
			-webkit-appearance: none; 
			width: 98px;
			height: 35px;
			background-color: white;
			outline: none;
		}
		.join_content {
			width: 460px;
			margin: 0 auto;
		}
		.terms {
			margin-bottom: 20px;
			background-color: white;
			border: 3px double #dee2e6;
		}
		.terms_span > input {
			position: absolute;
			right: 1px;
			top: 50%;
			width: 22px;
			height: 22px;
			margin-top: -11px;
			visibility: hidden;
		}
		.terms_p {
			display: block;
			padding: 15px;
			margin: 0px;
			position: relative;
		}
		.terms_span > label {
			background: url('${path}/images/check_off.gif') 100% 50% no-repeat;
			display: block;
			line-height: 20px;
			height: 58px;
			top: -1px;
			font-size: 14px;
			font-weight: 700;

		}
		.terms_span {
			position: relative;
			display: block;
			height: 58px;
		}
		.terms_span > input:checked +label {
			background-image: url('${path}/images/check_on.gif');
		}
		.terms_ul {
			padding-bottom: 7px;
			list-style: none;
		}
		.terms_ul_li1 {
			border-top: 1px solid #f0f0f0;
		}
		.terms_ul > li {
			display: block;
			padding: 13px 15px 7px;
		}
		.ul_li_span {
			position: relative;
			display: block;
			height: 24px;
		}
		.label1 {
			height: 24px;
			font-size: 14px;
			font-weight: 700;
			line-height: 24px;
			position: absolute;
			color: #333;
			top: 0px;
			left: 0px;
			width: 100%;
		}
		.span_only {
			color: #0d9900;
			font-size: 12px;
			font-weight: 400;
		}
		.ul_li_span > input {
			visibility: hidden;
			position: absolute;
			right: 1px;
			width: 22px;
			height: 22px;
			margin-top: -11px;
			top: 50%;
		}
		.ul_li_span > label {
			background: url('${path}/images/check_off.gif') 100% 50% no-repeat;
			display: block;
		}
		.ul_li_span > input:checked +label {
			background-image: url('${path}/images/check_on.gif');
		}
		.terms_box {
			position: relative;
			box-sizing: border-box;
			height: 88px;
			margin-top: 11px;
			padding: 8px 10px;
			border: 1px solid #f0f0f0;
			background-color: #f7f7f7;
			overflow: auto;
		}
		.article_title {
			font-size: 12px;
			font-weight: 700;
			line-height: 16px;
			color: #666;
		}
		.article > p {
			
			font-size: 12px;
			line-height: 16px;
			color: #666;
		}
		.span_select {
			color: #969696;
			font-size: 12px;
			font-weight: 400;
		}
		.btn_double_area {
			margin: 30px -5px 0px;
			overflow: hidden;
		}
		.btn_double_area > span {
			display: block;
			float: left;
			width: 50%
		}
		.btn_default:hover {
			color: inherit!important;
			text-decoration: none;
		}
		.btn_agree:hover {
			color: white!important;
			text-decoration: none;
		}
		.btn_default {
			color: #333;
			border: 1px solid #e7e7e7;
			background-color: #fff;
		}
		.btn_agree {
			color: #fff;
			border: 1px solid #252851;
			background-color: #252851;
		}
		.btn_type {
			width: auto;
			margin: 0 5px;
			font-size: 20px;
			font-weight: 600;
			line-height: 50px;
			display: block;
			box-sizing: border-box;
			height: 61px;
			padding-top: 1px;
			text-align: center;
			border: 3px double #dee2e6;
		}
		a {
			text-decoration: none;
			color: inherit;
		}
		.group_join {
			margin: 20px 0px 65px;
			text-align: center;
			color: #666;
			font-size: 12px;
		}
		.group_join > a {
			text-decoration: underline;
			color: #333;
		}
		footer {
			background-color: #f7f7f7;
			border-top: 3px double #dee2e6;
		}
		.footer_wrap > ul {
			list-style: none;
			margin: 0 auto 9px;
		}
		.footer_wrap * {
			font-size: 11px;
			line-height: normal;
			color: #333;
		}
		.footer_wrap > ul > li {
			display: inline;
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		.footer_wrap > ul > li a:hover {
			color: #252851;
		}
		.footer_wrap > ul > li:first-child {
			border-left: 0px;
		}
		.addr_logo {
			width: 20px;
			height: 20px;
		}
		.address {
			margin: 0px auto;
			text-align: center;
		}
		/* .address * {
			font: 9px verdana;
		} */
		.addree a {
			font-weight: bold;
		}
		.address a:hover {
			color: #252851;
		}	
		#err_check {
			color: #b30000;
			font-size: 12px;
			display: none;
		}
</style>
</head>
<body>
<header>
		<div class="header">
			<h1 class="swt_logo">
				<a href="index.swt" class="n_logo">
					<img src="${path}/images/mylogo_constract.png">
				</a>
			</h1>
			<div class="lang">
				<select class="langselect">
					<option>한국어</option>
					<option>English</option>
					<option>中文(简体)</option>
					<option>中文(台灣)</option>
				</select>
			</div>
		</div>
	</header>

	<section>
		<div class="container">
			<form class="join_content">
				<div class="terms">
					<p class="terms_p">
						<span class="terms_span">
							<input type="checkbox" id="cbox">
							<label for="cbox">
							이용약관, 개인정보 수집 및 이용,<br>
							위치정보 이용약관(선택), 프로모션 안내<br>메일 수신(선택)에 모두 동의합니다. 
							</label>
						</span>
					</p>
					<ul class="terms_ul">
						<li class="terms_ul_li1">
							<span class="ul_li_span">
								<input type="checkbox" id="li1box" class="ckboxs">
								<label for="li1box" class="label1">
									S.W.T 이용약관 동의
									<span class="span_only">(필수)</span>
								</label>
							</span>
							<div class="terms_box">
								<div class="article">
									<h3 class="article_title">제 1 조 (목적)</h3>
									<p>이 약관은 S.W.T 주식회사 ("회사" 또는 "S.W.T")가 제공하는 S.W.T<br> 및 S.W.T 관련 
										제반 서비스의 이용과 관련하여 회사와 회원과의 권리, <br> 의무 및 책임사항, 기타 필요한
									사항을 규정함을 목적으로 합니다.</p><br>

									<h3 class="article_title">제 2 조 (정의)</h3>
									<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
										①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유<br> 무선 장치를 포함)와 
										상관없이 "회원"이 이용할 수 있는 S.W.T 및 S.W.<br>T 관련 제반 서비스를 의미합니다.
									</p>
								</div>
							</div>
						</li>

						<li class="terms_ul_li2">
							<span class="ul_li_span">
								<input type="checkbox" id="li2box" class="ckboxs">
								<label for="li2box" class="label1">
									개인정보 수집 및 이용에 대한 안내
									<span class="span_only">(필수)</span>
								</label>
							</span>
							<div class="terms_box">
								<div class="article">
									<p>정보통신망법 규정에 따라 S.W.T에 회원가입 신청하시는 분께 수집하<br>는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및<br> 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p><br>
									<h3 class="article_title">1. 수집하는 개인정보</h3>
									<p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 S.<br>W.T 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘<br>린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위<br>해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 <br>개인정보를 수집합니다.</p>

									
								</div>
							</div>
						</li>

						<li class="terms_ul_li3">
							<span class="ul_li_span">
								<input type="checkbox" id="li3box" class="ckboxs">
								<label for="li3box" class="label1">
									위치정보 이용약관 동의
									<span class="span_select">(선택)</span>
								</label>
							</span>
							<div class="terms_box">
								<div class="article">
									<p>위치정보 이용약관에 동의하시면,
										<strong>위치를 활용한 광고 정보 수신</strong> 등을<br>
										포함하는 S.W.T 위치기반 서비스를 이용할 수 있습니다.
									</p><br>
									<h3 class="article_title">제 1 조 (목적)</h3>
									<p>이 약관은 S.W.T 주식회사 (이하 “회사”)가 제공하는 위치정<br>
										보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의<br>
									무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

									
								</div>
							</div>
						</li>

						<li class="terms_ul_li4">
							<span class="ul_li_span">
								<input type="checkbox" id="li4box" class="ckboxs">
								<label for="li4box" class="label1">
									이벤트 등 프로모션 알림 메일 수신
									<span class="span_select">(선택)</span>
								</label>
							</span>
						</li>
					</ul>
				</div>
				<div id="err_check">
					<span id="err_check_msg">S.W.T 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
				</div>
				<div class="btn_double_area">
					<span><a href="#" class="btn_type btn_default">비동의</a></span>
					<span><a href="#" class="btn_type btn_agree">동의</a></span>
				</div>
			</form>
			<div class="group_join">
				회사, 동아리 등 단체에서 사용할 ID가 필요하세요?
				<a href="#">단체 회원 가입</a>
			</div>
		</div>
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
							<img class="addr_logo" alt="S.W.T 로고" src="${path}/images/logoswt_trans.png">
						</a>
					</span>
					<span>Copyright</span>
					<span>ⓒ</span>
					<span>
						<strong><a href="${path}/index.swt">S.W.T Corp.</a></strong>
					</span>
					<span>All Rights Reserved.</span>
				</div>

			</div>
		</div>
	</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			/*prop은 체크를 하는거, prop(property): 속성 값을 가져다 주는 것 */
			/*checked속성값에 true를 집어 넣어라 */
			$('#cbox').click(function() {
				var flag = $(this).is(':checked');
				//is는 확인해서 true false로 알려 줌. is로 값을 넣을 순 없음. 
				if(flag==true){
					$('.ckboxs').prop('checked',true);
				} else {
					$('.ckboxs').prop('checked',false);
					/*false가 checked 해제 하는 것 */
					/*checked는 체크가 됐냐 안됐냐임 true false가 구분하는거 unchecked는 없음 */
				} 
				
			});
			//.ckboxs의 4개 중 하나가 체크가 됐을 떄 
			$('.ckboxs').click(function() {
				// alert('check');
								//.ckboxs에서 checkbox옵션 중 checked인것의 갯수 
								// length: 갯수를 새줌.
				var ckleng = $('.ckboxs:checkbox:checked').length;
				/*alert(ckleng);*/

				//4개 다 체크됐을때 #cbox가 체크 돼야 하고, 하나라도 빠지면 체크해제돼야 함 
				if(ckleng==4){ 
					$('#cbox').prop('checked',true);
					/*$(this).prop('checked',false);*/
					
					
				}else {
					$('#cbox').prop('checked',false);
					
				}
			});
			// 최소한 필수가 체크됐을때 통과. return;쓰면 됨 
			$('.btn_agree').click(function() {
				var essential1 = $('#li1box').is(':checked');
				var essential2 = $('#li2box').is(':checked');
				
				if(essential1==true && essential2==true ){
					// 페이지 이동 
					location.href="member.swt";
					//같은 폴더에 있으니 이렇게 써도 됨. 이렇게 하면 보안이 취약함. 나중에 웹개발할때 바꿔줌 
				}else {
					$("#err_check").css("display","block");
					return false;
					// return하면 메서드 종료. 반드시 return써야함. 
					// 화면 새로고침은 location.reload();
				}
			});
			
		});
	</script>
</body>
</html>