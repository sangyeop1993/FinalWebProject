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
		    
		    #header {
		    	display: flex;
		    }
		    
		    .sideHeader {
		    	width: 150px;
		    	margin: 10px;
		    	margin-top: 30px;
		    }
		    
		    #headCenter {
		    	flex-grow: 1;
		    }
		    
		    #userBox {
		    	border: 4px solid white;
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
				<div id="userBox" class="sideHeader"></div>
			</div>
		</header>
	</body>
</html>