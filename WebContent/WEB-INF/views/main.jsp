<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		    
		    #center, #lower {
		    	flex-grow: 1;
		    	display: flex;
		    	margin: 0px;
		    }
		    
		    #header {
		    	display: flex;
		    }
		    
		    #logoBox {
		    	width: 150px;
		    	margin: 0px;
		    }
		    
		    #headCenter {
		    	flex-grow: 1;
		    }

		    #loggerBox {
		    	height: 600px;
		    	width: 300px;
		    	border: 4px solid white;
		    	margin: 10px;
		    }
		    
		    #contentBox{
		    	display: flex;
		    	flex-direction: column;
		    	width: 300px;
		    	height: 608px;
		    }
		    
		    .contents {
				margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
		    	border: 4px solid white;
		    	height: 200px;
		    	padding: 7px;
		    }
		    
		    #userMiniBox {
		    	display: flex;
		    	margin-top:20px;
		    	margin-bottom: 0px;
		    	padding:0px;
		    }
		    
		    #userImage {
		    	margin: 10px;
		    }
		    
		    #userTextBox {
		    	margin-top: 10px;
		    	margin-right: 10px;
		    	margin-left: 10px;
		    	
		    }
		    
		    #logoutButton {
		    }
		    
		    #mapBox {
		  		margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
		    	margin: 10px;
		    	height: 600px;
		    	width: 1300px;
		    	border: 4px solid white;
		    }
		    
		    #locationBar {
		    	flex-grow: 1;
		    	margin: 10px;
		    	border: 4px solid white;
		    	height: 170px;
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
				<div id="logoBox" style="padding-left: 900px; padding-top: 15px;">
					<img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG" >
				</div>
				<div id="headCenter">
				</div>
			</div>
		</header>
		<div id="center">
			<div id="contentBox" class="sideBar">
				<div id="userBox" class="contents">
					<div id="userMiniBox">
							<p>
							<img id="userPng" src="<%=application.getContextPath()%>/resources/images/user_icon.png" width=80px; hight=80px; style="margin-bottom: 0px;"/>
							</p>
						<div id="userTextBox" >
							<p>NAME: ${member.mname} <br/>
							LEVEL: ${member.lname} <br/>
							DRONE: ${droen.dname}</p>
						</div>
					</div>
					<button id="logoutButton" class="btn btn-danger" type="button" onclick="location.href='logout'">로그아웃</button>
				</div>
				<div id="orderListBox" class="contents"></div>
				<div id="TemperatureBox" class="contents"></div>
			</div>
			<div id="mapBox">
				
			</div>
			<div id="loggerBox" class="sideBar"></div>
		</div>
		<div id="lower">
			<div id="locationBar"></div>
		</div>
		<footer>
			<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
		</footer>
		
	</body>
</html>