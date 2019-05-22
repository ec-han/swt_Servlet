<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<%
	String referer = request.getHeader("referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/css/board_view.css?v=1"> 
<title>QnA</title>
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
							<div class="box-body">
								<table class="table-boarded">
									<caption>Q&A 게시글</caption>
									<thead>
										<tr>
											<th id="bd_num">
												<span>${one.bno}번째 게시글</span>
												<div class="tb-center">${one.title}</div>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="line">
												<div class="cont-sub-des">
													<div class="date01">
														<span>
															<strong>작성일 :</strong>
															<fmt:formatDate pattern="yyyy.MM.dd" value="${one.regdate}"/>
														</span>
													</div>
													<div class="name01">
														<span>
															<strong>작성자 :</strong>
															${one.writer}
														</span>
													</div>
													<div class="good01 text_center">
														<img class="btn_img btn_good" alt="좋아요" src="${path}/images/good.png">
														<span class="good_cnt">
															${one.goodcnt}
														</span>
													</div>
													<div class="hits01 text_center">
														<img class="btn_img btn_hits" alt="조회수" src="${path}/images/hits.png">
														<span>${one.viewcnt}</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="data-bd-cont">
													<span class="detail_wr">
														<br>
														${one.content}
														<br> 
													</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="att_wrap">
									<div class="att_area">
										<img class="btn_img btn_att" alt="첨부파일" src="${path}/images/attachment1.png">
										<a href="#">"${one.filename}"</a>
									</div>
								</div>
								<div class="btn_area">
									
									<c:if test="${sessionScope.loginUser.id == one.writer}">
										<a href="#">
											<img class="bd-btns" id="btn_regi" alt="게시글 수정" src="${path}/images/regi.png">
										</a>
										<a href="#" id="del_btn">
											<img class="bd-btns" id="btn_del" alt="게시글 삭제" src="${path}/images/delete2.png">
										</a>
									</c:if>
									
									
									<a href="#">
										<img class="bd-btns" id="btn_list" alt="게시글 목록" src="${path}/images/list.png">
									</a>
									
									
									<a href="#">
										<img class="bd-btns" id="btn_rpl" alt="게시글 답변" src="${path}/images/reply_blue.png">
									</a>
									
									<div id="wrap_like">
										<button type="button" class="btn_like" id="btn_good">
											<span class="img_emoti">좋아요</span>
											<span class="ani_heart_m"></span>
										</button>
									</div>
								</div>
								<!-- 모달 창  -->
								<div id="bd_modal_all">
									<div id="bd_modal">
										<div class="bd_wrap">
											<div id="bd_h_wrap">
												<h3>글 삭제</h3>
											</div>
											<p><span class="bd_modal_txt">정말 <span class="bd_focus_text">삭제</span>하시겠습니까?</span></p>
											<div class="bd_btn_wrap">
												<a class="bd_modal_btn" id="bd_btn_no" href="#">아니오</a>
												<a class="bd_modal_btn" id="bd_btn_yes" href="#">예</a>
											</div>
											<button id="bd_close_modal">X</button>
										</div>
									</div>
								</div>
								
								<div>
									<ul class="list-link">
										<li>
											<div>
												<span class="arrow prev">▲이전글 :</span>
											</div>
										</li>
										<li>
											<div>
												<span class="arrow nex">▼다음글 :</span>
												<a href="#">일본에서 수입되는 차도 있나요?</a>
											</div>
										</li>
									</ul>
								</div>
							</div>
							
							
							<!-- 댓글 목록 시작  -->
							<div class="reply-wrapper">
								<div id="commentList">
								</div>
							</div>
							<!-- 댓글 목록 끝  -->
							
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			/* 문서가 준비되면 댓글 목록을 조회하는 AJAX 실행 */
			comment_list();
			// 댓글 띄우는 기능
			function comment_list(){
				$.ajax({
					type: "post",
					url: "commentlist.swt",
					data: "bno=${one.bno}",
					success: function(result){
						$("#commentList").html(result);
					}
				});
			}
			
			
			
			$('#btn_good').click(function(){
				if($(this).hasClass('btn_unlike')) {
					$(this).removeClass('btn_unlike');
					$('.ani_heart_m').removeClass('hi');
					$('.ani_heart_m').addClass('bye');
				}
				else {
					$(this).addClass('btn_unlike');
					$('.ani_heart_m').addClass('hi');
					$('.ani_heart_m').removeClass('bye');
				}
			});
			/* 삭제확인 모달창 */
			$('#del_btn').click(function(){
				$('#bd_modal_all').css('display','block');
			});
			$('#bd_close_modal').click(function(){
				$('#bd_modal_all').css('display','none');
			});
			$('#bd_btn_no').click(function(){
				$('#bd_modal_all').css('display','none');
			});
			$('#bd_btn_yes').click(function(){
				location.href="boardList.swt";
			});
		});
		
		$(document).on("click","#btn_list", function(){
			location.href = "<%=referer%>";
			/* referer: 이전페이지 가짐. */
		});
	
	</script>	
</body>
</html>
