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
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/series-label.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
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
		    }
		    
		    #userBox {
				margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
		    	background-color:white;
		    	border-radius: 8px;
		    	height: 110px;
		    	padding: 7px;
		    	padding-left: 11px;
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
     			margin-top: 10px;
				margin-left: 10px;
				margin-right: 10px;
		    	background-color:white;
		    	border-radius: 8px;
		    	height: 150px;
		    	
		    }
		    
		    #container {
		    	height: 140px;
		    	width: 355px;
		    	text-align: center;
		    	padding-top: 5px;
		    }
		    #mapBox {
		  		margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
		    	height: 420px;
		    	width: 395px;
		    	border-radius: 8px;
		    	background-color:white;
		    }
		    footer {
		    	height: 30px;
		        line-height: 50px;
		        text-align: center;
		    }
		     .wrap_content {overflow:hidden;}
   			 .wrap_map {width:50%;float:left;position:relative}
    		.wrap_button {position:absolute;left:15px;top:12px;z-index:2}
    		.highcharts-background {
    			height: 120px !important;
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
					<div style="display: flex;">
						<div id="container"></div>
					</div>
						
				</div>			

			
				<div class="wrap_content">
    				<div class="wrap_map">
    				<div id="mapBox"></div>
    				<div class="wrap_button">
						<a href="javascript:;" class="btn_comm btn_resetMap" onclick="endMission()">
						<img src="${pageContext.request.contextPath}/resources/images/replay.png" width="20px"/></a>
					</div>
				</div>
			</div>
			
			
		<div id="lower">
		<footer>
			<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
		</footer>
		</div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dad7fb57c07b01439820b31881802e7a"></script>
		<script type="text/javascript">
		//---------------------------------------------------------------------------- 카카오 지도
        var container = document.getElementById('mapBox'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
           center: new kakao.maps.LatLng(37.495046, 127.1223785), //지도의 중심좌표.
           level: 6 //지도의 레벨(확대, 축소 정도)
        };
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        var marker = null;
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
        var lastMission = -1;
        
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
        
        
        //---------------------------------------------------------------------------- client1 연결
        $(function() {
        	client1 = new Paho.MQTT.Client("106.253.56.124", 61622, "clientId"+new Date().getTime() + 1);
        	
        	client1.connect({onSuccess:function() {
        		client1.subscribe("/drone/fc/pub");
        		console.log("client1 연결");
        	}});
        	client1.onMessageArrived = function(message) {     
        		var JSONString = message.payloadString;
                var obj = JSON.parse(JSONString);
                
                if(obj.msgid=="GLOBAL_POSITION_INT"){
    				var nowLat = obj.currLat;
                    var nowLng = obj.currLng;
                   // 마커가 표시될 위치입니다 
                   var markerPosition  = new kakao.maps.LatLng(nowLat, nowLng);
                   var imageSrc = "${pageContext.request.contextPath}/resources/images/drone.png"; // 마커이미지의 주소입니다    
                   imageSize = new kakao.maps.Size(30, 30); // 마커이미지의 크기입니다.
                   
                   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                   /*marker = new kakao.maps.Marker({
                  	    position: markerPosition, 
                  	  	image: markerImage // 마커이미지 설정 
                  		});
                   */
                   if(marker != null) {
                      marker.setMap(null);
                      marker.setPosition(markerPosition);
                   } else {
                      marker = new kakao.maps.Marker({
                          position: markerPosition,
                          image: markerImage // 마커이미지 설정 
                      });
                   }
                   
                   
                   marker.setMap(map);
                   map.setCenter(markerPosition);
                }
                

                //Drone이 미션을 완료하면 드론이 도착했는지를 묻는 알림창을 표시하기
    			if(obj.msgid=="MISSION_CURRENT") {
    				if(obj.seq == lastMission) {
    					var message;
    					deleteCookie("missionArray");
    					deleteCookie("lastMissionNum");
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
    					client1.send(message);
                        lastMission++;
                        location.href = "endPage";
                     }
                  }
                
            }
        });
        
        //---------------------------------------------------------------------------- client2 연결
        $(function() {
        	client2 = new Paho.MQTT.Client("106.253.56.124", 61622, "clientId"+new Date().getTime() + 2);
        	
        	client2.connect({onSuccess:function() {
        		client2.subscribe("/drone/fc/sub");
        		console.log("client2 연결");
        	}});
        	client2.onMessageArrived = function(message) {     
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
                         lastMission = missionArr.length - 1;
                      setCookie("lastMissionNum", lastMission, 7);
                      // 지도에 선을 표시합니다 
                      polyline.setMap(map);
                   }
                }
            }
        });
        
        //---------------------------------------------------------------------------- client3 연결
        $(function() {
        	client3 = new Paho.MQTT.Client("106.253.56.124", 61622, "clientId"+new Date().getTime()+3);
        	
        	client3.connect({onSuccess:function() {
        		client3.subscribe("/drone/temperature/pub");
        		console.log("client3 연결");
        	}});
        	client3.onMessageArrived = function(message) {     
        		var JSONString = message.payloadString;
                var obj = JSON.parse(JSONString);
                if(obj.msgid=="TEMPERATURE") {
    				console.log(obj.temperature);
    				var series = chart.series[0];
    	        	var shift = series.data.length > 5;
    	        	series.addPoint(obj.temperature, true, shift);
    			}
                
            }
        });
        
        //---------------------------------------------------------------------------- 네트워크 끝
        var chart = null;
		$(function() {
			chart = new Highcharts.chart('container', {
				  chart: {
					    type: 'spline'
					  },
				  title: {
						text: '나의 치킨 온도는?'
				  },
				  xAxis: {
				      tickPixelInterval: 100,
				      visible: false,
				      labels: {
				        enabled: false
				      }
				  },
				  legend:{
					  enabled: false
				  },
				  yAxis: {
				    title: {
					  text: 'Temperature'
				    },
					    labels: {
					      formatter: function () {
					        return this.value + '°';
					      }
					    }
					  },
					  tooltip: {
					    crosshairs: true,
					    shared: true
					  },
					  plotOptions: {
					    spline: {
					      marker: {
					        radius: 4,
					        lineColor: '#FDBD33',
					        lineWidth: 1
					      }
					    }
					  },
					  series: [{
						  marker: {
						      symbol: "url(${pageContext.request.contextPath}/resources/images/Chicken_tempicon.png)",
						      width: 15,
						      height: 20
						  },
						  name: "", 
						  color: '#FDBD33',
						  data: []}
					  ]
			  });	
		});
        //-----------------------------------------------------------------------------
        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            
            function endMission() {
            	deleteCookie("missionArray");
				deleteCookie("lastMissionNum");
            	location.href = "endPage";
            }
            //-------------------------------
        
     </script>
  </body>
</html>