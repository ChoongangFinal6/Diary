<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="template.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container{
	width:800px;
	margin:0 auto;
}
header {
	height : 100px;
	background-color: #f0f0f0;
}

section {
	min-height: 800px;
}

footer {
	height: 100px;
	background-color: #f0f0f0;
}
</style>
</head>
<c:if test="${warningEmail != null}">
	<script type="text/javascript">
		alert('${warningEmail}'
				+ "님.\n오늘의 다이어리가 이미 작성되어 있습니다.\n다이어리를 수정하거나 삭제해주세요.");
	</script>
</c:if>
<body>

<div id="container">
	<header>
		<jsp:include page="\template\diary_top.jsp" />
	</header>

	<section>
		<article>
			<jsp:include page="${viewPage}" />
		</article>
	</section>

	<footer>
		<jsp:include page="\template\diary_bottom.jsp" />
	</footer>
</div>

</body>
</html>