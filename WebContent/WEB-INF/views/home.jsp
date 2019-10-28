<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in content</title>
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js" ></script>
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
    
    #loginButton1, #loginButton2 {
    	flex-grow: 1;
    	height: 40px;
    	width: 180px;
    	margin: 15px;
    }
    
    #logoutDiv {
    	text-align: center;
    }
    
    footer {
    	height: 50px;
        line-height: 50px;
        text-align: center;
    }
</style>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/style.css">
<script type="text/javascript">
	function btnLogin() {
		var result = true;
		if($("#mid").val() == ""){
			$("#idError").text("아이디를 입력해주세요.");
			result = false;
		}
		if($("#mpassword").val() == ""){
			$("#passwordError").text("비밀번호를 입력해주세요.");
			result = false;
		}
		return result;
	}
	function btnLogout() {
		location.href = "logout";
	}
	$(document).ready(function(){
		 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#mid").val(key); 
	     
	    if($("#mid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#mid").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#mid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#mid").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
</script>
</head>
<body>
	<div id="wrap">
		<c:if test="${loginResult != 'success'}">
			<div id="imageDiv">
				<img id="mainimage" src="<%=application.getContextPath()%>/resources/images/chicken.PNG" width = 320/>
			</div>
		    <div id="content-box">
				<form id="loginForm" method="post" action="login" onsubmit="return btnLogin()">
					<div class="form-group">
						<input type="text" class="form-control" id="mid" name="mid" placeholder="아이디">
						<p id="idError" style="color: red;"></p>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="mpassword" name="mpassword" placeholder="비밀번호">
						<p id="passwordError" style="color: red;"></p>
					</div>
					<c:if test="${loginResult == 'fail'}">
						<span style="color:red;">아이디나 비밀번호가 틀렸습니다.</span><br/>
					</c:if>
					<input type="checkbox" id="idSaveCheck"> 아이디 저장
					<div class="loginButton">
						<input id="loginButton1" type="submit" class="btn btn-danger" value="로그인"/>
						<button id="loginButton2" type="button" onclick="location.href='join'" class="btn btn-danger">회원가입</button>
					</div>
				</form>
			</div>
		</c:if>
		<c:if test="${loginResult == 'success'}">
			<div id="logoutDiv">
				<button id="orderPage" onclick="location.href='selectMenu'" class="btn btn-primary">임시버튼 주문페이지</button>
				<button id="mainPage" onclick="location.href='main'" class="btn btn-primary">임시버튼 메인페이지</button>
				<button id="logoutButton" onclick="btnLogout()" class="btn btn-danger">로그아웃</button>
			</div>
		</c:if>
	</div>
	<footer>
		<div id="footer">&copy;copyright 2019 . <a href="https://github.com/sangyeop1993/FinalWebProject" target="_blank">치킨날다</a></div>
	</footer>
</body>
</html>