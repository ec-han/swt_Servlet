<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글목록</title>
</head>
<body>
	<ul class="list-group">
		<li id="note-title" class="list-group-item note-title">
			<h3 class="panel-title">
				댓글 
				<span id="note-count">${replyList.size()}</span>
			</h3>
		</li>
		
		<c:if test="${replyList.size() ==  0}">
			<li class="list-group-item note-item clearfix">
				<h5>
					등록된 댓글이 없습니다. 첫 번째 댓글을 남겨주세요:)
				</h5>
			</li>
		</c:if>
		
<!-- forEach는 items의 갯수(사이즈)가 0이면 반복 아예 안함. -->
		<c:forEach items="${replyList}" var="replyview">
			<li class="list-group-item note-item clearfix">
				<div class="content-body panel-body pull-left">
					<div class="avatar avatar-medium clearfix">
						<a href="#" class="avatar-photo">
							<img alt="사진" src="${path}/images/avatar_tea.png">
							<%-- <img alt="사진" src="${path}/images/avatar1.png"> --%>
						</a>
						<div class="avatar-info">
							<a class="nickname" href="#">${replyview.writer}</a>
							<div class="date-created">
								<span class="timeago">
									<fmt:formatDate pattern="yyyy.MM.dd hh:mm:ss" value="${replyview.regdate}"/>
								</span>
								
							</div>
						</div>
					</div>
					<fieldset class="fform">
						<article>
							<p>${replyview.content}</p>
						</article>
					</fieldset>
				</div>
				<div class="content-function-cog note-submit-buttons clearfix">
					<c:if test="${sessionScope.loginUser.id == replyview.writer}">
						<p>
							<a id="note-create-delete-btn" class="bd-btn btn-default btn-wide reply-del" style="" data_num="${replyview.rno}">삭제</a>
						</p>
															<!-- data_ㅇㅇㅇ: 태그에다가 저장소(변수)를 하나 만듦. ㅇㅇㅇ안에 변수이름 짓듯 맘대로 지음 됨 -->
					</c:if>
					<input type="hidden" name="create" id="btn-modify-btn" class="bd-btn btn-default btn-wide" value="수정">
				</div>
			</li>
		</c:forEach>
		
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<li class="list-group-item note-item clearfix">
					<h5>
						<a href="#" class="link">로그인</a>을 하시면 댓글을 등록할 수 있습니다.
					</h5>
				</li>
			</c:when>
			<c:otherwise>
				<form action="replyAdd.swt" method="POST" name="frm_reply" id="frm_reply">
					<li class="list-group-item note-item clearfix">
						<div class="content-body panel-body pull-left">
							<div class="avatar avatar-medium clearfix" id="comment_area_div">
								<a href="#" class="avatar-photo">
									<img alt="사진" src="${path}/images/avatar1.png">
								</a>
								<div class="avatar-info">
									<a class="nickname" href="#">은체</a>
								</div>
							</div>
							<fieldset class="fform">
								<input type="hidden" name="" value="HTML">
								<textarea rows="1" cols="1" placeholder="댓글쓰기" class="form-control" id="replyInsert" name="re_textarea" style='width:100%; min-width:260px;'></textarea>
								<script type="text/javascript">
									var oEditors = [];
									nhn.husky.EZCreator.createInIFrame({
									 oAppRef: oEditors,
									 elPlaceHolder: "replyInsert",
									 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
									 fCreator: "createSEditor2"
									});
								</script>
							</fieldset>
						</div>
						<div class="content-function-cog note-submit-buttons clearfix">
							<p>
								<a href="#" id="note-create-cancel-btn" class="bd-btn btn-default btn-wide" name="re_textarea" style="">취소</a>
							</p>
							<input type="button" name="create" id="btn-create-btn" class="bd-btn btn-default btn-wide" value="등록">
							
							<input type="hidden" name="re_writer" value="${sessionScope.loginUser.id}">
							<input type="hidden" id="re_bno" name="re_bno">
						
						</div>
					</li>
				</form>
			</c:otherwise>
		</c:choose>
		
	</ul>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('.link').click(function(){
			$('#modal_all').css('display','flex');
			$('#login_id').focus();
		});
	});
	

</script>
</html>