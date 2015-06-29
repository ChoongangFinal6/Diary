<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>장소 등록</title>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=eb226acb34a88bef51b7fed138d7468a"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function () {
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(37.49586416184341, 127.02920943791224), //지도의 중심좌표.
			level: 5 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		var marker = new daum.maps.Marker; 
		
		marker.setMap(map);
		
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var x = $("#pmapx");
		    var y = $("#pmapy");
		    x.val(latlng.getLng());
		    y.val(latlng.getLat());
		});
	});
	
	function check() {
		if($("#pmapx").val() == null || $("#pmapx").val() == "") {
			alert("지도를 클릭하여 위치를 선택 하여 주세요");
			return false;
		}
		
		if($("#pmapy").val() == null || $("#pmapy").val() == "") {
			alert("지도를 클릭하여 위치를 선택 하여 주세요");
			return false;
		}
		
		return true;
	}
	
	
	$(function(){
		$('#ptypeCat1').click(function(){
			var name = $('#name').val();
			var pass = $('#pass').val();
			var sendData = 'name=' + name + '&pass=' + pass;
			// 세팅한 후에
			$.ajaxSetup( {
				type : 'get',
				url : 'getCat2.html', 
				dataType : 'text', 
				success : function(msg){
					$('#msg').html(msg);	
				}
			});
			// 요청 전송
			$.ajax({ data:sendData});
		});
	});
</script>
</head>
<body>
	<div id="map" style="width:500px;height:400px; float: left; margin-right: 30px;"></div>
	
	<form action="abcd.jsp" method="post" enctype="multipart/form-data" onsubmit="return check()">
		<input type="hidden" id="pmapx" name="pmapx" value="">
		<input type="hidden" id="pmapy" name="pmapy" value="">
		
		<div id="name">
			장소명<input type="text" id="pname" name="pname" value="" placeholder="장소의 이름을 입력해 주세요" required="required" />
		</div>
		
		<div id="type">
			대분류
			<select id="ptypeCat1" name="ptypeCat1" required="required">
				<option value="">선택</option>
				<option value="01">음식점</option>
				<option value="02">사무실</option>
				<option value="03">집</option>
				<option value="04">주점</option>
				<option value="05">커피</option>
				<option value="09">기타</option>
			</select>
			소분류
			<select id="ptypeCat2" name="ptypeCat2" required="required">
				<option value="">선택</option>
			</select>
		</div>
		
		<div id="img">
			<input type="file" id="pimg" name="pimg" required="required" accept="image/*">
		</div>
		
		<input type="submit" value="전송" />
	</form>
	
</body>
</html>
