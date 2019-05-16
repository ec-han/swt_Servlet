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
footer {
	background-color: #f7f7f7;
	/* border: 3px solid pink; */
	text-align: center;
	width: 80%;
	margin: 0 auto;
}
#footer {
	position: relative;
	bottom: 0;
	/* border: 1px solid orange; */
}
#footer > ul > li {
	padding: 10px 10px;
}
#footer > ul > li:hover {
	text-decoration: underline;
}
#addr_logo {
	width: 200px;
	height: 90px;
	padding: 10px 10px;
	float: right;
}
#address > span {
	float: left;
	padding: 10px 10px;
} 
.container {
	width: 100%;
	margin: 0 auto;
	background-color: white;
	display: flex;
	flex-direction: column;
	/* border: 1px solid blue; */
	/*max-width: 1215px;*/
	max-width: 80%;
	height: auto;
	justify-content: center;
	align-items: center;
	
	/* opacity: 0.8; */
}

#footer_bottom {
	width: 80%;
	margin: auto;
	font-size: 12px;
}
#footer_bottom > span {
	text-align: center;
}
</style>
</head>
<body>
	<footer>
		<div id="footer">
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
				<ul>
					<li><a href="">Customer Service</a></li>
					<li><strong><a href="">Privacy Policy</a></strong></li>
					<li><a href="">Terms of Sale</a></li>
				</ul>
				<div id="address">
					<!-- <span>
						<a href="index.swt"> 작은 로고 
							<img src="images/logo3.png" id="addr_logo">
						</a>
					</span> -->
					<div id="footer_bottom">
						<span>Copyright</span>
						<span>ⓒ</span>
						<span><strong><a href="index.swt">S.W.T Corp.</a></strong></span>
						<span>All rights Reserved.</span>
					</div>
				</div>
			</div>
	</footer> 
</body>
</html>