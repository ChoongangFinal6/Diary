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
		var marker = new daum.maps.Marker;
		var infowindow = new daum.maps.InfoWindow;		
		
		$('#searchPlaceBtn').click(function(){
			marker.setMap(null);
			infowindow.close();
			var params = "pName=" + $('#searchPlace').val();
			$.getJSON("searchPlace.html", params, function (data) {
				$.each(data.place, function (index, place) {
					var pcode = place.pcode;
					var ptype = place.ptype;
					var pname = place.pname;
					var pimg = place.pimg;
					var pmapx = place.pmapx;
					var pmapy = place.pmapy;
					
					$('#pCode').val(pcode);

					iwContent = "";
					
					//iwContent += "<div style='padding:5px;'>pname : " + pname + ", pMapX : " + pmapx + ", pmapy : " + pmapy + "</div>";
					console.log(iwContent);
					// 마커가 표시될 위치입니다 
					var markerPosition  = new daum.maps.LatLng(pmapy, pmapx); 
					
					/* // 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});
					marker.setMap(null);
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map); */
					marker.setPosition(markerPosition);
					marker.setMap(map);
					
					var moveLatLon = new daum.maps.LatLng(pmapy, pmapx);
				    
				    // 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(moveLatLon);   
					
					iwContent = '<div style="padding:15px;">'+pname
						+'<input type="button" id="insertVisitBtn" value="확인"><div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					iwPosition = new daum.maps.LatLng(pmapy, pmapx); //인포윈도우 표시 위치입니다
					
					// 인포윈도우를 생성합니다
					/* var infowindow = new daum.maps.InfoWindow({
					    position : iwPosition,
					    content : iwContent 
					}); */
					
					infowindow.setPosition(iwPosition);
					infowindow.setContent(iwContent);
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker);
					
					var visitVal = "?dNo=" + $('#dNo').val() + "&mNo=" + $('#mNo').val() +
						"&pCode=" + $('#pCode').val();
					
					$('#insertVisitBtn').click(function(){
						window.open("insertVisitView.html"+visitVal, "search",
							"width=500,height=370,scrollbars=yes,resizeable=no,left=300,top=150", "");
					});
					/* $('#insertVisitBtn').click(function(){
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
					}); */
				});
			}).error( function() { 
				if(confirm("등록되지 않은 장소입니다. 새로 추가하시겠습니까?")){ addNewPlace(); }
			});			
		});
		
		
	});
	
	
	// 새 장소 등록창 팝업
	function addNewPlace(){
		window.open("diaryPlaceInsertForm.html", "NewPlace",
				"width=550,height=500,scrollbars=yes,resizable=no,left=300,top=150", "");
	}
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
			<input type="button" id="insertPlaceBtn" value="새로등록" onclick='addNewPlace()' style="position: absolute; z-index: 2; left: 163px;">
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
<div style="width: 100%; height: 100%; background-color: "></div>
</body>
</html>