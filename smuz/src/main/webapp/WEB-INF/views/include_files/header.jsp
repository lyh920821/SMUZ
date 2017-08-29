<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>S:MUZ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/resources/css/header.css?ver=2">
<link rel="stylesheet" href="${path}/resources/css/bar.css?ver=3">
<link rel="stylesheet" href="${path}/resources/css/main.css?ver=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/3d4b6a6bb1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.serchBTN{
		background-color: #5285c4;
		border:1px solid #5285c4;
		color:#fff;
		display:none;
	}
</style>
<script type="text/javascript">
$(document).on("click",".serchBTN",function(){

	if (confirm("노래를 재생목록에 추가하시겠습니까?") == true){
		var aa = $(this).attr('serchidid');
		$.ajax({
      		url:"${path}/music/playinsert.do",
              dataType:"text",
              type:"post",
              data:aa,
              processData: false,
              contentType: "application/json", 
              success:function(data){
            	var jsonObj = JSON.parse(data);
            	window.location.reload();
            	var appendTxt=
            	'<a href="#" srcc="'+jsonObj.ms_file+'" class="list-group-item follwer-group-item selectMusic">'
	 			+'<img src="${path}/resources/img/playplay.gif" class="playicon">'+jsonObj.ms_name+' - '+jsonObj.ms_singer+'</a>';
	 			
	 			$("#addMusic").css("display","none");
            	$("#platListLYH").prepend(appendTxt);
            	alert('성공');
            	
              },error:function(request,status,error){
            	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

              }  
          });
		
	}else{  
	    return;
	}
	
});

