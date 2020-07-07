
<%@page import="beans.dao.MemberDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	change_info.jsp : 
	- 데이터 수정을 할 수 있도록 입력창에 데이터를 설정해주는 것이 중요!
	- 회원 가입 페이지와 항목은 다르지만 유사할 것으로 보임
 -->

<%
	MemberDto mdto = (MemberDto)session.getAttribute("userinfo");
	String member_id = mdto.getMember_id();
	MemberDao mdao = new MemberDao(); 
	MemberDto user = mdao.get(member_id);
%>


<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
 	<h2>회원 정보 수정</h2>

 	<form action="change_info.do" method="post">
 		<table>
 			<tbody>
 				<tr>
 					<th>닉네임</th>
 					<td>
 						<input type="text" name="member_name" value="<%=user.getMember_name()%>" required>
 					</td>
 				</tr>
 				<tr>
 					<th rowspan="3">주소</th>
 					<td>
 						<input type="text" name="post" size="6" maxlength="6" value="<%=user.getPost()%>" placeholder="우편번호">
 						<input type="button" value="우편번호 찾기">
 					</td>
 				</tr>
 				<tr>
 					<td>
						<input type="text" name="base_addr" size="50" value="<%=user.getBase_addr()%>" placeholder="기본주소"> 					
 					</td>
 				</tr>
 				<tr>
 					<td>
						<input type="text" name="extra_addr" size="50" value="<%=user.getExtra_addr()%>" placeholder="상세주소"> 					
 					</td>
 				</tr>
 				<tr>
 					<th>전화번호</th>
 					<td>
 						<input type="text" name="member_phone" required value="<%=user.getMember_phone()%>">
 					</td>
 				</tr>
 			</tbody>
 			<tfoot>
 				<tr>
 					<td colspan="2" align="center">
 						<input type="submit" value="수정하기">
 					</td>
 				</tr>
 			</tfoot>
 		</table>
 	</form>
 </div>

 <jsp:include page="/template/footer.jsp"></jsp:include>


