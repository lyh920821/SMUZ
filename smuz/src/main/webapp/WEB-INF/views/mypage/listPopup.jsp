<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
   
   body::-webkit-scrollbar {
      display: none;
   }
   #results::-webkit-scrollbar {
      display: none;
   }
   #mlist::-webkit-scrollbar {
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
    
    li{
       margin:0; padding:0;
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

    .btnlist{
       float: right;
       border: 0px;
       color: #fff;
       background-color: #5285c4 !important;
       height: 23px;
       margin-top: -2px;
    }
    #results{
       z-index:9999;
      text-align:left;
      margin-top:36px;
      width:100%;
      background-color:#fff;
      max-height:300px;
      overflow: auto;
      border-radius: 5px;
}   
#results li{
      list-style:none;
      padding:14px 10px 14px 10px;
      font-size: 11pt;
      border-bottom: 1px solid rgba(50,50,50,0.1);
}
#results li:hover{
      background-color:rgba(100,100,100,0.1);
}
.serchBTN{
      background-color: #5285c4;
      border:1px solid #5285c4;
      color:#fff;
      display:none;
   }
</style>

<script type="text/javascript">
   
$(document).on("mouseenter",".serchlist",function(){
   $(this).find(".serchBTN").css("display","block");
}).on("mouseleave",".serchlist",function(){
   $(this).find(".serchBTN").css("display","none");
});
   
$(document).ready(function(){
      
      $("#Comment").click(function(){
         var lf_title, lf_hashtag, lf_list, t1;
         var musicnum = $.makeArray($(".list-group-item").map(function(){ //커스텀 속성을 배열로 만들어 중복된 커스텀속성의 모든것을 가져오게 해주는식
              return $(this).attr("abc");
         }));
         lf_list=""; //반드시 ""를 붙여야 String 공백형식이 된다.
         for(var i= 0; i<musicnum.length; i++){
            if(i==musicnum.length-1){
               lf_list += musicnum[i];
               break;
            }
            lf_list += musicnum[i]+"/";   // 빈값에 musicnum의 값에 + / 를 붙여 1/2/3/4/ 이런식으로 넘김
         }
         document.getElementById('lf_list').value = lf_list;
         lf_title = $('#lf_title').val();
         lf_hashtag = $('#lf_hashtag').val();
         lf_list = $('#lf_list').val();
         if(lf_title==''||lf_title==null){
            alert('제목을 입력해주세요.');
         }else if(lf_hashtag==''||lf_hashtag==null){
            alert('해시태그가 없어요.');
         }else if(lf_list==''||lf_list==null){
            alert('노래를 추가해주세요.');
         }else{
            /* alert(lf_title+":"+lf_hashtag+":"+lf_list); */ 
           var data = new Object();
               
           data.lf_title = lf_title;
           data.lf_list = lf_list;
           data.lf_hashtag = lf_hashtag;
           console.log(data);
           $.ajax({
               url:"${path}/music/listFeed.do",
               dataType:"text",
               type:"post",
               data:JSON.stringify(data),
               processData: false,
               contentType: "application/json", 
               success:function(data){   
            	   window.close();
               },error:function(request,status,error){ 
                  console.log(error);
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               }  
         });
     
            
         }
      });        
      
});

$(document).on("click",".btnlist",function(){
   $(this).parent().css("display","none");
   $(this).parent().removeClass('list-group-item');
});
$(document).on("click",".serchBTN",function(){
   var aa = $(this).siblings(".musicTitle").text();
   var bb = $(this).attr('serchidid');
   /* alert(aa+":"+bb); */
   var ttt = '';
   ttt+='<li>';
   ttt+='<a href="#" class="list-group-item" abc="'+bb+'">'+aa+'';
   ttt+='<button class="btnlist">삭제</button></a>';
   ttt+='</li>';
   $("#mlist").prepend(ttt);
   $('.search').val('');
   $('.search').keyup();
});

$(document).ready(function(){
   
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
                  var textresult = val.name+" - "+val.singer;
                  if(textresult.length > 43){
                     textresult = textresult.substring(0,43);
                     textresult += '...';
                  }
                   sorted += '<li class="serchlist"><a href="#" class="musicTitle">'+textresult+'';
                   sorted += '</a><button serchidid="'+val.id+'" class="serchBTN" style="float:right">추가</button></li>';
               }); 
             $('#results').html(sorted);
             
           });
        }
      });   
});
   
</script>
</head>
<body>

   <div style="width:600px;height:760px;border: solid 1px black;border-radius: 0;padding: 16px;">
   <!-- 블럭 시작 -->
      <div class="w3-container w3-card-2 w3-white w3-round" style="height: 100%;">
               <div class="nameBox" style="margin:0;">
                  <input type="text" id="lf_title" style="width:100%;margin-top: 30px;height: 50px;font-size:17px;text-align:center;" placeholder="제목을 입력해주세요."/>
                  <p class="w3-opacity datebox" style="margin-top: 24px;margin-bottom: 15px;">2017년 06월 28일</p>
               </div>
               <div class="w3-row-padding" style="margin: 0 -16px">
                  
                <div class="input-group" style="position:relative;">
                  <input type="text" class="form-control search" placeholder="Search" name="search"  autocomplete=off>
                  <div id="results" style="position:absolute"></div>
                  <div class="input-group-btn">
                    <button class="btn btn-default" type="button" style="width: 50px;height: 35px;"><i class="glyphicon glyphicon-search" style="color:#fff;"></i></button>
                  </div>
                </div>
              
                  <div class="list-group" style="margin:20px auto;">
                     <div class="list-main" style="max-height: 287px !important; overflow: scroll; ">
                      <ul class="list-group-menu" id="mlist" style="margin:0;padding:0;height:300px;overflow:scroll;">   
                          
                      </ul>
                     </div>
                  </div>
               </div>
                 
            <div class="form-group" style="margin-top: 15px;">
              <label for="inputlg">해시태그</label>
              <input class="form-control input-lg" id="lf_hashtag" type="text" style="height: 50px;overflow: scroll;font-size: 15px;" placeholder="#즐거움">
         <div class="input-group">
         <!-- 노래의 커스텀 넘버를 안보이게씀 -->
         <input type="hidden" id="lf_list">
         </div>
            </div>
               <hr class="w3-clear" style="">
               <form class="w3-container" action="#">
               <input type="button" id="Comment" class="w3-button w3-margin-bottom" style="background-color:#5285c4;margin-left:3px;float:right;color:#fff;" value="작성완료"/>
                  <!-- <span style="color:white;">작성완료</span> -->
               
               </form>
            </div>
   <!-- 블럭 끝 -->
   </div>
</body>
</html>