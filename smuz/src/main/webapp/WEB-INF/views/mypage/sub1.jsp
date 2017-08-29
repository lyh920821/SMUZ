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

.container{
   width: 1080px;
}
#albumimg:HOVER {
   cursor:pointer;
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
        
       function music_search() { 
         window.open("${path}/linked/music_search.do?", "a", "width=600, height=500, left=100, top=50");  //comPopOpen("/rk/cm/cm83/CM830601P01.do?, argParam, 960, 860, false);
    }
   //팝업창 데이터 받는곳
      function music_search_callback(mf_music, mf_id,mf_img) { 
         $("#albumimg").css("display","block");
         $("#albumimg").attr("src","${path}/resources/albumimg/"+mf_img+"");
         $("#title").text(mf_music);
         $("#mf_file").val(mf_id);
         $("#mf_img").val(mf_img);
         console.log(mf_music);
         console.log(mf_id);
         console.log(mf_img);
    }
   $(document).ready(function(){
      $("#post_btn").click(function(){
         var aa = $("input[name=mf_board]").val();
         var bb = $("input[name=mf_tag]").val();
         if($("#mf_file").val()==[]){
            alert("음악을 선택해주세요");
         }else if(aa==''||aa==null){
            alert("내용을 입력해주세요.");
         }else if(bb==''||bb==null){
            alert("해시태그가 없어요.");
         }else{
            $("#today_form").submit();
         }
         
      }); 
      })
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
                    
                    function typeB(i,title,img,tag,date){
                    var typeB;
                    typeB=
                       '<div class="w3-container w3-card-2 w3-white w3-round" id="abc'+i+'" style="float:left;width:47%;margin:14px;">'
                       +'<div class="nameBox">'
                          
                          +'<p class="nickNamebox">Bamanaze</p>'
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
                       +'<p class="contant-main">'+title+''
                       +'</p>'
                       +'<div class="hash-tag-main">'
                          +'<a href="#" class="w3-opacity hash-tag-main-a">'+tag+'</a>'
                       +'</div>'
                       +'<hr class="w3-clear">'
                       +'<button type="button" id="Like" class="w3-button w3-margin-bottom">'
                          +'<i class="fa fa-thumbs-up"></i>  Like'
                       +'</button>'
                    +'</div>';
                 
                    return typeB;
                 }
                    
                    
                    var list1 = new Array();
                       <c:forEach items="${MusicFeed}" var="member" varStatus="status">
                          list1["${status.index}"] = new Array();
                          list1["${status.index}"].push("${member.mf_file}");
                          list1["${status.index}"].push("${member.mf_board}");
                          list1["${status.index}"].push("${member.mf_tag}");
                          list1["${status.index}"].push("${member.mf_date}");
                          list1["${status.index}"].push("${member.mf_img}");
                       </c:forEach>
                    console.log(list1);
                    /* for ( var i = 0; i < list1.length; i++) {
                        alert(list1[i]);
                    } */


                    
                    
                    
                    $(document).ready(function(){
                       
                       for(var a = 0;a<list1.length;a++){
                          $("#musicFeedResult").append(typeB(a,list1[a][1],list1[a][4],list1[a][2],list1[a][3]));
                       }
                       
                       
                  })
                </script>
            </div>
        </div>
    </div>
      
      <div class="container">
         <div class="w3-row">
            <a href="${path}/linked/mypage.do">
               <div
                  class="w3-third tablink mypage-bottombar w3-hover-light-grey mypage-padding-tab mypage-border-color"
                  style="width:25%;">
                  마이 피드</div>
            </a> 
            <a href="${path}/linked/mylist.do">
               <div
                  class="w3-third tablink mypage-bottombar w3-hover-light-grey mypage-padding-tab"
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
   <!-- Page Container -->
   <div class="w3-container w3-content"
      style="max-width: 1080px; margin-top: 30px;">
      
