<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>


<div align="center">

	<form action="show_delete.do" method="post">

		<h2>상영 정보 삭제</h2>

		<input name="show_no" type="text" value="삭제할 상영번호"> <a
			href="/khann/show/show_list.jsp"> <input type="submit"
			value="삭제하기"></a>



	</form>
</div>





<jsp:include page="/template/footer.jsp"></jsp:include>