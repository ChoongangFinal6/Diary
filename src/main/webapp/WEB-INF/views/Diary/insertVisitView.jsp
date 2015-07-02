<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">

$(function(){	
	$('#insertVisit').click(function(){
		if($('#tWork').val() == "" || $('#tWork').val() == null){
			$('#warning').html("<font color='red'>오늘 한일을 입력하셔야합니다.</font>");
		}else if($('#time1').val() == ""){
			$('#warning').html("<font color='red'>시작 시간을 입력하셔야합니다.</font>");
		}else if($('#time2').val() == ""){
			$('#warning').html("<font color='red'>끝난 시간을 입력하셔야합니다.</font>");
		}else{
			var params = "dNo=" + $('#dNo').val() + "&mEmail=" + $('#mEmail').val();
			params += "&pName=" + $('#pName').val() + "&tWork=" + $('#tWork').val();
			params += "&time1=" + $('#time1').val() + "&time2=" + $('#time2').val();
			$.get("insertVisit.html", params, function(data) {
				console.log(data);
				  if(data == 1){
					alert("입력에 성공하셨습니다.")
					$(opener.document).find("#bgDisplay").css({"width":0,"height":0});
					//self.close();
			//		validNavigation = true;
					self.close();
				  }else if(data == 2){
					$('#warning').html("<font color='red'>끝난 시간이 시작 시간보다 빠를 수 없습니다.</font>");
					//alert("끝난 시간이 시작 시간보다 빠를 수 없습니다.")
				  }else if(data == 3){
					$('#warning').html("<font color='red'>끝난 시간이 오늘을 넘길 수 없습니다.</font>");
				  }else{				  
					alert("입력에 실패하셨습니다.")				  
				  }
			});
		}
	}); 
	$('#insertVisitClose').click(function(){
		$(opener.document).find("#bgDisplay").css({"width":0,"height":0});
		//self.close();
	//	validNavigation = true;
		self.close();
	});
});
</script>
</head>
<body>
	<h1>오늘 내가 한 일</h1>
		<input type="hidden" id="pName" value="${pName }">
		<input type="hidden" id="dNo" value="${dNo }">
		<input type="hidden" id="mEmail" value="${mEmail }">
		<input type="text" id="tWork" placeholder="오늘 한 일" required="required"><br>
		시간 <input type="time" id="time1" required="required">
		<input type="time" id="time2" required="required">
		<div id="warning"></div>
		<br>
		<input type="button" id="insertVisit" value="확인">
		<input type="button" id="insertVisitClose" value="취소">
</body>
</html>