<!-- 마이피드 음악추가란 -->
      <div class="w3-row-padding">
         <br>
         <div class="w3-col m12">
            <div class="w3-card-2 w3-round w3-white">
               <div class="w3-container w3-padding" style="">
                  <form id="today_form" method="post" action="${path}/music/musicfeed.do">
                  <div>
                     <div style="float:left;height: 88px;margin-top: 30px;margin-left: 12px;margin-right: 37px;position:relative;">
                        <img alt="img" id="albumimg"
                           src="${path}/resources/albumimg/010aaee9-7c13-44e7-a4e6-c8f5007fa198_쿵쾅대%20-%20에디킴.jpeg" style="position:absolute;top:0px;width:100%;height:109px;display:none;" onclick="music_search()">
                        <button type="button" class="w3-button w3-theme btTextW" onclick="music_search()" style="width: 105px;height:109px;">
                        음악찾기
                        </button>
                        <p id="title" style="overflow:hidden;width:105px;font-size:10pt;"></p>
                        <input type="hidden" name="mf_file" id="mf_file"/>
                        <input type="hidden" name="mf_img" id="mf_img"/>
                     </div>
                  
                     <div style="float:left;width: 82.5%;margin-bottom: 10px;">
                        <h5 class="w3-opacity" style="font-size: 11pt;margin-left:5px;">오늘의 기분을 음악으로 표현해주세요</h5>
                        <input type="text" name="mf_board" value="" id="content_today" class="form-control"
                           placeholder="이 음악에 대한 당신의 생각은?" style="height:50px;max-width:100%;"/> 
                        
                        <h5 class="w3-opacity" style="font-size: 11pt; margin-left:5px;">해쉬태그를 작성해주세요.</h5>
                        <input type="text" name="mf_tag" value="" class="form-control"
                           placeholder="#기분좋음 #불금 #슬픔" style="max-width:100%;"/>
                     </div>
                  </div>
                     <div style="width:100%;margin-right: 15px;overflow: hidden;">
                        <div style="float:right;margin-right:15px;margin-top:15px;">
                           <button type="button" class="w3-button w3-theme" id="post_btn">
                           <i class="fa fa-pencil"></i>  Post
                           </button>
                        </div>
                     </div>
                  
                  </form>                  
               </div>
            </div>
         </div>
      </div>
      
      
<!-- 마이피드 콘텐츠란 -->
      <!-- The Grid -->
      <div class="w3-row">
         <!-- Left Column -->
         <div class="w3-col m3">
            <!-- End Left Column -->
         </div>
         <div class="w3-container w3-card-2 w3-white w3-round w3-margin"  id="musicFeedResult">
            <%-- <br> <img src="${path}/resources/img/icon.jpg" alt="Avatar"
               class="w3-left w3-circle w3-margin-right"
               style="width: 60px; border-radius: 50%;"> <span
               class="w3-right w3-opacity">2017년 05월 24일</span>
            <h4>SMUZ의 오늘의 추천 - (5월 24일)</h4>
            <br>
            <hr class="w3-clear">
            <p>
               오늘은 정말 더운 날씨 입니다.<br> 오늘은 날씨가 더우니 시원한 EDM 한번 들어 보실래요?<br>Calvin
               Harris - Summer | Cash Cash - overtime(EP)
            </p>
            <div class="w3-row-padding" style="margin: 0 -16px">
               <div class="w3-half">
                  <img src="${path}/resources/img/calvinharris.jpg" style="width: 100%"
                     alt="Northern Lights" class="w3-margin-bottom">
               </div>
               <div class="w3-half">
                  <img src="${path}/resources/img/cashcash.jpg" style="width: 100%" alt="Nature"
                     class="w3-margin-bottom">
               </div>
               <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom">
               <i class="fa fa-thumbs-up"></i>  Like
               </button>
            </div> --%>
            
         </div>
         
         
         <c:choose>
            <c:when test="${not empty MusicFeed}">
            
                
            </c:when>
            <c:otherwise>
                <a href="#" class="list-group-item follwer-group-item">Music Feed를 입력해주세요</a>
            </c:otherwise>
         </c:choose>



         <!-- End Middle Column -->
      </div>
   </div>

   <!-- End Grid -->

   <!-- End Page Container -->
   <br>
   
</div><!-- endend -->
   
</body>
</html>