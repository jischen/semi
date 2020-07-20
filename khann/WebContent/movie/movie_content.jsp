<%@page import="beans.dto.MovieFileDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.MovieFileDao"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="beans.dto.MovieDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

	MovieDao mdao = new MovieDao();
	MovieDto mdto = new MovieDto();
	
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));
	System.out.println(movie_no);
	//무비컨텐츠 //
	
	
	mdto = mdao.get(movie_no);
	
	MovieFileDao mfdao = new MovieFileDao();
	List<MovieFileDto> fileList = mfdao.getList(movie_no);
	
	
	
	int movie_file_no = mfdao.getMovieImgNo(movie_no);
	
	//System.out.println("영화 파일 번호 : " + movie_file_no);

	
%>

	
	
<jsp:include page="/template/header.jsp"></jsp:include>

<head>
   <link rel="stylesheet" type="text/css" href="../css/base.css">

<style>
    .mvcontent-form{
        border:1px solid black;
    }
    #movielabel{
        font-weight: 800;
      
      
    }
    #movietext:hover{
        background-color: lightgray;
    }
    .mvbutton{
   
        height: 40px;
         border:1px solid black;
        background-color: #9D3434;
        text-align: right;
    }
    
    .moviemain{
    height:40px;
    background-color: #9D3434;
    }
    </style>
</head>


<body>


    <div id="dh-content" style="margin-left: 320px">

       
      <div class="mvcontent-form">

<div class="moviemain">

</div>
       <div>
    <img src="download.do?movie_file_no=<%=movie_file_no%>" width="250" height="250">       
       </div>
 
        <div class="movie_content">
            <label id="movielabel"> 제목</label>
             <%=mdto.getMovie_name()%>
        </div>
        <br>

       
        <div class="movie_content">
            <label id="movielabel"> 감독/배우</label>
             <%=mdto.getMovie_director()%>/<%=mdto.getMovie_ac()%>
        </div>

        <div class="movie_content">
            <label id="movielabel">  장르,상영등급</label>
            <%=mdto.getMovie_type()%>/<%=mdto.getMovie_age() %>
        </div>
 

        <div class="movie_content">
           <label id="movielabel">  개봉일 </label>
            <%=mdto.getMovie_open() %>
        </div>
<br>
        <div class="movie_content">
           <label id="movielabel">  줄거리</label>
            <textarea id="movietext" rows="3" cols="70"><%=mdto.getMovie_content() %></textarea>
        </div>
        
<br>
        <div class="movie_content">
            <label> 첨부파일</label>
           <%if(!fileList.isEmpty()){%>
						<%for(MovieFileDto mfdto2 : fileList){ %>
						<%=mfdto2.getMovie_file_name()%>
						(<%=mfdto2.getMovie_file_size()%> bytes)
					
						<%} %>
						<%} %>
				
            
        </div>
            <div class="mvbutton">
            <a href="/khann/movie/movie_change.jsp?movie_no=<%=mdto.getMovie_no()%>"><input type="submit" value="영화수정"></a>
			<a href="/khann/review/review_write.jsp"><input type="submit" value="리뷰작성"></a>

			<a href="/khann/review/review_list.jsp"><input type="submit" value="리뷰 더보기"></a>
           
            

            </div>
            </div>
                            </div>


</body></html>





