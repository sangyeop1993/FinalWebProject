<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image⁄png" href="${pageContext.request.contextPath}/resources/images/chickenIcon.png">
		<title>배달완료</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<style>
			@import url('https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean');
			
			* {
            	box-sizing: border-box;
            	font-family: 'Jua', sans-serif;
         	}       
				/* Variables */
				/* Reset */
				*, *::after, *::before {
				  margin: 0;
				  padding: 0;
				  box-sizing: border-box;
				}
				
				/* Generic */
				body {
				  flex-direction:column;
				  width: 100%;
				  height: 100vh;
				  background-color: rgb(253, 189, 51);
				}
				.box1{
					display: flex;
					flex-direction:column; 
					height: 290px;
				}
				.box2{
					 display: flex;
					 flex: 1;
				}

				
				.monster {
				  display: flex;
				  justify-content: center;
				  position: relative;
				  width: 415px;
				  height: 460px;
				  border-top-left-radius: 200px;
				  border-top-right-radius: 200px;
				  background-color: #ffffff;
				  
				}
				.haed{
				  display: flex;
				  justify-content: center;
				  position: relative;
				  width: 375px;
				  height: 490px;
				}
				.monster__face {
				  display: flex;
				  justify-content: center;
				  align-items: center;
				  flex-direction: column;
				  position: absolute;
				  top: 19%;
				  width: 75%;
				  height: 200px;
				}
				.monster__eyes {
				  display: flex;
				  justify-content: space-between;
				  width: 28%;
				  height: auto;
				  margin-bottom: 10px;
				}
				.monster__eye {
				  width: 17px;
				  height: 30px;
				  border-radius: 20px;
				  background: #000000;
				}
				.monster__mouth {
				  display: flex;
				  justify-content: center;
				  align-items: center;
				  position: relative;
				  width: 100%;
				  height: 0%;
				  overflow: hidden;
				  border: 25px solid #FFC333;
				  border-radius: 100px;
				  background-color: #810332;
				  animation: mouth 1.75s infinite;
				}
				.monster__mouth::before {
				  content: "";
				  position: absolute;
				  width: 150px;
				  height: 80px;
				  border-radius: 100px;
				  background-color: #400018;
				}
				.monster__mouth::after {
				  content: "";
				  position: absolute;
				  bottom: -80px;
				  width: 160px;
				  height: 80px;
				  border-top-left-radius: 50%;
				  border-top-right-radius: 50%;
				  background-color: #DC1B50;
				  animation: tongue 1.75s infinite;
				}
				.monster__top {
				  position: absolute;
				  top: -30px;
				  width: 170px;
				  height: 30px;
				  border-bottom-left-radius: 10px;
				  border-bottom-right-radius: 10px;
				  background-color: #ffffff;
				  z-index: 100;
				  animation: t 1.75s infinite;
				}
				.monster__bottom {
				  position: absolute;
				  bottom: 0;
				  width: 100px;
				  height: 30px;
				  border-top-left-radius: 10px;
				  border-top-right-radius: 10px;
				  background-color: #ffffff;
				  z-index: 100;
				  animation: b 1.75s infinite;
				}
				#home{
					margin-left: 375px;
					margin-top: 20px;
				}
				#text{
					font-size: 35px;
					text-align: center;	
					color: white;
				}
				p{
					margin: 0px;	
				}
				#icon{
					text-align: center;
					margin-top: 90px;
				}
				
				/**/
				@keyframes t {
				  0%, 10%, 80%, 100% {
				    top: -30px;
				  }
				  20% {
				    top: 0px;
				  }
				  30% {
				    top: -20px;
				  }
				  40% {
				    top: 0px;
				  }
				  50% {
				    top: -25px;
				  }
				  70% {
				    top: 0px;
				  }
				}
				@keyframes b {
				  0%, 10%, 80%, 100% {
				    bottom: -30px;
				  }
				  20% {
				    bottom: 0px;
				  }
				  30% {
				    bottom: -20px;
				  }
				  40% {
				    bottom: 0px;
				  }
				  50% {
				    bottom: -25px;
				  }
				  70% {
				    bottom: 0px;
				  }
				}
				@keyframes mouth {
				  0%, 10%, 100% {
				    width: 100%;
				    height: 0%;
				  }
				  15% {
				    width: 90%;
				    height: 30%;
				  }
				  20% {
				    width: 50%;
				    height: 70%;
				  }
				  25% {
				    width: 70%;
				    height: 70%;
				  }
				  30% {
				    width: 80%;
				    height: 60%;
				  }
				  35% {
				    width: 60%;
				    height: 70%;
				  }
				  40% {
				    width: 55%;
				    height: 75%;
				  }
				  45% {
				    width: 50%;
				    height: 90%;
				  }
				  50% {
				    width: 40%;
				    height: 70%;
				  }
				  55% {
				    width: 70%;
				    height: 95%;
				  }
				  60% {
				    width: 40%;
				    height: 50%;
				  }
				  65% {
				    width: 100%;
				    height: 60%;
				  }
				  70% {
				    width: 100%;
				    height: 70%;
				  }
				  75% {
				    width: 90%;
				    height: 70%;
				  }
				  80% {
				    width: 50%;
				    height: 70%;
				  }
				  85% {
				    width: 90%;
				    height: 50%;
				  }
				  85% {
				    width: 40%;
				    height: 70%;
				  }
				  90% {
				    width: 90%;
				    height: 30%;
				  }
				  95% {
				    width: 100%;
				    height: 10%;
				  }
				}
				@keyframes tongue {
				  0%, 20%, 100% {
				    bottom: -80px;
				  }
				  30%, 90% {
				    bottom: -40px;
				  }
				  40% {
				    bottom: -45px;
				  }
				  50% {
				    bottom: -50px;
				  }
				  70% {
				    bottom: -80px;
				  }
				  90% {
				    bottom: -40px;
				  }
				}
</style>
	</head>
	<body>
	<div class="box1">
		<div style="width: 414px; height: 50px"><a href="logout"><img src="<%=application.getContextPath()%>/resources/images/home.png" id="home" style="width: 30px;"/></a></div>
		<div id="text" style="width: 414px; height: 100px"><p style="margin-top: 40px;">★배달완료★<br/>주문해주셔서 감사합니다</p></div>
		<div id="icon">
		<a href="<%=application.getContextPath()%>/"><img src="<%=application.getContextPath()%>/resources/images/HEAD.png" style="width: 230px;"/></a>
		</div>
	</div>
		
		<div class="box2">
	    <div class="monster">
	        <div class="monster__face">
	            <div class="monster__eyes">
	                <div class="monster__eye"></div>
	                <div class="monster__eye"></div>
	            </div>
	            <div class="monster__mouth">
	                <div class="monster__top"></div>
	                <div class="monster__bottom"></div>
	            </div>
	        </div>
	    </div>
	    </div>
	</body>
</html>