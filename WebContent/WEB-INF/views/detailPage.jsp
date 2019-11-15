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
<p>�ֹ���ȣ: ${member.oid}</p>
<p>����� id: ${member.mid}</p>
<p>�̸�: ${member.mname}</p>
<p>��ȭ��ȣ: ${member.mphonenumber}</p>
<p>��о��̵�: ${member.did}</p>
<p>���� �ݾ�: ${member.price}</p>
<!-- <p>${member.date}</p> -->
<p>�������: ${member.ostatus}</p>
<p>���: ${member.lname}</p>
<p>����: ${member.lat}</p>
<p>�浵: ${member.lng}</p>

<hr/>

<h5>�ֹ� ����Ʈ</h5>
<table border="1">
	<thead>
	<tr>
	<th>��û ��ȣ</th>
	<th>�޴� ��ȣ</th>
	<th>�̸�</th>
	<th>����</th>
	<th>����</th>
	<th>����</th>
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