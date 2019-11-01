<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reset</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<style>
		@import url('https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean');
	
			* {
				box-sizing: border-box;
				font-family: 'Jua', sans-serif;
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
		    	margin-left:20px;
		    	padding:0px;
		    }
		    
		    #userTextBox {
     			font-size:13pt;
     			line-height:1.9em; 
     			margin-top: 0px; 
     			margin-left:10px;
     		}
     		#userPng{
     			margin-bottom: 0px;
     			margin-left:0px;
     			margin-right: 5px;
     		}
     		
     		 #deleteButton, #logoutButton{
     			font-size:14pt;
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
		    #logoBox {
				width: 100%;
				height: 80px;
		    }
		    #logoBox img {
		    	margin: 26px auto 0;
		    	display: block;
		    	
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
		<div style="width:1903px; margin:0 auto;">
		<header id="header">
			<div id="logoBox">
				<a href="<%=application.getContextPath()%>/"><img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG" ></a>
			</div>
			<div id="headCenter">
			</div>
		</header>
		<div id="center">
			<div id="contentBox" class="sideBar">
				<div id="userBox" class="contents" >
					<div id="userMiniBox" style="margin-left: 10px">
							<p>
							<img id="userPng" src="<%=application.getContextPath()%>/resources/images/user_icon.png" width=90px;  />
							</p>
						<div id="userTextBox" style=" ">
							<p>
								NAME: ${member.mname} <br/>
								LEVEL: ${member.lname} <br/>
								DRONE: ${droen.dname}
							</p>
						</div>
					</div>
					<div style="text-align: center;">
				<button id="logoutButton" class="btn btn-danger" type="button" onclick="location.href='logout'" style="margin-right: 15px; width:80pt;">로그아웃</button>
				<a href="deleteMember?mid=${member.mid}" id="deleteButton" class="btn btn-secondary" style="width:80pt;">회원탈퇴</a>
				
				</div>
				</div>
				
				<div id="orderListBox" class="contents">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
					  <li class="nav-item">
					    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">현재주문</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">과거주문</a>
					  </li>
					</ul>
				<div class="tab-content" id="myTabContent">
				  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">현재주문</div>
				  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">과거주문</div>
				</div>
				</div>
				
				<div id="TemperatureBox" class="contents">
				<p style="margin-top: 0; margin-bottom: 0;">NAME: ${member.mname} </p>
					<img id="tempericon" src="<%=application.getContextPath()%>/resources/images/Chicken_tempicon.png" width=200px; style=" margin-left: 20px;"  />
				</div>
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
		</div>
	</body>
</html>