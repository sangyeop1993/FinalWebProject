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
    		
    		h3 {
    			text-align: center;
    			margin: 120px;
    		}
		</style>
	</head>
	<body>
		<h3><a href="/FinalWebProject">감사합니다!</a></h3>
	</body>
</html>