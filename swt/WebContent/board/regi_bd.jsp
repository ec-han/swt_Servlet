<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/board_regi.css?v=1">
<title>게시글 등록</title>
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
											<th>
												<div class="tb-left">제목</div>
												<fieldset class="fform">
													<input type="hidden" name="" value="HTML">
													<textarea rows="1" cols="1" placeholder="제목" class="form-control"></textarea>
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
															<input type="hidden" name="" value="HTML">
															<textarea rows="1" cols="1" placeholder="내용" class="form-control"></textarea>
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
													<input type="hidden" name="" value="HTML">
													<textarea rows="1" cols="1" placeholder="작성자" class="form-control"></textarea>
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
										<a href="#">
											<img class="bd-btns" id="btn_regi" alt="게시글 등록" src="${path}/images/regi.png">
										</a>
									</div>
									
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