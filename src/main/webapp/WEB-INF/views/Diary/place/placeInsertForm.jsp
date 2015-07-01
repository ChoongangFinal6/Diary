<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>장소 등록</title>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=eb226acb34a88bef51b7fed138d7468a"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	var isRegisted = 0;

	// DAUM MAP 처리
	$(function() {
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new daum.maps.LatLng(37.49586416184341, 127.02920943791224), //지도의 중심좌표.
			level : 5
		//지도의 레벨(확대, 축소 정도)
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
		if ($("#pmapx").val() == null || $("#pmapx").val() == "") {
			alert("지도를 클릭하여 위치를 선택 하여 주세요");
			return false;
		}

		if ($("#pmapy").val() == null || $("#pmapy").val() == "") {
			alert("지도를 클릭하여 위치를 선택 하여 주세요");
			return false;
		}
		
		if( isRegisted == 0){
			alert("다른 지역명으로 시도해 주세요.");
			return false;
		}
		
		return true;
	}

	// 소분류 조회 ajax
	$(function() {
		$('#pTypeCat1').change(function() {
			var param = 'pTypeCat1=' + $(this).val();
			// 세팅한 후에
			$.ajaxSetup({
				type : 'get',
				url : 'getPTypeCat2.html',
				dataType : 'text',
				success : function(result) {
					$('#pTypeCat2').html(result);
				}
			});
			// 요청 전송
			$.ajax({ data : param });
		});
	});
	
	// 이미 등록된 장소명인지 조회 ajax
	$(function(){
		$('#pname').attr('value', '${pName}'); 
		$('#pname').keyup(function(){
			if($(this).val().length<2){
				isRegisted = 0;
				$('#isRegistResult').html("장소명은 2글자 이상이어야합니다.");
			}else{
				var param = 'pName=' + $(this).val();
				$.ajaxSetup({
					type : 'get',
					url : 'isRegistedPlace.html',
					dataType : 'text',
					success : function(result){
						if(result!=0){
							isRegisted = 0;
							$('#isRegistResult').html("이미 등록되어있는 장소입니다.");
						}else{
							isRegisted = 1;
							$('#isRegistResult').html("등록가능한 장소명입니다.");
						}
					}
				});
			}
			// 요청 전송
			$.ajax({ data : param });
		});
	});
	
</script>
</head>
<body>
	<div id="map"
		style="width: 500px; height: 400px; float: left;"></div>
	<div id="resultMsg">${resultMsg}</div>
	<form action="diaryPlaceInsert.html" method="post" id="frm" enctype="multipart/form-data"
		onsubmit="return check()">
		<input type="hidden" id="pmapx" name="pmapx" value="">
		<input
			type="hidden" id="pmapy" name="pmapy" value="">

		<table>
			<tr>
				<td><div id="name">
					장소명<input type="text" id="pname" name="pname" value="${pName}"
						placeholder="장소의 이름을 입력해 주세요" autofocus="autofocus" required="required" />
				</div><div id="isRegistResult" style="height:10px ; color:red; font-size: 8pt"></div></td>
			</tr>
			<tr>
				<td><div id="type">
					대분류
					<select id="pTypeCat1" name="pTypeCat1" required="required">
						<option value="">선택</option>
						<option value="01">교통</option>
						<option value="02">카페</option>
						<option value="03">병원,의료</option>
						<option value="04">관공서</option>
						<option value="05">쇼핑,마트</option>
						<option value="06">생활,편의</option>
						<option value="07">스포츠시설</option>
						<option value="08">음식점</option>
						<option value="09">숙박</option>
						<option value="10">문화</option>
						<option value="11">관광</option>
						<option value="00">기타</option>
					</select><br>
					소분류 
					<select id="pTypeCat2" name="pTypeCat2" required="required"></select>
				</div></td>
			</tr>
			
			<tr>
				<td><div id="img">
					<input type="file" id="pimg" name="pimg" required="required" accept="image/*">
				</div></td>
			</tr>
			<tr>
				<td><input type="submit" value="전송"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
