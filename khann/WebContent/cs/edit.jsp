<%@page import="beans.dto.CsDto"%>
<%@page import="beans.dao.CsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cs_no = Integer.parseInt(request.getParameter("cs_no"));
	CsDao cdao = new CsDao();
	CsDto cdto = cdao.get(cs_no);

%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>게시글 수정</h2>
	
	<form action="edit.do" method="post">
	
		<input type="hidden" name="cs_no" value="<%=cs_no%>">
		
		<table border="1">
			<tbody>
				<tr>
					<th>말머리</th>
					<td>
						<select name="cs_head">
							<option value="">말머리 선택</option>
							<option value="영화예매">영화예매</option>
							<option value="회원제도">회원제도</option>
							<option value="회원정보">회원정보</option>
							<option value="카드할인">카드할인</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="cs_title" size="75" required value="<%=cdto.getCs_title()%>">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="cs_content" required rows="15" cols="77"><%=cdto.getCs_content()%></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정"></td>
				</tr>
			</tfoot>
		</table>
	
	</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>