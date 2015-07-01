<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<table>
	<tr>
		<td>음식명</td><td>이미지</td><td>칼로리(kcal)</td><td>목측량(1개,1인분)</td><td>분량(g)</td>
	</tr>
  <c:forEach var="food" items="${foodList}">
     <tr>
		<td>${food.foodName}</td><td>${food.foodIamge}</td>
		<td>${food.kcal}<td><td>${food.amount}<td><td>${food.gram}<td>
	</tr>
  </c:forEach>

</table>



</body>
</html>