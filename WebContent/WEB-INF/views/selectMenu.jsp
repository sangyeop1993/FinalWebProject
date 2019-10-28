<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>proJext</title>
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<style>
	#wrap {
		display: flex;
		box-sizing: border-box;
		padding-top: 100px;
	}
	#innerWrap {
		height: 100vh;
		width: 1200px;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		flex-grow: 1;
	}
	#menuWrap {
		width: 300px;
		text-align: center;
	}
	ul {
	} 
	ul li {
		width: 150px;
		margin: 0 auto;
		height: 42px;
	}
	ul li a {
		text-align: center;
	}
	
	#myTabContent {
		background-color: #EEE;
		flex-grow: 1;
	}
	#myTabContent div {
		
	}
    #myTabContent .cards {
        margin: 0 auto;
        display: flex;
        width: 90%; 
    }
    #myTabContent .card {
        margin: 0 auto;
    }
    #myTabContent .cend {
    
    }
</style>

<script type="text/javascript">
	function countUp(param) {
		console.log(${"menu.get(param).menuPrice"});
	}
	
	
	function countDown() {
		value = value - 1;
		$(".item_count").html(value);
	}
</script>
</head>
<body>
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
                        <h5 class="card-title">후라이드치킨</h5>
                        <p class="card-text"><label for="price"></label></p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
                
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">소이살살치킨</h5>
                        <p class="card-text"><label for="price"></label></p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
                
                <div class="card cend" style="width: 18rem;">
                    <div class="card-body">	
                        <h5 class="card-title">허니콤보</h5>
                        <p>
                        18000won
                        </p>
						<button class="btn btn-primary" onClick="countDown()">-</button>
						<span class="item_count">0</span>
						<button class="btn btn-primary" value="허니콤보" onClick="countUp()">+</button>
						<button type="submit" class="btn btn-primary">submit</button>
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
	
	
	<div id="menuWrap">
		<h3>장바구니</h3>
		<div id="menus">
		    Test Text
		    <div class="selecItem"></div>
		</div>
	    <button type="submit" class="btn btn-danger">구매하기</button>
	</div>
</div>
</body>
<script>
  $(function () {
    $('#myTab li:last-child a').tab('show')
  })
</script>
</html>