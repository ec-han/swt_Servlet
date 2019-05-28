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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/css/board_regi.css?v=1">
<title>게시글 수정</title>
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
							<form class="modify_form" id="modify_frm" method="POST" action="modifyPlay.swt" enctype="multipart/form-data">
								<div class="box-body">
									<table class="table-boarded">
										<caption>QnA 게시글</caption>
										<thead>
											<tr>
												<th>
													<div class="tb-left">제목</div>
													<fieldset class="fform">
														<input name="modi_title" class="form-control" id="modi_title" value="${one.title}">
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
																	<textarea rows="1" cols="1" placeholder="내용" class="form-control" id="boardListModify" name="boardListModify" style='width:100%; min-width:260px;'><el>${one.content}</el></textarea>
																	<script type="text/javascript">
																		var oEditors = [];
																		nhn.husky.EZCreator.createInIFrame({
																		 oAppRef: oEditors,
																		 elPlaceHolder: "boardListModify",
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
														<input class="form-control" name="modi_writer" id="modi_writer" value="${sessionScope.loginUser.id}" readonly="readonly">
														
													</fieldset>
												</td>
											</tr>
										</tfoot>
									</table>
									
									<div class="btn_area">
										<div class="att_wrap">
											<!-- 기존 첨부파일 -->
											<c:if test="${one.filesize>0}">
												<div class="before_att_area">
											        <div class="before_d_file_text">
											            <img class="before_btn_img before_btn_att" alt="첨부파일" src="${path}/images/attachment2.png">	
											            <span class="before_file_name" style="padding-left: 40px;"> 
											            	${one.filename} (${one.filesize})
											            </span>
											            <span id="before_file_size"> </span>
											            <%-- <span class="before_file_x_btn">
											            	<img class="before_btn_img before_btn_att_del" alt="첨부파일 삭제" src="${path}/images/minus.png">
											            </span> --%>
											            <span class="file_msg">[첨부파일 삭제됨]</span>
											            <i class="fas fa-check open_file_btn" id="check_btn"></i>
											            <i class="fas fa-times close_file_btn close_basic_btn"></i>
											            
											        </div>
											     </div>
										    </c:if>
									
										     <!-- 글 수정 시 새로 첨부할 파일  --> 
										     <div class="att_area">
												<input type="file" name="b_file" id="b_file" style="display:none!important">
										        <div class="d_file_text">
										            <img class="btn_img btn_att" alt="첨부파일" src="${path}/images/attachment1.png">	
										            <span class="file_name" style="padding-left: 40px;"> 
										            	첨부된 파일이 없습니다. 
										            </span>
										            <span id="now_file_size"> </span>
										            <span class="file_x_btn">
										            	<img class="btn_img btn_att_del" alt="첨부파일 삭제" src="${path}/images/minus.png">
										            </span>			      
										        </div>
											</div>
										</div>
										<div class="btn_right">
											<a>
												<c:if test="${sessionScope.loginUser.id == one.writer}">
													
													<img class="bd-btns" id="btn_modi" alt="게시글 수정" src="${path}/images/regi.png">
												
												</c:if>
											</a>
										</div>
										
									</div>
								</div>
								<input type="hidden" id="basic_check" name="basic_check">
								<input type="hidden" name="hidden_bno" id="hidden_bno" value="${one.bno}">
								<input type="hidden" name="bFileName" id="bFileName" value="${one.filename}">
					            <input type="hidden" name="bFileSize" id="bFileSize" value="${one.filesize}">
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
			
			$('.btn_att').click(function(event) {
			       $('#b_file').click();
			});
			$('.file_name').click(function(event) {
			       $('#b_file').click();
			});
			
		
			$("#btn_modi").click(function(){
				
				oEditors.getById["boardListModify"].exec("UPDATE_CONTENTS_FIELD",[]); //이걸해야 스마트에디터에서 값 가져옴 
				// 첨부파일 제외하고 게시글 등록되게 하기
				var title = $("#modi_title").val();
				var content = $("#boardListModify").val();
						
				// 게시글 내용 작성자 null안되게 유효성 체크
				if(title==""||title.length==0){
					$('.step_url').text('글을 등록하려면 입력해주세요').css('display','block');
					return false;
				} else {
					$('.step_url').css('display','hidden');
				} 
				
				if(content == "<p><br></p>"){
					$('.step_url').text('글을 등록하려면 입력해주세요').css('display','block');
					return false;
				} else {
					$('.step_url').css('display','hidden');
				} 
				
				$("#modify_frm").submit();
			});
			
			// 첨부파일 삭제할때(삭제버튼 클릭시)동작
			$('.file_x_btn > img').click(function(event) {
	            $('.file_name').text("첨부된 파일이 없습니다.")
	                               .css("color", "#BDBDBD")
	                               .css("letter-spacing", "-1px");
	            $('#b_file').replaceWith($("#b_file").clone(true));
	            $('#b_file').val("");
	            $('#now_file_size').text("");
	            $('.file_x_btn > img').css("display", "none");
	       
	       });
			
			$('.before_file_x_btn > img').click(function(event) {
	            $('.before_file_name').text("첨부된 파일이 없습니다.")
	                               .css("color", "#BDBDBD")
	                               .css("letter-spacing", "-1px");
	            $('#before_b_file').replaceWith($("#before_b_file").clone(true));
	            $('#before_before_b_file').val("");
	            $('#before_now_file_size').text("");
	            $('.before_file_x_btn > img').css("display", "none");
	         
	       });
	       
	       
	       
	       $('#b_file').change(function(event) {
	            var filesize = $(this)[0].files;
	            if(filesize.length < 1){
	                  $('.file_name').text("선택된 파일 없음");
	                  $('.file_x_btn > img').css("display", "none");
	                  $("#now_file_size").text("");
	            } else {
	                  var filename = this.files[0].name;
	                  var size = this.files[0].size;
	                  var maxSize = 10 * 1024 * 1024;
	                  var mbsize = size / (1024 * 1024);
	                  
	                  if(size > maxSize){
	                       alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
	                       $(".file_name").text("선택된 파일 없음")
	                                          .css("color", "#BDBDBD")
	                                          .css("letter-spacing", "-1px");
	                       $("#b_file").val("");
	                       $("#now_file_size").text("");
	                     
	                  } else {
	                       $(".file_name").text(filename)
	                                          .css("color", "black")
	                                          .css("letter-spacing", "-1px");
	                       $('.file_x_btn > img').css("display", "inline-block");
	                    
	                       
	                       if(mbsize < 1){
	                            var kbsize = size / 1024;
	                            $("#now_file_size").text("("+kbsize.toFixed(1)+"kb)");
	                       }else{
	                            $("#now_file_size").text("("+mbsize.toFixed(1)+"mb)");
	                       }
	                  }
	            }
	       });
	       
	      
		});
		
		$(document).on('click','.close_basic_btn', function(){
			$('.file_msg').css('display','inline-block');
			$('.before_file_name').css('color',"#AAA").css('text-decoration','line-through');
			$('.close_basic_btn').css('display','none');
			$('#check_btn').css('display','inline-block');
			$('#basic_check').val('no');
		});
		
		$(document).on('click','#check_btn', function(){
			$('.file_msg').css('display','none');
			$('.before_file_name').css('color',"black").css('text-decoration','none');
			$('.close_basic_btn').css('display','inline-block');
			$('#check_btn').css('display','none');
			$('#basic_check').val('yes');
		});
	
	</script>
</body>
</html>