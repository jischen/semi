<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.CsDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.CsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("keyword");
	String head = request.getParameter("head");

	boolean isSearch = keyword != null;
	boolean isHead1 = head != null; 
	CsDao cdao = new CsDao();
	
	List<CsDto> list;
	if(isSearch){
		list = cdao.search(keyword); 
	}
	else if(isHead1){
		list = cdao.searchHead(head);
	}
	else{
		list = cdao.getList(); 
	}
	
	MemberDto user = (MemberDto)session.getAttribute("userinfo");
	boolean isAdmin = user.getGrade().equals("관리자");
	
	String rootPath = request.getContextPath();
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>FAQ</h2>
	
	<table border="0">
		<thead>
			<tr>
				<td colspan="5">
				여러분들이 자주 문의하시는 질문과 답변을 정리하였습니다.<br>
				FAQ 검색을 이용하시면 궁금하신 내용을 보다 빠르고 편리하게 찾으실 수 있습니다.
				</td>
			</tr>
		</thead>
		<tbody align="center">
			<tr>
				<td><form action="list.jsp" method="get"><input type="hidden" name="head" value="영화예매"><input type="submit" value="영화예매"></form></td>
				<td><form action="list.jsp" method="get"><input type="hidden" name="head" value="회원제도"><input type="submit" value="회원제도"></form></td>
				<td><a href="#">회원정보</a></td>
				<td><a href="#">카드할인</a></td>
				<td><a href="#">기타</a></td>
			</tr>
		</tbody>
	</table>
	
	<form action="list.jsp" method="get">
		<label>FAQ 검색</label>
		<!-- 검색어 -->
		<input type="text" name="keyword" placeholder="검색어를 입력해주세요" required>
		<!-- 전송버튼 -->
		<input type="submit" value="검색">
	</form>
	
	<table border="1">
		<thead align="center">
			<tr>
				<td>번호</td>
				<td width="600">제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody align="center">
			<%for(CsDto cdto : list){ %>
			<tr>
				<td><%=cdto.getCs_no()%></td>
				<td align="left">
					<a href="content.jsp?cs_no=<%=cdto.getCs_no()%>"><%=cdto.getCs_title()%></a>
				</td>
				<td><%=cdto.getCs_writer()%></td>
				<td><%=cdto.getCs_autotime()%></td>
				<td><%=cdto.getCs_read()%></td>
			</tr>
			<%} %>
		</tbody>
		<%if(user != null) {
			if(isAdmin){ %>
		<tfoot>
			<tr>
				<td colspan="5" align="right">
					<a href="write.jsp"><input type="button" value="글쓰기"></a>
				</td>
			</tr>
		</tfoot>
			<%} 
			} %>
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>