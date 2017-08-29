<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<link rel="shortcut icon" href="${path}/resources/icon/icon.png">
<title>s:muz</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/resources/css/main2.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${path}/resources/js/Chart.bundle.js"></script>
<script src="${path}/resources/js/utils.js"></script>
<style>
html, body, h1, h2, h3, h4, h5 {
   font-family: "Open Sans", sans-serif
}

body::-webkit-scrollbar {
   display: none;
}

.tab{
   max-width: 1080px;
}

.container{
   width: 1080px;
}

/* sub2_콘텐츠 css 추가 */
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
    #mov{
       width:100%;
       height:100%;
       position:relative;
    }
    #file_imga{
       display:none;
       opacity:0;
       width:100%;
       height:100%;
       position:absolute;
       top:0px;
       transition:0.5s all ease;
    }
    #nofile_img{
       
       width:100%;
       height:100%;
    }
    #mov a:hover{
       cursor:pointer;
    }
    
    .w3-content{
       max-width:1080px !important;
    }
/* sub2_콘텐츠 css 추가 */
</style>


 <script>
        window.beatratioFactor = {
            set1: '40',
            set2: '20',
            set3: '40'
        };

        window.beatnameFactor = {
            set1: '일렉트로닉',
            set2: 'K-asdasdsa',
            set3: '하드메탈'
        };

        window.beatcolorFactor = {
            set1: 'rgb(35,59,93)',
            set2: 'rgb(82,133,196)',
            set3: 'rgb(118,118,118)'
        };

        window.feelratioFactor = {
            set1: '40',
            set2: '20',
            set3: '40'
        };

        window.feelnameFactor = {
            set1: '일렉트로닉',
            set2: 'K-asdasdsa',
            set3: '하드메탈'
        };

        window.feelcolorFactor = {
            set1: 'rgb(35,59,93)',
            set2: 'rgb(82,133,196)',
            set3: 'rgb(118,118,118)'
        };

        window.genreratioFactor = {
            set1: '40',
            set2: '30',
            set3: '30'
        };

        window.genrenameFactor = {
            set1: '일렉트로닉',
            set2: 'K-pop',
            set3: '하드메탈'
        };

        window.genrecolorFactor = {
            set1: 'rgb(35,59,93)',
            set2: 'rgb(82,133,196)',
            set3: 'rgb(118,118,118)'
        };
        
     
        
/* sub2_콘텐츠 script 추가 */

   $(document).ready(function() {

      var hideUI = $('.list-group-menu li').find('ul').hide();

      $('.list-group-menu li').on('mouseenter', function() {
         $(this).find('ul').stop().slideDown(500);
      }).on('mouseleave', function() {
         $(this).find('ul').stop().slideUp(500);
      });
      
      $("#mov").on('mouseenter',function(){
         $("#file_imga").css("display","block");
         setTimeout(function(){ 
            $("#file_imga").css("opacity","1");
         }, 50);
      }).on('mouseleave', function(){
         $("#file_imga").css("display","none");
         setTimeout(function(){ 
            $("#file_imga").css("opacity","0");
         }, 50);
      });
   });
   
    function listPopup() { 
       window.open("${path}/linked/popup.do", "a", "width=600, height=760, left=600, top=50"); 
    }
   
   
   function myfunction(){
      alert("s");
   }
   
   
   
   
   function typelist(i,title,tag,date){
       var typelist;
       typelist=
       '<div class="w3-container w3-card-2 w3-white w3-round" style="width: 32%;float: left;margin:6px;">'
       +'<div class="nameBox" style="margin-top: 20px;">'
         +'<li class="list-group-item main-table-title" style="background-color: #5285c4;color:#fff;margin-top: -5px;height: 50px;font-size:17px;text-align:center;">'+title+'</li>'
         +'<p class="w3-opacity datebox" style="margin-top: 24px;margin-bottom: 0px;">'+date+'</p>'
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
         +'<span style="color:white;">재생목록 추가</span>'
       +'</button>'
       +'<button type="button" id="Comment" class="w3-button w3-margin-bottom" style="margin-left:3px;">'
         +'<span style="color:white;">공유</span>'
       +'</button>'
       +'<button type="button" id="Comment" class="w3-button w3-margin-bottom" style="margin-left:3px;">'
         +'<span style="color:white;">수정</span>'
       +'</button>'
    +'</div>'
    
       return typelist;
    }
       
       
       var list1 = new Array();
          <c:forEach items="${ListFeed}" var="list" varStatus="status">
             list1["${status.index}"] = new Array();
             var aa = "${list.lf_list}";
              var tt = aa.split("/"); 
             list1["${status.index}"].push(tt);
             list1["${status.index}"].push("${list.lf_title}");
             list1["${status.index}"].push("${list.lf_hashtag}");
             list1["${status.index}"].push("${list.lf_date}");
          </c:forEach>
       console.log(list1);
       /* for ( var i = 0; i < list1.length; i++) {
           alert(list1[i]);
       } */


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
     

       
       $(document).ready(function(){
    	   
       	for(var a = 0;a<list1.length;a++){
       		for(var b=0;b<list1[a][0].length;b++){
       				musiclistlist(list1[a][0][b],a);
       			}
               $("#listlistlist").append(typelist(a,list1[a][1],list1[a][2],list1[a][3]));
            }
       	
       });
   
   

