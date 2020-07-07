<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    					<br>
					</td>
				</tr>
				<!-- 하단(footer) 영역 -->
				<tr height="100">
					<td align="center">
					
						
						<!-- 사용자의 로그인 정보를 분석하는 코드 작성(연습용) -->
						<h6>세션ID : <%=session.getId()%></h6>
						<h6>userinfo : <%=session.getAttribute("userinfo")%></h6>
						<h6>로그인 : <%=session.getAttribute("userinfo") != null%></h6>
						<h6>(07212)서울 영등포구 선유동2로 57 이레빌딩 </h6>
						<h6>대표이사 : 고지선 | 사업자등록번호 : 1004-82-49105 </h6>
						<h6>&copy;KH.KHANN.All Rights Reserved</h6>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>


