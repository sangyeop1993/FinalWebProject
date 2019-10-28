<%@ page contentType="text/html; charset=UTF-8"%>

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
		    
		    #center {
		    	flex-grow: 1;
		    	display: flex;
		    }
		    
		    #header {
		    	display: flex;
		    }
		    
		    #logoBox {
		    	width: 150px;
		    	margin: 10px;
		    }
		    
		    #headCenter {
		    	flex-grow: 1;
		    }
		    
		    #userInfoBox {
		    	margin: 10px;
		    	width: 150px;
		    	border: 4px solid white;
		    }
		    #loggerBox {
		    	width: 300px;
		    	border: 4px solid white;
		    	margin: 10px;
		    }
		    
		    #contentBox{
		    	width: 300px;
		    	display: flex;
		    	flex-direction: column;
		    }
		    
		    .contents {
		    	margin: 10px;
		    	border: 4px solid white;
		    	flex-grow: 1;
		    }
		    #mapBox {
		    	flex-grow: 1;
		    }
		    
		    #locationBar {
		    	margin: 10px;
		    	border: 4px solid white;
		    	height: 150px;
		    }
		    footer {
		    	height: 50px;
		        line-height: 50px;
		        text-align: center;
		    }
		</style>
	</head>
	<body>
		<header>
			<div id="header">
				<img id="logoBox" src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG"/>
				<div id="headCenter"></div>
				<div id="userInfoBox">VVIP 김상엽</div>
			</div>
		</header>
		<div id="center">
			<div id="contentBox" class="sideBar">
				<div id="userBox" class="contents">
					<!-- <button onclick=""></button> -->
				</div>
				<div id="orderListBox" class="contents"></div>
				<div id="TemperatureBox" class="contents"></div>
			</div>
			<div id="mapBox"></div>
			<div id="loggerBox" class="sideBar"></div>
		</div>
		<div id="locationBar"></div>
		<footer>
			<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
		</footer>
		
	</body>
</html>