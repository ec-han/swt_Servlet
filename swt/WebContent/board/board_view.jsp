<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="../css/board_view.css?v=1"> 
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
							</div>
							
							<div class="box-body">
								<table class="table table-boarded">
									<caption>Q&A 게시글</caption>
									<thead>
										<tr>
											<th>
												<div class="tb_center">냉침해도 되나요?</div>
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
													<img class="btn_img btn_good" alt="좋아요" src="${path}/images/good.png">
													<span class="good_cnt">
														7
													</span>
												</div>
											</td>
											<td>
												<!-- 조회수 -->
												
												<div class="text_center">
													<img class="btn_img btn_hits" alt="조회수" src="${path}/images/hits.png">
													<span>7</span>
												</div>
											</td>
											<td>
												<!-- 첨부-->
												<div class="text_center">
													<!-- <i class="fas fa-sticky-note"></i> -->
													<img class="btn_img btn_att" alt="첨부파일" src="${path}/images/attachment1.png">
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<a href="#">
									<img id="btn_regi" alt="게시글 수정" src="${path}/images/regi.png">
								</a>
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