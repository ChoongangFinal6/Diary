<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:if test="${warningEmail != null}">
	<script type="text/javascript">
		alert('${warningEmail}' + "님.\n오늘의 다이어리가 이미 작성되어 있습니다.\n다이어리를 수정하거나 삭제해주세요.");
	</script>
</c:if>
<body>
	<c:forEach var="dList" items="${diaryList }">
		${dList.dNo } / ${dList.dTitle } / ${dList.dDay }
	</c:forEach>
	<input type="button" value="다이어리 쓰기" onclick="location.href='DiaryWrite.html'"/>
</body>
</html>