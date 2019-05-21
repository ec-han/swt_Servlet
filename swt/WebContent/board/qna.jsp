<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/css/board.css?v=1"> 
<title>Q&A</title>
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
								<div id="order_board">
									<input type="hidden" value="new" id="code">
									<span>
										<!-- rgb(231, 29, 54) -->
										<a href="${path}/boardList.swt?sort_type=new&search_option=${search_option}&keyword=${keyword}" id="orderNew">최신순</a>
									</span>
									<span>
										<a href="${path}/boardList.swt?sort_type=good&search_option=${search_option}&keyword=${keyword}" id="orderGood">추천순</a>
									</span>
									<span>
										<a href="${path}/boardList.swt?sort_type=reply&search_option=${search_option}&keyword=${keyword}" id="orderReply">댓글순</a>
									</span>
									<span>
										<a href="${path}/boardList.swt?sort_type=view&search_option=${search_option}&keyword=${keyword}" id="orderCnt">조회순</a>
									</span>
								</div>
								<!-- <button class="board_btn btn-primary">게시글 등록</button> -->
								<a href="#">
									<img id="btn_regi" alt="게시글 등록" src="${path}/images/regi.png">
								</a>
							</div>
							
							<div class="box-body">
								<table class="table table-boarded" summary="No., Title, Name, Date, Likes, Hits, attachments">
									<caption>Q&A 게시글</caption>
									<thead>
										<tr style="width: 10px">
											<th style="width: 50px">
												<div class="tb_center">No.</div>
											</th>
											<th style="width: 300px">
												<div class="tb_center">제목</div>
											</th>
											<th style="width: 100px">
												<div class="tb_center">작성자</div>
											</th>
											<th style="width: 130px">
												<div class="tb_center">작성일</div>
											</th>
											<th style="width: 85px">
												<div class="tb_center">좋아요</div>
											</th>
											<th style="width: 85px">
												<div class="tb_center">조회수</div>
											</th>
											<th style="width: 70px">
												<div class="tb_center">첨부</div>
											</th>
										</tr>
									</thead>
									<!-- 공지사항 리스트 끝 -->
									
									<tbody>							
															
										<!-- 게시글 리스트 시작(한페이지당 게시글 수)-->
									<c:forEach items="${list}" var="bDto">
										<!-- 현재시간 구하기  -->
										<jsp:useBean id="now" class="java.util.Date"/>
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
										<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
										<tr>
											<td class="text_center">
												<!-- No. -->
												<div class="tb_center">${bDto.bno}</div>
											</td>
											<td>
												<!-- 제목 -->
												<div class="title_table">
													<a href="#">${bDto.title}</a>
													<c:if test="${bDto.replycnt >0}">
														<span class="replyCnt_Color">${bDto.replycnt}</span>
													</c:if>
													
													<c:if test="${today==regdate}">
													
														<span class="new_time">New</span>
													</c:if>
												</div>
											</td>
											<td>
												<!-- 작성자 -->
												<div >
													${bDto.writer}
												</div>
											</td>
											<td>
												<!-- 작성일 -->
												<div class="text_center">
												<c:choose>
													<c:when test="${today==regdate}">
														<fmt:formatDate pattern="hh:mm:ss" value="${bDto.regdate}"/>
													</c:when>
													<c:otherwise>
														<fmt:formatDate pattern="yyyy.MM.dd" value="${bDto.regdate}"/>
													</c:otherwise>
												</c:choose>
												
												<!-- 년월일 시분초까지 띄우고 싶으면=> pattern="yyyy-MM-dd hh:mm:ss" -->
												</div>
											</td>
											<td>
												<!-- 좋아요 -->
												<div class="text_center">
													<img class="btn_img btn_good" alt="좋아요" src="${path}/images/good.png">
													<span class="good_cnt">
														${bDto.goodcnt}
													</span>
												</div>
											</td>
											<td>
												<!-- 조회수 -->
												
												<div class="text_center">
													<img class="btn_img btn_hits" alt="조회수" src="${path}/images/hits.png">
													<span>${bDto.viewcnt}</span>
												</div>
											</td>
											<td>
												<!-- 첨부-->
												<div class="text_center">
													<!-- <i class="fas fa-sticky-note"></i> -->
													<img class="btn_img btn_att" alt="첨부파일" src="${path}/images/attachment1.png">
													<!-- ${bDto.filesize} -->
												</div>
											</td>
										</tr>
									</c:forEach>
										
										
									</tbody>
								</table>
								
								<!-- 검색창 -->
								<div class="div_search">
								
									<select id="selsearch" name="selsearch">
										<option value="1" selected="selected">제목+내용</option>
										<option value="2">제목</option>
										<option value="3">내용</option>
										<option value="4">작성자</option>
									</select>
									
									<input type="text" placeholder="검색할 값을 입력하세요" id="search_board" name="search_board">
									<a href="#" id="search_btn"><img alt="검색" src="${path}/images/search2.png"></a>
									
									<!-- class="board_btn btn_search" -->
								</div>
								
								<c:if test="${!empty keyword}">
									<div id="search_result">
										<span class="search_span">"${keyword}"</span>로 검색한 결과는 총
										<span class="search_span">${totalCount}</span>건 입니다.  
									</div>
								</c:if>
								
								<!-- 페이지네이션 -->
								<div class="board_pagination">
									<ul class="pagination">
									
										<c:if test="${pageMaker.prev}">
											<li class="active">
												<a href="${path}/boardList.swt?page=${pageMaker.startPage - 1}&sort_type=${sort_type}&search_option=${search_option}&keyword=${keyword}">
													<i class="fas fa-angle-double-left"></i>
												</a>
											</li>
											<!-- <li class="active">
												<a href="#">
													<i class="fas fa-angle-left"></i>
												</a>
											</li> -->
											
											<li>
												<a href="${path}/boardList.swt?page=1&sort_type=${sort_type}&search_option=${search_option}&keyword=${keyword}">1</a>
											</li>
											<li>
												<a href="">...</a>
											</li>
										</c:if>
										<!-- begin end로 몇번부터 몇번까지 반복하게 설정. startPage(1)부터 begin해서 endPage(10)에서 end. var="idx"는 for문의 i(index) 같은거
										c:out은 출력임. 삼항연산자 사용. pageMaker.criDto.page : 선택한 페이지 == idx랑 같으면 class="active"효과를 주는 거 -->
										<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
											<li <c:out value="${pageMaker.criDto.page == idx ? 'class=active':''}"/>>
												<a href="${path}/boardList.swt?page=${idx}&sort_type=${sort_type}&search_option=${search_option}&keyword=${keyword}">${idx}</a>
											</li>
										</c:forEach>
										
										<c:if test="${pageMaker.next}">
											<li class="active">
												<a href="">...</a>
											</li>
											
											<li>
												<a href="${path}/boardList.swt?page=${pageMaker.finalPage}&sort_type=${sort_type}&search_option=${search_option}&keyword=${keyword}">
													${pageMaker.finalPage}
													<!-- <i class="fas fa-angle-right"></i> -->
												</a>
											</li>
											
											<li class="active">
												<a href="${path}/boardList.swt?page=${pageMaker.endPage+1}&sort_type=${sort_type}&search_option=${search_option}&keyword=${keyword}">
													<!-- &raquo; --> 
													<i class="fas fa-angle-double-right"></i>
												</a>
											</li>
										</c:if>
										
										
										
									</ul>
								</div>
							</div>
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
			var sort_type = "${sort_type}";
			if(sort_type == "new"){
				$("#orderNew").css("color","rgb(36, 195, 182)").css("font-weight", "bold").css("text-decoration", "underline");
			} else if(sort_type == "good"){
				$("#orderGood").css("color","rgb(36, 195, 182)").css("font-weight", "bold").css("text-decoration", "underline");
			} else if(sort_type == "reply"){
				$("#orderReply").css("color","rgb(36, 195, 182)").css("font-weight", "bold").css("text-decoration", "underline");
			} else if(sort_type == "view"){
				$("#orderCnt").css("color","rgb(36, 195, 182)").css("font-weight", "bold").css("text-decoration", "underline");
			}
		});
		
		$(document).on("click","#search_btn", function(){
			var search_option = $('#selsearch').val();
			var keyword = $.trim($('#search_board').val());
			
			if(keyword == null || keyword.length == 0){
				$('#search_board').focus();
				$('#search_board').css('border','1px solid rgb(183,46,154)');
				return false;
				
			}
//			alert(search_option+","+keyword);
			location.href="${path}/boardList.swt?search_option="+search_option+"&keyword="+keyword;
		});
	
	
	</script>
	
</body>
</html>