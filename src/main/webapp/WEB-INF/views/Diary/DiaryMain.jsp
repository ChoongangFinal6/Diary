<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == 0 }">
<script type="text/javascript">
	alert("다이어리가 등록되지 않았습니다");
</script>
</c:if>
	<input type="button" value="다이어리 쓰기" onclick="location.href='DiaryWrite.html'"/>
</body>
</html>