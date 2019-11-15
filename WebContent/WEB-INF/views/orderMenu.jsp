<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>Insert title here</title>
			<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js/"></script>
			<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
			<script type="text/javascript" src = "<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
			<style>
			@import
				url('https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean')
				;
			
				* {
					box-sizing: border-box;
					font-family: 'Jua', sans-serif;
				}
			
				body {
					display: flex;
					flex-direction: column;
					background-color: rgb(253, 189, 51);
					height: 100vh;
				}
				#content{
					/*display: flex;*/
					height: 100%;
				}
				#logoBox{
					background-color: rgb(253, 189, 51);
					text-align: center;
					padding-top: 10px;
					padding-bottom: 10px;
				}
				#orderListBox{
					flex-grow: 1;
				}
				/*메뉴카운트*/
				.btn-outline-danger {
					    color: red;
					    border-color: red;
				    border-radius: 3px;
				}
				
				p{
					font-size: 25px;
					text-align: center;
				}
				/*카테고리css*/
				#myTab{			
				    height: 60px;
				}
				#all-tab, #chicken-tab, #side-tab, #drink-tab{
				    height: 54px;
				    width: 103.4px;
				    padding-top: 15px;
				}
				a {
				    font-size: 21px;
				    color: #ffffff;
				    text-align: center;
				}
				a:hover {
					color: red !important;
				}
				.nav-tabs {
				    border-bottom: 3px solid #ffffff;
				    border-top: 3px solid #ffffff;
				}
				.nav-tabs .nav-link {  
				    border: none;
				    border-top-left-radius: 0px;
				    border-top-right-radius: 0px;
				}
				.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
				    color: red;
				    background-color: #fff;
				    border-color: #dee2e6 #dee2e6 #fff;
				}
				/*메뉴틀 css*/
				#all-box, #chicken-box, #side-box, #drink-box{
   					padding-top: 30px;
   					padding-bottom: 30px;
				}
				
				/*표 css*/
				td{
					padding : 65px;
				}
				/*장바구니 css*/
				 #shoping-box{
					
					margin:10px;
					background-color: #ffffff;	
					border-radius: 20px;
					padding-bottom: 10px;
				} 
				#shopping-log{
					font-size: 25px;
					line-height: 80px;  
					text-align: center;	
   					margin-bottom: 0px;
				}
				#selec-manue{
					 font-size: 15px;
					 text-align: left;
				}

				.selecBox_img::after {
					display: block;
					content: '';
						
				}
				#selec_button{
				width: 120px;
   				height: 40px;
   				font-size: 18px;
				}
				
			</style>
			<script type="text/javascript">
			var menuArray = [0,0,0,0,0,0,0,0,0,0,0];
			var menuNameArray = ["허니콤보","뿌링클","황금올리브","황금올리브 순살","갈비천왕","감자튀김","치즈볼","소떡소떡","콜라","사이다","맥주"];
			var menuPriceArray = ["19000","20000","18000","20000","20000","4000","5000","2500","2000","2000","3000"];
			
			var i = 0;
			var html1 = "";
			var tp = 0;
			function countUp(param) {
				if(menuArray[param] == 0) {
					menuArray[param]++;
					html1 = html1 + "<li>";
					html1 = html1 + menuNameArray[param] + "        ";
					html1 = html1 + menuArray[param];
					html1 = html1 + "        " + menuPriceArray[param] * menuArray[param];
					html1 = html1 + "</li>";
				} else {
					menuArray[param]++;
					html1 = "";
					for(var j=0; j<11;j++) {
						if(menuArray[j] != 0) {
							html1 = html1 + "<li>"
							+ menuNameArray[j]
							+ "        "+ menuArray[j]
							+ "        " + menuPriceArray[j] * menuArray[j]
							+ "</li>";
						}
					}
				}
				menuPriceArray[param] *= 1;
				tp = tp + menuPriceArray[param];
				$(".item_count" + param).html(menuArray[param]);
				$(".selecItem").html(html1);
				$("#totalPrice").html("총합계금액  "+tp+" 원");
			}
			function countDown(param) {
				if(menuArray[param] > 0){
					menuArray[param]--;
					html1 = "";
					for(var j=0; j<11;j++) {
						if(menuArray[j] != 0) {
							html1 = html1 + "<li>";
							html1 = html1 + menuNameArray[j];
							html1 = html1 + menuArray[j];
							html1 = html1 + "        " + menuPriceArray[j] * menuArray[j];
							html1 = html1 + "</li>";
						}
					}
					
					menuPriceArray[param] *= 1;
					tp = tp - menuPriceArray[param];
				}
				$(".item_count" + param).html(menuArray[param]);
				$(".selecItem").html(html1);
				$("#totalPrice").html("총합계금액  "+tp+" 원");
			}
			function send() {
				location.href="finalOrder?arr="+menuArray;
			}
