<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <link rel="stylesheet" href="/css/todayCodi.css" type="text/css"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
    	footer {display:none;}
  	</style>
	<!-- <script>
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	    	$("#tc_box").append(
	    		  "<li class='tc_img' style='margin:-270px 50px 0 -35px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
	    		 + "<li class='tc_img' style='margin:-270px 40px 0 -5px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
	    		 + "<li class='tc_img' style='margin:-270px 40px 0 5px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
	    		 + "<li class='tc_img' style='margin:-270px 0 0 5px'><img src='/img/bg.png'><a href=''><img src='/img/profileDefault.png'><p>닉네임</p><span>작성일</span></a>"
	    	);
	    }
	});
	</script> -->
	<script>
		var imgTag='';
		$(document).ready(function(){		
				//imgTag +='<img src="img/'+ imgList[i] +'"/>';
				<c:forEach var="vo" items="${lst}">
				
					imgTag +="<figure>";
					imgTag += "<img src='/upload/todayCodi/"+"${vo.file1}"+"'/>";
					imgTag += "<a href='javascript:;'>";
					imgTag += "<img src='/upload/"+"${vo.profile_image}"+"'>";
					imgTag += "<p>"+"${vo.user_nickname}"+"</p>";
					imgTag += "<span>"+"${vo.write_date}"+"${vo.heart_type}"+"</span>";
					<c:choose>
						<c:when test="${vo.heart_type eq '1'}">
							imgTag += "<p class='like_btn'><img src='/img/heart_fill.png' class='heart_empty' alt='채운하트'>";
						</c:when>
						<c:otherwise>
							imgTag += "<p class='like_btn'><img src='/img/heart_empty.png' class='heart_empty' alt='빈하트'>";
						</c:otherwise>
					</c:choose>
					imgTag += "<span>추천 수 : xxx</span></p>";
					imgTag += "<input type='hidden' value='${vo.board_num}'/>";			
					imgTag += "<div class='buttons'><button>수정</button><button>삭제</button><button>신고</button></div></a>";	
					imgTag +="</figure>";
					
				</c:forEach>
			$("#columns").append(imgTag);
			
			$(".like_btn").click(function(){
				var heart_click = $(this).next().val();
				var params = {board_num: heart_click}
				$.ajax({
					url : '/board/Like',
					type : 'POST',
					dataType : 'json',
					data :params,
					success : function(data){
						if(data==1){
							$(".heart_empty").attr("src", "/img/heart_empty.png");
						}else{
							$(".heart_empty").attr("src", "/img/heart_fill.png");
						}	 
					} 				
				});
			})
		});
	
	</script>
<body>
	<div id="tc_container">
		<div id="tc_wrap">
			<h1>오늘의 코디</h1>
			<div id="write"><a href="/board/todayCodi/todayCodiWrite">글쓰기</a></div>
			<ul id="tc_box" >
					<li class='tc_img' style='margin: -270px 40px 0 0px;'>
						<div id="columns"></div>
					</li>
			</ul>
		</div>
	</div>
</body>