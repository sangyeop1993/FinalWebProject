<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<style>
			* {
				box-sizing: border-box;
			}
			
		    body {
		    	display:flex;
		    	flex-direction: column;
		        background-color: rgb(253, 189, 51);
		        height: 100vh;
		    }
		    
		    header {
		    	height: 100px;
		    }
		    
		    #header {
		    	display: flex;
		    }
		    
		    #logoBox {
		    	width: 150px;
		    	margin: 10px;
		    	margin-top: 30px;
		    }
		    
		    #headCenter {
		    	flex-grow: 1;
		    }
		    
		    #userInfoLine {
		    	display: flex;
		    	height: 50px;
		    }
		    
		    #userInfoLineLeftBox {
		    	flex-grow: 1;
		    }
		    
		    .userLine {
		    	margin-right: 5px;	
		    }
		    
		    #center {
		    	height: 4000px;
		    	background-color: white;
		    	margin: 30px;
		    	margin-bottom: 0px;
		    	overflow: auto;
		    	text-align: center;
		    }
		    
		    .centerElements {
		    	width: 1200px;
		    	margin: 20px;
		    }
		    
		    #costSum {
		    	text-align: right;
		    }
		    .elementTitle {
		    	text-align: left;
		    	font: bold 20px;
		    }
		    
		    .elementContent {
		    	text-align: left;
		   	}
		    
		    footer {
		    	height: 50px;
		        line-height: 50px;
		        text-align: center;
		    }
		    
		</style>
		<script type="text/javascript">
			<%
			ArrayList<String[]> arr = (ArrayList<String[]>)request.getSession().getAttribute("selectedMenu");
			int[] costArr = new int[arr.size()];
			int S = 0;
			for(int i=0; i<arr.size(); i++) { 
				int s = Integer.parseInt(arr.get(i)[1])*Integer.parseInt(arr.get(i)[2]);
				S += s;
				costArr[i] = s;
			}
			%>
			var check = ($("#selectCoupon").val() == "1");
			
			function couponSelect(){
				if($("#selectCoupon").val()=="0"){
					$("#couponCost").html("0원");
					$("#finalOrderCost").html("${finalCost}원");
				}
				if($("#selectCoupon").val()=="1"){
					$("#couponCost").html("-${finalCost}원");
					$("#finalOrderCost").html("0원");
				}
			}
		</script>
		
	</head>
	<body>
		<header>
			<div id="header">
				<div id="logoBox" class="sideHeader">
					<img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG">
				</div>
				<div id="headCenter">
				</div>
			</div>
			<div id="userInfoLine">
				<div id="userInfoLineLeftBox"></div>
				<div class="userLine" style="color: red;">${member.lname}</div>
				<div class="userLine" style="margin-right: 40px;">${member.mname}님 환영합니다</div>
			</div>
		</header>
		<div id="center">
			<div class="centerElements">
				<div class="elementTitle">
					<p class="elementnName">주문 제품</p>
					<hr/>
				</div>
				<div class="elementContent">
					<ul class="list-group list-group-flush">
						<%for(int i=0;i<costArr.length;i+=1){ %>
							<li class="list-group-item">
								<div class="menuContent"><%=arr.get(i)[0]%><br/><%=arr.get(i)[1]%>원</div>
								<div class="menuCount"><%=arr.get(i)[2]%></div>
								<div class="menuCount"><%=costArr[i]%>원</div>
							</li>
						<%}%>
					</ul>
					<hr/>
					<div id="costSum">
						${orderCost}원
					</div>
				</div>
			</div>
			<div class="centerElements">
				<div class="elementTitle">
					<p class="elementnName">배달지</p>
					<hr/>
				</div>
				<div class="elementContent">
					<div id="shopName" style="width: 600px;">
						<div style="margin: 10px;">배달 매장</div>
						<div style="margin: 10px;">치킨날다</div>
					</div>
					<div id="orderMessage" style="width: 1000px;">
						<div style="margin: 10px;">주문요청사항</div>
						<input type="text" class="form-control" style="margin: 10px;"/>
					</div>
					<div id="map" style="width:1000px; height:600px; margin: 10px;"></div>
				</div>
				
			</div>
			<div class="centerElements">
				<div class="elementTitle">
					<p class="elementnName">결제정보</p>
					<hr/>
				</div>
				<div class="elementContent" style="display: flex;">
					<div id="costNames" style="margin: 10px; margin-right: 100px;">
						<div>주문금액</div>
						<br/>
						<div>회원할인</div>
						<br/>
						<div>쿠폰할인</div>
						
					</div>
					<div id="costNumbers" style="margin: 10px; margin-left: 100px;">
						<div>
							${orderCost}원
						</div>
						<br/>
						<div>
							-${discountCost}원
						</div>
						<br/>
						<div style="display: flex;">
							<div id="couponCost" style="width: 150px;">
								0원
							</div>
							<div class="input-group mb-3">
								<select class="custom-select" id="selectCoupon" name="selectCoupon" onchange="couponSelect()">
							    	<option value="0">쿠폰 선택</option>
								    <option value="1">☆특별 100% 할인 쿠폰★</option>
								</select>
							</div>
						</div>
					</div>
					
				</div>
				<hr/>
				<div style="display: flex; margin: 10px;">
					<div style="margin-right: 100px;">총 주문 금액</div>
					<div id="finalOrderCost" style="margin-left: 100px;">${finalCost}원</div>
				</div>
			</div>
			<a href="payment" class="btn btn-primary">결제하기!</a>
		</div>
		<footer>
			<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
		</footer>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dad7fb57c07b01439820b31881802e7a"></script>
		<script type="text/javascript">
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.495046, 127.1223785), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);

			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng; 
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			    
			    latlng.getLat();
			    latlng.getLng();
			    
			});
		</script>
	</body>
</html>