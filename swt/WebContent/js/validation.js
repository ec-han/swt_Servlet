// 유효성 체크 모듈화 
var joinValidate = {
		// 결과 메시지 출력 시 사용하는 Text
		resultCode : {
			// 공통 
			empty_val : {
				code : 1,
				desc : '필수입력 정보입니다'
			},
			space_length_val : {
				code : 2,
				desc : '공백없이 입력해주세요'
			},
			// ID
			success_id : {
				code : 0,
				desc : '사용가능한 아이디입니다'
			},
			invalid_id : {
				code : 3,
				desc : '올바른 ID를 입력해주세요'
			},
			length_id : {
				code : 4,
				desc : 'ID는 공백없이 6자 이상~15자 이하여야 합니다'
			},
			overlap_id : {
				code : 5,
				desc : '중복된 ID 입니다'
			},
			// PW
			success_pw : {
				code : 0,
				desc : '사용가능한 비밀번호 입니다'
			},
			invalid_pw : {
				code : 3,
				desc : '올바른 비밀번호(4~12자)를 입력해주세요'
			},
			other_pw : {
				code : 4,
				desc : '입력하신 비밀번호와 일치하지 않습니다'
			},
			// name
			success_name : {
				code : 0,
				desc : '멋진 이름이네요'
			},
			invalid_name : {
				code : 3,
				desc : '이름은 표준한글만 입력가능합니다'
			},
			length_name : {
				code : 4,
				desc : '이름은 공백없이 2자 이상~4자 이하만 가능합니다'
			},
			// phone
			success_phone : {
				code : 0,
				desc: '사용가능한 휴대폰 번호입니다'
			},
			invalid_phone : {
				code : 3,
				desc : '유효하지 않은 휴대폰 번호입니다'
			},
			number_phone : {
				code : 4,
				desc : '숫자만 입력해주세요'
			},
			// email
			success_email : {
				code : 0,
				desc : '사용가능한 이메일이네요'
			},
			invalid_email : {
				code : 3,
				desc : '올바른 값을 입력해주세요'
			}
		},
		checkId : function(memId) {
			var regEmpty = /\s/g; // 공백 문자 
			var reg = /[^a-z0-9-_.]+/g; // ID 유효성 체크 
			
			// 4. member.jsp에서 전달한 매개변수 memId로 유효성체크 시작
			// 1) null값 체크 				if
			// 2) 값 사이의 공백값 체크 		else if
			// 3) 유효한 값인지 체크(정규식) 	else if
			// 4) 6자~15자 이내 길이 체크 	else if
			// 5) 성공: 유효한 값(중복값체크x)else 
			if(memId == ""||memId.length==0){ // this : this는 상위 호출. 즉, joinValidate 
				return this.resultCode.empty_val;
			} else if(memId.match(regEmpty)) {
				return this.resultCode.space_length_val;
			} else if(reg.test(memId)) {
				return this.resultCode.invalid_id;
			} else if(memId.length<6||memId.length>15) {
				return this.resultCode.length_id;
			} else {
				// 5. 입력받은 값이 haneunche94로 위의 유효성체크 4단계를 통과 
				//	   하지만 아직 중복된 ID인지 검정 필요
				// 6. return 결과값으로 success_id(code, desc)를 호출한 곳으로 전송!!
				//	  code: 0, desc: '사용가능한 아이디입니다'
				return this.resultCode.success_id;
			}
		},
		checkPw : function(memPw,memRpw) {
			var regEmpty = /\s/g; // 공백 문자
			var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 비밀번호 체크
			
			if(memPw == ""||memPw.length==0){
				return this.resultCode.empty_val;
			} else if(memPw.match(regEmpty)) {
				return this.resultCode.space_length_val;
			} else if(!pwReg.test(memPw)) {
				return this.resultCode.invalid_pw;
			} else {
				return this.resultCode.success_pw;
			}
		},
		checkRpw : function(memPw,memRpw) {
			var regEmpty = /\s/g; // 공백 문자
			var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 비밀번호 체크
			
			if(memRpw == ""||memRpw.length==0){
				return this.resultCode.empty_val;
			} else if(memRpw.match(regEmpty)) {
				return this.resultCode.space_length_val;
			} else if(!pwReg.test(memRpw)) {
				return this.resultCode.invalid_pw;
			} else {
				return this.resultCode.success_pw;
			}
			
		}
		
}

// ID 중복체크 Ajax
function ajaxCheck(memId){
	// 10. ajax 시작! 
	//		목적지: idCheck.swt
	//		전달데이터: memId 데이터를 id변수에 담아 전달. 
	//		데이터 포장방법: json
	//		데이터 전달방법: POST방식 
	//		결론: web.xml로 이동!
	
	// id에 값이 있는 경우에만 ajax 동작! : 중복체크 
	$.ajax({
		url: "idCheck.swt",
		type: "POST",
		dataType: "json",
		data: "id="+memId,
//		<1>. <input type="text" value=memID name="id">
//		<2>. Ajax>> data: "id="+memid,
//		<3>. 쿼리스트링: "idCheck.swt?id="+memId
//		<1>,<2>,<3> 다 똑같음 Controller단에서 받을 때
//		String id = request.getParmeter("id"); 이렇게 받으면 다 똑같은거임 
		
		
		success: function(data) {
			// 29. Action단에서 전송한 message, id를 data 매개변수로 받음 
			// 30. data.message의 값이 -1이면 => 중복메시지 출력 
			//     data.message의 값이 1이면 => 사용가능메시지 출력
			// 아직 끝나지 않음! 호출한 곳으로 돌아가야 함. 
			if(data.message == "-1"){
				$("#error_id").css("display","block").css("color","#b30000").text("중복된 ID 입니다");
				return "-1";
			}else {
				$("#error_id").css("display","block").css("color","dodgerblue").text("멋진 아이디네요");
				return "1";
			}
			
		},
		error: function(){// success탔으면 error안탐. error탔으면 success안 탐. 둘 중 하나만 탐. 
			alert("System Error!!!");
		}
	});
}




function ajaxPwCheck(nowId, nowPw){
	var return_val = false;
	$.ajax({
		url: 'pwCheck.swt',
		type: 'POST',
		dataType: 'json',
		async: false,
		data: 'id='+nowId+'&pw='+nowPw,
		success: function(data) {
			if(data.flag){
				$(".pwAjax").css('color','dodgerblue').css('display','block').text('비밀번호가 일치합니다.');
				return_val = true;
			} else {
				$(".pwAjax").css('color','#b30000').css('display','block').text('비밀번호가 일치하지 않습니다.');
				return_val = false;
			}
		},
		error: function(){
			alert("System Error!!!");
		}
	});
	return return_val;
}




