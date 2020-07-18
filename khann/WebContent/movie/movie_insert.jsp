<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.MovieFileDao"%>
<%@page import="beans.dto.MovieFileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

MovieDao mdao = new MovieDao();
MovieDto mdto = new MovieDto();



//첨부파일 목록을 구해오는 코드
MovieFileDao mfdao = new MovieFileDao();
//getSequence 
//글따로 파일따로 servlet
 
%>
<jsp:include page="/template/header.jsp"></jsp:include>




 <link rel="stylesheet" type="text/css" href="../base.css">

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
<form action="insert.do" method="post" enctype="multipart/form-data">
 
	 <input type="hidden" name="movie_no" value="<%=request.getParameter("movie_no")%>">
       
       영화 삽입
      <div class="mvcontent-form">


 
        <div class="movie_content">
            <label id="movielabel"> 제목</label>
             <br>
           <input type="text" name="movie_name" required>
        </div>
       

        <div class="movie_content">
            <label id="movielabel">  장르</label>
             <br>
           <input name="movie_type" type="text" required>
        </div>
 
       
        <div class="movie_content">
            <label id="movielabel">  상영등급</label>
             <br>
           <input name="movie_age" type="text" required>
        </div>
 
        <div class="movie_content">
            <label id="movielabel"> 상영시간</label>
             <br>
          <input name="movie_runtime" type="text" required>
        </div>

      
       

        <div class="movie_content">
           <label id="movielabel">  개봉일 </label>
            <br>
         <input name="movie_open" type="text" required>
        </div>

             <div class="movie_content">
            <label id="movielabel"> 감독</label>
             <br>
         <input name="movie_director" type="text">
        </div>


             <div class="movie_content">
            <label id="movielabel"> 배우</label>
                 <br>
       <input name="movie_ac" type="text">
        </div>

        <div class="movie_content">
           <label id="movielabel">  줄거리</label>
                <br>
          <textarea name="movie_content"  rows="7" cols="70"></textarea>
        </div>
        
        
        <div class="movie_content">
   <label>첨부파일</label>
           첨부파일
	<input type="file" name="movie_file" multiple accept=".jpg, .png, .gif"> 
            
        </div>
            <div class="mvbutton">
            <input type="submit" value="등록">
           
            

            </div>
            </div>
                           	</form>
                            </div>



	<div>제목
	<input type="text" name="movie_name" required>
	</div>
	<br>
	
	<div>장르
	<input name="movie_type" type="text" required>
	</div>	
	<br>
		
	<div>상영등급
	<input name="movie_age" type="text" required>
	</div>
	<br>
	
	<div>상영시간
	<input name="movie_runtime" type="text" required>
	</div>
	<br>
	
	<div>개봉일
	<input name="movie_open" type="text" required>
	</div>
	<br>
	
	<div>감독
	<input name="movie_director" type="text">
	</div>
	<br>
	
	<div>배우
	<input name="movie_ac" type="text">
	</div>
	<br>
	
	<div>줄거리
		<textarea name="movie_content"  rows="7" cols="70"></textarea>
	</div>	
	
	<div>첨부파일
	<input type="file" name="movie_file" multiple accept=".jpg, .png, .gif"> 
	
				
	</div>
	
	<div colspan="2" align="center">
			<input type="submit" value="등록">
	</div>
	

	
	</form>	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>




    