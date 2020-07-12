<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<script>

	function idCheck(){ 
	window.name = "parent"
	window.open("id_overlap_check.jsp", "idwin", "width=400, height=350"); }




</script>





<div align="center">
	
	<h2>회원가입</h2>    
    
<!-- 	<form action="/home/member/join.do"> -->
	<!-- 
		form을 만들 때에는 전송방식을 설정할 수 있다.
		- GET : 주소를 이용하여 요청과 데이터 모두 전달하는 방식
			- 장점 : 간편하게 사용이 가능하다
			- 단점 : 길이 제한이 있다(256byte) , 주소창에 데이터가 노출된다
			- 주로 간편한 select 등을 수행할 때 사용
		- POST : 요청 바디(request body)에 데이터를 첨부하여 전달하는 방식
			- 장점 : 길이 제한이 없다. 데이터가 주소창에 노출되지 않는다
			- 단점 : 요청을 보내기 위해서 도구가 많이 필요하다(form 등), 한글과 같은 유니코드가 깨져서 저장된다
			- 이 방식으로 전송한 데이터를 복구하기 위해서는 request.setCharacterEncoding() 명령이 필요
			- 주로 등록과 같은 복잡한 데이터 전송에 사용
	 -->
	<form action="join.do" method="post">
		<table border="0">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="member_id" required placeholder="5~20자 영문 또는 숫자 " id="parent">
						<input type="button" value="ID중복확인" onclick="idCheck()">

					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="member_pw" required placeholder="8~16자 영문 또는 숫자">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="member_name" required placeholder="한글 8자 이내">
					</td>
				</tr>
				<tr>
					<th rowspan="3">주소</th>
					<td>
						<!-- 우편번호는 6자정도 크기에 6자까지만 입력하도록 설정 -->
						<input type="text" name="post" size="6" maxlength="6" placeholder="우편번호">
						
						<!-- 버튼은 눌러도 지금 당장은 효과가 없다(자바스크립트 배워야 함) -->
						<input type="button" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="base_addr" size="50" placeholder="기본주소">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="extra_addr" size="50" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="member_phone" required placeholder="- 제외">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="member_birth" required>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<input type="submit" value="가입">
					</th>
				</tr>
			</tfoot>
		</table>
	</form>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>