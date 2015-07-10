<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>HOME</h1>
	<%-- <c:forEach var="dList" items="${diaryList }">
		${dList.dNo } / ${dList.dTitle } / ${dList.dDay }
		<button onclick="location.href='diaryUpdate.html?dNo=${dList.dNo}'">수정</button>
		<button onclick="location.href='diaryCancel.html?dNo=${dList.dNo}'">삭제</button><br>
	</c:forEach> --%>
	<input type="button" value="다이어리 쓰기" onclick="location.href='DiaryWrite.html'"/>
	<br>
	<br>
	<button onclick="location.href='DiaryMain.html'">다이어리 메인으로</button>
	<button onclick="location.href='FoodKcalBook1.html'">FoodKcalBook1</button>
</body>
</html>