<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean');
	* {
	box-sizing: border-box;
	font-family: 'Jua', sans-serif;
	
	}
	
	body{
		background-color: rgb(253, 189, 51);
	}
			
	#logoBox{
		background-color: rgb(253, 189, 51);
		padding-left: 900px;
		padding-top: 25px;
		padding-bottom: 25px;
	}
	#menu_drink{
		text-align: center;
		padding-left: 50px;
	}
	#menu_side{
		text-align: center;
		padding-left: 50px;
	}
	#sidebox{
		padding-right: 600px;
	}
	
	#wrap {
		display: flex;
		box-sizing: border-box;
		height: 100vh; 
	}
	
	#innerWrap {
		height: 100vh;
		width: 1200px;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		flex-grow: 1;
		background-color: rgb(253, 189, 51);
	}
	
	#menuWrap {
		position: relative;
		right: 0;
		height: 100%;
		padding-top:20px;
		width: 303px;
		text-align: center;
		background-color:#ffffff;
	}
	
	#myTab {
	border-top:3px solid #ffffff; 
	border-bottom: 3px solid #ffffff;
	} 
	
	#innerWrap ul li {
		width: 400px;
		margin: 0px;
		height: 80px;
		line-height: 80px;
	}
	
	ul li a {
		text-align: center;
		height: 80px;
	}
	
	#myTabContent {
		flex-grow: 1;
	}
	
    #myTabContent .cards {
        margin: 0 auto;
        display: flex;
        width: 90%; 
        height: 80px;
    }
    
    #myTabContent .card {
        margin: 0 auto;
        height: 80px;
    }
    
    #myTabContent .cend {
   		 height: 80px;
    }
    
    #cart{
    	display: flex;
    	justify-content: center;
    	align-items:center;
    }
    
    h5 {
 	 font-size: 35px;
	}
	
	.nav-tabs .nav-link {
		border: none;
		border-radius: 0;
	}
	li{
	font-size: 25px;
	}
	
	a {
		font-size: 28px;
		color: #ffffff;
	}
	
	a:hover {
		color: red !important;
	}
	
	.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	    color: red;
	    background-color: #fff;
	}
</style>

<script type="text/javascript">
	var menuArray = [0,0,0,0,0,0,0,0,0,0,0];
	var menuNameArray = ["허니콤보","뿌링클","황금올리브","황금올리브 순살","갈비천왕","감자튀김","치즈볼","소떡소떡","콜라","사이다","맥주"];
	var menuPriceArray = ["19000","20000","18000","20000","20000","4000","5000","2500","2000","2000","4000"];
	
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
				<img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG" >
			</div>
			<div id="headCenter">
			</div>
		</div>
	</header>
