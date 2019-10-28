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
		    	margin-top: 30px;
		    }
		    
		    #headCenter {
		    	flex-grow: 1;
		    }
		    
		    #loggerBox {
		    	width: 300px;
		    	border: 4px solid white;
		    	margin: 10px;
		    }
		    
		    #contentBox{
		    	width: 300px;
		    }
		    
		    .contents {
		    	margin: 10px;
		    	border: 4px solid white;
		    	height: 200px;
		    	padding: 7px;
		    }
		    
		    #userMiniBox {
		    	display: flex;
		    }
		    
		    #userImage {
		    	margin: 10px;
		    }
		    
		    #userTextBox {
		    	margin: 20px;
		    	
		    }
		    
		    #logoutButton {
		    	margin: 10px;
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
		<script type="text/javascript">
			function test(param) {
				console.log("${member_model.mid}");
				console.log("${member_model.mname}");
				console.log("${member_model.mid}");
			}
		</script>
	</head>
	<body>
		<header>
			<div id="header">
				<img id="logoBox" src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG"/>
				<div id="headCenter"></div>
			</div>
		</header>
		<div id="center">
			<div id="contentBox" class="sideBar">
				<div id="userBox" class="contents">
					<div id="userMiniBox">
						<p id="userImage">
							<img id="userPng" src="<%=application.getContextPath()%>/resources/images/user_icon.png" width=80>
						</p>
						<div id="userTextBox">
							<p>NAME: ${member.mname}
							LEVEL: ${member.lname}
							DRONE: 드론1</p>
						</div>
					</div>
					<button id="logoutButton" class="btn btn-danger" type="button" onclick="location.href='logout'">로그아웃</button>
				</div>
				<div id="orderListBox" class="contents"></div>
				<div id="TemperatureBox" class="contents"></div>
			</div>
			<div id="mapBox">
				<img src="<%=application.getContextPath()%>/resources/images/logout.png" width=200/>
				<button id=testing onclick="test('admin')" class="btn btn-danger" >테스트</button>
				${member_model.mid}
			</div>
			<div id="loggerBox" class="sideBar"></div>
		</div>
		<div id="locationBar"></div>
		<footer>
			<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
		</footer>
		
	</body>
</html>