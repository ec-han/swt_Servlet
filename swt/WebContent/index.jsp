<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/common.css?v=1">
<title>Insert title here</title>
<style type="text/css">

/* 캐로셀 */ 
/* Make the image fully responsive */
.carousel {
	position: relative;
	order: 1;
}
.carousel-inner img {
      width: 100%;
      height: 100%;
      margin: 30px 10px;
}
a:not([href]):not([tabindex]):focus, a:not([href]):not([tabindex]):hover {
    color: inherit;
    text-decoration: none;
}
/* 모달창에서 거슬리는 작은 막대기 */ 
.carousel-indicators {
	position: absolute;
    right: 0;
    bottom: 50px!important;
    left: 0;
    z-index: 15;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    padding-left: 0;
    margin-right: 15%;
    margin-left: 15%;
    list-style: none;
}
/*상품창*/ 
.main_categories {
	width: 100%;
	margin: 0 auto;
	background-color: white;
	display: flex;
	order: 2;
	/*border: 1px solid dodgerblue;*/
	max-width: 1215px;
	height: auto;
	justify-content: center;
	align-items: center;
}
.category_block{
	float: left;
	width: 100%;
	height: 100%;
	padding: 5px;
}
.category{
    background-size: contain;
    background-position: center center;
    background-repeat: no-repeat;
    position: relative;
    width: 100%;
    padding-top: 80%;
}
/*.category_menu{
	background-color: transparent;
    top: 20px;
    left: 20px;
    position: absolute;
    transition: background-color .25s ease-out;
    padding: 20px 20px 35px;
    width: 200px;
}
.sub_categories{
	height: 0;
    opacity: 0;
    overflow: hidden;
    margin-top: 5px;
    transition: all .25s ease-out;
}*/

.main_info_wrap{
	order: 3;
	width: 100%;
	margin: 0 auto;
	display: flex;
	/*border: 1px solid yellow;*/
	max-width: 1215px;
	height: auto;
	padding: 25px 12px 20px;
	align-items: center;
	justify-content: center;
}
.main_info{
    width: 100%;
	display: flex;
	flex-direction: row;
	height: 280px;
}
.main_info01{
	order:1;
	width: 410px;
}
.main_info_wrap .main_info .main_info01 > div {
    padding: 0 35px 0 30px;
}
.main_info02{
	order:2;
	width: 380px;

}
.text01>span>a>img{
	float: right;

}
.main_info_wrap .main_info .main_info02 > div {
    padding: 0 30px;
}
.main_info_wrap .main_info .text01 {
    line-height: 21px;
    color: #323232;
    font-size: 14px;
}
.main_info_wrap .main_info .main_info01 ul li:last-child {
    border-top: 1px solid #e5e5e5;
}
.notice div ul {
    margin-top: 10px;
}
.notice div ul>li:first-child {
    border-top: 0;
}
.notice div ul>li {
    padding: 13px 0;
    width: 100%;
    border-top: 1px solid #e5e5e5;
    font-size:14px;
    list-style: circle;
}
.notice div ul>li>a {
    font-size:14px;
}
.notice_date{
	float: right;
}
.main_info03{
	order:3;
	width: 390px;
}
.main_info03 > div {
	display: flex;
	flex-direction: row;
}
.main_info_wrap .main_info .main_info03 > div {
    padding: 60px 30px;
}
.main_info_wrap .main_info .main_info03 ul li.b_bottom {
    border-bottom: 1px solid #f2f2f2;
}
.main_info_wrap .main_info .main_info03 ul li.b_right {
    border-right: 1px solid #f2f2f2;
}
.main_info_wrap .main_info .main_info03 ul li {
    width: 50%;
    float: left;
    box-sizing: border-box;
}
#info03_01{
	order: 1;

}
#info03_02{
	order: 2;
}
#info03_03{
	order: 3;
}
#info03_04{
	order: 4;
}
.main_info_wrap .main_info > div {
	float: left;
    border-left: 1px dashed #d7d7d7;
    box-sizing: border-box;
}
/*
세로 dotted 없애는 거 맨 왼쪽
 */
