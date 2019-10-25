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
		    
		    #wrap {
		    	flex-grow: 1;
		    }
		    
		    #content-box {
		        margin: 0 auto;
		        width: 300px;
		        
		    }
		    
		    #wrapper {
				display: flex;
				padding-top: 100px;
			}
					    
		    #joinFormBox {
				flex-grow: 1;
				text-align: center;
			}
			
			.marginDiv {
				flex-grow: 2;
			}
		    
		    #btn-login {
		        margin: 50px 0;
		    }
		    footer {
		    	height: 50px;
		        line-height: 50px;
		        text-align: center;
		    }
		</style>
		<script type="text/javascript">
			function checkJoin() {
				var result = true;
				if($("#mid").val() == ""){
					$("#idError").text("아이디를 입력해주세요.");
					result = false;
				}
				if($("#mname").val() == ""){
					$("#nameError").text("이름을 입력해주세요.");
					result = false;
				}
				if($("#mpassword").val() == ""){
					$("#passwordError").text("비밀번호를 입력해주세요.");
					result = false;
				}
				if($("#mphonenumber").val() == ""){
					$("#phonenumberError").text("전화번호를 입력해주세요.");
					result = false;
				}
				return result;
			}
		</script>
	</head>
	<body>
		<div id="wrapper">
			<div class="marginDiv"></div>
			<div id="joinFormBox">
				<form id="joinForm" method="post" action="join" onsubmit="return checkJoin()">
					<div class="input-group mb-3">
					  	<input id="mid" name="mid" type="text" class="form-control" placeholder="아이디"/>
					</div>
					<p id="idError" style="color: red;"></p>
					
					<div class="input-group mb-3">
						<input id="mname" name="mname" type="text" class="form-control" placeholder="이름">
					</div>
					<p id="nameError" style="color: red;"></p>
					
					<div class="input-group mb-3">
						<input id="mpassword" name="mpassword" type="password" class="form-control" placeholder="비밀번호">
					</div>
					<p id="passwordError" style="color: red;"></p>
					
					<div class="input-group mb-3">
						<input id="mphonenumber" name="mphonenumber" type="text" class="form-control" placeholder="전화번호">
					</div>
					<p id="phonenumberError" style="color: red;"></p>
					
					<input id="mlevel" name="mlevel" type="hidden" value="1"/>
					<input id="joinButton" type="submit" class="btn btn-danger" value="회원가입"/>
				</form>
			</div>
			<div class="marginDiv"></div>
		</div>
		<footer>
			<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
		</footer>
	</body>
</html>