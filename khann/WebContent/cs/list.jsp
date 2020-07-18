<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.CsDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.CsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#title{
		color:black;
	}
</style>  
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
	
	String rootPath = request.getContextPath();
	
	
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>

<article class="w-90">
	<!-- 제목 -->
	<div class="row"><a id="title" href="<%=rootPath%>/cs/list.jsp"><h2>FAQ</h2></a></div>
	
	<!-- 안내문 -->	
	<div class="row center"><p>여러분들이 자주 문의하시는 질문과 답변을 정리하였습니다.<br>
				FAQ 검색을 이용하시면 궁금하신 내용을 보다 빠르고 편리하게 찾으실 수 있습니다.</p></div>
	
	<!-- 검색창 -->	
	<div class="row center">
		<form action="list.jsp" method="get">
			<!-- 검색어 -->
			<input class="form-input form-inline" type="text" name="keyword" placeholder="검색어를 입력해주세요" required>
			<!-- 전송버튼 -->
			<input class="form-btn form-inline" type="submit" value="검색">
		</form>
	</div>
	
	<!-- 말머리 버튼 -->	
	<div class="menu-list float-box float-left">
		<div class="menu-item"><form action="list.jsp" method="get"><input type="hidden" name="head" value="영화예매"><input class="form-btn form-inline" type="submit" value="영화예매"></form></div>
		<div style="margin-left:10px" class="menu-item"><form action="list.jsp" method="get"><input type="hidden" name="head" value="회원제도"><input class="form-btn form-inline" type="submit" value="회원제도"></form></div>
		<div style="margin-left:10px" class="menu-item"><form action="list.jsp" method="get"><input type="hidden" name="head" value="회원정보"><input class="form-btn form-inline" type="submit" value="회원정보"></form></div>
		<div style="margin-left:10px" class="menu-item"><form action="list.jsp" method="get"><input type="hidden" name="head" value="카드할인"><input class="form-btn form-inline" type="submit" value="카드할인"></form></div>
		<div style="margin-left:10px" class="menu-item"><form action="list.jsp" method="get"><input type="hidden" name="head" value="기타"><input class="form-btn form-inline" type="submit" value="기타"></form></div>
	</div>
	
	
	<!-- 표 -->	
	<div class="row">
		<table class="table table-border">
			<thead align="center">
			<tr bgcolor="#f5f5f5">
				<td>번호</td>
				<td width="600">제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			</thead>
			<tbody class="cl" align="center">
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
		</table>
	</div>
	
	<!-- 글쓰기 버튼 -->	
	<%if(user != null) {
			if(user.getGrade().equals("관리자")){ %>
	<div class="row right"><a href="write.jsp"><input class="form-btn form-inline" type="button" value="글쓰기"></a></div>
			<%} 
	} %>	
</article>


<jsp:include page="/template/footer.jsp"></jsp:include>