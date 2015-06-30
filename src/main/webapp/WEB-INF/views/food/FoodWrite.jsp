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
	$('#typeCode').change(function(){
		var param = "typeCode="+$(this).val();
		$.ajaxSetup({
			method : 'get',
			url:'menu.html', 
			dataType:'text',
			success:function(result){
				   $('#kindCode').html(result) 
		    }	
		  });
	 	$.ajax({data : param});
	});
	
});

</script>
</head>
<body>
	<h2><메뉴등록></h2>
	<form action="" method="post" enctype="multipart/form-data">
		<div>
			<div>종류코드</div>
			<div>
		        <select name="typeCode" id="typeCode" required="required">
		        <option value="">선택</option>
				<option value="10">한식</option>
				<option value="20">중식</option>
				<option value="30">일식</option>
				<option value="40">양식</option>
				<option value="50">분식</option>
				<option value="60">간식</option>
	    	    </select>
			</div>
		</div>
		<div>
			<div>타입코드</div>
			<div>
				<select name="kindCode" id="kindCode" required="required">
				<option value="">선택</option>				
				</select>			
			</div>
		</div>	
		<!-- <div>
			<div>음식 코드</div>
			 <div>
			 	<input type="number" name="foodCode" required="required">
			 </div>
		</div> -->
		<div>
			<div>음식명</div>
			<div>
				<input type="text" name="foodName" required="required">
			</div>
		</div>
		<div>
			<div>음식이미지</div>
			<div>
				<input type="button" name="foodImage" value="이미지첨부" required="required">
			</div>
		</div>
		<div>
			<div>칼로리(kcal)</div>
		   	<div>
				<input type="number" name="kcal" required="required">
	 	   </div>
		</div>
		
		<div>
			<div>목측량</div>
		 	<div>
			  	<input type="number" name="amount" required="required">
		 	</div>
		</div>
		<div>
			<div>분량(g)</div>
			<div>
				<input type="number" name="gram" required="required">
		    </div>
		</div>
		<input type="submit" value="확인">
	</form>





</body>
</html>