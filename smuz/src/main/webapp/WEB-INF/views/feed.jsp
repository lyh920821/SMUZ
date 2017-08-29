<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<title>S:MUZ</title>
	<link rel="shortcut icon" href="${path}/resources/icon/icon.png">
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
		#feed1,#feed2,#feed3{
			width:353px;
			height:500px;
			/* background-color:#aaa; */
			float:left;
			position:relative;
		}
		#feed2{
			margin:0px 10.5px 0px 10.5px;
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
			margin:21px 0px 0px 10px;
			font-size:12pt;
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
		#feed1 buttton:disabled{
			cursor:pointer;
			opacity:0.9;
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
			var cntA=1,cntB=0,cntC=0;
			
			/* alert("${sessionScope.loginsession.sm_id}");
			console.log("${sessionScope.loginsession.sm_id}"); */
			
			$(document).on("click",".likeBtn",function(){
				var t = $(this).attr("likeId");
 				alert(t);
			});
			
			$(document).on("click",".btncoment",function(){

				var t = $(this).attr("likeId");
 				alert(t);
			});
			
			$(document).on("click",".commentBtn",function(){
				var tf =$(this).attr("cobtn");
				if(tf=="false"){
					
					var a = $(this).attr("likeId");
					var commenttext = '';
					commenttext += '<div class="commentBox">';
          		    commenttext += '<input type="text" class="inputcoment" placeholder="댓글을 입력해주세요."/>';
              	    commenttext += '<input type="button" class="btncoment" likeId='+a+' value="등록"/>';
					var tt =$(this);
					$.ajax({
                  		url:"${path}/comment/check.do",
                          dataType:"text",
                          type:"post",
                          data:a,
                          processData: false,
                          contentType: "application/json", 
                          success:function(data){
                        	  if(data!='[]'){
	                        	  var jsonObj = JSON.parse(data);
	                        	  
	                        	  
	                        	  $.each(jsonObj, function(entryIndex, entry) {
	                        		  console.log(entry.cm_user+'-'+entry.cm_content);
	                        		  commenttext += '<p class="spanspan"><span class="spana"><a href=#>'+entry.cm_user+'</a></span>';
	                        		  commenttext += '<span class="spanb">'+entry.cm_content+'</span></p>';
	                    	      });  
                        	  }
                        	  
                        	  commenttext += '</div>';
          					  tt.after(commenttext);
          					  tt.attr("cobtn","true");
                        	  
                          },error:function(e){  
                              alert("error");  
                          }  
                      });
					
					
					
				}else{
					$(this).next().empty();
					$(this).attr("cobtn","false");
				}
			});
			
			function typeA(i){
				var typeA;
				typeA=
					'<div class="w3-container w3-card-2 w3-white w3-round" style="margin-bottom:10.5px;width:100%">'
						+'<div class="nameBox">'
							+'<p class="nameImgBox" style="line-height:42px;">'
								+'<img alt="" src="${path}/resources/img/youyou.jpg">'
							+'</p>'
							+'<p class="nickNamebox">YOUTUBE</p>'
							+'<p class="w3-opacity datebox">2017년 06월 28일</p>'
						+'</div>'
						+'<div class="w3-row-padding" style="margin: 0 -16px">'
							+'<div class="video-box" id="youtube'+i+'">'
								+'<iframe width="100%" height="100%" src="https://www.youtube.com/embed/O33x3EyUbpc" frameborder="0" allowfullscreen></iframe>'
							+'</div>'
							+'<br>'
						+'</div>'
						+'<p class="contant-main w3-margin-bottom" id="title'+i+'"></p>'
						+'<div class="hash-tag-main">'
						+'</div>'
						+'<hr class="w3-clear">'
						+'<button type="button" id="Like" class="w3-button w3-margin-bottom likeBtn" likeId="'+i+'">'
							+'<i class="fa fa-thumbs-up"></i>  Like'
						+'</button>'
						+'<button type="button" id="Comment" class="w3-button w3-margin-bottom commentBtn" style="margin-left:3px;" cobtn="false" likeId="10">'
							+'<i class="fa fa-comment"></i>  Comment'
						+'</button>'
				+'</div>';
				return typeA;
			}
			function typeMusic(i,content,tag,date,img,user){
				var typeB;
				typeB=
					'<div class="w3-container w3-card-2 w3-white w3-round" style="margin-bottom:10.5px;width:100%">'
					+'<div class="nameBox">'
						+'<p class="nameImgBox">'
							+'<img alt="" src="${path}/resources/img/no1.jpg">'
						+'</p>'
						+'<p class="nickNamebox">'+user+'</p>'
						+'<p class="w3-opacity datebox">'+date+'</p>'
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
					+'<p class="contant-main">'+content+''
					+'<br><a href="#" class="w3-opacity all-view-main">펼쳐보기</a>'
					+'</p>'
					+'<div class="hash-tag-main">'
						+'<a href="#" class="w3-opacity hash-tag-main-a">'+tag+'</a>'
					+'</div>'
					+'<hr class="w3-clear">'
					+'<button type="button" id="Like" class="w3-button w3-margin-bottom">'
						+'<i class="fa fa-thumbs-up"></i>  Like'
					+'</button>'
					+'<button type="button" id="Comment" class="w3-button w3-margin-bottom" style="margin-left:3px;">'
						+'<i class="fa fa-comment"></i>  Comment'
					+'</button>'
				+'</div>';
			
				return typeB;
			}
			function typelist(i,title,tag,date,name){
			       var typelist;
			       typelist=
			       '<div class="w3-container w3-card-2 w3-white w3-round" style="margin-bottom:10.5px;width:100%">'
			       +'<div class="nameBox">'
						+'<p class="nameImgBox">'
							+'<img alt="" src="${path}/resources/img/no1.jpg">'
						+'</p>'
						+'<p class="nickNamebox">'+name+'</p>'
						+'<p class="w3-opacity datebox">'+date+'</p>'
					+'</div>'
			       +'<div class="nameBox" style="margin-top: 20px;">'
			         +'<li class="list-group-item main-table-title" style="background-color: #5285c4;color:#fff;margin-top: -5px;height: 50px;font-size:17px;text-align:center;">'+title+'</li>'
			       +'</div>'
			       +'<div class="w3-row-padding" style="margin: 0 -16px">'
			          +'<div class="list-group" style="margin:10px auto;">'
			             +'<div class="list-main" style="max-height: 205px !important; overflow: scroll; ">'
			              +'<ul class="list-group-menu" style="margin:0;padding:0;" id="aaa'+i+'">'
			              
							+'</ul>'
							+'</div>'
						+'</div>'
					+'</div>'
					+'<div class="hash-tag-main" style="margin-top: 21px;margin-bottom:0;">'
						+'<a href="#" class="w3-opacity hash-tag-main-a">'+tag+'</a>'
			       +'</div>'
			       +'<hr class="w3-clear" style="margin:10px 0px;">'
			       +'<button type="button" id="Like" class="w3-button w3-margin-bottom">'
					+'<i class="fa fa-thumbs-up"></i>  Like'
					+'</button>'
					+'<button type="button" id="Comment" class="w3-button w3-margin-bottom" style="margin-left:3px;">'
						+'<i class="fa fa-comment"></i>  Comment'
					+'</button>'
			    +'</div>'
			    
			       return typelist;
			    }
			
			$(".muisc-over-main").mouseover(function() {
				$(this).children(".over-img-main").show();
			});
			$(".muisc-over-main").mouseout(function() {
				$(this).children(".over-img-main").hide();
			});
			
			var musicfeed = new Array();
            <c:forEach items="${MusicFeed}" var="music" varStatus="status">
	            musicfeed["${status.index}"] = new Array();
	            musicfeed["${status.index}"].push("${music.mf_file}");
	            musicfeed["${status.index}"].push("${music.mf_board}");
	            musicfeed["${status.index}"].push("${music.mf_tag}");
	            musicfeed["${status.index}"].push("${music.mf_date}");
	            musicfeed["${status.index}"].push("${music.mf_img}");
	            musicfeed["${status.index}"].push("${music.mf_user}");
            </c:forEach>
            
            var listfeed = new Array();
            <c:forEach items="${ListFeed}" var="list" varStatus="status">
            	listfeed["${status.index}"] = new Array();
               	var aa = "${list.lf_list}";
                var tt = aa.split("/"); 
                listfeed["${status.index}"].push(tt);
                listfeed["${status.index}"].push("${list.lf_title}");
                listfeed["${status.index}"].push("${list.lf_hashtag}");
                listfeed["${status.index}"].push("${list.lf_date}");
                listfeed["${status.index}"].push("${list.lf_uploader}");
            </c:forEach>
            
            var follower = new Array();
            <c:forEach items="${followMember}" var="member" varStatus="status">
	            follower["${status.index}"] = new Array();
	            follower["${status.index}"].push("${member.sm_seq}");
	            follower["${status.index}"].push("${member.sm_name}");
        	</c:forEach>
        	
        	
        	 function musiclistlist(list,index){
          	   var aaa = list;
          	   var y = index;
          	   
          	   var aa='';
          	   $.getJSON('${path}/resources/search/search.json', function(data) {
         	            $.each(data, function(key, val) { // index, obj
         	             	if(aaa==val.id){
         	             		var lklk = val.name+'-'+val.singer;
         	             		if(lklk.length > 28){
         	             			lklk = lklk.substring(0,28);
         	             			lklk += '...';
      	            	   	}
         	             		aa='<li><a href="#" class="list-group-item">'+lklk+'</a></li>';
         	             		$("#aaa"+y+"").append(aa);
         	             	}
         	             });
            		});
          	   
             }
        	 var generateRandom = function (min, max) {
				 var ranNum = Math.floor(Math.random()*(max-min+1)) + min;
				 return ranNum;
			 }
        	 function youtube(index){
            	   var y = index;
            	   var aa='';
            	   var random = generateRandom(1,31);
            	   $.getJSON('${path}/resources/search/youtuberessult.json', function(data) {
           	            $.each(data, function(key, val) { // index, obj
           	            	if(random==val.id){
	           	            	aa='<iframe width="100%" height="100%" src="'+val.addr+'" frameborder="0" allowfullscreen></iframe>';
	           	             	$("#youtube"+y+"").append(aa);
	           	             	$("#title"+y+"").html(val.name);
           	            	}
           	             });
              		});
            	   
               }
        	
        	for(var a = 0;a<musicfeed.length;a++){
        		for(var i=0;i<follower.length;i++){
        			if(follower[i][0]==musicfeed[a][5]){
        				var ran = generateRandom(1,6);
        				var htmlResult = typeMusic(a,musicfeed[a][1],musicfeed[a][2],musicfeed[a][3],musicfeed[a][4],follower[i][1]);
        				switch (ran) {
	      				  case 1     : $("#feed1").append(htmlResult);
	      				               break;
	      				  case 2	 : $("#feed2").append(htmlResult);
	      				               break;
		      			  case 3     : $("#feed3").append(htmlResult);
				          		       break;
		      			  case 4     : $("#feed1").prepend(htmlResult);
	          		       			   break;
		      			  case 5     : $("#feed2").prepend(htmlResult);
	          		       			   break;
	      				  default    : $("#feed3").prepend(htmlResult);
	      				               break;
      					}
        			}		
        		}
             }
        	for(var a = 0;a<listfeed.length;a++){
           		for(var b=0;b<listfeed[a][0].length;b++){
           				musiclistlist(listfeed[a][0][b],a);
           		}
           		for(var i=0;i<follower.length;i++){
        			if(follower[i][0]==listfeed[a][4]){
        				var ran = generateRandom(1,6);
        				var htmlResult = typelist(a,listfeed[a][1],listfeed[a][2],listfeed[a][3],follower[i][1]);
        				switch (ran) {
	      				  case 1     : $("#feed1").append(htmlResult);
	      				               break;
	      				  case 2	 : $("#feed2").append(htmlResult);
	      				               break;
	      				  case 3	 : $("#feed3").append(htmlResult);
				               		   break;
	      				  case 4	 : $("#feed1").prepend(htmlResult);
				               		   break;
	      				  case 5	 : $("#feed2").prepend(htmlResult);
				               		   break;
	      				  default    : $("#feed3").prepend(htmlResult);
	      				               break;
    					}
        			}
        		}
            }
			for(var i=0;i<6;i++){
				var t = typeA(i);
				var ran = generateRandom(1,6);
				switch (ran) {
				  case 1     : $("#feed1").append(t);
				               	break;
				  case 2	 : $("#feed2").append(t);
				               	break;
				  case 3	 : $("#feed3").append(t);
	               				break;
				  case 4	 : $("#feed1").prepend(t);
	               				break;
				  case 5	 : $("#feed2").prepend(t);
	               				break;
				  default    : $("#feed3").prepend(t);
				               break;
				}
				youtube(i);
				
								
			}
        	
    	 console.log(follower);
    	 console.log(listfeed);
         console.log(musicfeed);
			
			
		})
	</script>
	<div id="mainfeed">
		<div id="feed1">
			
		</div>
		<div id="feed2">
			
		</div>
		<div id="feed3">
			
		</div>
		
		
	</div>
	


	<script>
		
			
	</script>
	
	<%-- <jsp:include page="include_files/footer.jsp"></jsp:include> --%>
</body>
</html>