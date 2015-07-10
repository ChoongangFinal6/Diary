<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#joinFormBlock {
	width:300px;
	margin:100 auto;
	padding: 20 20 20 20;
	border-radius: 5px; 
	-moz-border-radius: 5px; 
	-webkit-border-radius: 5px; 
	border: 0px solid #FFFFFF;
	background-color: #CCCCCC;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="joinFormBlock">
		<h2>회원가입</h2>
		<form action="memberJoinPro.html">
			<table>
				<tr>
					<td>E-Mail</td>
					<td><input type="email" name="mEmail" required="required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="mName" required="required"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="mPass" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><button>확인</button></td>
				</tr>
			</table>
			
		</form>
	</div>
</body>
</html>
