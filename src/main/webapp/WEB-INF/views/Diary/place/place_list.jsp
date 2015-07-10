<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../template.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#placeListTitle{
	background-color: #eeeeee;
	width: 100%;
	height: 40px;
}

.placeCell {
	width: 300px;
	height: 50px;
}

.placeImg {
	max-height: 40px;
	max-width: 40px;
}

.placeName {
	width: 150px;
	font-weight: bold;
}

#exitBtn {
	position: fixed;
	top: 0;
	right: 0;
	width: 40px;
	height: 40px;
	background-image: url("resources/images/exit.png");
	background-size: 40px 40px;
}

#pageBlock {
	width : 280;
	margin : 0 0 0 0;
	padding : 0 10 10 10;
	bottom : 0;
	position: fixed;
	background: #eeeeee;
}

</style>
<script type="text/javascript">
	// 클릭시 부모창에서 해당 장소 표시
	function moveToLocation(pName){
		opener.name='pareWin';
		opener.placeInserted(pName);
	}

	// 장소정보의 오류를 신고
	function errorReport(pName){
		if(confirm(" "+pName+'에 대한 정보의 수정을 \n 요청하시겠습니까?')){
			// 신고 처리
		}
	}

</script>
</head>
<body style="margin:0 0 0 0">
	<div id="placeListTitle">
		<h3>등록 장소 목록</h3>
		<span id=exitBtn onclick="window.close()"></span>
	</div>
	<table style="width: 100%">
	<c:forEach var="place" items="${pList}">
		<tr  class="placeCell">
			<td style="text-align: center; width: 50px">
				<img src="resources/upload/place/${place.pImg}" class="placeImg">
			</td>
			<td  class="placeName">
				${place.pName}
			</td>
			<td style="text-align: right;">
				<button onclick="moveToLocation('${place.pName}')">이동</button><br>
				<button onclick="errorReport('${place.pName}')">신고</button>
			</td>
		</tr>
	</c:forEach>
	</table>
	
	<div id="pageBlock">
		<c:if test="${ startPage > blockSize }">
			<a href='listPlace.html?pageNum=${ startPage - 1 }'>[이전]</a>
		</c:if>

		<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
			<c:if test="${pageNum == i }">
				<b>
			</c:if>
			<a href='listPlace.html?pageNum=${i}' id="${i}page">[${ i }]</a>
			<c:if test="${ pageNum == i }">
				</b>
			</c:if>
		</c:forEach>

		<c:if test="${endPage < pageCnt }">
			<a href='listPlace.html?pageNum=${ startPage + blockSize }'>[다음]</a>
		</c:if>
		
		<button onclick="opener.addNewPlace(); window.close();" style="position:absolute; right:0;">새로 등록</button>
	</div>
</body>
</html>