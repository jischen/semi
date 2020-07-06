<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	파라미터로 전달되는 경우 : 변조가 가능하므로 위험한 방식
// 	String member_id = request.getParameter("member_id");

//	세션으로 전달되는 경우 : 변조가 불가능하지만 세션 용량을 고려하여 바로 삭제해야 한다는 주의사항이 있다
	String member_name = request.getParameter("member_name");
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

<h1>회원가입</h1>
<h5>KHANN에서 어쩌구 저쩌구 하세요~*^^*</h5>	
<hr>
	<h3><%=member_name%>님! KANN의 회원으로 등록되어 있습니다.</h3>
	
	<h5><a href="find_id.jsp">아이디 찾아보아요</a></h5>
	<h5><a href="login.jsp">로그인</a></h5>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>