<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사 </title>


		<script>
		
		function apply(){ 
			var check_id =document.getElementById('check_id').textContent;
			window.opener.document.getElementById("parent").value = check_id;	

			window.close();

			 }
		
		</script>
		
	
</head>
<body>
	<div style="text-align: center">
		<h3>아이디 중복확인</h3>
		<form method="post" action="id_overlap_check.do">
			아이디 : <input type="text" name="request_id" maxlength="20" autofocus pattern="[A-Za-z0-9]{5,19}" title="아이디 형식에 맞춰주세요 ">
			<input type="submit" value="중복확인"  > 
		</form>
		<div>아이디는 5~20자 영문 또는 숫자만 입력해주세요</div>
	</div>

	
		<%if(request.getParameter("no") != null){ %>
	<h4 align="center" ><font color="red"> <%= request.getAttribute("request_id") %>
	사용이 불가능합니다.</font></h4>
			
	<%} %>
	<%if(request.getParameter("ok") != null){ %>
	<h4 align="center">
	   <span id="check_id"><%= request.getAttribute("request_id")%></span> 사용이가능합니다.</h4>
	<input type="button" value="사용하기" onclick="apply()">
		
	<%} %>
	
	
</body>
</html>