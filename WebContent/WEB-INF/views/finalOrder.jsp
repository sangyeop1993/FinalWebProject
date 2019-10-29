<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpSession"%>

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
		    
		    #userInfoLine {
		    	display: flex;
		    	height: 50px;
		    }
		    
		    #userInfoLineLeftBox {
		    	flex-grow: 1;
		    }
		    
		    .userLine {
		    	margin-right: 5px;	
		    }
		    
		    #center {
		    	height: 4000px;
		    	background-color: white;
		    	margin: 30px;
		    	margin-bottom: 0px;
		    	overflow: auto;
		    	text-align: center;
		    }
		    
		    .centerElements {
		    	width: 1200px;
		    	margin: 20px;
		    }
		    
		    .elementTitle {
		    	text-align: left;
		    	font: bold 20px;
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
				<div id="logoBox" class="sideHeader">
					<img src="<%=application.getContextPath()%>/resources/images/Chicken_logo.PNG">
				</div>
				<div id="headCenter">
				</div>
			</div>
			<div id="userInfoLine">
				<div id="userInfoLineLeftBox"></div>
				<div class="userLine" style="color: red;">${member.lname}</div>
				<div class="userLine" style="margin-right: 40px;">${member.mname}님 환영합니다</div>
			</div>
		</header>
		<div id="center">
			<div class="centerElements">
				<div class="elementTitle">
					<p class="elementnName">주문 제품</p>
					<hr/>
					<ul>
						<c:forEach items="${selectedMenu}" var="menuList">
							<li>${menuList[0]}, ${menuList[1]}, ${menuList[2]}</li>
						</c:forEach>
					</ul>
					<hr/>
				</div>
			</div>
			<div class="centerElements">
				<div class="elementTitle">
					<p class="elementnName">배달지</p>
					<hr/>
				</div>
			</div>
			<div class="centerElements">
				<div class="elementTitle">
					<p class="elementnName">결제 금액</p>
					<hr/>
				</div>
			</div>
		</div>
		<footer>
			<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
		</footer>
	</body>
</html>