<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/food.css" rel="stylesheet" type="text/css">    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table style="width: 450px;">
	<tr>
		<th>음식명</th><th>이미지</th><th>칼로리(kcal)</th><th>목측량(1개,1인분)</th><th>분량(g)</th>
	</tr>
  <c:forEach var="food" items="${foodList}">
     <tr>
		<td>${food.foodName}</td><td><img alt="foodImage" src="${food.foodImage}" width="70px"height="50px"> </td>
		<td>${food.kcal}</td><td>${food.amount}</td><td>${food.gram}</td>
	</tr>
  </c:forEach>

</table>



</body>
</html>
