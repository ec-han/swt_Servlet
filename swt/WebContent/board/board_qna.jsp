<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="../css/board.css?v=1"> 
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
								<h3 class="box-title">Q&A</h3>
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
									<img id="btn_regi" alt="게시글 등록" src="../images/regi.png">
								</a>
							</div>
							
							<div class="box-body">
								<table class="table table-boarded" summary="No., Title, Name, Date, Likes, Hits, attachments">
									<caption>Q&A 게시글</caption>
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
									<tbody>
										<!-- 공지사항 리스트 끝 -->
										<!-- 게시글 리스트 시작(한페이지당 게시글 수)-->
										<tr>
											<td class="text_center">
												<!-- No. -->
												<div class="tb_center">4</div>
											</td>
											<td>
												<!-- 제목 -->
												<div class="title_table">
													<a href="#">냉침해도 되나요?</a>
												</div>
											</td>
											<td>
												<!-- 작성자 -->
												<div >
													은체
												</div>
											</td>
											<td>
												<!-- 작성일 -->
												<div class="text_center">
													2019-05-16
												</div>
											</td>
											<td>
												<!-- 좋아요 -->
												<div class="text_center">
													<img class="btn_img" alt="좋아요" src="../images/good.png">
													<span class="good_cnt">
														7
													</span>
												</div>
											</td>
											<td>
												<!-- 조회수 -->
												<img class="btn_img" alt="조회수" src="../images/hits.png">
												<div class="text_center">
													7
												</div>
											</td>
											<td>
												<!-- 첨부-->
												<div class="text_center">
													<!-- <i class="fas fa-sticky-note"></i> -->
													<img class="btn_img" alt="첨부파일" src="../images/attachment1.png">
												</div>
											</td>
										</tr>
										<!-- 게시글 리스트 시작(한페이지당 게시글 수)-->
										<tr>
											<td class="text_center">
												<!-- No. -->
												<div class="tb_center">3</div>
											</td>
											<td>
												<!-- 제목 -->
												<div class="title_table">
													<a href="#">일본에서 수입되는 차도 있나요?</a>
												</div>
											</td>
											<td>
												<!-- 작성자 -->
												<div >
													수연
												</div>
											</td>
											<td>
												<!-- 작성일 -->
												<div class="text_center">
													2019-05-15
												</div>
											</td>
											<td>
												<!-- 좋아요 -->
												<div class="text_center">
													<img class="btn_img" alt="좋아요" src="../images/good.png">
													<span class="good_cnt">
														5
													</span>
												</div>
											</td>
											<td>
												<!-- 조회수 -->
												<div class="text_center">
													<img class="btn_img" alt="조회수" src="../images/hits.png">
													5
												</div>
											</td>
											<td>
												<!-- 첨부-->
												<div class="text_center">
													<img class="btn_img" alt="첨부파일" src="../images/attachment2.png">
												</div>
											</td>
		
										</tr>
									</tbody>
								</table>
								<div class="div_search">
									<select id="selsearch">
										<option value="3" selected="selected">-조건 선택-</option>
										<option value="1">제목</option>
										<option value="2">내용</option>
										<option value="3">제목+내용</option>
										<option value="4">작성자</option>
									</select>
									<input type="text" placeholder="검색할 값을 입력하세요" id="search_board" name="search_board">
									<a href="#" id="search_btn"><img alt="검색" src="../images/search2.png"></a>
									<!-- class="board_btn btn_search" -->
								</div>
								<div class="board_pagination">
									<ul class="pagination">
										<li class="active">
											<a href="#">
												<i class="fas fa-angle-double-left"></i>
											</a>
										</li>
										<li class="active">
											<a href="#">
												<i class="fas fa-angle-left"></i>
											</a>
										</li>
										<li class="active">
											<a href="#">1</a>
										</li>
										<li class="active">
											<a href="#">2</a>
										</li>
										<li class="active">
											<a href="#">3</a>
										</li>
										<li class="active">
											<a href="#">4</a>
										</li>
										<li class="active">
											<a href="#">5</a>
										</li>
										<li class="active">
											<a href="#">6</a>
										</li>
										<li class="active">
											<a href="#">...</a>
										</li>
										<li class="active">
											<a href="#">
												<i class="fas fa-angle-right"></i>
											</a>
										</li>
										<li class="active">
											<a href="#">
												<i class="fas fa-angle-double-right"></i>
											</a>
										</li>
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