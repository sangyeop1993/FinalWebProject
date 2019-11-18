<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문리스트</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image⁄png" href="${pageContext.request.contextPath}/resources/images/chickenIcon.png">	
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>	
		
		<style>
			@import url('https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean');
	   
	         	* {
	            	box-sizing: border-box;
	            	font-family: 'Jua', sans-serif;
	         	}
			body {
	             display:flex;
	             flex-direction: column;
	             background-color: rgb(253, 189, 51);
	             height: 100vh;
	          }
		     #logo{
		     	padding : 10px;
				text-align: center;
				padding-left: 80px;
				padding-bottom: 0px;
		     }
		     #logoutButton{
		     	float: right;
		     	padding-top: 18px;
		     	padding-right: 20px;
		     }
		     #center {
	         	height: 4000px;
	            background-color: white;
	            text-align: center;
	            margin:10px;
	            border-radius: 10px;   
	         }
		     #listname{
		     	padding: 10px;
		     	padding-left:20px;
		     	float: left;
		     }
		     h5{
		     	font-size: 30px;
		     	margin: 0px;
		     }	
		       
		</style>

		<script type="text/javascript">   
			  $(function(){
		      client = new Paho.MQTT.Client("106.253.56.124", 61622, "clientId");
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
		    	  	var json=JSON.parse(message);
		    	  	location.reload(true);
				}
		   });  
</script>
	

	</head>
	<body>
		<div id="logo">
          <img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG" width="140px" height="55px" />
         <div id="logoutButton">  
         	<button class="btn btn-danger" type="button" onclick="location.href='logout'">로그아웃</button>
         </div> 
         </div>  
      	
     <div id="center" style="margin-bottom: 0px;">
		<div id="listname"><h5>-ORDER LIST-</h5>	</div>
		<table class="table table-hover">
		
		  <thead>
		    <tr>
		      <th scope="col">주문 ID</th>
		      <th scope="col">요청일자</th>
		      <th scope="col">요청시간</th>
		      <th scope="col">고객명</th>
		      <th scope="col">전화번호</th>
		      <th scope="col">등급</th>
		      <th scope="col">가격</th>
		      <th scope="col">처리상태</th>
		      <th scope="col">상세 보기</th>
	
		    </tr>
		  </thead>
		  
		  <tbody>
		      <c:forEach var="order" items="${list}">
		    <tr>
		      <th scope="row">${order.oid}</th>
		      <td><fmt:formatDate value="${order.datetime}" pattern="yyyy.MM.dd"/></td>
           	  <td><fmt:formatDate value="${order.datetime}" pattern="HH:mm"/></td>
						<td>${order.mname}</td>
						<td>${order.mphonenumber}</td>
						<td>${order.lname}</td>
						<td>${order.price}</td>
						<c:if test="${order.ostatus == 0 }" ><td><a class="btn btn-danger" style="width: 100px; height: 30px; padding-top: 4px; font-size: 15px;" href="commitOrder?oid=${order.oid}&lat=${order.lat}&lng=${order.lng}&datetime=<fmt:formatDate value="${order.datetime}" pattern="yyyy.MM.dd HH:mm"/>&ostatus=0">주문 접수</a></td></c:if>
						<c:if test="${order.ostatus == 1 }" ><td><a class="btn btn-warning" style="width: 100px; height: 30px; padding-top: 4px; font-size: 15px;" href="commitOrder?oid=${order.oid}&lat=${order.lat}&lng=${order.lng}&datetime=<fmt:formatDate value="${order.datetime}" pattern="yyyy.MM.dd HH:mm"/>&ostatus=1">배달 요청</a></td></c:if>
						<c:if test="${order.ostatus == 2 }" ><td><a class="btn btn-primary" style="width: 100px; height: 30px; padding-top: 4px; font-size: 15px;" href="commitOrder?oid=${order.oid}&lat=${order.lat}&lng=${order.lng}&datetime=<fmt:formatDate value="${order.datetime}" pattern="yyyy.MM.dd HH:mm"/>&ostatus=2">배달중</a></td></c:if>
						<c:if test="${order.ostatus == 3 }" ><td><a class="btn btn-success"style="width: 100px; height: 30px; padding-top: 4px; font-size: 15px;"  href="commitOrder?oid=${order.oid}&lat=${order.lat}&lng=${order.lng}&datetime=<fmt:formatDate value="${order.datetime}" pattern="yyyy.MM.dd HH:mm"/>&ostatus=3">배달완료</a></td></c:if>
						<td><a style="color:gray;" href="detailOrder?oid=${order.oid}">상세보기</a></td>
						</tr>
		    <tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
	</body>
</html>