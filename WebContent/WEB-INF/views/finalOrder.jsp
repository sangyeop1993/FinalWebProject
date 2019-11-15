<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type= image⁄png href="${pageContext.request.contextPath}/resources/images/chickenleg.png">
		<title>결제하기</title>
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
	           font-size: 30px;
	           color: #DF0101;
	           text-align: center;
	        }
			hr{
	           margin: 0px;
	           margin-top: 10px;
	           background-color: #D8D8D8;
	        }
			body {
             display:flex;
             flex-direction: column;
              background-color: rgb(253, 189, 51);
              height: 100vh;
          }
          #header {
          	margin : 10px;
            margin-bottom: 0px;
            display: flex;
            text-align: left;
          }
          
         #member_info{
          	padding-left: 60px;
            padding-top: 20px;
            padding-right: 0px;
         }    
              
         .userLine {
         	margin-right: 5px;   
         }
          
         #center {
         	height: 4000px;
            background-color: white;
            text-align: center;
            margin:10px; 
         }
         .centerElements {
         	width: 100%;
            padding:20px;
            padding-bottom: 0px;   
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
         .elementnName{
         	margin-bottom: 0px;   
         }
          
         footer {
         	height: 50px;
            line-height: 45px;
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
					$("#paymentButton").html("${finalCost}원 결제하기");
				}
				if($("#selectCoupon").val()=="1"){
					$("#couponCost").html("-${finalCost}원");
					$("#finalOrderCost").html("0원");
					$("#paymentButton").html("${finalCost}원 공짜로 결제하기");
				}
			}
			
		</script>
		
	</head>
	<body>
		<header>
         <div id="header">
               <img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG" width="130px" height="50px"/>
               <div id="member_info" style="color:red; display: flex;">${member.lname}&nbsp; <div style="color:black;">${member.mname}님 환영합니다</div>
            </div>
        </div>
      	</header>
		
		<div id="center" style="margin-bottom: 0px;">
         <div class="centerElements">
            <div class="elementTitle">
               <p class="elementnName">★주문 제품★ <hr/></p>
            </div>
            <div class="elementContent" style="text-align: center;">
                  <%for(int i=0;i<costArr.length;i+=1){ %>
                  <div class="ordermenu_list"><%=arr.get(i)[0]%> &nbsp; <%=arr.get(i)[1]%>원 &nbsp; <%=arr.get(i)[2]%>개 &nbsp; <%=costArr[i]%>원</div>
                  <%}%>
               <div id="costSum">
               <hr/>
                  <p style="font-size: 20px; color:black; padding-top:10px">총합계금액 ${orderCost} 원<p>
               </div>
            </div>
         </div>
               
         <div class="centerElements" style="padding-top: 0px;">
               <p class="elementnName">★배달지★</p>
               <hr/>
				<div class="elementContent">
               <div id="shopName" style="width:100%;">
                  <div style="margin: 10px; text-align: center; font-size: 20px;">배달매장 - 치킨날다</div>
               </div>
               
               <div id="orderMessage" style="width:100%;">
                  <div style="margin: 10px; text-align: center; font-size: 16px;">-주문요청사항-</div>
                  <div class="form-group">
                  <input type="text" class="form-control"/>
                  </div>
               </div>
               <div id="map" style="width:100%; height:300px; "></div>
               <div id="pointError" style="color: red;"></div>
               <div id="my_marker"style="margin: 10px; text-align: center; font-size: 16px; color: #DF0101;">현재 주문 위치를 지정해 주세요.</div>
            </div>
            
         </div>
         <div class="centerElements" >
            <div class="elementTitle">
               <p class="elementnName">★결제정보★</p>
               <hr/>
            </div>
            <div class="elementContent" style="display: flex; height: 140px;">
               <div id="costNames" style="margin: 10px; width:100px;">
                  <div>주문금액</div>
                  <br/>
                  <div>회원할인</div>
                  <br/>
                  <div>쿠폰할인</div>
                  
               </div>
               <div id="costNumbers" style="margin: 10px; ">
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
            <div style="display: flex;">
               <div style= "text-align: center;  font-size: 20px; color:black; padding-top:20px; padding-left:90px;">총 주문 금액 ${finalCost}원</div>
            </div>
         </div>
         <form method="post" name="payment_form" action="payment" style="height: 60px; padding-top:10px; padding-bottom: 10px;">
            <input name="nowLat" value="" type="hidden">
            <input name="nowLng" value="" type="hidden">
            <button id="paymentButton" class="btn btn-primary" disabled="disabled" >${finalCost}원 결제하기</button>
         </form>
      </div>
      <footer>
         <div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
      </footer>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dad7fb57c07b01439820b31881802e7a"></script>
      <script type="text/javascript">
         var nowLat = 37.545293;
         var nowLng = 127.117972;
         var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
         var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(nowLat, nowLng), //지도의 중심좌표.
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
            $("#my_marker").html("");
             // 클릭한 위도, 경도 정보를 가져옵니다 
             var latlng = mouseEvent.latLng; 
             
             // 마커 위치를 클릭한 위치로 옮깁니다
             marker.setPosition(latlng);
             
             nowLat = latlng.getLat();
             nowLng = latlng.getLng();
             if(Math.pow(88.9*(nowLng-127.117972),2)+Math.pow(111*(nowLat-37.545293),2)<=25) {
                $("#pointError").html("");
                document.payment_form.nowLat.value=nowLat;
                document.payment_form.nowLng.value=nowLng;
                $("#paymentButton").removeAttr("disabled");
             } else {
                $("#pointError").html("*배달불가 지역입니다*");
                document.payment_form.nowLat.value=null;
                document.payment_form.nowLng.value=null;
                $("#paymentButton").attr("disabled", "disabled");
             }
         });
         
         var circle = new kakao.maps.Circle({
               center: new kakao.maps.LatLng(37.545293, 127.117972), // 원의 중심좌표 입니다 
                radius: 5000, // 미터 단위의 원의 반지름입니다 
                strokeWeight: 1, // 선의 두께입니다 
                strokeColor: '#0080FF', // 선의 색깔입니다
                strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'line', // 선의 스타일 입니다
                fillColor: '#0080FF', // 채우기 색깔입니다
                fillOpacity: 0.15  // 채우기 불투명도 입니다   
            }); 

            // 지도에 원을 표시합니다 
            circle.setMap(map); 
            
            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      </script>
   </body>
</html>