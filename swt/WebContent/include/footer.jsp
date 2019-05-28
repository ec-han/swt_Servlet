<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/common.css?v=1">
<title>Insert title here</title>
<style type="text/css">

.sns_btn {
	display: inline-block;
	width: 40px;
	height: 40px;
	background-color: #A7AFCC;
	margin: 0 10px;
	border: 3px double #E5F3FA;
	box-shadow: 0 2px 5px 0 rgba(0,0,0,0.1),
				0 2px 10px 0 rgba(0,0,0,0.05); 
	overflow: hidden;
	position: relative;
	text-align: center;
}
.sns_btn i {
	line-height: 35px;
	font-size: 1.5em;
	transition: 0.2s linear;
}
.sns_btn:hover i{
	transform: scale(1.1); 
	color: #EEE;
}
/* .sns_btn:before {
	content: "";
	position: absolute;
	width: 120%;
	height: 130%;
	transform: rotate(90deg);
	left: -110%;
	top: 90%;
	background-color: #E4E4E1;
    background-image: radial-gradient(at top center, rgba(255,255,255,0.03) 0%, rgba(0,0,0,0.03) 100%), linear-gradient(to top, rgba(255,255,255,0.1) 0%, rgba(143,152,157,0.60) 100%);
    background-blend-mode: normal, multiply;
}
.sns_btn:hover:before {
	animation: sns_hover 0.8s 1;
	top: -10%;
	left: -10%;
}

@keyframes sns_hover {
	0% {left: -100%; top: 90%;}
	50% {left: 10%; top: -40%;}
	100% {left: -10%; top: -10%;}
}   */

footer {
	position: relative;
	bottom: 0;
	border-left: 3px double #dee2e6;
    border-right: 3px double #dee2e6;
    width: 80%;
    margin-left: auto;
    margin-right: auto;
    background-color: #fff;
}
.footer {
    width: 100%;
    margin: 0 auto;
    height: 251.2px;
}

.footer .footer_top {
    background-color: #f7f7f7;
    width: 100%;
    display: table;
    border-top: 1px solid #d5d7da;
    border-bottom: 1px solid #d5d7da;
}
.footer .footer_top .left_sec {
    float: left;
    padding-left: 42px;
}
.footer .footer_top .left_sec ul {
    margin: 0 -9px;
}
.footer .footer_top .left_sec ul li {
    float: left;
    position: relative;
    BORDER-RIGHT: 3PX double #c7c2c2;
    padding-right: 2px;
}
.footer .footer_top .left_sec ul li a {
    color: #6e6e6e;
    font-size: 12px;
    margin: 0 9px;
    display: inline-block;
    padding-top: 8px;
    padding-bottom: 8px;
    cursor: pointer;
}
.footer .footer_top .left_sec ul li a:hover {
	color: inherit;
	bold: 400;
	text-decoration: underline;
}
/* .footer .footer_top .left_sec ul li a:before {
    content: '';
    background-color: #cecece;
    width: 1px;
    height: 15px;
    position: absolute;
    top: 10px;
    left: 0;
} */
.footer .footer_top .right_sec {
    float: right;
    padding-right: 21px;
}
.footer .footer_bottom {
    background-color: #ffffff;
    padding: 30px 0 35px;
    display: table;
    width: 100%;
    height: 151px;
}
.footer .footer_bottom .left_sec {
    padding-left: 42px;
    float: left;
}
.footer .footer_bottom .left_sec .text01 {
    color: #84ad23;
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 15px;
}
.footer .footer_bottom .left_sec .text02 {
    color: #323232;
    font-size: 14px;
    font-weight: bold;
    line-height: 17px;
    font-family: 'NanumGothic';
}
.footer .footer_bottom .left_sec .text03 {
    color: #8c8c8c;
    font-size: 12px;
    line-height: 17px;
    margin-bottom: 10px;
}
.footer .footer_bottom .left_sec .text03 span {
    color: #fff;
    font-size: 11px;
    background-color: #555555;
    padding: 2px 4px 2px;
    cursor: pointer;
}
.footer .footer_bottom .left_sec .text03 span.caution {
    display: block;
    color: #555555;
    font-weight: 600;
}
.footer .footer_bottom .left_sec .text04 {
    font-family: 'Lora';
    font-size: 11px;
}
.footer .footer_bottom .right_sec {
    padding-right: 51px;
    float: right;
    margin-top: 5px;
}
.footer_sns {
	position: relative;
	top: 65px;
}

</style>
</head>
<body>
	<footer>
		<div class="footer">
			<div class="footer_top">
				<div class="left_sec">
					<ul>
						<li>
							<a>회사소개</a>
						</li>
						<li>
							<a>이용약관</a>
						</li>
						<li>
							<a>개인정보 처리방침</a>
						</li>
						<li>
							<a>찾아오시는 길</a>
						</li>
						<li>
							<a>이메일 주소 무단수집 거부</a>
						</li>
					</ul>
				</div>
				<!-- 오른쪽 -->
				<div class="right_sec"></div>
			</div>
			<div class="footer_bottom">
				<div class="left_sec">
					<p class="text01">Contact Us</p>
					<p class="text02">SleepWellTea</p>
					<p class="text03">광주광역시 북구 경양로 170(중흥동) 5층, SleepWellTea 코리아(주) 대표자. 한은체 
					사업자등록번호. 010-11-11111 <span>사업자정보확인</span><br> 통신판매업 신고번호. 
					2019-광주-00111 email. eunchehan@swt.co.kr 
					tel. 062-111-1234 fax. 062-111-1111 
					개인정보관리책임자. 한은체
					<span class="caution"></span>
					</p>
					<p class="text04 lora">COPYRIGHT 2019 S.W.T Corp. ALL RIGHTS RESERVED.</p>
				</div>
				<div class="right_sec">
					<div class="footer_sns">
						<a href="https://www.instagram.com/" target="_blank" class="sns_btn">
							<i class="fab fa-instagram"></i>
						</a>
						<a href="https://www.facebook.com/" target="_blank" class="sns_btn">
							<i class="fab fa-facebook"></i>
						</a>
						<a href="https://twitter.com/?lang=ko" class="sns_btn"><i class="fab fa-twitter"></i></a>
						<a href="https://www.google.com/" class="sns_btn"><i class="fab fa-google"></i></a>
						<a href="https://line.me/ko/" class="sns_btn"><i class="fab fa-line"></i></a>
					</div>
				</div>
			</div>
		</div>
	</footer> 
</body>
</html>