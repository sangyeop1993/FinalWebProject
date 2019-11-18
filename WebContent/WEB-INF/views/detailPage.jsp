<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="shortcut icon" type="image⁄png" href="${pageContext.request.contextPath}/resources/images/chickenIcon.png">	
			<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js/"></script>
			<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
			<script type="text/javascript" src = "<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dad7fb57c07b01439820b31881802e7a"></script>
			<script type="text/javascript">
				$(function(){
					var container = document.getElementById('mapbox'); //지도를 담을 영역의 DOM 레퍼런스
			        var options = { //지도를 생성할 때 필요한 기본 옵션
			           center: new kakao.maps.LatLng(${member.lat}, ${member.lng}), //지도의 중심좌표.
			           level: 6 //지도의 레벨(확대, 축소 정도)
			        };
			        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			        var markerPosition  = new kakao.maps.LatLng(${member.lat}, ${member.lng});
			        var marker = new kakao.maps.Marker({
	                      position: markerPosition
	                });
			        marker.setMap(map);
			        map.setCenter(markerPosition);
				});
			</script>
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
				text-align: left;
				padding-top:15px;
				padding-left: 80px;
				padding-bottom:10px;
		     }
		     #logoutButton{
		     	float: right;
		     	padding-top: 10px;
		     	padding-right: 60px;
		     }
		     #box1 {
	         	height: 100hv;
	         	width: 440px;
	            background-color: white;
	            margin:10px;
	            margin-left: 50px;
	            margin-right: 12px;
	            padding:20px;
	            border-radius: 10px;  
	            float: left;  
	         }
	         #box2 {
	         	height: 100hv;
	         	width: 100hv;
	            background-color: white;
	            margin:10px;
	            margin-left: 50px;
	            margin-right: 40px;
	            padding:20px;
	            border-radius: 10px;
	                 
	         }
	         #mapbox{
	         	height: 480px;
	         	width: 1358px;
	            background-color: white;
	            margin:10px;
	            margin-left: 15px;
	            padding:20px;
	            border-radius: 10px;  
	            float: left;
	         }
	         #wrap{
	         	height: 800px;
	         }
	         #footer{
	         	padding-bottom: 10px;
	         	text-align: center;
	         }
	  </style>
	</head>
	<body>
	<div id="logo">
          <img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG" width="180px" />
         <div id="logoutButton"> 
         	<a href="returnList"><img src="<%=application.getContextPath()%>/resources/images/back.png" style="width: 50px;"/></a>
         	<a href="logout"><img src="<%=application.getContextPath()%>/resources/images/home.png" style="width: 50px;"/></a>
        </div> 
    </div>  
     <div id="wrap">    
	    <div id= "box1">   
			<p>주문번호 :	${member.oid}</p>
			<p>사용자 ID :	${member.mid}</p>
			<p>이름 :		${member.mname}</p>
			<p>등급: ${member.lname}</p>
			<p>전화번호: ${member.mphonenumber}</p>
			<p>결재 금액: ${member.price}</p>
			<p>진행상태:	<c:if test="${member.ostatus == 0}">주문접수</c:if>
						<c:if test="${member.ostatus == 1}">배달요청</c:if>
						<c:if test="${member.ostatus == 2}">배달중</c:if>
						<c:if test="${member.ostatus == 3}">배달완료</c:if></p>
			<p>주문 시간 : ${member.datetime}</p>
			<p>드론아이디: ${member.did}</p>	
			<p>위도: ${member.lat}</p>
			<p>경도: ${member.lng}</p>
		</div> 
			
		<div id="mapbox">
		
		</div>
		</div>
		<div id="box2">	
			<h5>주문 리스트</h5>
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">요청 번호</th>
			      <th scope="col">메뉴 번호</th>
			      <th scope="col">주문메뉴</th>
			      <th scope="col">수량</th>
			      <th scope="col">가격</th>
			      <th scope="col">무게</th>
			      <th scope="col">총무게</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="menu" items="${itemList}">
			    <tr>
			      <td>${menu.oid}</td>
						<td>${menu.menuId}</td>
						<td>${menu.menuName}</td>
						<td>${menu.amount}</td>
						<td>${menu.menuPrice}</td>
						<td>${menu.menuWeight}g</td>
						<td ></td>
			    </tr>
			    </c:forEach>
			    <tr>
			    	<td colspan="7" align=right style="padding-right: 100px;">${totalWeight}g</td>
			    </tr>
			  </tbody>
			</table>
	</div>
	<footer>
			<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
	</footer>
</body>
</html>