/* sub2_콘텐츠 script 추가 */
    </script>




<div id="includePage">
   <jsp:include page="../include_files/header.jsp"></jsp:include>
</div>

<div style="width:100%;padding-top:42px;">

    <div class="mypage-padding" style="background: url(${path}/resources/img/Opa.png);">
        <div class="mypage-width">
            <div id="mypage-holder">
                <img src="${path}/resources/img/IU.jpg" class="mypage-circle">
                <p class="mypage-username">아이유님의 마이페이지</p>
            </div>
            <div id="canvas-holder-full">

                <div class="canvas-holder">
                    <span>박자</span>
                    <canvas id="chart-area1" width="200px" height="200px"></canvas>
                    <script>
                        var beat = {
                            type: 'doughnut',
                            data: {
                                datasets: [{
                                    data: [
                                        window.genreratioFactor.set1,
                                        window.genreratioFactor.set2,
                                        window.genreratioFactor.set3
                                    ],
                                    backgroundColor: [
                                        window.genrecolorFactor.set1,
                                        window.genrecolorFactor.set2,
                                        window.genrecolorFactor.set3
                                    ],
                                    label: '박자'
                                }],
                                labels: [
                                    window.genrenameFactor.set1,
                                    window.genrenameFactor.set2,
                                    window.genrenameFactor.set3
                                ]
                            },
                            options: {
                                responsive: true,
                                legend: {
                                    display: false
                                },
                                title: {
                                    display: false
                                },
                                elements: {
                                    arc: {
                                        borderWidth: 0
                                    }
                                },
                                animation: {
                                    animateScale: true,
                                    animateRotate: true
                                }
                            }
                        };
                    </script>
                </div>
                <div class="canvas-holder">
                    <span>감정</span>
                    <canvas id="chart-area2" width="200px" height="200px"></canvas>
                    <script>
                        var feel = {
                            type: 'doughnut',
                            data: {
                                datasets: [{
                                    data: [
                                        window.genreratioFactor.set1,
                                        window.genreratioFactor.set2,
                                        window.genreratioFactor.set3
                                    ],
                                    backgroundColor: [
                                        window.genrecolorFactor.set1,
                                        window.genrecolorFactor.set2,
                                        window.genrecolorFactor.set3
                                    ],
                                    label: '느낌'
                                }],
                                labels: [
                                    window.genrenameFactor.set1,
                                    window.genrenameFactor.set2,
                                    window.genrenameFactor.set3
                                ]
                            },
                            options: {
                                responsive: true,
                                legend: {
                                    display: false
                                },
                                title: {
                                    display: false
                                },
                                elements: {
                                    arc: {
                                        borderWidth: 0
                                    }
                                },
                                animation: {
                                    animateScale: true,
                                    animateRotate: true
                                }
                            }
                        };
                    </script>
                </div>
                <div class="canvas-holder">
                    <span>장르</span>
                    <canvas id="chart-area3" width="200px" height="200px"></canvas>
                    <script>
                        var genre = {
                            type: 'doughnut',
                            data: {
                                datasets: [{
                                    data: [
                                        window.genreratioFactor.set1,
                                        window.genreratioFactor.set2,
                                        window.genreratioFactor.set3
                                    ],
                                    backgroundColor: [
                                        window.genrecolorFactor.set1,
                                        window.genrecolorFactor.set2,
                                        window.genrecolorFactor.set3
                                    ],
                                    label: '장르'
                                }],
                                labels: [
                                    window.genrenameFactor.set1,
                                    window.genrenameFactor.set2,
                                    window.genrenameFactor.set3
                                ]
                            },
                            options: {
                                responsive: true,
                                legend: {
                                    display: false
                                },
                                title: {
                                    display: false
                                },
                                elements: {
                                    arc: {
                                        borderWidth: 0
                                    }
                                },
                                animation: {
                                    animateScale: true,
                                    animateRotate: true
                                }
                            }
                        };
                    </script>
                </div>
                <script>
                    window.onload = function() {
                        var ctx = document.getElementById("chart-area1").getContext("2d");
                        var ctx2 = document.getElementById("chart-area2").getContext("2d");
                        var ctx3 = document.getElementById("chart-area3").getContext("2d");
                        window.myDoughnut = new Chart(ctx, genre);
                        window.myDoughnut = new Chart(ctx2, feel);
                        window.myDoughnut = new Chart(ctx3, beat);
                    }; 
                </script>
            </div>
        </div>
    </div>
    
      <div class="container">
         <div class="w3-row">
            <a href="${path}/linked/mypage.do">
               <div
                  class="w3-third tablink mypage-bottombar w3-hover-light-grey mypage-padding-tab"
                  style="width:25%;">
                  마이 피드</div>
            </a> 
            <a href="${path}/linked/mylist.do">
               <div
                  class="w3-third tablink mypage-bottombar w3-hover-light-grey mypage-padding-tab mypage-border-color"
                  style="width:25%;">
                  마이 리스트</div>
            </a>
             <a href="${path}/linked/follow.do">
               <div
                  class="w3-third tablink mypage-bottombar w3-hover-light-grey mypage-padding-tab"
                  style="width:25%;">
                  팔로워 소식</div>
            </a> 
            <a href="${path}/linked/userInfo.do">
               <div 
                  class="w3-third tablink mypage-bottombar w3-hover-light-grey mypage-padding-tab"
                  style="width:25%;">
                  정보 수정</div>
            </a>
         </div>
      </div>
   
   
      <!-- myList & Content write(edit) -->

   <!-- Page Container -->
   <div class="w3-container" style="width: 1080px;margin-top: 30px;margin: 0 auto;">
      <div class="w3-row-padding" style="padding:0px;">
         <br>
         <div class="w3-col m12" style="padding: 0px;">
            <div class="w3-card-2 w3-round w3-white">
               <div class="w3-container w3-padding">
                  <div style="float:left;">
                     <h4 class="w3-opacity">마이리스트 페이지</h4>
                  </div>
                  <!-- <input type="text" name="post" value="" class="form-control"
                     placeholder="리스트에 맞는 글을 작성해 주세요." /> <br> -->
                  <div style="float:right;">
                     <button type="button" class="w3-button w3-theme" onclick="listPopup()">
                        <i class="fa fa-pencil"></i> 추가
                     </button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
         
   <!-- Page Container -->
   
   <div class="w3-container w3-content" style="width: 1080px !important;padding: 16px;" id="listlistlist">
      
