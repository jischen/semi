<%@page import="java.io.Console"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.EventDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	String condition = request.getParameter("condition");
	boolean isSearch = keyword != null;

	int pageSize = 10;//한 페이지에 표시할 데이터 개수

	String pageStr = request.getParameter("page");
	int pageNo;
	try {
		pageNo = Integer.parseInt(pageStr);
		if (pageNo <= 0) {
			throw new Exception();
		}
	} catch (Exception e) {
		pageNo = 1;
	}

	int finish = pageNo * pageSize;
	int start = finish - (pageSize - 1);

	int blockSize = 5; //네비게이터 블록을 5개씩 배치
	int startBlock = (pageNo - 1) / blockSize * blockSize + 1;
	int finishBlock = startBlock + blockSize - 1;

	EventDao edao = new EventDao();

	//[다음] 버튼의 경우 계산을 통하여 페이지 개수를 구해야 출력 여부 판단이 가능
	int count; 
	 if (isSearch) {
		count = edao.getCount(type, keyword);
	} else {//목록만
		count = edao.getCount();
	}
	int pageCount = (count + pageSize - 1) / pageSize;

	if (finishBlock > pageCount) {
		finishBlock = pageCount;
	}

 
	//관리자만 글쓰기 버튼 보이게 

	MemberDto user = (MemberDto)session.getAttribute("userinfo");

	
	// List<EventDto> list = 목록 or 검색;
	 List<EventDto> list;
	
	// 검색 시
	if(request.getParameter("type") != null && request.getParameter("keyword") != null) {

		list = edao.test(type, keyword, start, finish);
	} else {
		list = edao.getList(start, finish);
	}
%>




<jsp:include page="/template/header.jsp"></jsp:include>

<article class="w-90" align="center">
	<!-- 제목 -->
	<div class="row">
		<h2>이벤트 게시판</h2>
	</div>


	<!-- 글 목록 -->
	<div class="row">

		<!-- 테이블 -->
		<table border="1" align="center" width="60%" height="80px">
			<thead align="center">
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th>작성일</th>
					<th>진행</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (EventDto edto : list) {
				%>
				<tr>
					<td><%=edto.getEvent_no() %></td>
					<td align="left"><a
						href="content.jsp?event_no=<%=edto.getEvent_no() %>"> <%=edto.getEvent_title() %>
					</a>
					<td><%=edto.getEvent_autotime() %></td>
					<td><%=edto.getEvent_condition() %></td>
				</tr>
				<%} %>

			</tbody>
		</table>


		<%if (user != null) {
				if(user.getGrade().equals("관리자")) {%>
		<!--isAdmin -->

		<div align="right">
		
			<a href="write.jsp"> <input type="button" value="글쓰기">
			</a>
		</div>

		<%} %>
		<%} %>
	</div>

 	<%EventDto edto2 = new EventDto() ; %>
	<!-- 네비게이터  -->
	<h4>
		<%if(startBlock>1) { %> <!-- 첫 페이지 때 이전이 안나오게 하는 경우 -->
			<%if(!isSearch){ %>
			<a href="list.jsp?page=<%=startBlock-1 %>">[이전]</a>
			<%}else{ %>
			<a href = "list.jsp?page=<%=startBlock=1%>&type=<%=type%>&keyword=<%=keyword%>">[이전]</a>  
		<% } %>
		<% } %>
	 
		<!-- 페이지 숫자 반복문  -->
		<%for(int i=startBlock; i<= finishBlock; i++){ %>
			<%if(!isSearch){ %> 
			<a href="list.jsp?page=<%=i%>"><%=i%></a>
			<%}else{ %>
			<a href="list.jsp?page=<%=i%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
			<%} %>
		<%} %>
	
	<%-- 	<%if(pageCount > finishBlock){ %> --%>
		<%if(!isSearch){ %>
			<a href="list.jsp?page=<%=finishBlock+1%>">[다음]</a>
			<%} else { %>
			<a href="list.jsp?page=<%=finishBlock+1%>&type=<%=type%>&keyword=<%=keyword%>">[다음]</a>
			<%}%>
		<%-- <%}%> --%>
	</h4>
	

	<!-- 검색창 -->
	<div class="row center">

		<form action="list.jsp" method="get">
			<!-- 검색분류 -->
			<select class="form-input form-inline" name="type">
				<option value="event_title">제목</option>
				<option value="event_condition">진행</option>
			</select>

			<!-- 검색어 -->
			<input class="form-input form-inline" type="text" name="keyword" required>

			<!-- 전송버튼 -->
			<input class="form-btn form-inline" type="submit" value="검색">
		</form>

	</div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>


