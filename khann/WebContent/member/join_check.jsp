<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	
	<h2>회원 가입</h2>
	
	<!-- 가입여부 확인 칸은 오른쪽 -->
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
						<input type="text" name="member_birth" placeholder="법정 생년월일 6자리를 입력하세요."required>
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<td>
						<input type="text" name="member_phone" placeholder="-를 제외한 휴대전화 번호를 입력하세요." required>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td align="center" colspan="3">
						<input type="submit" value="가입여부 확인">
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







