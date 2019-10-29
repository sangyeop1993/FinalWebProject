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
		    
		    #wrapper {
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
				width: 450px;
				text-align: center;
			}
			
			.marginDiv {
				flex-grow: 1;
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
			
			function inputPhoneNumber(mphonenumber) {

			    var number = mphonenumber.value.replace(/[^0-9]/g, "");
			    var phone = "";

			    if(number.length < 4) {
			        return number;
			    } else if(number.length < 7) {
			        phone += number.substr(0, 3);
			        phone += "-";
			        phone += number.substr(3);
			    } else if(number.length < 11) {
			        phone += number.substr(0, 3);
			        phone += "-";
			        phone += number.substr(3, 3);
			        phone += "-";
			        phone += number.substr(6);
			    } else {
			        phone += number.substr(0, 3);
			        phone += "-";
			        phone += number.substr(3, 4);
			        phone += "-";
			        phone += number.substr(7);
			    }
			    mphonenumber.value = phone;
			}
			
			$(document).ready(function () {
				   $(function () {
				            
				            $('#mphonenumber').keydown(function (event) {
				             var key = event.charCode || event.keyCode || 0;
				             $text = $(this); 
				             if (key !== 8 && key !== 9) {
				                 if ($text.val().length === 3) {
				                     $text.val($text.val() + '-');
				                 }
				                 if ($text.val().length === 8) {
				                     $text.val($text.val() + '-');
				                 }
				             }

				             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
							 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
							 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
				         })
				   });

				})
			
		</script>
	</head>
	<body>
		<div id="wrapper">
			<div class="marginDiv">
			</div>
			<div id="joinFormBox">
			<p>
			<img id="mainimage" src="<%=application.getContextPath()%>/resources/images/chicken.PNG" width = 320/>
			</p>
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
					<input type="text" name="mphonenumber" id="mphonenumber"  maxlength="13" class="form-control" placeholder="전화번호"/>					
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