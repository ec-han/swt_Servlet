<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<c:if test="${sessionScope.loginUser == null}">
		<script>
			alert("로그인 하신 후 사용하세요.");
			location.href="${path}/boardList.swt?message=nologin";
		</script>
</c:if>
<%-- <c:choose>
	<c:when test="${sessionScope.loginUser == null}">
		<script>
			alert("로그인 하신 후 사용하세요.");
			location.href="${path}/boardList.swt?message=nologin";
		</script>
	</c:when>
	<c:otherwise>
		<script>		
			location.href="${path}/boardList.swt?message=login";
		</script>
	</c:otherwise>
</c:choose> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/board_regi.css?v=1">
<title>게시글 등록</title>
<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
	<section>
		<div id="contentWrapper" class="content01">
		<%@ include file="../include/board_aside.jsp" %>
			<div id="content">
				<div>
					<div class="page_body">
						<div class="bd_hd">
							<div class="bd_tit01">
								<img alt="제목" src="${path}/images/ribon2.png" id="ribon">
							</div>
							<form class="register_form" id="register_frm" method="POST" action="registerPlay.swt">
								<div class="box-body">
									<table class="table-boarded">
										<caption>Q&A 게시글</caption>
										<thead>
											<tr>
												<th>
													<div class="tb-left">제목</div>
													<fieldset class="fform">
														<input name="regi_title" class="form-control" id="regi_title">
														<span class="step_url"></span>
													</fieldset>
												</th>
											</tr>
											
										</thead>
										<tbody>
											
											<tr>
												<td>
													<div class="data-bd-cont">
														<span class="detail_wr">
															<div class="tb-left">내용</div>
															<fieldset class="fform">
																
																<textarea rows="1" cols="1" placeholder="내용" class="form-control" id="boardListInsert" name="boardListInsert" style='width:100%; min-width:260px;'></textarea>
																<script type="text/javascript">
																	var oEditors = [];
																	nhn.husky.EZCreator.createInIFrame({
																	 oAppRef: oEditors,
																	 elPlaceHolder: "boardListInsert",
																	 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
																	 fCreator: "createSEditor2"
																	});
																</script>
																<span class="step_url"></span>
															</fieldset>
														</span>
													</div>
												</td>
											</tr>
											
										</tbody>
										<tfoot>
											<tr>
												<td>
													<div class="tb-left">작성자</div>
													<fieldset class="fform">
														<input class="form-control" name="regi_writer" id="regi_writer" value="${sessionScope.loginUser.id}">
														
													
														
													</fieldset>
												</td>
											</tr>
										</tfoot>
									</table>
									
									<div class="btn_area">
										<div class="att_wrap">
											<div class="att_area">
												<a href="#">
													<img class="btn_img btn_att" alt="첨부파일" src="${path}/images/attachment1.png">	
												</a>
												<span>선택된 파일 없음</span>
											</div>
										</div>
										<div class="btn_right">
											
											<img class="bd-btns" id="btn_regi" alt="게시글 등록" src="${path}/images/regi.png">
											
											
											
										</div>
										
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
		
			$("#btn_regi").click(function(){
				
				oEditors.getById["boardListInsert"].exec("UPDATE_CONTENTS_FIELD",[]); //이걸해야 스마트에디터에서 값 가져옴 
				// 첨부파일 제외하고 게시글 등록되게 하기
				var title = $("#regi_title").val();
				var content = $("#boardListInsert").val();
				
				
				alert(title);
				alert(content);
			
				
				// 게시글 내용 작성자 null안되게 유효성 체크
				if(title==""||title.length==0){
					$('.step_url').text('글을 등록하려면 입력해주세요').css('display','block');
					return false;
				} else {
					$('.step_url').css('display','hidden');
					alert('유효성 체크1 완료');
				} 
				
				if(content == "<p><br></p>"){
					$('.step_url').text('글을 등록하려면 입력해주세요').css('display','block');
					return false;
				} else {
					$('.step_url').css('display','hidden');
					alert('유효성 체크2 완료');
				} 
				
				$("#register_frm").submit();
			});
		});
	
	</script>
	
</body>
</html>