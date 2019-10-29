<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reset</title>
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
	
	}
			
	#logoBox{
	background-color: rgb(253, 189, 51);
	padding-bottom: 10px;
	}
	
	#wrap {
		display: flex;
		box-sizing: border-box;
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
	
		padding-top:20px;
		width: 300px;
		text-align: center;
		background-color:#ffffff;
	}
	#myTab {
	border-top:3px solid #ffffff; 
	border-bottom: 3px solid #ffffff;
	} 
	#innerWrap ul li {
		
		width: 150px;
		margin: 0 auto;
		height: 80px;
		line-height: 80px;
	}
	ul li a {
		text-align: center;
		height: 80px;
	}
	
	#myTabContent {
		flex-grow: 1;
		height: 80px;
		background-color: rgb(253, 189, 51);
		
	}
	#myTabContent div {
		height: 80px;
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
</style>

<script type="text/javascript">
	
	var menuArray = new Array();
	var i = 0;
	function countUp(param) {
		menuArray[i] = param;
		i = i+1;
		sessionStorage.setItem('menuArray', menuArray);
		$(".selecItem").html(menuArray)
	}
		 

	function countDown() {
		value = value - 1;
		$(".item_count").html(value);
	}
</script>

</head>
<body>
	<header>
			<div id="header">
				<div id="logoBox" style="padding-left: 900px; padding-top: 25px;">
					<img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG" >
				</div>
				<div id="headCenter">
				</div>
			</div>
		</header>

<div id="wrap">
	<div id="innerWrap">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" id="menu_all-tab" data-toggle="tab" href="#menu_all" role="tab" aria-controls="menu_all" aria-selected="true">전체메뉴</a>
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
		    A
		</div>
		<div class="tab-pane fade" id="menu_chicken" role="tabpanel" aria-labelledby="menu_chicken-tab">
		    <div class="cards">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">허니콤보</h5>
                        <p>19000won</p>
						<button class="btn btn-primary" onClick="countDown()">-</button><span class="item_count">0</span>
						<button class="btn btn-primary" onClick="countUp(0)">+</button>
                    </div>
                </div>
                
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">뿌링클</h5>
                        <p>20000won</p>
						<button class="btn btn-primary" onClick="countDown()">-</button><span class="item_count">0</span>
						<button class="btn btn-primary" onClick="countUp(1)">+</button>
                    </div>
                </div>
                
                <div class="card cend" style="width: 18rem;">
                    <div class="card-body">	
                        <h5 class="card-title">황금올리브</h5>
                        <p>18000won</p>
						<button class="btn btn-primary" onClick="countDown()">-</button><span class="item_count">0</span>
						<button class="btn btn-primary" onClick="countUp(2)">+</button>
                    </div>
                </div>
			</div>
		</div>
		<div class="tab-pane fade" id="menu_side" role="tabpanel" aria-labelledby="menu_side-tab">
		    C
        </div>
		<div class="tab-pane fade" id="menu_drink" role="tabpanel" aria-labelledby="menu_drink-tab">
		    D
        </div>
	</div>
	</div>
	
	
	<div id="menuWrap" >
		<div id="cart">
		
		<img src="<%=application.getContextPath()%>/resources/images/shoppingcarticon.png" width="60px"/> 
		<h5>장바구니</h5>
		</div>
		
		<div id="menus">
		    <div class="selecItem">
		    	${menus.get(0).getMenuPrice()}
		    </div>
		</div>
		
	    <button type="submit" class="btn btn-danger">구매하기</button>
	</div>
</div>
</body>
</html>