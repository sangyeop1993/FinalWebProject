<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
		<script type="text/javascript">
   $(function(){
      client = new Paho.MQTT.Client(location.hostname, 61622, "clientId");
      client.onMessageArrived = onMessageArrived;
      client.connect({
         onSuccess : onConnect
      });

      function onConnect() {
         // 연결이 완료되었을 때 자동으로 콜백되는 함수
         client.subscribe("/chicken/order/pub");

      }

      //메세지를 수신했을때 자동으로 실행(콜백)되는 함수
      function onMessageArrived(message) {
    	  //$("#divRecieve").append(message.payloadString + "<br/>");
          //$("#divRecieve").append(location.hostname + "<br/>");
     	  location.reload();
         
      }
   });
   /*
   function sendMessage(){
      var data = "웹 송신: "+ $("#inputData").val();
      var message = new Paho.MQTT.Message(data);
        message.destinationName ="aaa";
        client.send(message);
   }
   */
   
</script>

	</head>
	<body>
		<h5>주문 리스트</h5>
		<table border="1">
			<tr>
				<th>주문 ID</th>
				<th>요청일자</th>
				<th>요청시간</th>
				<th>고객명</th>
				<th>전화번호</th>
				<th>가격</th>
				<th>상세 보기</th>
			</tr>
			<c:forEach var="orderChicken" items="${list}">
				<tr>
					<td>${orderChicken.oid}</td>
					<td><fmt:formatDate value="${orderChicken.date}" pattern="yyyy.MM.dd"/></td>
					<td><fmt:formatDate value="${orderChicken.date}" pattern="HH:mm"/></td>
					<td>${orderChicken.mname}</td>
					<td>${orderChicken.mphonenumber}</td>
					<td>${orderChicken.price}</td>
					<td><a href="">상세보기</a></td>
				</tr>
			</c:forEach>
		</table>
		<div id="divRecieve"></div>
	</body>
</html>