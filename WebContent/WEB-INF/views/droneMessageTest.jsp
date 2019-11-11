<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div id="divReceive"></div>
		<div id="map" style="width:1000px; height:600px; margin: 10px;"></div>
	</body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dad7fb57c07b01439820b31881802e7a"></script>
	<script type="text/javascript">
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.495046, 127.1223785), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    //marker.setPosition(latlng);
	    
	    //latlng.getLat();
	    //latlng.getLng();
	});
	
	var marker = null;

	// MQTT Broker와 연결하기
	client = new Paho.MQTT.Client("192.168.2.6", 61614, "clientId");
	// Message를  수신했을 때 자동으로 실행(콜백) 되는 함수
	
	client.onMessageArrived = function(message) {
		var JSONString = message.payloadString;
		var obj = JSON.parse(JSONString);
		if(obj.msgid=="ATTITUDE"){
			$("#divReceive").html("roll : "+obj.roll+"<br/>pitch : "+obj.pitch+"<br/>yaw : "+obj.yaw);
		}
		if(obj.msgid=="GLOBAL_POSITION_INT"){
			var nowLat = obj.currLat;
			var nowLng = obj.currLng;
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(nowLat, nowLng); 

			if(marker != null) {
				marker.setMap(null);
				marker.setPosition(markerPosition);
			} else {
				marker = new kakao.maps.Marker({
				    position: markerPosition
				});
			}
			
			marker.setMap(map);
			map.setCenter(markerPosition);
		}
	}
	
	client.connect({onSuccess:onConnect});
	
	// 연결이 완료되었을 때 자동으로 실행(콜백) 되는 함수
	function onConnect() {
	  client.subscribe("/drone/fc/pub");
	}

	</script>
</html>