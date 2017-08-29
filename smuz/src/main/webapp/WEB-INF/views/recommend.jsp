<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="${path}/resources/icon/icon.png">
	<title>s:muz</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/3d4b6a6bb1.js"></script>
	<style type="text/css">
		#mainfeed{
			width:1080px;
			height:900px;
			margin:0 auto;
			/* background-color:rgba(50,50,50,0.6); */
			padding-top:60px;
		}
		#feed1,#feed2,#feed3,#feed4{
			width:260px;
			height:500px;
			/* background-color:#aaa; */
			float:left;
			position:relative;
		}
		#feed2{
			margin:0px 10.5px 0px 10.5px;
		}
		#feed4{
			margin:0px 0px 0px 10.5px;
		}
		.nameBox{
			width:100%;
			height:65px;
			border-bottom:1px solid #eee;
			margin-bottom:15px;
		}
		.nameBox .nickNamebox,.nameBox .nameImgBox{
			float:left;
		}
		.nameBox .nickNamebox{
			margin:21px 0px 0px 5px;
			font-size:11pt;
		}
		.nameBox .nameImgBox{
			margin-top:8px;
			width:50px;
			height:50px;
		}
		.nameBox .nameImgBox img{
			width:100%;
			border-radius:50%;
			object-fit: cover;
    		object-position: top;
		}
		.nameBox .datebox{
			margin-top:40px;
			font-size:10pt;
			float:right;
		}
		
		.commentBox{
			width:100%;
		}
		.spana{
			display:block;
			width:20%;
			color:#5285c4;
			float:left;
			font-weight: bold;	
		}
		.spanb{
			display: block;
			float:left;
			width:80%;
		}
		.spanc{
			font-weight: bold;
		}
		.spanspan{
			width:100%;
			height:20px;
			border-bottom: 1px solid rgba(60,60,60,0.2);
			padding-bottom: 25px;
		}
		.inputcoment{
			width:80%;
			border:0.5px solid #ccc;
			margin-bottom:15px;
			text-indent: 7px;
		}
		.btncoment{
			background-color: #5285c4;
			color:#fff;
			border:1px solid #5285c4;
		}
	</style>
</head>
<body style="background-color:rgba(180,180,180,0.6)">
	


	<jsp:include page="include_files/header.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function(){
			
			var listr = new Array();
            <c:forEach items="${colorR}" var="color" varStatus="status">
	            listr["${status.index}"] = new Array();
	            listr["${status.index}"].push("${color.ms_name}");
	            listr["${status.index}"].push("${color.ms_singer}");
	            listr["${status.index}"].push("${color.ms_img}");
	            listr["${status.index}"].push("${color.ms_file}");
	            listr["${status.index}"].push("회원님의 장르와 비슷한 음악");
            </c:forEach>
            var listg = new Array();
            <c:forEach items="${colorG}" var="color" varStatus="status">
	            listg["${status.index}"] = new Array();
	            listg["${status.index}"].push("${color.ms_name}");
	            listg["${status.index}"].push("${color.ms_singer}");
	            listg["${status.index}"].push("${color.ms_img}");
	            listg["${status.index}"].push("${color.ms_file}");
	            listg["${status.index}"].push("회원님의 스타일과 비슷한 음악");
            </c:forEach>
            var listb = new Array();
            <c:forEach items="${colorB}" var="color" varStatus="status">
	            listb["${status.index}"] = new Array();
	            listb["${status.index}"].push("${color.ms_name}");
	            listb["${status.index}"].push("${color.ms_singer}");
	            listb["${status.index}"].push("${color.ms_img}");
	            listb["${status.index}"].push("${color.ms_file}");
	            listb["${status.index}"].push("회원님의 박자와 비슷한 음악");
            </c:forEach>
         console.log(listr);
         console.log(listg);
         console.log(listb);
			
			
			
			function recommend(name,singer,img,title){
				var typeB;
				typeB=
					'<div class="w3-container w3-card-2 w3-white w3-round" style="margin-bottom:10.5px;width:100%">'
					+'<div class="nameBox">'
						+'<p class="nickNamebox">'+name+' - '+singer+'</p>'
						+'<p class="w3-opacity datebox">2017년 06월 28일</p>'
					+'</div>'
					+'<div class="w3-row-padding" style="margin: 0 -16px">'
						+'<div class="">'
							+'<a href="#">'
								+'<div class="muisc-over-main">'
									+'<div class="over-img-main"></div>'
									+'<img src="${path}/resources/albumimg/'+img+'" style="width: 100%" alt="Nature" class="w3-margin-bottom">'
								+'</div>'
							+'</a>'
						+'</div>'
					+'</div>'
					+'<p class="contant-main">'+title+''
					+'</p>'
					+'<div class="hash-tag-main">'
						
					+'</div>'
					+'<hr class="w3-clear">'
				+'</div>';
			
				return typeB;
			}
			 var generateRandom = function (min, max) {
				 var ranNum = Math.floor(Math.random()*(max-min+1)) + min;
				 return ranNum;
			}
			
			
			for(var i=0;i<listr.length;i++){	
				var tt = recommend(listr[i][0],listr[i][1],listr[i][2],listr[i][4]);
				var random = generateRandom(1,4);
				switch (random) {
				  case 1     : $("#feed1").append(tt);
				               break;
				  case 2	 : $("#feed2").append(tt);
				               break;
				  case 3  	 : $("#feed3").append(tt);
				               break;
				  default    : $("#feed4").append(tt);
				               break;
				}
			}
			for(var i=0;i<listg.length;i++){	
				var tt = recommend(listg[i][0],listg[i][1],listg[i][2],listg[i][4]);
				var random = generateRandom(1,4);
				switch (random) {
				  case 1     : $("#feed1").append(tt);
				               break;
				  case 2	 : $("#feed2").append(tt);
				               break;
				  case 3  	 : $("#feed3").append(tt);
				               break;
				  default    : $("#feed4").append(tt);
				               break;
				}
			}
			for(var i=0;i<listb.length;i++){	
				var tt = recommend(listb[i][0],listb[i][1],listb[i][2],listb[i][4]);
				var random = generateRandom(1,4);
				switch (random) {
				  case 1     : $("#feed1").append(tt);
				               break;
				  case 2	 : $("#feed2").append(tt);
				               break;
				  case 3  	 : $("#feed3").append(tt);
				               break;
				  default    : $("#feed4").append(tt);
				               break;
				}
			}
			
			$(".muisc-over-main").mouseover(function() {
				$(this).children(".over-img-main").show();
			});
			$(".muisc-over-main").mouseout(function() {
				$(this).children(".over-img-main").hide();
			});
			
			
		})
	</script>
	<div id="mainfeed">
		<div id="feed1">
			
		</div>
		<div id="feed2">
			
		</div>
		<div id="feed3">
			
		</div>
		<div id="feed4">
			
		</div>
		
		
	</div>
	


	<script>
		
			
	</script>
	
	<%-- <jsp:include page="include_files/footer.jsp"></jsp:include> --%>
</body>
</html>