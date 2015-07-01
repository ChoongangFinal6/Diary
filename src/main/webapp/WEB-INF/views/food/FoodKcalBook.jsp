<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

 	<div style="width: 800px;">
		<div style="width: 800px;">
			<div style="font-size: 20px; width: 400px; float: left;">칼로리북</div>
			<div style="width: 400px; float: right;">카테고리:</div>
		</div>

		<div>
			<c:set var="i" value="0" />
			<c:set var="j" value="0" />
			<table>
				<c:forEach var="list1" items="${dlist}">
				<tr>
					<td bgcolor="gray" width="100px" valign="top">
						${i}/${MenuList1.get(i).foodType}
						<c:set var="i" value="${i+1 }" />
					</td>
					
				 	<td>
						<table style="background-color: lime">
							<tr>
							<c:forEach var="menu" items="${list1}">
								<td style="background-color: pink">
									${j}/${menu.foodKind}
									<c:set var="j" value="${j+1 }" />
								</td>
								<c:if test="${j%3==0}">
									</tr><tr>
								</c:if>
							</c:forEach>
							</tr>
						</table>
							
						
						
						<c:set var="j" value="0" />
					</td>
					
					
				</tr>
				</c:forEach>
			</table>
			<%-- <c:set var="i" value="0" /> --%>
		</div>
		
		
		
	</div>



<%-- 	<div style="width: 800px;">
		<div style="width: 800px;">
			<div style="font-size: 20px; width: 400px; float: left;">칼로리북</div>
			<div style="width: 400px; float: right;">카테고리:</div>
		</div>

		<div style="float: left;">
			<c:set var="i" value="0" />
			<table>
				<tr>
					<td rowspan="10" width="300px" valign="top">한식</td>
					<c:forEach var="menu0" items="${Menu0}">
						<c:set var="i" value="${i+1 }" />
						<td width="500px">${menu0.foodKind}</td>
						<c:if test="${i%3 ==0 }">
							<tr>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<c:set var="i" value="0" />
		</div>

		<div style="float: left;">
			<c:set var="i" value="0" />
			<table>
				<tr>
					<td rowspan="10" width="300px" valign="top">중식</td>
					<c:forEach var="menu1" items="${Menu1}">
						<c:set var="i" value="${i+1 }" />
						<td width="500px">${menu1.foodKind}</td>
						<c:if test="${i%3 ==0 }">
							<tr>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<c:set var="i" value="0" />
		</div>
		<div style="float: left;">
			<c:set var="i" value="0" />
			<table>
				<tr>
					<td rowspan="10" width="300px" valign="top">일식</td>
					<c:forEach var="menu2" items="${Menu2}">
						<c:set var="i" value="${i+1 }" />
						<td width="500px">${menu2.foodKind}</td>
						<c:if test="${i%3 ==0 }">
							<tr>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<c:set var="i" value="0" />
		</div>

		<div style="float: left;">
			<c:set var="i" value="0" />
			<table>
				<tr>
					<td rowspan="10" width="300px" valign="top">양식</td>
					<c:forEach var="menu3" items="${Menu3}">
						<c:set var="i" value="${i+1 }" />
						<td width="500px">${menu3.foodKind}</a></td>
						<c:if test="${i%3 ==0 }">
							<tr>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<c:set var="i" value="0" />
		</div>
		<div style="float: left;">
			<c:set var="i" value="0" />
			<table>
				<tr>
					<td rowspan="10" width="300px" valign="top">분식</td>
					<c:forEach var="menu4" items="${Menu4}">
						<c:set var="i" value="${i+1 }" />
						<td width="500px">${menu4.foodKind}</a></td>
						<c:if test="${i%3 ==0 }">
							<tr>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<c:set var="i" value="0" />
		</div>
		<div style="float: left;">
			<c:set var="i" value="0" />
			<table>
				<tr>
					<td rowspan="10" width="300px" valign="top">간식</td>
					<c:forEach var="menu5" items="${Menu5}">
						<c:set var="i" value="${i+1 }" />
						<td width="500px">${menu5.foodKind}</a></td>
						<c:if test="${i%3 ==0 }">
							<tr>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<c:set var="i" value="0" />
		</div>


	</div>






 --%>

</body>
</html>