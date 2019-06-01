<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		.footer {
			height: auto;
			text-align: center;
			padding-top: 15px;
		    background-color: white;
		    border-top: 3px double #dee2e6;
		    width: 768px;
			margin: auto;
			box-sizing: border-box;
			border-left: 3px double #dee2e6;
   			border-right: 3px double #dee2e6;
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
			text-decoration: underline;
		}
		.footer_wrap > ul > li:first-child {
			border-left: 0px;
		}
		.addr_logo {
			width: 20px;
			height: 20px;
		}
		.address {
		    padding: 10px 0;
		    text-align: center;
		   /*  border-top: 1.5px solid #dee2e6; */
		}
		/* .address * {
			font: 9px verdana;
		} */
		.addree a {
			font-weight: bold;
		}
		.address a:hover {
			color: #252851;
			text-decoration: none;
		}	
		#err_check {
			color: #b30000;
			font-size: 12px;
			display: none;
		}
		.mem_footer_sns{
			height: auto;
			/* border-top: 1px solid black; */
		}
		.mem_footer_sns>a:hover{
			text-decoration: none;
		}
		.m_sns_btn > i{
			font-size: 15px;
			padding: 5px;
		}
</style>

</head>
<body>
	<footer>
		<div class="footer">
			<div class="footer_wrap">
				<ul>
					<li><a href="#">회사소개</a></li>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보 처리방침</a></strong></li>
					<li><a href="#">찾아오시는 길</a></li>
					<li><a href="#">이메일 주소 무단수집 거부</a></li>
					<li><a href="${path}/boardList.swt" target="_blank">CS Center</a></li>
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
				
				<div class="mem_footer_sns">
					<a href="https://www.instagram.com/" target="_blank" class="m_sns_btn">
						<i class="fab fa-instagram"></i>
					</a>
					<a href="https://www.facebook.com/" target="_blank" class="m_sns_btn">
						<i class="fab fa-facebook"></i>
					</a>
					<a href="https://twitter.com/?lang=ko" class="m_sns_btn"><i class="fab fa-twitter"></i></a>
					<a href="https://www.google.com/" class="m_sns_btn"><i class="fab fa-google"></i></a>
					<a href="https://line.me/ko/" class="m_sns_btn"><i class="fab fa-line"></i></a>
				</div>

			</div>
		</div>
	</footer>
</body>
</html>