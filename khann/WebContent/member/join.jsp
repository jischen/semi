<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
<script>
  /*아이디 중복검사 스크립트 */
	function idCheck(){ 
	window.name = "parent"
	window.open("id_overlap_check.jsp", "idwin", "width=400, height=350"); }

</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("input[name=post]").value = data.zonecode;
                document.querySelector("input[name=base_addr]").value = addr;
                
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("input[name=extra_addr]").focus();
                
            }
        }).open();
    }
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
						<input type="button" onclick="findAddress();" value="우편번호 찾기">
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