</script>
	</head>
	<body>
		<header>
		<div id="header">
			<div id="logoBox" >
				<img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG" />
			</div>
			<div id="headCenter">
			</div>
		</div>
					<div id="shoping-box">
					<p id="shopping-log">장바구니</p>
				<div id="menus" style=" text-align: center;">
				    <ol class="selecItem" id=selec-manue></ol>
				    <div id="totalPrice" style="font-size: 20px;"></div>
				    <button onclick="send()" class="btn btn-danger" id="selec_button">구매하기</button>
				</div>
			</div>
			
		<div id="content" style=" height: 100vh;">
			<div id="orderListBox" class="contents">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="all-tab" data-toggle="tab" href="#all-box" role="tab" aria-controls="home" aria-selected="true">★추천★</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="chicken-tab" data-toggle="tab" href="#chicken-box" role="tab" aria-controls="profile" aria-selected="false">치킨</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="side-tab" data-toggle="tab" href="#side-box" role="tab" aria-controls="profile" aria-selected="false">사이드</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="drink-tab" data-toggle="tab" href="#drink-box" role="tab" aria-controls="profile" aria-selected="false">음료</a>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade active show" id="all-box" role="tabpanel" aria-labelledby="all-tab">
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/chicken03.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(2)">-</button>
								<span class="item_count2" style="margin-left: 10px; margin-right: 10px; font-size:23px; ">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(2)">+</button>
							</div>
							</div>
	
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/chicken05.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(4)">-</button>
								<span class="item_count4" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(4)">+</button>
							</div>
							</div>

							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/chicken02.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(1)">-</button>
								<span class="item_count1" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(1)">+</button>
							</div>
							</div>

							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/side01.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(5)">-</button>
								<span class="item_count5"style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(5)">+</button>
							</div>
							</div>
		
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/side03.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(7)">-</button>
								<span class="item_count7" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(7)">+</button>
							</div>
							</div>
		
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/beverage03.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(10)">-</button>
								<span class="item_count10" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(10)">+</button>
							</div>
							</div>
					</div>
					
					<!-- 치킨테이블 -->
				    <div class="tab-pane fade" id="chicken-box" role="tabpanel" aria-labelledby="chicken-tab">
			
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/chicken01.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(0)">-</button>
								<span class="item_count0" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(0)">+</button>
							</div>
							</div>
		
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/chicken02.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(1)">-</button>
								<span class="item_count1" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(1)">+</button>
							</div>
							</div>
		
						<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/chicken03.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(2)">-</button>
								<span class="item_count2" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(2)">+</button>
							</div>
							</div>
			
			
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/chicken04.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(3)">-</button>
								<span class="item_count3" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(3)">+</button>
							</div>
							</div>
							
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/chicken05.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(4)">-</button>
								<span class="item_count4" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(4)">+</button>
							</div>
							</div>
				
				    </div>
				    
				    <!-- 사이드테이블 -->
				    <div class="tab-pane fade" id="side-box" role="tabpanel" aria-labelledby="side-tab">
				
						    <div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/side01.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(5)">-</button>
								<span class="item_count5" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(5)">+</button>
							</div>
							</div>
					
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/side02.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(6)">-</button>
								<span class="item_count6" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(6)">+</button>
							</div>
							</div>
					
							<div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/side03.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(7)">-</button>
								<span class="item_count7" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(7)">+</button>
							</div>
							</div>
					
				    </div>
				    
				     <!-- 음료테이블 -->
				    <div class="tab-pane fade" id="drink-box" role="tabpanel" aria-labelledby="drink-tab">
					
							 <div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/beverage01.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(8)">-</button>
								<span class="item_count8" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(8)">+</button>
							</div>
							</div>
					
								 <div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/beverage02.png" width="300px"/> 
		                    <div style="text-align: center;">
								<button type="button" class="btn btn-danger" onClick="countDown(9)">-</button>
								<span class="item_count9" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(9)" >+</button>
							</div>
							</div>
						
								 <div style="text-align: center;">
								<img src="<%=application.getContextPath()%>/resources/images/beverage03.png" width="300px"/> 
		                    <div style="text-align: center;" >
								<button type="button" class="btn btn-danger" onClick="countDown(10)">-</button>
								<span class="item_count10" style="margin-left: 10px; margin-right: 10px; font-size:23px;">0</span>
								<button type="button" class="btn btn-danger" onClick="countUp(10)">+</button>
							</div>
							</div>
				    </div>
				</div>
			</div>
			
			

			
		</div>
		
	</header>
	</body>
</html>