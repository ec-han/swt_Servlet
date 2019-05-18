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
												<div class="tb-center">[질문] 냉침해도 되나요</div>
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
															" 2019-05-16"
														</span>
													</div>
													<div class="name01">
														<span>
															<strong>작성자 :</strong>
															" 은체 "
														</span>
													</div>
													<div class="good01 text_center">
														<img class="btn_img btn_good" alt="좋아요" src="${path}/images/good.png">
														<span class="good_cnt">
															"7"
														</span>
													</div>
													<div class="hits01 text_center">
														<img class="btn_img btn_hits" alt="조회수" src="${path}/images/hits.png">
														<span>"15"</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="data-bd-cont">
													<span class="detail_wr">
														<br>
														자스민펄을 구입했는데 냉침해도 되나요?
														<br> 
														된다면 몇 분 우려내야 하나요?
													</span>
												</div>
											</td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<!-- <td scope="row">첨부파일</td>
											<td>
												자스민펄.jpg
											</td> -->
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

<%-- <!-- 좋아요 -->
<div class="">
	
</div> --%>
<%-- <!-- 조회수 -->
<div class="text_center">
	<img class="btn_img btn_hits" alt="조회수" src="${path}/images/hits.png">
	<span>7</span>
</div> --%>
<%-- <!-- 첨부-->
<div class="text_center">
	<img class="btn_img btn_att" alt="첨부파일" src="${path}/images/attachment1.png">
</div> --%>