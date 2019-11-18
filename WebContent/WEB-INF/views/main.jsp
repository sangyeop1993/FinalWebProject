<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image⁄png" href="${pageContext.request.contextPath}/resources/images/chickenIcon.png">
		<title>주문조회</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<style>
		@import url('https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean');
	
			* {
				box-sizing: border-box;
				font-family: 'Jua', sans-serif;
			}
			p{
				margin-bottom: 0px;
				font-size: 18px;
			}
			
		    body {
		    	flex-direction: column;
		        background-color: rgb(253, 189, 51);
		        height: 100vh;
		        width: 
		    }
		    
		    #userBox {
				margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
		    	background-color:white;
		    	border-radius: 8px;
		    	height: 110px;
		    	padding: 7px;
		    	padding-top: 11px;
		    	
		    }
		    
		    
		    #logoBox{
		    	text-align: center;
				padding: 10px;
				padding-bottom: 0px;
		    }

		    #userPng{
     			margin-bottom: 0px;
     			margin-left:0px;
     			margin-right: 15px;
     			padding-top:10px;
     		}
     		
		    #userMiniBox {   
		    	display: flex;
		    }
	
     		 #deleteButton, #logoutButton{
     			font-size:12pt;
     			width:80pt;
     			height: 30px;
     			text-align: center;			
			    padding-bottom: 12px;
			    padding-top: 0px;
			    border-top-width: 5px;
			    marggin-left: 30px;	
     		}
     		
     		#TemperatureBox {
				margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
		    	background-color:white;
		    	border-radius: 8px;
		    	height: 200px;
		    	padding: 7px;
		    } 
     		
		    #mapBox {
		  		margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
		    	margin: 10px;
		    	height: 600px;
		    	border: 4px solid white;
		    }
		    footer {
		    	height: 50px;
		        line-height: 50px;
		        text-align: center;
		    }
		</style>
		<script type="text/javascript">
			function test(param) {
				console.log("${member_model.mid}");
				console.log("${member_model.mname}");
				console.log("${member_model.mid}");
			}
			
			var mapBoxStatus = true;
			function changeMapBox() {
				mapBoxStatus = !mapBoxStatus;
			}
			
			function setCookie(cookieName, value, exdays){
			    var exdate = new Date();
			    exdate.setDate(exdate.getDate() + exdays);
			    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
			    document.cookie = cookieName + "=" + cookieValue;
			}
			 
			function deleteCookie(cookieName){
			    var expireDate = new Date();
			    expireDate.setDate(expireDate.getDate() - 1);
			    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
			}
			 
			function getCookie(cookieName) {
			    cookieName = cookieName + '=';
			    var cookieData = document.cookie;
			    var start = cookieData.indexOf(cookieName);
			    var cookieValue = '';
			    if(start != -1){
			        start += cookieName.length;
			        var end = cookieData.indexOf(';', start);
			        if(end == -1)end = cookieData.length;
			        cookieValue = cookieData.substring(start, end);
			    }
			    return unescape(cookieValue);
			}
			
			
			var cookieArr = getCookie("missionArray");
			
		</script>
	</head>
	<body>
		<header id="header">
			<div id="logoBox">
				<a href="<%=application.getContextPath()%>/"><img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG"/></a>
			</div>
		</header>

			
				<div id="userBox">
					<div id="userMiniBox">
							<p style="padding-left: 10px;"><img id="userPng" src="<%=application.getContextPath()%>/resources/images/user_icon.png" width=80px;/></p>
						<div>		
							<p>${member.lname} &nbsp ${member.mname}님 환영합니다.</p>
							<p>DRONE: ${drone.dname}</p>
							
							<div style="padding-left: 0px; padding-top:5px; ">
							<button id="logoutButton" class="btn btn-danger" type="button" onclick="location.href='logout'" >로그아웃</button>
							<a href="deleteMember?mid=${member.mid}" id="deleteButton" class="btn btn-secondary" >회원탈퇴</a>	</div>
						</div>
					</div>
				</div>

				<div id="TemperatureBox">
						<img id="tempericon" src="<%=application.getContextPath()%>/resources/images/Chicken_tempicon.png" width=100px;/>
						<p style="margin-top: 0; margin-bottom: 0;">NAME: ${member.mname} </p>
				</div>

			<div id="mapBox">
				<div id="map" style="width:400px; height:300px; margin: 10px;"></div>
			</div>
			<div id="loggerBox" class="sideBar"></div>

		<div id="lower">
		<footer>
			<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
		</footer>
		</div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dad7fb57c07b01439820b31881802e7a"></script>
		<script type="text/javascript">
		//---------------------------------------------------------------------------- 카카오 지도
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
           center: new kakao.maps.LatLng(37.495046, 127.1223785), //지도의 중심좌표.
           level: 6 //지도의 레벨(확대, 축소 정도)
        };
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        var marker;
        // 선을 만드는 변수
        var linePath = [];
        if(cookieArr != ""){
           var jsonCookieArray = JSON.parse(cookieArr);
           for(var i=0;i<jsonCookieArray.length;i++){
              linePath.push(new kakao.maps.LatLng(jsonCookieArray[i]["Ha"], jsonCookieArray[i]["Ga"]));
           }
           console.log(linePath);
        }
        
        var polyline;
        var lastMission;
        
        polyline = new kakao.maps.Polyline({
            path: linePath, // 선을 구성하는 좌표배열 입니다
            strokeWeight: 5, // 선의 두께 입니다
            strokeColor: '#FF0000', // 선의 색깔입니다
            strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
        
        // 지도에 선을 표시합니다 
        polyline.setMap(map);
        
        //map.setDraggable(draggable); //지도 이동 불가
        
        if(getCookie("lastMissionNum") != "") {
           lastMission = getCookie("lastMissionNum");
        }
        
        
        //---------------------------------------------------------------------------- MQTT연결
        client = new Paho.MQTT.Client("106.253.56.124", 61622, "clientId"+new Date().getTime());
        // Message를  수신했을 때 자동으로 실행(콜백) 되는 함수
        client.onMessageArrived = function(message) {
           var JSONString = message.payloadString;
           var obj = JSON.parse(JSONString);
           var totalDistance=0;
           if(obj.msgid=="MISSION_UPLOAD") {
              console.log("좌표 받았는데?");
              if(linePath.length==0){
                 var objArr = obj.items;
                 for(var i=0;i<objArr.length;i++){
                    linePath.push(new kakao.maps.LatLng(objArr[i].x, objArr[i].y));
                    if(i>0){
                    	totalDistance += Math.pow(Math.pow(88.3197*(objArr[i].y-objArr[i-1].y),2)+Math.pow(111*(objArr[i].x-objArr[i-1].x),2), 0.5);
                    }
                 }
                 console.log(totalDistance);
                 
                 var jsonLine = JSON.stringify(linePath);
                 setCookie("missionArray", jsonLine, 7);
                 
                 console.log(linePath);
                    
                 // 지도에 표시할 선을 생성합니다
                 polyline = new kakao.maps.Polyline({
                     path: linePath, // 선을 구성하는 좌표배열 입니다
                     strokeWeight: 5, // 선의 두께 입니다
                     strokeColor: '#FF0000', // 선의 색깔입니다
                     strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                     strokeStyle: 'solid' // 선의 스타일입니다
                 });
                 
                 //마지막 미션번호 구하기
                     var missionArr = obj.items;
                    lastMission = missionArr[missionArr.length - 1].seq;
                 setCookie("lastMissionNum", lastMission, 7);
                 // 지도에 선을 표시합니다 
                 polyline.setMap(map);
              }
           }
           
           //---------------------------------------
           //Drone이 미션을 완료하면 드론이 도착했는지를 묻는 알림창을 표시하기
			if(obj.msgid=="MISSION_CURRENT") {
				//console.log("now mission: " +obj.seq);
                //console.log("lastMission: " + lastMission);
				if(obj.seq == lastMission) {
					var message;
					deleteCookie("missionArray");
					var check = confirm("드론이 도착했습니까?");
					if(check) {
						$.ajax({
							url: "orderEnd",
							success: function(data) {
								console.log("지운거같은디?");
							}
						});
						console.log("보낸것같다");
						message = new Paho.MQTT.Message("true");
						
					} else {
						message = new Paho.MQTT.Message("false");
					}
					message.destinationName = "/drone/chicken/delivery/success";
					console.log(message);
					client.send(message);
                    lastMission++;
                    location.href = "endPage";
                 }
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
			console.log("##연결 되었다");
            console.log(${orderId});
        	client.subscribe("/drone/fc/+");
        }
        //-----------------------------------------------------------------------------

        
     </script>
  </body>
</html>