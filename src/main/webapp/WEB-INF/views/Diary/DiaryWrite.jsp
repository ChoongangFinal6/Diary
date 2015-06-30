<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=115e224cfdaefc58554b1435511ab0f4"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.49586416184341, 127.02920943791224), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };
		
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		var iwContent = "";
		$('#searchPlaceBtn').click(function(){
			var map = null;
			var params = "pName=" + $('#searchPlace').val();
			$.getJSON("searchPlace.html", params, function (data) {
				$.each(data.place, function (index, place) {
					var pcode = place.pcode;
					var ptype = place.ptype;
					var pname = place.pname;
					var pimg = place.pimg;
					var pmapx = place.pmapx;
					var pmapy = place.pmapy;
					
										
					mapOption = { 
					        center: new daum.maps.LatLng(pmapx, pmapy), // 지도의 중심좌표
					        level: 5 // 지도의 확대 레벨
					};

					
					
					var map = new daum.maps.Map(mapContainer, mapOption);
					
					$('#pCode').val(pcode);

					iwContent = "";
					
					//iwContent += "<div style='padding:5px;'>pname : " + pname + ", pMapX : " + pmapx + ", pmapy : " + pmapy + "</div>";
					console.log(iwContent);
					// 마커가 표시될 위치입니다 
					var markerPosition  = new daum.maps.LatLng(pmapx, pmapy); 
				
					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
						});
				
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					iwContent = '<div style="padding:15px;">'+pname+
						'<br><input type="text" id="tWork" placeholder="한일"/><br>'+
						'<input type="text" id="tTime" placeholder="시간"/><br>'
						+'<input type="button" class="insertVisitBtn" value="확인"><div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwPosition = new daum.maps.LatLng(pmapx, pmapy); //인포윈도우 표시 위치입니다
					
					// 인포윈도우를 생성합니다
					var infowindow = new daum.maps.InfoWindow({
					    position : iwPosition,
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker);
					
					$('.insertVisitBtn').click(function(){
						var params = "dNo=" + $('#dNo').val() + "&mNo=" + $('#mNo').val();
							params += "&pCode=" + $('#pCode').val() + "&tWork=" + $('#tWork').val();
							params += "&tTime=" +$('#tTime').val();
						$.get("insertVisit.html", params, function(data) {
							console.log(data);
							  if(data == 1){
								  alert("입력에 성공하셨습니다.")
							  }else{
								  alert("입력에 실패하셨습니다.")
							  }
						});
					});
				});
			}).error(function() { alert("존재하지않는 장소입니다"); });			
		});
	});
	
</script>
</head>
<body>
<h3>다이어리 쓰기</h3>
<form action="">
	<div style="width: 45%">
		<input type="hidden" id="pmapx" name="pmapx" value="">
		<input type="hidden" id="pmapy" name="pmapy" value="">
		<div>
			날짜 <input type="date" name="Dday">
		</div>
		<div style="">
			<input type="button" value="날씨" name="Dweather">
		</div>
		<div style="">
			<input type="button" value="식단" name="FoodList">
		</div>
		
		<div id="map" style="margin-top:50px; width: 500px; height: 360px; margin-right: 30px;">
			<input type="text" id="searchPlace" style="position: absolute; z-index: 2; width: 120px;">
			<input type="button" id="searchPlaceBtn" value="검색" style="position: absolute; z-index: 2; left: 123px;">
			<input type="button" id="insertPlaceBtn" value="장소 등록" style="position: absolute; z-index: 2; left: 165px;">
		</div>
		
		<div>
	 		내용<br>
	 		<textarea rows="10" cols="58" name="Dcontent" placeholder="내용"></textarea>
	 	</div>
	 
	 	<input type="hidden" id="pCode" value="">
	 	
	 	<input type="hidden" id="dNo" value="2">
	 	<input type="hidden" id="mNo" value="1">
	 	
	</div>
</form>
</body>
</html>