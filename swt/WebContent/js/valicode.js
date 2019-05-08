function memIdCheck(){ 
	//uname을 $('#name')으로 바꿈 
	var name = $.trim($('#name').val());
	var nameReg = RegExp(/^[가-힣]{2,4}$/);
		if(name == '' || name.length == 0) {
			//둘이 비슷한 표현이지만 더 디테일 함 
				$('.err_msg').eq(3).css('display','block').text('필수입력 정보입니다.').css('color','tomato');
				$('#name').val('');
				return false; 
		} else if(!nameReg.test(name)) {
			$('.err_msg').eq(3).css('display','block').text('올바른 값을 입력하세요.').css('color','tomato');
				return false; 
		} else {
			$('.err_msg').eq(3).css('display','block').text('멋진 이름이네요!').css('color','dodgerblue');
		}
}