<!-- 마이리스트 추가란 -->
   <!-- 블럭 시작 -->
      <!-- <div class="w3-container w3-card-2 w3-white w3-round" style="width: 32%;float: left;margin-right: 7px;margin-bottom: 10px;">
               <div class="nameBox" style="margin-top: 20px;">
                 <li class="list-group-item main-table-title" style="background-color: #5285c4;color:#fff;margin-top: -5px;height: 50px;font-size:17px;text-align:center;">내 멋대로 리스트</li>
                 <p class="w3-opacity datebox" style="margin-top: 24px;margin-bottom: 0px;">2017년 06월 28일</p>
               </div>
               <div class="w3-row-padding" style="margin: 0 -16px">
                  <div class="list-group" style="margin:10px auto;">
                     <div class="list-main" style="max-height: 205px !important; overflow: scroll; ">
                      <ul class="list-group-menu" style="margin:0;padding:0;">
							<li><a href="#" class="list-group-item">And July - 헤이즈</a></li>
							<li><a href="#" class="list-group-item">Young - The Chainsmokers</a></li>
							<li><a href="#" class="list-group-item">Feels - Calvin Harris</a></li>
							<li><a href="#" class="list-group-item">소녀 - 오혁</a></li>
							<li><a href="#" class="list-group-item">And July - 헤이즈</a></li>
							<li><a href="#" class="list-group-item">Young - The Chainsmokers</a></li>
							<li><a href="#" class="list-group-item">Feels - Calvin Harris</a></li>
							<li><a href="#" class="list-group-item">소녀 - 오혁</a></li>
							<li><a href="#" class="list-group-item">And July - 헤이즈</a></li>
							<li><a href="#" class="list-group-item">Young - The Chainsmokers</a></li>
							<li><a href="#" class="list-group-item">Feels - Calvin Harris</a></li>
							<li><a href="#" class="list-group-item">소녀 - 오혁</a></li>

						</ul>
                     </div>
                  </div>
               </div>
               <div class="hash-tag-main" style="margin-top: 21px;margin-bottom:0;">
                  <a href="#" class="w3-opacity hash-tag-main-a">#내멋대로</a> <a href="#" class="w3-opacity hash-tag-main-a">#공부용</a> <a href="#" class="w3-opacity hash-tag-main-a">#감상용</a>
               </div>
               <hr class="w3-clear" style="margin:10px 0px;">
               <button type="button" id="Like" class="w3-button w3-margin-bottom">
                  <span style="color:white;">재생목록 추가</span>
               </button>
               <button type="button" id="Comment" class="w3-button w3-margin-bottom" style="margin-left:3px;">
                  <span style="color:white;">공유</span>
               </button>
               <button type="button" id="Comment" class="w3-button w3-margin-bottom" style="margin-left:3px;">
                  <span style="color:white;">수정</span>
               </button>
            </div> -->
   <!-- 블럭 끝 -->
         <!-- End Middle Column -->
         
   

   
   <!-- 블럭 시작 -->
      <%-- <div class="w3-container w3-card-2 w3-white w3-round" style="width: 32%;float: left;margin-right: 7px;height: 447px;margin-bottom: 10px;">
          <div id="mov">
              <img id="nofile_img" alt="파일없음" src="${path}/resources/img/play.png" style="opacity:30%;background-color: black"> 
              <div class="w3-row-padding" style="height: 283px !important;">
                   <a onclick="myfunction()"><img id="file_imga" alt="파일추가" src="${path}/resources/img/09.png" style="width: 326px;margin-left: -24px;"></a>
              </div>
          </div>
         </div> --%>
         <%-- <div class="w3-container w3-card-2 w3-white w3-round" style="width: 32%;float: left;margin-right: 7px;height: 447px;margin-bottom: 10px;">
          <div id="mov">
              <img id="nofile_img" alt="파일없음" src="${path}/resources/img/play.png" style="width: 335.5px;height: 100%;margin-left: -16px;opacity:30%;background-color: black"> 
              <div class="w3-row-padding" style="height: 283px !important;">
                   <a onclick="myfunction()"><img id="file_imga" alt="파일추가" src="${path}/resources/img/09.png" style="width: 335.5px;margin-left: -24px;"></a>
              </div>
          </div>
         </div> --%>
   <!-- 블럭 끝 -->
   </div>

   <!-- End Grid -->

   <!-- End Page Container -->
   <br>
</div>
</body>
</html>