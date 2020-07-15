<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	write.jsp : 게시글 작성 페이지
	- 입력 항목은 3개 : event_head, event_title, event_content
	- 작성자는 관리자
 -->
 
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center" >
	<h2>이벤트 작성</h2>
	
	<!-- 게시글 전송 폼 -->
	<form action="write.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tbody>
				<tr>
					<th>말머리</th>
					<td>
						<select name="event_condition">
							<option value="">상황 선택</option>
							<option value="예정">예정</option>
							<option value="진행">진행</option>
							<option value="마감">마감</option>
						</select>
					</td>
				</tr>
				<tr>
				
					<th>제목</th>
					<td>
						<input type="text" name="event_title" size="70" required>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="event_content" required rows="20" cols="80"></textarea>
					</td>  
				</tr>
				
				<!-- 첨부파일 -->
				<tr>
					<th>첨부파일</th>
					<td>
						 <input type="file" name="event_file" multiple accept=".jpg, .png, .gif"> 
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="작성">
					</td>
				</tr>
			</tfoot>
		</table>
		
	</form>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>

