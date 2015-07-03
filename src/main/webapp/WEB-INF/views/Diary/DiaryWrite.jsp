<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.actBox1 {
		width:290px;
		border-radius: 5px; 
		-moz-border-radius: 5px; 
		-webkit-border-radius: 5px; 
		border: 3px dashed #3DC5FF;	
	}

</style>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=115e224cfdaefc58554b1435511ab0f4"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<style type="text/css">
	img {cursor: pointer;}
</style>
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
		
		var fullWidth = screen.width;
		var fullHeight = screen.height;

		
		$('#searchPlaceBtn').click(function(){
			console.log($('#searchPlace').val());
			marker.setMap(null);
			infowindow.close();
			
			var params = "pName=" + $('#searchPlace').val();
			$.getJSON("searchPlace.html", params, function (data) {
				$.each(data.place, function (index, place) {
					var pname = place.pname;
					var ptype = place.ptype;
					var pimg = place.pimg;
					var pmapy = place.pmapy;
					var pmapx = place.pmapx;
					
					$('#pName').val(pname);

					iwContent = "";
					
					//iwContent += "<div style='padding:5px;'>pname : " + pname + ", pMapX : " + pmapx + ", pmapy : " + pmapy + "</div>";
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
					
					var visitVal = "?dNo="+$('#dNo').val()+"&mEmail=" + $('#mEmail').val() + "&pName=" + $('#pName').val();
					
					$('#insertVisitBtn').click(function(){
						var wid = 500;
						var hei = 370;
						var LeftPosition=(fullWidth-wid)/2;
						var TopPosition=(fullHeight-hei)/2-200;
						
						$('#bgDisplay').css({"width":fullWidth,"height":fullHeight});
						window.open("insertVisitView.html"+visitVal, "search",
							"width="+wid+",height="+hei+",scrollbars=no,resizeable=no,menubar=no,z-lock=yes,left="+LeftPosition+",top="+TopPosition, "");
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
				if(confirm($('#searchPlace').val() + "\n등록되지 않은 장소입니다.\n새로 추가하시겠습니까?")){ addNewPlace(); }
			});			
		});
		
		$('#dweather').click(function(){
			if($('#weatherImg').css('display') == 'none'){
				$('#weatherImg').css('display', 'block');
			}else{
				$('#weatherImg').css('display', 'none');
			}
			return false;
		});
		$('.weatherImages').each(function(){
			$(this).click(function(){
				console.log($(this));
				var src = $(this).prop('src');
				var title = $(this).prop('title');
				$('#dWeather').prop({"title":title,"src":src});
				$('#weatherImg').css('display', 'none');
			});
		});

		$('#diaryCancel').click(function(){
			location.href="diaryCancel.html?dNo="+$('#dNo').val();
		});
	});
	
	
	// 새 장소 등록창 팝업
	function addNewPlace(){
		window.name = "pareWin";
		var url = "diaryPlaceInsertForm.html"
		if( $('#searchPlace').val()!=""){ 
			url += "?searchPlace="+$('#searchPlace').val();
		}	
		w = 800; 	h = 450;
		LeftPosition = (screen.width-w)/2;
		TopPosition = (screen.height-h)/2;
		
		window.open( url, "NewPlace",
				"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition+", scrollbars=yes,resizable=no");
	}
	
	// 새 장소 등록후, 등록된 장소명 표시
	function placeInserted(newName){
		console.log(newName+" 등록됨");
		$('#searchPlace').val(newName);
		$('#searchPlaceBtn').trigger('click');
	}
	
	// 새로운 방문활동 등록후, 등록된 활동 표시
	function activityInserted(params){
		console.log(params); 
		//dNo=10&mEmail=ttt@choongang.com&pName=양재역&tWork=잠&time1=12:58&time2=12:59		
	}
	
	// 방문기록 전체 조회
	function allVisit(){
		alert("allVisit?")
		var params =  "mEmail=${mEmail}&dNo=${dNo}";
		$.ajax({
			type : 'get',
			url : 'placeAll.html',
			dataType : 'text',
			data : params,
			success : function(result) {
				$('#actBox1').html(result);
				//$('#pTypeCat2').html(result);
			}
		});
	}
	
	$(function(){
		$('#visitListSector').click(function(){
			allVisit();
		});
	});
</script>
</head>
<body style="margin: 0 0 0 0;">

<c:if test="${result == 0 }">
<script type="text/javascript">
	alert("다이어리가 등록되지 않았습니다");
</script>
</c:if>

<div id="bgDisplay" style="position: fixed; opacity:1; background-color: black; z-index: 10; margin: -30px -30px 0 0; opacity:0.6;"></div>
<h3 style="margin: 8px;">다이어리 쓰기</h3>
<form action="DiaryWrite.html" method="post" style="margin: 8px;">
	<div>
		<input type="hidden" id="pmapx" name="pmapx" value="">
		<input type="hidden" id="pmapy" name="pmapy" value="">
		<div>
			날짜 <input type="date" name="dDay">
		</div>
		<div id="dweather">
			<button style="border: 0px; background-color: white;">
				<img id="dWeather" title="맑음" src="resources/weatherImg/DB01.png"/>
			</button>
		</div>
		<div id="weatherImg" style="display: none;">
			<table>
				<tr align="center">
					<td><img src="resources/weatherImg/DB01.png" title="맑음" alt="맑음" width="30px" height="35px" class="weatherImages"/></td>
					<td><img src="resources/weatherImg/DB02.png" title="흐림 뒤 맑음" alt="흐림 뒤 맑음" width="30px" height="35px" class="weatherImages"/></td>
					<td><img src="resources/weatherImg/DB03.png" title="맑은 뒤 흐림" alt="맑은 뒤 흐림" width="30px" height="35px" class="weatherImages"/></td>
					<td><img src="resources/weatherImg/DB04.png" title="흐림" alt="흐림" width="30px" height="35px" class="weatherImages"/></td>
				</tr>
				<tr align="center">
					<td><img src="resources/weatherImg/DB05.png" title="비옴" alt="비옴" width="30px" height="35px" class="weatherImages"/></td>
					<td><img src="resources/weatherImg/DB06.png" title="비온 뒤 눈옴" alt="비온 뒤 눈옴" width="30px" height="35px" class="weatherImages"/></td>
					<td><img src="resources/weatherImg/DB07.png" title="눈온 뒤 비옴" alt="눈온 뒤 비옴" width="30px" height="35px" class="weatherImages"/></td>
					<td><img src="resources/weatherImg/DB08.png" title="눈옴" alt="눈옴" width="30px" height="35px" class="weatherImages"/></td>
				</tr>
			</table>
		</div>
		<div style="">
			<input type="button" value="식단" name="FoodList">
		</div>
		<div>
			<div id="map" style="float:left; width: 500px; height: 360px;">
				<input type="text" id="searchPlace" value="" style="position: absolute; z-index: 2; width: 120px;">
				<input type="button" id="searchPlaceBtn" value="검색" style="position: absolute; z-index: 2; left: 123px;">
				<input type="button" id="insertPlaceBtn" value="새로등록" onclick='addNewPlace()' style="position: absolute; z-index: 2; left: 163px;">
			</div>
			<div id="visitListSector" style="float:left; left:510px;height: 360px;position:absolute; background-color:pink; width:300px;">
				<div>방문기록</div>
				<div class="actBox1" id="actBox1">sss</div>
			</div>
		</div>
		
		<div style="clear:left;">
	 		내용<br>
	 		<textarea rows="10" cols="58" name="Dcontent" placeholder="내용" style="resize:none"></textarea>
	 	</div>
	 	
	 	<input type="hidden" name="dNo" id="dNo" value="${dNo}">
	 	<input type="hidden" name="pName" id="pName" value="">
	 	<input type="hidden" name="mEmail" id="mEmail" value="${mEmail}">
	</div>
	<input type="submit" value="확인" >
	<input type="button" value="취소" id="diaryCancel">
</form>

</body>
</html>