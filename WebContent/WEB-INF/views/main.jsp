<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reset</title>
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
		    body {
		    	display:flex;
		    	flex-direction: column;
		        background-color: rgb(253, 189, 51);
		        height: 100vh;
		    }
		    
		    header {
		    	height: 80px;
		    	
		    }
		    
		    #center, #lower {
		    	flex-grow: 1;
		    	display: flex;
		    	margin: 0px;
		    }
		    
		    #header {
		    	display: flex;
		    }
		    
		    
			element.style {
			    margin-top: 14px;
			}
		    
		    #logoBox {
		    	width: 150px;
		    	margin: 0px;
		    }
		    
		    #headCenter {
		    	flex-grow: 1;
		    }

		    #loggerBox {
		    	height: 600px;
		    	width: 300px;
		    	border: 4px solid white;
		    	margin: 10px;
		    }
		    
		    #contentBox{
		    	display: flex;
		    	flex-direction: column;
		    	width: 300px;
		    	height: 608px;
		    }
		    
		    .contents {
				margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
		    	border: 4px solid white;
		    	height: 200px;
		    	padding: 7px;
		    }
		    #orderListBox{
		    	padding : 0px;
		    }
		    #userMiniBox {
		    	display: flex;
		    	margin-top:20px;
		    	margin-bottom: 0px;
		    	margin-left:20px;
		    	padding:0px;
		    }
		    
		    #userTextBox {
     			font-size:13pt;
     			line-height:1.9em; 
     			margin-top: 0px; 
     			margin-left:10px;
     		}
     		#userPng{
     			margin-bottom: 0px;
     			margin-left:0px;
     			margin-right: 5px;
     		}
     		
     		 #deleteButton, #logoutButton{
     			font-size:14pt;
     		}

		    #mapBox {
		  		margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
		    	margin: 10px;
		    	height: 600px;
		    	width: 1300px;
		    	border: 4px solid white;
		    }
		    
		    #locationBar {
		    	flex-grow: 1;
		    	margin: 10px;
		    	border: 4px solid white;
		    	height: 170px;
		    }

		    footer {
		    	height: 50px;
		        line-height: 50px;
		        text-align: center;
		    }
		    #logoBox {
				width: 100%;
				height: 80px;
		    }
		    #logoBox img {
		    	margin: 26px auto 0;
		    	display: block;	
		    }
		    #noworder-tab, #oldorder-tab{
		  		width: 133px;
		  		border-radius: 0px;
		  						border-bottom: 3px solid #ffffff;
		  		
		    }
		    
			#orderListBox a {
				font-size: 22px;
				color: #fff;
				text-align: center;

			}
			
			#orderListBox a:hover {
				color: red !important;
	
			}
			
		    .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
			    color: red !important;
			    background-color: #fff;
			  	border-color: #fff; 
  			
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
		<div style="width:1903px; margin:0 auto;">
		<header id="header">
			<div id="logoBox">
				<a href="<%=application.getContextPath()%>/"><img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG" style="margin-top: 20px;"></a>
			</div>
			<div id="headCenter">
			</div>
		</header>
		<div id="center">
			<div id="contentBox" class="sideBar">
				<div id="userBox" class="contents" >
					<div id="userMiniBox" style="margin-left: 10px">
							<p>
							<img id="userPng" src="<%=application.getContextPath()%>/resources/images/user_icon.png" width=90px;  />
							</p>
						<div id="userTextBox" style=" ">
							<p>
								NAME: ${member.mname} <br/>
								LEVEL: ${member.lname} <br/>
								DRONE: ${droen.dname}
							</p>
						</div>
					</div>
					<div style="text-align: center;">
				<button id="logoutButton" class="btn btn-danger" type="button" onclick="location.href='logout'" style="margin-right: 15px; width:80pt;">로그아웃</button>
				<a href="deleteMember?mid=${member.mid}" id="deleteButton" class="btn btn-secondary" style="width:80pt;">회원탈퇴</a>
				
				</div>
				</div>
				
				<div id="orderListBox" class="contents">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
					  <li class="nav-item">
					    <a class="nav-link active" id="noworder-tab" data-toggle="tab" href="#NowOrder-box" role="tab" aria-controls="home" aria-selected="true">현재주문</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="oldorder-tab" data-toggle="tab" href="#OldOrder-box" role="tab" aria-controls="profile" aria-selected="false">과거주문</a>
					  </li>
					</ul>
				<div class="tab-content" id="myTabContent">
				  <div class="tab-pane fade show active" id="NowOrder-box" role="tabpanel" aria-labelledby="noworder-tab">현재주문</div>
				  <div class="tab-pane fade" id="OldOrder-box" role="tabpanel" aria-labelledby="oldorder-tab">과거주문</div>
				</div>
				</div>
				
				<div id="TemperatureBox" class="contents">
				<p style="margin-top: 0; margin-bottom: 0;">NAME: ${member.mname} </p>
					<img id="tempericon" src="<%=application.getContextPath()%>/resources/images/Chicken_tempicon.png" width=200px; style=" margin-left: 20px;"  />
				</div>
			</div>
			<div id="mapBox">
				<div id="map" style="width:1000px; height:600px; margin: 10px;"></div>
				<!-- 
				<div class="tab-pane fade show active" id="nowCamera" role="tabpanel" aria-labelledby="noworder-tab">영상</div>
				<div class="tab-pane fade" id="nowMap" role="tabpanel" aria-labelledby="oldorder-tab">지도</div>
				 -->
			</div>
			<div id="loggerBox" class="sideBar"></div>
		</div>
		<div id="lower">
			<div id="locationBar"></div>
		</div>
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
				level: 3 //지도의 레벨(확대, 축소 정도)
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
			client = new Paho.MQTT.Client(location.hostname, 61622, "clientId"+new Date().getTime());
			// Message를  수신했을 때 자동으로 실행(콜백) 되는 함수
			client.onMessageArrived = function(message) {
				var JSONString = message.payloadString;
				var obj = JSON.parse(JSONString);
				if(obj.msgid=="MISSION_UPLOAD") {
					console.log("좌표 받았는데?");
					if(linePath.length==0){
						var objArr = obj.items;
						for(var i=0;i<objArr.length;i++){
							linePath.push(new kakao.maps.LatLng(objArr[i].x, objArr[i].y));
						}
						
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
	                  alert("드론이 도착했습니까?");
	                  lastMission++;
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
				console.log("##연결 되었다")
			    client.subscribe("/drone/fc/+");
			}
			//-----------------------------------------------------------------------------

			
		</script>
	</body>
</html>