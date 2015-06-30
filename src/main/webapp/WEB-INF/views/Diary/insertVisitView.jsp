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
		var params = "dNo=" + $('#dNo').val() + "&mNo=" + $('#mNo').val();
			params += "&pCode=" + $('#pCode').val() + "&tWork=" + $('#tWork').val();
			params += "&time1=" + $('#time1').val() + "&time2=" + $('#time2').val();
		$.get("insertVisit.html", params, function(data) {
			console.log(data);
			  if(data == 1){
				  alert("입력에 성공하셨습니다.")
			  }else{
				  alert("입력에 실패하셨습니다.")
			  }
			self.close();
		});
	}); 
	$('#insertVisitClose').click(function(){
		self.close();
	});
});
</script>
</head>
<body>
	<h1>오늘 내가 한 일</h1>
		<input type="hidden" id="pCode" value="${pCode }">
		<input type="hidden" id="dNo" value="${dNo }">
		<input type="hidden" id="mNo" value="${mNo }">
		<input type="text" id="" placeholder="오늘 한 일" required="required"><br>
		시간 <input type="time" id="time1" required="required">
		<input type="time" id="time2" required="required"><br>
		<input type="button" id="insertVisit" value="확인">
		<input type="button" id="insertVisitClose" value="취소">
</body>
</html>