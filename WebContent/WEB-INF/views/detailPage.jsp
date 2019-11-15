<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<p>주문번호: ${member.oid}</p>
<p>사용자 id: ${member.mid}</p>
<p>이름: ${member.mname}</p>
<p>전화번호: ${member.mphonenumber}</p>
<p>드론아이디: ${member.did}</p>
<p>결재 금액: ${member.price}</p>
<!-- <p>${member.date}</p> -->
<p>진행상태: ${member.ostatus}</p>
<p>등급: ${member.lname}</p>
<p>위도: ${member.lat}</p>
<p>경도: ${member.lng}</p>

<hr/>

<h5>주문 리스트</h5>
<table border="1">
	<thead>
	<tr>
	<th>요청 번호</th>
	<th>메뉴 번호</th>
	<th>이름</th>
	<th>수량</th>
	<th>가격</th>
	<th>무게</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="menu" items="${itemList}">
	<tr>
	<td>${menu.oid}</td>
	<td>${menu.menuId}</td>
	<td>${menu.menuName}</td>
	<td>${menu.amount}</td>
	<td>${menu.menuPrice}</td>
	<td>${menu.menuWeight}</td>
	</tr>
	
	</c:forEach>
	</tbody>
</table>

</body>
</html>