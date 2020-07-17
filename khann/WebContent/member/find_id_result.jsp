<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	파라미터로 전달되는 경우 : 변조가 가능하므로 위험한 방식
// 	String member_id = request.getParameter("member_id");

//	세션으로 전달되는 경우 : 변조가 불가능하지만 세션 용량을 고려하여 바로 삭제해야 한다는 주의사항이 있다
	String member_id = (String)session.getAttribute("member_id");
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.getID(member_id);
	session.removeAttribute("member_id");
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

<h1>아이디 확인</h1>
<h5>입력하신 정보와 일치하는 아이디는 다음과 같습니다*^^*</h5>	
<hr>
	<h3><%=mdto.getMember_name()%>님의 아이디는 <%=member_id%> 입니다</h3>
	
	<!-- 이 다음에 할 것으로 예상되는 작업에 대한 링크를 제공 -->
	<h5><a href="login.jsp">로그인하러 가기</a></h5>
	<h5><a href="find_pw.jsp">비밀번호 찾기</a></h5>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>