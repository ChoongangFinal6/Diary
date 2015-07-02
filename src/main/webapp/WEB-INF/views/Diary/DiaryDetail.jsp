<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#JSONtest').click(function(){
		/*var root = "http://localhost:8181/diary";
		alert(root); */
		//var url = root + "/placeAll.html";

		var iwContent = "";
		
		
		
		var params = "dNo=" + $('#dNo').val();
		/* $.post("placeAll.html", params, function(data) {
			  alert(data);
		}); */
		
		$.getJSON("placeAll.html", params, function (data) {
			alert(data);
			$.each(data.paceAll, function (index, pdto) {
				var ptype = pdto.ptype;
				var pname = pdto.pname;
				var pimg = pdto.pimg;
				var pmapx = pdto.pmapx;
				var pmapy = pdto.pmapy;
				
				iwContent += "<div style='padding:5px;'>pname : " + pname + ", pMapX : " + pmapx + ", pmapy : " + pmapy + "</div>";
				$('#div').html(iwContent);
			});
		});
		
	});
});
</script>
</head>
<body>
<input type="button" id="JSONtest" value="해당 JSON보기">
<div id="div"></div>
<input type="hidden" id="dNo" name="dNo" value="2">

</body>
</html>