.main_info_wrap .main_info>div:first-child {
    border: none;
}
.fa-search:before {
	color: black;
}


</style>
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section>
		<article>
			<div class="container">
				<div id="demo" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				  </ul>
				  
				  <!-- The slideshow -->
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="images/main01.png" alt="First Slide" width="1100" height="500">
				    </div>
				    <div class="carousel-item">
				      <img src="images/main02.png" alt="Second Slide" width="1100" height="500">
				    </div>
				    <div class="carousel-item">
				      <img src="images/main04.png" alt="Third Slide" width="1100" height="500">
				    </div>
				  </div>
				  
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
				</div>
				
				<div class="main_categories">
					<div class="category_block">
						<div class="category" style="background-image: url(images/cont_img01.jpg);">
						</div>
					</div>
					<div class="category_block">
						<div class="category" style="background-image: url(images/cont_img03.jpg);">
						</div>
					</div>
					<div class="category_block">
						<div class="category" style="background-image: url(images/cont_img04.jpg);">
							<!-- 문법 오류 아닌가?  -->
						</div>
					</div>
				</div>
				
				<div class="main_info_wrap">
					<div class="main_info">
					   <div class="main_info01">
							<div>
							    <ul>
							      <li>
							        <div>
							          <p class="text01"><img src="images/cont_ico01.png"></p>
							          <h3 class="cs_num">062)123-4567</h3>
							          <p class="text03 m_b10">평일 AM 10:00 - PM 17:00  토요일 및 일요일 <span>휴무</span></p>
							        </div>
							      </li>
							      <li>
							        <div>
							          <p class="text01 m_t10"><img src="images/cont_ico02.png"></p>
							          <h3 class="cs_num">123.45678.91.011</h3>
							          <p class="text03"><span>광주은행</span> 예금주 : S.W.T 코리아 주식회사</p>
							        </div>
							      </li>
							    </ul>
							</div>
					   </div>
					   <div class="main_info02">
						<div>
						    <p class="text01">
						    	<img src="images/cont_ico03.png">
						    	<span>
						    		<a href="#">
						    			<img src="images/more_ico.jpg">
						    		</a>
						    	</span>
						    </p>
						    <div class="notice">
						      <div id="board_area">
						      	<div>
						      		<ul>
						      			<li>
						      				<a href="#">신제품 출시 안내</a>
						      				<span class="notice_date">04.01</span>
						      			</li>
						      			<li>
						      				<a href="#">추출 액상차 제품 증정 이벤트</a>
						      				<span class="notice_date">04.05</span>
						      			</li>
						      			<li>
						      				<a href="#">택배 출고일 변경 안내</a>
						      				<span class="notice_date">04.21</span>
						      			</li>
						      			<li>
						      				<a href="#">배송 지연 공지</a>
						      				<span class="notice_date">04.21</span>
						      			</li>
						      		</ul>
						      	</div>
						      </div>     
						   </div>
						</div>
					   </div>
					   <div class="main_info03">
							<div>
							    <ul>
							      <li class="b_right b_bottom"><a href="#"><img src="images/cont_img07.png"
							onmouseover="this.src='images/cont_img07_on.png'" onmouseout="this.src='images/cont_img07.png'"
							id="info03_01"></a></li>
							      <li class="b_bottom"><a href="#"><img src="images/cont_img08.png"
							onmouseover="this.src='images/cont_img08_on.png'" onmouseout="this.src='images/cont_img08.png'"
							id="info03_02"></a></li>
							      <li class="b_right"><a href="JavaScript:onetoone()"><img src="images/cont_img09.png"
							onmouseover="this.src='images/cont_img09_on.png'" onmouseout="this.src='images/cont_img09.png'"
							id="info03_03"></a></li>
							      <li><a href="#"><img src="images/cont_img10.png"
							onmouseover="this.src='images/cont_img10_on.png'" onmouseout="this.src='images/cont_img10.png'"
							id="info03_04"></a></li>
							    </ul>
							</div>
					   </div>
					</div>
				</div>
			</div>
		</article>
	</section> 
	<%@ include file="/include/footer.jsp" %>
</body>
</html>