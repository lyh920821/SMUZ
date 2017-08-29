<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>myList</title>


<style>

	html, body, h1, h2, h3, h4, h5 {
		font-family: "Open Sans", sans-serif
	}
	#results::-webkit-scrollbar {
		display: none;
	}
	body::-webkit-scrollbar {
		display: none;
	}
	.list-main::-webkit-scrollbar{
	display:none;
	}
	a {
		text-align: left;
		text-decoration:none !important;
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
     
     button {
		background-color: #4d636f !important;
	}
      
    .list-group-item{
    	font-size: 14px;
    }
    
    #results li{
    	margin:10px;
    	padding:0;
    	list-style: none;
    	
    }
    
    ul{
    	margin:0px;
    	padding:0px;
    }
    
    .list-group-menu-sub li{
    	background-color: #ddd;
    	text-align: center;
		width:100%;
		height:20px;
    	padding:0;
    	float: left;
    }

    
</style>

<script type="text/javascript">
	
//	$(function() {
	$(document).ready(function() {


		//music_popup 음악검색 스크립트
		$('.search').keyup(function(){
	           var srchInput1 = $('.search').val();
	           var srchInput2 = $.trim(srchInput1);
	           var pattern = /[\{\}\[\]\/?.,;:|\)*~`!^\_<>@\#$%&\\\\(\'\"]/gi;
	           var srchInput
	           if(pattern.test(srchInput2)){
	              srchInput = srchInput2.replace(pattern, "");
	           }else{
	              srchInput = srchInput2;
	           }
	           console.log(srchInput);
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
	                
	                var count=0;
	                  $.each(results, function(key, val) {
	                       count++;
	                      sorted += '<li><a href="#" class="test" music_num='+val.id+'>'+val.name+'-'+val.singer+'';
	                      sorted += '</a></li>';
	                  }); 
	                $('#results').html(sorted);
	                
	              });
	           }
	         });
	        
	           
	     $(document).on("click",".test",function(){
	    	 var mf_id, mf_music, mf_img; 
	    	 mf_id = $(this).attr('music_num');
		    $.getJSON('${path}/resources/search/search.json', function(data) {
		    	 $.each(data, function(i, item) {
		    		if(item.id == mf_id){ // 받아온 고유넘버값과 기존 json 파일을 비교해서 맞는 내용만 출력!
		    			 mf_music = item.name;
		    			 mf_img = item.img;
		    		 }
		    	 });
		    	 
		    	 document.getElementById('mf_music').value = mf_music;
		    	 document.getElementById('mf_id').value = mf_id;
		    	 document.getElementById('mf_img').value = mf_img;
		     }); //json 노래 제목가져오는 곳 끝 
		     
	     });
	     
	     $('#Comment').click(function (){
  	    	var mf_music = $('input[name=mf_music]').val();
  	    	var mf_id = $('input[name=mf_id]').val();
  	    	var mf_img = $('input[name=mf_img]').val();

			opener.parent.music_search_callback(mf_music, mf_id, mf_img);    //opener.location.href = "javascript:music_search_callbacke();";
			window.close();

			});
	     
	     $("#cancle").click(function(){
				window.close();
			});
	     
});
		
		
	  
</script>
</head>
<body>

	<div style="width: 600px; height: 500px; border: solid 1px black; border-radius: 0; padding: 16px;">
		<!-- 블럭 시작 -->
		<div class="w3-container w3-card-2 w3-white w3-round"
			style="height: 70;">
			<div class="nameBox" style="overflow: hidden;">
				<h3 style="margin: 27px auto;">검색창</h3>
			</div>
			<p class="w3-opacity datebox" id="dateinput"
				style="width: 100%; margin-top: 24px; float: right; text-align: left;">원하는
				음악을 검색해주세요.</p>
				<div class="w3-row-padding" style="margin: 0 -16px">
					<div class="input-group">
						<div id="test_input_box" style="float: left; width: 500px;">
							<input type="text" class="form-control search"
								placeholder="Search" name="mf_music" id="mf_music">
						</div>
						<input type="hidden" id="mf_id" name="mf_id"> <!-- 노래 고유 넘버 -->
						<input type="hidden" id="mf_img" name="mf_img"> <!-- 노래 고유 넘버 -->
						<div style="float: right;">
							<button class="btn btn-default" type="submit"
								style="width: 50px; height: 35px;">
								<i class="glyphicon glyphicon-search" style="color:#fff;"></i>
							</button>
						</div>
					</div>
					<div id="results" style="height: 200px;overflow:auto;">
					</div>
					
				</div>


			<hr class="w3-clear">
			<button type="button" id="Comment" class="w3-button w3-margin-bottom"
				style="background-color: #5285c4; margin-left: 3px; float: right;">
				<span style="color: white;">추가</span>
			</button>
			<button type="button" id="cancle" class="w3-button w3-margin-bottom"
				style="background-color: #5285c4; margin-left: 3px; float: right;">
				<span style="color: white;">취소</span>
			</button>
		</div>
		<!-- 블럭 끝 -->
	</div>
</body>
</html>