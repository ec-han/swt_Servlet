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
										<a href="#" id="orderNew" style="color: rgb(36, 195, 182); font-weight: bold; text-decoration: underline;">최신순</a>
									</span>
									<span>
										<a href="#" id="orderGood">추천순</a>
									</span>
									<span>
										<a href="#" id="orderReply">댓글순</a>
									</span>
									<span>
										<a href="#" id="orderCnt">조회순</a>
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
								<div class="div_search">
									<select id="selsearch">
										<option value="3" selected="selected">--선택--</option>
										<option value="1">제목</option>
										<option value="2">내용</option>
										<option value="3">제목+내용</option>
										<option value="4">작성자</option>
									</select>
									<input type="text" placeholder="검색할 값을 입력하세요" id="search_board" name="search_board">
									<a href="#" id="search_btn"><img alt="검색" src="${path}/images/search2.png"></a>
									<!-- class="board_btn btn_search" -->
								</div>
								
								<!-- 페이지네이션 -->
								<div class="board_pagination">
									<ul class="pagination">
									
										<c:if test="${pageMaker.prev}">
											<li class="active">
												<a href="${path}/boardList.swt?page=${pageMaker.startPage - 1}">
													<i class="fas fa-angle-double-left"></i>
												</a>
											</li>
											<!-- <li class="active">
												<a href="#">
													<i class="fas fa-angle-left"></i>
												</a>
											</li> -->
											
											<li class="active">
												<a href="${path}/boardList.swt?page=1">1</a>
											</li>
											<li class="active">
												<a href="">...</a>
											</li>
										</c:if>
										<!-- begin end로 몇번부터 몇번까지 반복하게 설정. startPage(1)부터 begin해서 endPage(10)에서 end. var="idx"는 for문의 i(index) 같은거
										c:out은 출력임. 삼항연산자 사용. pageMaker.criDto.page : 선택한 페이지 == idx랑 같으면 class="active"효과를 주는 거 -->
										<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
											<li <c:out value="${pageMaker.criDto.page == idx ? 'class=active':''}"/>>
												<a href="${path}/boardList.swt?page=${idx}&flag=${flag}&keyword=${keyword}&key=${code}">${idx}</a>
											</li>
										</c:forEach>
										
										<c:if test="${pageMaker.next}">
											<li class="active">
												<a href="">...</a>
											</li>
											
											<li class="active">
												<a href="${path}/boardList.swt?page=${pageMaker.finalPage}">
													${pageMaker.finalPage}
													<!-- <i class="fas fa-angle-right"></i> -->
												</a>
											</li>
											
											<li class="active">
												<a href="${path}/boardList.swt?page=${pageMaker.endPage+1}">
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
</body>
</html>