<div id="wrap">
	<div id="innerWrap">
	<ul class="nav nav-tabs" id="myTab" role="tablist" >
		<li class="nav-item">
			<a class="nav-link active" id="menu_all-tab" data-toggle="tab" href="#menu_all" role="tab" aria-controls="menu_all" aria-selected="true" style="padding:0px 30px;">전체메뉴</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="menu_chicken-tab" data-toggle="tab" href="#menu_chicken" role="tab" aria-controls="menu_chicken" aria-selected="false">치킨</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="menu_side-tab" data-toggle="tab" href="#menu_side" role="tab" aria-controls="menu_side" aria-selected="false">사이드메뉴</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="menu_drink-tab" data-toggle="tab" href="#menu_drink" role="tab" aria-controls="menu_drink" aria-selected="false">음료</a>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
	
		<div class="tab-pane fade show active" id="menu_all" role="tabpanel" aria-labelledby="menu_all-tab">
			전체내용불러오기
		</div>
		
		<div class="tab-pane fade" id="menu_chicken" role="tabpanel" aria-labelledby="menu_chicken-tab">
		    <div class="cards">
                <div style="width: 350px;">
                <div>
                    <div class="card-body">
                        <img src="<%=application.getContextPath()%>/resources/images/chicken01.png" width="350px"/> 
                        <p>
						<button class="btn btn-primary" onClick="countDown(0)">-</button><span class="item_count0">0</span>
						<button class="btn btn-primary" onClick="countUp(0)">+</button>
						<p>
                    </div>
                </div>
                
                <div style="width: 350px;">
                    <div class="card-body">
                         <img src="<%=application.getContextPath()%>/resources/images/chicken02.png" width="350px"/> 
                         <P>
						<button class="btn btn-primary" onClick="countDown(1)">-</button><span class="item_count1">0</span>
						<button class="btn btn-primary" onClick="countUp(1)">+</button>
						</P>
                    </div>
                </div>
                
                <div style="width: 350px;">
                    <div class="card-body">
                         <img src="<%=application.getContextPath()%>/resources/images/chicken03.png" width="350px"/> 
                         <p>
						<button class="btn btn-primary" onClick="countDown(2)">-</button><span class="item_count2">0</span>
						<button class="btn btn-primary" onClick="countUp(2)">+</button>
						</p>
                    </div>
                </div>
                </div>
                
                
                
                <div style="width: 350px;">
                    <div class="card-body">
                         <img src="<%=application.getContextPath()%>/resources/images/chicken04.png" width="350px"/> 
                         
						<button class="btn btn-primary" onClick="countDown(3)">-</button><span class="item_count3">0</span>
						<button class="btn btn-primary" onClick="countUp(3)">+</button>
						
                    </div>
                </div>
                
                <div style="width: 350px;">
                    <div class="card-body">
                         <img src="<%=application.getContextPath()%>/resources/images/chicken05.png" width="350px"/> 
						<button class="btn btn-primary" onClick="countDown(4)">-</button><span class="item_count4">0</span>
						<button class="btn btn-primary" onClick="countUp(4)">+</button>
                    </div>
                </div>
			</div>
		</div>
		
		
		<div class="tab-pane fade" id="menu_side" role="tabpanel" aria-labelledby="menu_side-tab">
		    <div class="cards" id="sidebox" >
                  <div style="width: 350px;">
                    <div class="card-body">
                         <img src="<%=application.getContextPath()%>/resources/images/side01.png" width="350px"/> 
						<button class="btn btn-primary" onClick="countDown(5)">-</button><span class="item_count5">0</span>
						<button class="btn btn-primary" onClick="countUp(5)">+</button>
                    </div>
                </div>
                
               <div style="width: 350px;">
                    <div class="card-body" >
                         <img src="<%=application.getContextPath()%>/resources/images/side02.png" width="350px"/> 
						<button class="btn btn-primary" onClick="countDown(6)">-</button><span class="item_count6">0</span>
						<button class="btn btn-primary" onClick="countUp(6)">+</button>
                    </div>
                </div>
                
                <div style="width: 350px;">
                    <div class="card-body">
                         <img src="<%=application.getContextPath()%>/resources/images/side03.png" width="350px"/> 
						<button class="btn btn-primary" onClick="countDown(7)">-</button><span class="item_count7">0</span>
						<button class="btn btn-primary" onClick="countUp(7)">+</button>
                    </div>
                </div>
			</div>
        </div>
		<div class="tab-pane fade" id="menu_drink" role="tabpanel" aria-labelledby="menu_drink-tab">
		    <div class="cards">
               <div style="width: 350px;">
                    <div class="card-body">
                         <img src="<%=application.getContextPath()%>/resources/images/beverage01.png" width="350px"/> 
						<button class="btn btn-primary" onClick="countDown(8)">-</button><span class="item_count8">0</span>
						<button class="btn btn-primary" onClick="countUp(8)">+</button>
                    </div>
                </div>
                
                 <div style="width: 350px;">
                    <div class="card-body">
                         <img src="<%=application.getContextPath()%>/resources/images/beverage02.png" width="350px"/> 
						<button class="btn btn-primary" onClick="countDown(9)">-</button><span class="item_count9">0</span>
						<button class="btn btn-primary" onClick="countUp(9)">+</button>
                    </div>
                </div>
                
                 <div style="width: 350px;">
                    <div class="card-body">
                         <img src="<%=application.getContextPath()%>/resources/images/beverage03.png" width="350px"/> 
						<button class="btn btn-primary" onClick="countDown(10)">-</button><span class="item_count10">0</span>
						<button class="btn btn-primary" onClick="countUp(10)">+</button>
                    </div>
                </div>
			</div>
        </div>
	</div>
	</div>
	<div id="menuWrap" >
		<div id="cart">
			<img src="<%=application.getContextPath()%>/resources/images/shoppingcarticon.png" width="60px"/> 
			<h5>장바구니</h5>
		</div>
		<div id="menus">
		    <ol class="selecItem">
		    </ol>
<<<<<<< HEAD
		    <div id="totalPrice"></div>
		    <button onclick="send()" class="btn btn-danger">배달 주문하기</button>
=======
		    <div id="totalPrice" style="font-size: 20px;"></div>
		    <button onclick="send()" class="btn btn-danger">구매하기</button>
		    
>>>>>>> branch 'master' of https://github.com/sangyeop1993/FinalWebProject
		</div>
	</div>
</div>
</body>
</html>