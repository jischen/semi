
<%@page import="java.io.Console"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.EventDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	/Event/list.jsp : 게시판 목록 겸 검색 페이지
 -->
<%
	String type = request.getParameter("type");//condition으로 바꿔야함
	String keyword = request.getParameter("keyword");

	boolean isSearch = type != null && keyword != null;

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

	int blockSize = 10; //네비게이터 블록을 10개씩 배치
	int startBlock = (pageNo - 1) / blockSize * blockSize + 1;
	int finishBlock = startBlock + blockSize - 1;

	EventDao edao = new EventDao();

	//(주의!) 다음 버튼의 경우 계산을 통하여 페이지 개수를 구해야 출력 여부 판단이 가능
	//int count=목록개수 or 검색개수 ;
	int count;
	if (isSearch) {
		count = edao.getCount(type, keyword);
	} else {
		count = edao.getCount();
	}
	int pageCount = (count + pageSize - 1) / pageSize;
	//만약 finishBlock이 pageCount보다 크다면 수정해야 한다
	if (finishBlock > pageCount) {
		finishBlock = pageCount;
	}

	// List<EventDto> list = 목록 or 검색;
	List<EventDto> list;
	if (isSearch) {
		list = edao.search(type, keyword);
	} else {
		list = edao.getList(start, finish);
	}

	//관리자만 글쓰기 버튼 보이게 
	MemberDto user = (MemberDto)session.getAttribute("userinfo");
	boolean isAdmin = user.getGrade().equals("관리자");
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
		<table border="1" align="center" width="60%" height="800px">
			<thead>
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th>작성일</th>
					<th>진행</th>
				</tr>
			</thead>
			<tbody align="center">
				<%for(EventDto edto : list){ %>
				<tr>
					<td><%=edto.getEvent_no() %></td>
					<td align="left">
						<a href="content.jsp?event_no=<%=edto.getEvent_no() %>">
						<%=edto.getEvent_title() %>
						</a>
					<td><%=edto.getEvent_date() %></td>
					<td><%=edto.getEvent_condition() %></td>
			</tbody>

			<!-- 게시글 제목 넣어야 함-->

		</table>

		<%if (user != null) {
				if(isAdmin) {%>
		<div align="right">
			<a href="write.jsp"> <input type="button" value="글쓰기">
			</a>
		</div>
		<%} %>
	<%} %>
	</div>


	<!-- 페이지 네비게이터 -->
	<div class="row center">
		<div class="pagination">
			<!-- 
			이전 버튼을 누르면 startBlock - 1 에 해당하는 페이지로 이동해야 한다
			(주의) startBlock이 1인 경우에는 출력하지 않는다
		 -->
			<%
					if (startBlock > 1) {
				%>

			<%
					if (!isSearch) {
				%>
			<a href="list.jsp?page=<%=startBlock - 1%>">&lt;</a>
			<%
					} else {
				%>
			<a
				href="list.jsp?page=<%=startBlock - 1%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%
					}
				%>

			<%
					}
				%>

			<!-- 
			이동 숫자에 반복문을 적용 
			범위는 startBlock부터 finishBlock까지로 설정
		-->
			<%
					for (int i = startBlock; i <= finishBlock; i++) {
				%>
			<%
					//현재 페이지에 해당하는 블록은 class="on"을 추가하여 출력하면 디자인 효과를 볼 수 있다.
						String prop;
						if (i == pageNo) {
							prop = "class='on'";
						} else {
							prop = "";
						}
				%>

			<%
					if (!isSearch) {
				%>
			<!-- 목록일 경우 페이지 번호만 전달 -->
			<a href="list.jsp?page=<%=i%>" <%=prop%>><%=i%></a>
			<%
					} else {
				%>
			<!-- 검색일 경우 페이지 번호와 검색 분류(type), 검색어(keyword)를 전달 -->
			<a href="list.jsp?page=<%=i%>&type=<%=type%>&keyword=<%=keyword%>"
				<%=prop%>><%=i%></a>
			<%
					}
				%>
			<%
					}
				%>

			<!-- 
			다음 버튼을 누르면 finishBlock + 1 에 해당하는 페이지로 이동해야 한다
			(주의!) 다음이 없는 경우에는 출력하지 않는다(pageCount <= finishBlock)
		 -->
			<%
					if (pageCount > finishBlock) {
				%>
			<%
						if (!isSearch) {
				%>
			<a href="list.jsp?page=<%=finishBlock + 1%>">&gt;</a>
			<%
					} else {
				%>
			<a
				href="list.jsp?page=<%=finishBlock + 1%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%
					}
				%>
			<%
					}
				%>
	
			<%
					}
				%>

			

		</div>
	</div>

	<!-- 검색창 -->
	<div class="row center">

		<form action="list.jsp" method="get">
			<!-- 검색분류 -->
			<select class="form-input form-inline" name="type">
				<option value="Event_title">제목</option>
				<option value="Event_condtion">진행</option>
			</select>

			<!-- 검색어 -->
			<input class="form-input form-inline" type="text" name="keyword"
				required>

			<!-- 전송버튼 -->
			<input class="form-btn form-inline" type="submit" value="검색">
		</form>

	</div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>

