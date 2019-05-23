<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>    
<%-- <%
	String referer = request.getHeader("referer");
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
							<!-- depth가 닫라서 상위폴더로 나가서 경로 찾아가야함 -->
<link rel="stylesheet" href="${path}/css/common.css?v=1"> 
<link rel="stylesheet" href="${path}/css/header.css?v=1"> 


<title>SleepWellTea</title>

</head>
<body>
<!-- TOP버튼 -->
<button id="topBtn">
	<i class="fas fa-arrow-up"></i>
</button>
<header>
	<div class="header_menu">
		<div class="inner_header inner_header_menu">
			<div class="header_member">
				<!-- 모달 로그인 시작  -->
				<div id="modal_all">
					<div id="modal">
						<div id="wrap">
							<button id="close_btn">
								<i class="fas fa-times"></i>
							</button>
							<div id="swt_content">
								<div id="login_area">
									<div id="login_logo">
										<img src="${path}/images/mylogo_6.png">
									</div>
									<div id="container">
										<form name="" action="" method="POST" id="login_form">
											<input type="text" class="idpw" id="login_id" name=""
											  placeholder="아이디"></input>
												<img src="${path}/images/help.PNG"> <!--  ? 이미지  -->
											<input type="password" class="idpw" id="login_pw" name="" placeholder="패스워드"></input>
										</form>

										<form action="/action_page.php">
										    <div class="custom-control custom-switch">
										      <input type="checkbox" class="custom-control-input" id="switch1" name="example">
										      <label class="custom-control-label" for="switch1">로그인 유지</label>
										      <span id="step_url"></span>
										    </div>
										</form>
											
											<div>
												<a href="#" id="btn_login">
													<button class="btn btn1">Login</button>
												</a>
											</div>
										<div id="login_help">
											<!-- <a href="#">Join Us</a> -->
											<div class="right">
												<a href="#">아이디 찾기</a>
												<span class="right_bar">｜</span>
												<a href="pwUpdate.swt">비밀번호 재설정</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 로그인 끝  -->
				<ul>
				
				<c:choose>
					<c:when test="${empty sessionScope.loginUser}">
					<li><a id="open_btn">Login</a></li>
					<li><a href="${path}/constract.swt" target="_blank">Join</a></li>
					</c:when>
					<c:otherwise>
					<li id="loginInfo">
						<span>${sessionScope.loginUser.name}</span>
							(${sessionScope.loginUser.id})
					</li>
					<li><a href="#" class="logout_btn">Logout</a></li>
					</c:otherwise>
				</c:choose>
					
					<li class="mydrop1">
						<a href="#">MyPage</a>
						<div class="mydrop2">
						<%-- <c:choose>
							<c:when test="${empty sessionScope.loginUser}"> --%>
							<a href="${path}/infoUpdate.swt">Account</a>
							<a href="${path}/pwUpdate.swt">Password</a>
							<a href="${path}/dropMember.swt">ByeBye</a>
							<a href="#">Order</a>
							<a href="#">WishList</a>
							<%-- </c:when>
						</c:choose> --%>
						</div> 
					</li>
					<li><a href="#">Cart</a></li>
				
				</ul>

			</div>
		</div>
	</div>
	<div class="header_logo">
		<div class="inner_header">
			<a href="index.swt">
				<img id="logo" src="${path}/images/mylogo_6.png" alt="로고이미지">
			</a>
		</div>
	</div>
	<div class="header_nav">
		<div class="inner_header">
			<div class="inner_header_nav">
				<ul>
					<li id="dropdown1">
						<a class="ihn" href="#">Tea Shop</a>
						 <div class="dropdown2">
							<a href="#">Tea</a>
							<a href="#">Latte</a>
							<a href="#">Tea Sachet</a>
						</div>
					</li>
					<li><a href="#">·</a></li>
					<li><a class="ihn" href="#">Teawear</a></li>
					<li><a href="#">·</a></li>
					<li><a class="ihn" href="#">GIFT & SET</a></li>
					<li><a href="#">·</a></li>
					<li><a class="ihn" href="#">S.W.T</a></li>
					<li><a href="#">·</a></li>
					<li><a class="ihn" href="${path}/boardList.swt">CS Center</a></li>
				</ul>
				
			</div>
		</div>
	<!-- 검색 모달창  -->
	<div id="modal_search">
		<div id="scmodal">
			<div id="search_wrap">
				<input class="search_txt" type="text" name="" placeholder="Search">
				<a id="sc_btn" href="#"><i class="fas fa-search"></i></a>
				<button id="close_search">X</button>
			</div>
		</div>
	</div>
		<div class="search_box">
			<a class="search_btn" href="#">
				<!-- <i class="fas fa-search"></i> -->
				<img alt="검색" src="${path}/images/main_search1.png" class="header_search_btn">
			</a>
		</div>
	</div>
</header>

<script type="text/javascript">
	$(function(){
		// top버튼 
		$(window).scroll(function(){
			var scrollValue = $(this).scrollTop();
			if(scrollValue > 40){
				$('#topBtn').fadeIn();
			} else {
				$('#topBtn').fadeOut();
			}
		});
		$('#topBtn').click(function(){
			$('html,body').animate({scrollTop:0},150);
		});
		 //모달 로그인
		$('#open_btn').click(function(){
			$('#modal_all').css('display','flex');
			$('#login_id').focus();
		});
		$('#close_btn').click(function(){
			$('#modal_all').css('display','none');
		});
		$('#btn_login').click(function(){
			var id = $.trim($('#login_id').val());
			var pw = $.trim($('#login_pw').val());
			/* alert(id+','+pw); */
		});
		
		$(".logout_btn").click(function(){
			$.ajax({
				url: "logoutAjax.swt",
				type: "POST",
				dataType: "json",
				success: function(data) {
					location.reload();
				},
				error:function(){
					alert("System Error!!");
				}
			});
		});
			
		$('#btn_login').click(function(){
			var id = $.trim($('#login_id').val());
			var pw = $.trim($('#login_pw').val());
			/* alert(id+','+pw); */
			
			var regEmpty = /\s/g; // 공백문자 체크
			//1. null값 체크
			//2. 공백체크 
			if(id == null || id.length == 0){
				$('#step_url').text('필수정보 입니다').css('display','block');
				return false;
			}else if(id.match(regEmpty)){
				$('#step_url').text('공백없이 입력해주세요').css('display','block');
				return false;
			}
			if(pw == null || pw.length == 0){
				$('#step_url').text('필수정보 입니다').css('display','block');
				return false;
			}else if(pw.match(regEmpty)){
				$('#step_url').text('공백없이 입력해주세요').css('display','block');
				return false;
			}
			
			$.ajax({
				url: "login.swt",
				type: "POST",
				dataType: "json",
				data: "id="+id+"&pw="+pw,
				success: function(data) {
					if(data.message == "1") {
						location.reload(); // 새로고침 
					} else if(data.message == "-1"){
						$('#login_id').focus();
						$('#step_url').text('회원 아이디 또는 비밀번호가 일치하지 않습니다.').css('display','block');
					}
				},
				error:function(){
					alert("System Error!!");
				}
			});
			
			
		});
		//모달 검색창
		$('.search_btn').click(function(){
			$('#modal_search').css('display','flex');
		});
		$('#close_search').click(function(){
			$('#modal_search').css('display','none');
		});
	
	
	});
	

	
	
	
	
</script>
</body>
</html>