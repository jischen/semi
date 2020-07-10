<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	
	<h2>아이디 찾기</h2>
	
	
	<h5>입력하신 정보는 아이디 찾기에만 사용되며 <span style="color: red">저장되지 않습니다</span>.</h5>
	<form action="find_id.do" method="post">
		<table border="0">
			<tbody>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="member_name" placeholder="이름을 입력하세요." required >
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="member_birth" placeholder="법정 생년월일 8자리를 입력하세요."
						pattern="(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])" title="형식 20121231">
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<td>
						<input type="text" name="member_phone" placeholder="-를 제외한 휴대전화 번호를 입력하세요." 
						pattern="(010)\d{3,4}\d{4}" title="형식 01012345678">
>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="찾기">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	
	
	<!-- error에 대한 처리 -->
	<%if(request.getParameter("error") != null){ %>
	<h6><font color="red">정보에 해당하는 아이디가 없습니다.</font></h6>
	<%} %>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>







