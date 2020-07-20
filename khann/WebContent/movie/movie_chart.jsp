<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	MovieDao mdao = new MovieDao();
	List<MovieDto> list = mdao.getList();
	//로그인 정보 확인 
	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
	boolean isLogin = mdto != null;
%>

<jsp:include page="/template/header.jsp"></jsp:include>


<head>
   
    <title>MovieName</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <style>
        
        
        
        table {
            margin: auto;
            text-align: center;
            
        
        }
        
        td	{
        	width: 300px;
        }
        
        
    
    </style>
 
</head>
<body>
    
    
    <table >
        	<tr>
    		<%for (MovieDto moivedto : list){%>
            		<td>
            		<label><%=moivedto.getMovie_name()%></label>
            		<br>
            		<a href="movie_content.jsp?movie_no=<%=moivedto.getMovie_no()%>"> 
            		<img src="/khann/image/<%=moivedto.getMovie_name()%>.jpg" 
            			width="280px" height="250px">
            		</a>
            		</td>
            		
        	<%}%>  
        	</tr>
        	         
    </table>
    <%if (isLogin) {%>
			<%if (mdto.getGrade().equals("관리자")) {%>
			<div>
			<a href="/khann/movie/movie_insert.jsp">영화 등록</a> 
			<a href="/khann/movie/movie_delete.jsp">영화 삭제</a>
       		</div>

			<%}%>
	<%} %>
    
    
    
</body>


<jsp:include page="/template/footer.jsp"></jsp:include>


























<jsp:include page="/template/footer.jsp"></jsp:include>