$(document).ready(function(){
    	/* alert("${sessionScope.loginsession.sm_id}"); */
    	$(document).on("mouseenter",".serchlist",function(){
    		$(this).find(".serchBTN").css("display","block");
    	}).on("mouseleave",".serchlist",function(){
    		$(this).find(".serchBTN").css("display","none");
    	});
    	
    	
    	
	   $('.search').keyup(function() {
	        var srchInput1 = $('.search').val();
	        var srchInput2 = $.trim(srchInput1);
	        var pattern = /[\{\}\[\]\/?.,;:|\)*~`!^\_<>@\#$%&\\\\(\'\"]/gi;
	        var srchInput
	        if(pattern.test(srchInput2)){
	        	srchInput = srchInput2.replace(pattern, "");
	        }else{
	        	srchInput = srchInput2;
	        }
	        if(srchInput==null||srchInput==""){
	           $('#results').html("");
	        }else{
	           srchInput = srchInput.replace(/ /g, '|');
	           if (srchInput[srchInput.length - 1 ] == '|') {
	             srchInput = srchInput.replace(/\|/, '');
	           }
	           var regex = new RegExp('(?=[^\\s])' + srchInput, 'gi');
	           
	           var sorted = '';
	           var results = [],
	           sortedResultNames = [];
	           $.getJSON('${path}/resources/search/search.json', function(data) {
	             
	             $.each(data, function(key, val) { // index, obj
	                if (val.name.search(regex) != -1) {
	                 results.push(val);
	                }else if(val.singer.search(regex) != -1){
	                 results.push(val);
	               }
	             
	             });
	             
	               $.each(results, function(key, val) {
	            	   var textresult = val.name+" - "+val.singer;
	            	   if(textresult.length > 43){
	            		   textresult = textresult.substring(0,43);
	            		   textresult += '...';
	            	   }
	                   sorted += '<li class="serchlist"><a href="#">'+textresult+'';
	                   sorted += '</a><button type="button" serchidid="'+val.id+'" class="serchBTN" style="float:right">듣기</button></li>';
	               }); 
	             $('#results').html(sorted);
	           });
	        }
	        
	      });
	   });
</script>
</head>
<body>

	<c:choose>
	    <c:when test="${empty sessionScope.loginsession}">
	    	<script type="text/javascript">
	    		alert("로그인이 필요한 페이지 입니다.");
 				location.href="${path}";
	    	</script>
	    </c:when>
	</c:choose>
	
	
	<nav class="navbar-custom-header">
	
	
		<div class="navigation-header">
			<a href="feed.do" class="logo-header a-header navigation-line-header" style="width:106px;height:50px;">
				<img alt="logo" src="${path}/resources/img/logologo.png" style="width:90%;height:70%;margin-bottom:0px;">
			</a>
	 		<div class="navigation-line-header search-header">
				<form class="navbar-form">
					<div class="input-group">
						<input type="text" class="form-control search" placeholder="검색하실 단어를 입력해주세요.">
						<div class="input-group-btn">
							<button class="btn btn-default btn-header" type="button" style="border:1px solid #5285c4;background-color:#5285c4 !important;color:#fff;">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
					<div id="results"></div>
				</form>
			</div>

			<a href="${path}/linked/recommend.do" class="a-header navigation-line-header"> <img
				class="icon-header" src="${path}/resources/icon/feed.png"
				onmouseover="this.src='${path}/resources/icon/feed-over.png'"
				onmouseout="this.src='${path}/resources/icon/feed.png'">
			</a> <a href="${path}/linked/mypage.do" class="a-header navigation-line-header"> <img
				class="icon-header" src="${path}/resources/icon/profile.png"
				onmouseover="this.src='${path}/resources/icon/profile-over.png'"
				onmouseout="this.src='${path}/resources/icon/profile.png'">
			</a>
		</div>
	</nav>
	<script type="text/javascript">
	/* audio 태그 script */
	function myFunction(){
		$("#next").trigger("click");
	}
	$(document).ready(function(){
		$(document).on("click",".selectMusic",function(){
			try {
	        	var oAudio = document.getElementById('myaudio');
	        	var src = $(this).attr("srcc");
	        	oAudio.src = '${path}/resources/music/'+src+'';
	        	if (oAudio.paused) {
	                oAudio.play();
	                $("#platListLYH a").removeClass("active-follower");
	                $("#playMusic").find("img").attr("src","${path}/resources/img/dd.png");
	                $(this).addClass("active-follower");
	                $("#platListLYH a img").css("display","none");
	                $(this).find("img").css("display","block");
	            }
	            else {
	                oAudio.pause();
	                $("#playMusic").find("img").attr("src","${path}/resources/img/cc.png");
	            }
	            
	        }catch (e) {
	             if(window.console && console.error("Error:" + e));
	        }
		});
		
		$("#playMusic").click(function(){
			var oAudio = document.getElementById('myaudio');
			if (oAudio.paused) {
                oAudio.play();
                $(this).find("img").attr("src","${path}/resources/img/dd.png");
            }
            else {
                oAudio.pause();
                $(this).find("img").attr("src","${path}/resources/img/cc.png");
            }
		});
		
		$("#next").on("click",function(){
			var a = $(".active-follower").next().attr('srcc');
			if(typeof a=="undefined"){
				alert('다음 노래가 없습니다.');
			}else{
				$(".active-follower").next().trigger("click");	
			}
		});
		$("#previous").on("click",function(){
			var a = $(".active-follower").prev().attr('srcc');
			if(typeof a=="undefined"){
				alert('첫번째 곡 입니다.');
			}else{
				$(".active-follower").prev().trigger("click");	
			}
		});
	})
	
    </script>
	<div class="music-bar w3-card-2 w3-white w3-round">
		<div class="follower-list-follower follower-bottom-margin">
			<div class="list-group-item follwer-table-title"><b>팔로우 리스트</b></div>
			<div class="list-main follower-list-main">
				<c:choose>
				    <c:when test="${not empty follow}">
				    	<c:forEach var="member" items="${follow}">
							<a href="#" class="list-group-item follwer-group-item">${member }</a>
						</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	<a href="#" class="list-group-item follwer-group-item">팔로우 추가 하기</a>
				    </c:otherwise>
				</c:choose>
			 
			</div>
		</div>
		<div class="play-list-follower follower-bottom-margin">
			<div class="list-group-item follwer-table-title"><b>플레이 리스트</b></div>
			<div class="list-main-follwer follower-list-main" id="platListLYH">
				<c:choose>
				    <c:when test="${not empty music}">
				    	<c:forEach var="member" items="${music}">
							<a href="#" srcc="${member.ms_file}" class="list-group-item follwer-group-item selectMusic">
				 				<img src="${path}/resources/img/playplay.gif" class="playicon">${member.ms_name} - ${member.ms_singer}</a>
						</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	<a href="#" class="list-group-item follwer-group-item" id="addMusic">노래 추가하기</a>
				    </c:otherwise>
				</c:choose>
				
				 
			</div>
		</div>
		<div id="musicPlay">
			<div id="previous">
				<img src="${path}/resources/img/bb.png">
			</div>
			<div id="playMusic">
				<img src="${path}/resources/img/cc.png">
			</div>
			<div id="next">
				<img src="${path}/resources/img/aa.png">
			</div>
			<audio id="myaudio" onended="myFunction()"></audio>
    		
		</div>
	</div>