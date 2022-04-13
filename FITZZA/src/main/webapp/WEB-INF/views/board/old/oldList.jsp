<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <title>FITZZA | 중고거래</title>
</head>
<link rel="stylesheet" href="/css/oldlist.css" type="text/css">

<body>
<br><br><br><br><br><br><br><br>
	<div class="oldboard">
    <h2 id="title">중고거래</h2>
    <div id="write">
        <a href="/board/old/oldWrite">글쓰기</a>
    </div>
    <ul class="oldlist" id="oldlist">
        <li>지역</li>
        <li>대표이미지</li>
        <li>제목</li>
        <li>작성자</li>
        <li>작성일</li>
        <li>조회</li>


		<!-- 게시물 리스트-->
        <c:forEach var="vo" items="${lst}">
            <li>${vo.city}</li>
            <li><a href="/board/old/oldView?board_num=${vo.board_num}"><img src="/upload/${vo.file1}"/></a></li>
            <li><a href="/board/old/oldView?board_num=${vo.board_num}">${vo.title}</a></li>
            <li><img src="${vo.profile_image}" style="width:20px; height:20px; border-radius: 70%;"/> ${vo.user_nickname}</li>
            <li>${vo.write_date}</li>
            <li>${vo.hit}</li>
        </c:forEach> 
    </ul>
    
    <!-- 리스트 더보기 -->
    <a id="moreView">더보기</a>
    
    
    <!-- 검색 -->
    <form method="get" action="/board/old/oldList" id="searchFrm">
            <select name="searchKey">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="city">지역</option>
                <option value="user_id">작성자</option>
            </select>
            <input type="text" name="searchWord" id="searchWord"/>
            <input type="submit" value="Search"/>
     </form>
</div>
</body>
<script>

   $(function() {
       $("#searchFrm").submit(function() {
          if ($("#searchWord").val() == "") {
             alert("검색어를 입력하세요");
             return false;
          }
       });
   		
       window.onload=function(){
			var startNum = $("#oldlist li").length/6; // oldlist안에 li태그의 길이
			var addListHtml = "";
			 console.log(startNum); 
			
			$.ajax({
				url : '/board/old/oldLists',
				type : 'POST',
				dataType : 'json',
				data : {
					"startNum" : startNum
				},
				success : function(data){
					
					for (var i = 0; i < data.length; i++) {
						addListHtml += "<li>"+data[i].city+"</li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'><img src='/upload/"+data[i].file1+"'/></a></li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'>"+data[i].title+"</a></li>";
						addListHtml += "<li><img src='"+data[i].profile_image+"' style='width:20px; height:20px; border-radius: 70%;'/>"+data[i].user_nickname+"</li>";
						addListHtml += "<li>"+data[i].write_date+"</li>";
						addListHtml += "<li>"+data[i].hit+"</li>";
						if(data[i].board_num==1){
							$("#moreView").remove();
						} 
					}
					$("#oldlist").append(addListHtml);
					/* console.log(addListHtml); */
				}
			});
       }
   
	   $('#moreView').click(function(){
			var startNum = $("#oldlist li").length/6; // oldlist안에 li태그의 길이
			var addListHtml = "";
			 console.log(startNum); 
			
			$.ajax({
				url : '/board/old/oldLists',
				type : 'POST',
				dataType : 'json',
				data : {
					"startNum" : startNum
				},
				success : function(data){
					
					for (var i = 0; i < data.length; i++) {
						addListHtml += "<li>"+data[i].city+"</li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'><img src='/upload/"+data[i].file1+"'/></a></li>";
						addListHtml += "<li><a href='/board/old/oldView?board_num="+data[i].board_num+"'>"+data[i].title+"</a></li>";
						addListHtml += "<li><img src='"+data[i].profile_image+"' style='width:20px; height:20px; border-radius: 70%;'/>"+data[i].user_nickname+"</li>";
						addListHtml += "<li>"+data[i].write_date+"</li>";
						addListHtml += "<li>"+data[i].hit+"</li>";
						if(data[i].board_num==1){
							$("#moreView").remove();
						} 
					}
					$("#oldlist").append(addListHtml);
					/* console.log(addListHtml); */
				}
			});
			
		});
   });
</script>

