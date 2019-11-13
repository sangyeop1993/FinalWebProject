<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			// MQTT Broker와 연결하기
			client = new Paho.MQTT.Client(location.hostname, 61622, "clientId"+new Date().getTime());
			// Message를  수신했을 때 자동으로 실행(콜백) 되는 함수
			client.onMessageArrived = function(message) {
				$("#divReceive").append(message.payloadString + "<br/>");
			}
			
			client.connect({onSuccess:onConnect});
			
			// 연결이 완료되었을 때 자동으로 실행(콜백) 되는 함수
			function onConnect() {
			  client.subscribe("/chicken/order/pub");
			}
			
		</script>
	</head>
	<body>
		<div id="divReceive"></div>
	</body>
</html>