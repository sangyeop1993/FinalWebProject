<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
			<meta charset="UTF-8">
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
					display: flex;
					height: 100%;
				}
				#logoBox{
					background-color: rgb(253, 189, 51);
					text-align: center;
					padding-top: 25px;
					padding-bottom: 25px;
				}
				#orderListBox{
					flex-grow: 1;
				}
				/*카테고리css*/
				#myTab{			
				    height: 86px;
				}
				#all-tab, #chicken-tab, #side-tab, #drink-tab{
				    height: 80px;
				    width: 388px;
				    padding-top: 15px;
				}
				a {
				    font-size: 40px;
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
					padding-left: 30px;
   					padding-top: 30px;
				}
				/*장바구니 css*/
				#shoping-box{
					width: 351px;
					height: 100vh;
					background-color: #ffffff;	
				}
				#shopping-font{
					font-size:50px;
					marggin-top: 20px;
				}
				.selecBox_img {
					float: left;
				}
				.selecBox_img::after {
					display: block;
					content: '';
					clear: both;
					
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
					html1 = html1 + menuNameArray[param];
					html1 = html1 + menuArray[param];
					html1 = html1 + "        " + menuPriceArray[param] * menuArray[param];
					html1 = html1 + "</li>";
				} else {
					menuArray[param]++;
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
				}
				menuPriceArray[param] *= 1;
				tp = tp + menuPriceArray[param];
				$(".item_count" + param).html(menuArray[param]);
				$(".selecItem").html(html1);
				$("#totalPrice").html("총"+tp+"won");
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
				$("#totalPrice").html("총"+tp+"won");
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
		<div id="content" style=" height: 100vh;">
			<div id="orderListBox" class="contents">
				<ul class="nav nav-tabs" id="myTab" role="tablist" >
					<li class="nav-item">
						<a class="nav-link active" id="all-tab" data-toggle="tab" href="#all-box" role="tab" aria-controls="home" aria-selected="true">전체메뉴</a>
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
					<div class="tab-pane fade" id="all-box" role="tabpanel" aria-labelledby="all-tab"></div>
					
					<!-- 치킨테이블 -->
				    <div class="tab-pane fade" id="chicken-box" role="tabpanel" aria-labelledby="chicken-tab">
				    <!-- 치킨테이블  첫번쨰 줄-->
					<table id="chicken-table">
					<tr>
						<td>
							<div>
								<img src="<%=application.getContextPath()%>/resources/images/chicken01.png" width="350px"/> 
		                        <p>
									<button class="btn btn-primary" onClick="countDown(0)">-</button><span class="item_count0">0</span>
									<button class="btn btn-primary" onClick="countUp(0)">+</button>
								</p>
							</div>
						</td>
					
						<td>
							<div>	
								<img src="<%=application.getContextPath()%>/resources/images/chicken02.png" width="350px"/> 
			                    <P>
									<button class="btn btn-primary" onClick="countDown(1)">-</button><span class="item_count1">0</span>
									<button class="btn btn-primary" onClick="countUp(1)">+</button>
								</P>
							</div>
						</td>
					
					<td>
						<div>
							<img src="<%=application.getContextPath()%>/resources/images/chicken03.png" width="350px"/> 
		                    <P>
								<button class="btn btn-primary" onClick="countDown(2)">-</button><span class="item_count2">0</span>
								<button class="btn btn-primary" onClick="countUp(2)">+</button>
							</P>
						</div>
					</td>
					</tr>
					<!-- 치킨테이블 두번째 줄 -->
					<tr>
						<td>
							<div>
								<img src="<%=application.getContextPath()%>/resources/images/chicken04.png" width="350px"/> 
		                    	<P>
								<button class="btn btn-primary" onClick="countDown(3)">-</button><span class="item_count3">0</span>
								<button class="btn btn-primary" onClick="countUp(3)">+</button>
								</P>
							</div>
						</td>
						 
						<td>
							<div>	
							 <img src="<%=application.getContextPath()%>/resources/images/chicken05.png" width="350px"/> 
		                         <P>
								<button class="btn btn-primary" onClick="countDown(4)">-</button><span class="item_count4">0</span>
								<button class="btn btn-primary" onClick="countUp(4)">+</button>
								</P>
							</div>
						</td>
					</tr> 
					</table>
				    </div>
				    
				    <!-- 사이드테이블 -->
				    <div class="tab-pane fade" id="side-box" role="tabpanel" aria-labelledby="side-tab">
				    <table id="side-table">
				    <tr>
					    <td>
						    <div>
							<img src="<%=application.getContextPath()%>/resources/images/side01.png" width="350px"/> 
		                    <p>
								<button class="btn btn-primary" onClick="countDown(5)">-</button><span class="item_count5">0</span>
								<button class="btn btn-primary" onClick="countUp(5)">+</button>
							<p>
							</div>
						</td>
						
						<td>
							<div>	
								<img src="<%=application.getContextPath()%>/resources/images/side02.png" width="350px"/> 
			                    <P>
									<button class="btn btn-primary" onClick="countDown(6)">-</button><span class="item_count6">0</span>
									<button class="btn btn-primary" onClick="countUp(6)">+</button>
								</P>
							</div>
						</td>
						
						<td>
							<div>
								<img src="<%=application.getContextPath()%>/resources/images/side03.png" width="350px"/> 
			                    <P>
									<button class="btn btn-primary" onClick="countDown(7)">-</button><span class="item_count7">0</span>
									<button class="btn btn-primary" onClick="countUp(7)">+</button>
								</P>
							</div>
							</td>
						</tr>
						</table>
				    </div>
				    
				     <!-- 음료테이블 -->
				    <div class="tab-pane fade" id="drink-box" role="tabpanel" aria-labelledby="drink-tab">
					    <table id="beverage-table">
					    <tr>
						    <td>
							    <div>
									<img src="<%=application.getContextPath()%>/resources/images/beverage01.png" width="350px"/> 
				                    <p>
										<button class="btn btn-primary" onClick="countDown(8)">-</button><span class="item_count8">0</span>
										<button class="btn btn-primary" onClick="countUp(8)">+</button>
									</p>
								</div>
							</td>
							
							<td>
								<div>	
									<img src="<%=application.getContextPath()%>/resources/images/beverage02.png" width="350px"/> 
				                    <P>
										<button class="btn btn-primary" onClick="countDown(9)">-</button><span class="item_count9">0</span>
										<button class="btn btn-primary" onClick="countUp(9)">+</button>
									</P>
								</div>
							</td>
							
							<td>
								<div>
									<img src="<%=application.getContextPath()%>/resources/images/beverage03.png" width="350px"/> 
				                    <P>
										<button class="btn btn-primary" onClick="countDown(10)">-</button><span class="item_count10">0</span>
										<button class="btn btn-primary" onClick="countUp(10)">+</button>
									</P>
								</div>
							</td>
						</tr>
						
						</table>
				    </div>
				</div>
			</div>
			
			
			<div id="shoping-box">
				<div id="shopping-log">
					<img class="selecBox_img" src="<%=application.getContextPath()%>/resources/images/shoppingcarticon.png" width=80px;/> 
					<h5 style="font-size: 30px; height: 80px; line-height: 80px;" >장바구니</h5>
				</div>
				<div id="menus">
				    <ol class="selecItem">
				    </ol>
				    <div id="totalPrice" style="font-size: 20px;"></div>
				    <button onclick="send()" class="btn btn-danger">구매하기</button>
				</div>
			</div>
			
		</div>
		
	</header>
	</body>
</html>