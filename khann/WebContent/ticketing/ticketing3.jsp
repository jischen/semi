<%@page import="java.util.ArrayList"%>
<%@page import="beans.dto.ShowDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.ShowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));
	String select_date = request.getParameter("select_date");
	
	
	ShowDao sdao = new ShowDao();
	List<ShowDto> list = sdao.startList(movie_no);
	List<String> time = new ArrayList<>();
	
	
	
%>


<jsp:include page="/template/header.jsp"></jsp:include>

<div id="dh-content">
	
	
	
	<table>
		
		<tr>
			<h2>상영 시간 선택</h2>
		</tr>
		
		<%-- <%for(ShowDto sdto : list){%>
		<%if(select_date.equals(sdto.getShow_start().substring(0,10))){ %>
		<tr> 
			<td><%=sdto.getShow_start().substring(11,16)%></td>
			
		</tr>
		<%}}%> --%>
		
		
	<form action="ticketing4.jsp" method="post">
		
		
		<input type="hidden">
		<select name="show_no"  >
			<%for(ShowDto sdto : list){%>
				<%if(select_date.equals(sdto.getShow_start().substring(0,10))){ %>
					<option value="<%=sdto.getShow_no()%>" >
						<%=sdto.getShow_start().substring(11,16)%>
					</option>
				<%}} %>
		</select>
	
	
		<input type="submit" value="전송">
	</form>
			
		
		
		
		
	</table>
	
	
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>