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
				"댓글 "
				<span id="note-count">${replyList.size()}</span>
			</h3>
		</li>
		
		<c:if test="${replyList.size() ==  0}">
			<li class="list-group-item note-item clearfix">
				<h5>
					"등록된 댓글이 없습니다. 첫 번째 댓글을 남겨주세요:)"
				</h5>
			</li>
		</c:if>
		
		<c:forEach items="${replyList}" var="replyview">
			<li class="list-group-item note-item clearfix">
				<div class="content-body panel-body pull-left">
					<div class="avatar avatar-medium clearfix">
						<a href="#" class="avatar-photo">
							<img alt="사진" src="${path}/images/avatar_tea.png">
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
					<p>
						<a href="#" id="note-create-delete-btn" class="bd-btn btn-default btn-wide" style="">삭제</a>
					</p>
					<input type="submit" name="create" id="btn-modify-btn" class="bd-btn btn-default btn-wide" value="수정" disabled="disabled">
				</div>
			</li>
		</c:forEach>
		
		
		
		<li class="list-group-item note-item clearfix">
			<div class="content-body panel-body pull-left">
				<div class="avatar avatar-medium clearfix">
					<a href="#" class="avatar-photo">
						<img alt="사진" src="${path}/images/avatar1.png">
					</a>
					<div class="avatar-info">
						<a class="nickname" href="#">은체</a>
					</div>
				</div>
				<fieldset class="fform">
					<input type="hidden" name="" value="HTML">
					<textarea rows="1" cols="1" placeholder="댓글쓰기" class="form-control"></textarea>
				</fieldset>
			</div>
			<div class="content-function-cog note-submit-buttons clearfix">
				<p>
					<a href="#" id="note-create-cancel-btn" class="bd-btn btn-default btn-wide" style="">취소</a>
				</p>
				<input type="submit" name="create" id="btn-create-btn" class="bd-btn btn-default btn-wide" value="등록" disabled="disabled">
			</div>
		</li>
		<li class="list-group-item note-item clearfix">
			<h5>
				<a href="#" class="link">로그인</a>"을 하시면 댓글을 등록할 수 있습니다."
			</h5>
		</li>
	</ul>
</body>
</html>