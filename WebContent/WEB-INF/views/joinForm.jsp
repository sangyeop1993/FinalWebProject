<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>회원가입</title>
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
		        height: 100%;
		    }
		    
		    #wrapper {
		    	/*flex-grow: 1;*/
		    	height: 100%;
		    }
		    
		    #content-box {
		        margin: 0 auto;
		        width: 300px;
		        
		    }
		    
		    #wrapper {
				display: flex;
				padding-top: 50px;
			}
					    
		    #joinFormBox {
				width: 450px;
				text-align: center;
			}
			#joinButton , #BackHomeButton{
			     font-size:16pt;
			     width:80pt;
			     height:35pt;"
			}
			
			.marginDiv {
				flex-grow: 1;
			}
		    
		    footer {
		    	height: 50px;
		        line-height: 50px;
		        text-align: center;
		        padding-top:20px;
		    }
		    #mname, #mpassword, #mpassword2, #mphonenumber{
		    	margin-left:20px;
		    	margin-right: 20px;
		    }
		    #mid{
		    	margin-left:20px;
		    }
		    #check_mid{
		    	margin-right: 20px;
		    }
		</style>
		<script type="text/javascript">
			function checkJoin() {
				if(checkMidResult) {
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
						$("#mpasswordError").text("비밀번호를 입력해주세요.");
						result = false;
					}
					if($("#mphonenumber").val() == ""){
						$("#phonenumberError").text("전화번호를 입력해주세요.");
						result = false;
					}
					return result;
				} else {
					alert("중복 체크를 하셔야 합니다.");
					return false;
				}
			}
			
			
			var checkMidResult = false;
			function checkMid(){
				$.ajax({
					url: "checkMid",
					data: {mid:$("#mid").val()},
					success: function(data){
						if(data.result){
							checkMidResult = true;
							$("#idError").text("*사용할 수 있는 아이디 입니다.");
							$("#idError").css("color","green");
							//$("#joinButton").removeAttr("disabled"); 
						} else {
							checkMidResult = false;
							$("#idError").text("*사용할 수 없는 아이디 입니다.");
							$("#idError").css("color","red");	
						}
					}
				});
				
			}
			
			$(function(){
				$("#alert-success").hide(); 
				$("#alert-danger").hide(); 
				$("input").keyup(function(){
					var pwd1=$("#mpassword").val();
					var pwd2=$("#mpassword2").val();
					if(pwd1 != "" && pwd2 != ""){
						if(pwd1 == pwd2){ 
							$("#joinButton").removeAttr("disabled"); 
							$("#mpasswordError").text("*비밀번호가 일치합니다.");
							$("#mpasswordError").css("color","green");
						}else{ 
								$("#joinButton").attr("disabled", "disabled");
								$("#mpasswordError").text("*비밀번호가 일치하지 않습니다.");
								$("#mpasswordError").css("color","red");
						}
					}
				});
			});
			
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
			<img id="mainimage" src="<%=application.getContextPath()%>/resources/images/chicken.PNG" width = 180/>
			</p>
				<form id="joinForm" method="post" action="join" onsubmit="return checkJoin()">
					<div class="input-group mb-3">
					  	<input id="mid" name="mid" type="text" class="form-control" placeholder="아이디"/>
					  	<div class="input-group-append" style="margin: 0px; padding-bottom: 8px;">
		    			<input id="check_mid" onclick="checkMid()" type="button" class="btn btn-danger" value="중복체크"/>
			  		</div>
					</div>

					<p id="idError" style="color: red;"></p>
					
					
					<div class="input-group mb-3" style="margin: 0px; padding-bottom: 8px;">
						<input id="mname" name="mname" type="text" class="form-control" placeholder="이름">
					</div>
					<p id="nameError" style="color: red;"></p>
					
					<div class="input-group mb-3" style="margin: 0px; padding-bottom: 8px;">
						<input id="mpassword" name="mpassword" type="password" class="form-control" placeholder="비밀번호">
					</div>
					<div class="input-group mb-3" style="margin: 0px; padding-bottom: 8px;">
						<input id="mpassword2" name="mpassword2" type="password" class="form-control" placeholder="비밀번호확인">
					</div>
					<p id="mpasswordError" style="color:red;"></p>
					
					
					<div class="input-group mb-3">
					<input type="text" name="mphonenumber" id="mphonenumber"  maxlength="13" class="form-control" placeholder="전화번호"/>					
					</div>
					<p id="phonenumberError" style="color: red;"></p>
					
					<input id="mlevel" name="mlevel" type="hidden" value="1"/>
					
					<div style="padding-top:30px">
					<input id="joinButton" type="submit" class="btn btn-primary" value="회원가입"  />			
					<button id="BackHomeButton" class="btn btn-secondary" type="button" onclick="location.href='logout'" >취소</button>
					</div>
				</form>
			</div>
			<div class="marginDiv"></div>
		</div>
		<footer>
			<div id="footer" >&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
		</footer>
	</body>
</html>