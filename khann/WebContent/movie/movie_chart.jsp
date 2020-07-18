<%@page import="beans.dao.MovieFileDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	MovieDao mdao = new MovieDao();
	MovieFileDao mfdao = new MovieFileDao();
	List<MovieDto> list = mdao.getList();
	//로그인 정보 확인 
	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
	boolean isLogin = mdto != null;
%>


<jsp:include page="/template/header.jsp"></jsp:include>

<head>
   <link rel="stylesheet" type="text/css" href="../base.css">
    <style>
   
    
    </style>
    
    
</head>
<body>
     <div id="dh-content">
   <div class="moviechart">
     
           
	<%
		for (MovieDto moviedto : list) {
			int movie_img_no = mfdao.getMovieImgNo(moviedto.getMovie_no());
	%>


           
            <a class="moviechart">
           <label><%=moivedto.getMovie_no() %></label>
          
         <a href="movie_content.jsp?movie_no=<%=moivedto.getMovie_no()%>"> <img
		src="/khann/image/<%=moivedto.getMovie_no()%>.jpg" width="200"
		height="300" style="margin: 50px;">
	</a>
      </a>
         
       	<%

	<a href="movie_content.jsp?movie_no=<%=moviedto.getMovie_no()%>"> <img
		src="download.do?movie_file_no=<%=movie_img_no%>" width="286"
		height="408" style="margin: 50px;">
	</a>
	</td>

	</a>


	<%

		}
	%>

<%
		if (isLogin) {
	%>
	<%
		if (mdto.getGrade().equals("관리자")) {
	%>


<div>
		<a href="/khann/movie/movie_insert.jsp">영화 등록</a> <a
			href="/khann/movie/movie_delete.jsp">영화 삭제</a>
        </div>

	<%
		}
	%>

	<%
		}
	%>

       
       

   
        
   
    </div>
        </div>
</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>
