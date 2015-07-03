<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">

//$('.menuKind').each(function(index){
$(function(){
	$('span').click(function(){
		var param = "kindCode="+$(this).attr('id');
		alert(param);
		var num = $(this).attr('id').substring(0,1);
		
		/* var foodDetail = $("#foodDetail").attr("id");
		alert(foodDetail); */
		
		$.ajaxSetup({
			type: 'POST',
			url: 'FoodList.html',
			dataType: 'text',
			success : function(result){
				$('#foodDetail' + num).html(result);
			}
				
		}); 
		$.ajax({data:param});
	});
});

</script>
</head>
<body>

 	<div style="width: 800px;">
		<div style="width: 800px;">
			<div style="font-size: 20px; width: 400px; float: left;">칼로리북</div>
			<div style="width: 400px; float: right;">카테고리:</div>
		</div>

		<div>
			<c:set var="j" value="0" />
			<c:set var="i" value="0" />
			<table>
				<c:forEach var="list1" items="${dlist}">
			
				<tr>
					<td  width="100px" valign="top">
						  ${MenuList1.get(i).foodType}
						<c:set var="i" value="${i+1 }" />
					</td>
					
				 	<td>
						<table >
							<tr>
							<c:forEach var="menu" items="${list1}">
								<td style="background-color: pink">
									<%-- <a href="FoodList.html?kindCode=${menu.kindCode}"> --%>
									<span class="menuKind" id="${menu.kindCode}">${menu.foodKind}</span>
									<!-- </a> -->
								
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
				<tr >
			    <td colspan="8" id="foodDetail${i}"></td>
			    </tr>		
				</c:forEach>
			</table>
		</div>
		
		
		
	</div>




</body>
</html>