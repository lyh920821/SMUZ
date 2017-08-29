<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="true"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

.tab {
   max-width: 1080px;
}

.container {
   width: 1080px;
}

/* sub2_콘텐츠 css 추가 */
.list-main::-webkit-scrollbar {
   display: none;
}

a {
   text-align: left;
   text-decoration: none !important;
}

.nameBox {
   width: 100%;
   height: 65px;
   border-bottom: 1px solid #eee;
}

.nameBox .nickNamebox, .nameBox .nameImgBox {
   float: left;
}

.nameBox .nickNamebox {
   margin: 21px 0px 0px 10px;
   font-size: 12pt;
}

.nameBox .nameImgBox {
   margin-top: 8px;
   width: 50px;
   height: 50px;
}

.nameBox .nameImgBox img {
   width: 100%;
   border-radius: 50%;
   object-fit: cover;
   object-position: top;
}

.nameBox .datebox {
   margin-top: 40px;
   font-size: 10pt;
   float: right;
}

.commentBox {
   width: 100%;
}

button {
   background-color: #4d636f !important;
}

.list-group-item {
   font-size: 14px;
}

li {
   margin: 0;
   padding: 0;
   list-style: none;
}

ul {
   margin: 0px;
   padding: 0px;
}

.list-group-menu-sub li {
   background-color: #ddd;
   text-align: center;
   width: 100%;
   height: 20px;
   padding: 0;
   float: left;
}

#mov {
   width: 100%;
   height: 100%;
   position: relative;
}

#file_imga {
   display: none;
   opacity: 0;
   width: 100%;
   height: 100%;
   position: absolute;
   top: 0px;
   transition: 0.5s all ease;
}

#nofile_img {
   width: 100%;
   height: 100%;
}

#mov a:hover {
   cursor: pointer;
}
/* sub2_콘텐츠 css 추가 */

/* sub4_콘텐츠 css 추가 */
#wrap {
   padding: 50px;
   border: 2px solid #e2e2e2;
   border-radius: 10px;
}

.info_form {
   overflow: hidden;
   margin: 0 auto;
}

.login_info {
   overflow: hidden;
}

.login_info_id {
   height: 50px;
   margin-top: 25px;
   margin-bottom: 10px;
}

.login_info_password {
   height: 50px;
}

.group_effect {
   margin-top: 30px;
}

h2 {
   margin: 0 auto;
   padding-bottom: 30px;
   border-bottom: 2px solid black;
   line-height: 1;
}

#ubtn {
   float: right;
   margin-right: 10px;
}

#dbtn {
   float: right;
}

#footer {
   overflow: hidden;
   margin: 0 auto;
}

.w3-content {
   max-width: 1080px !important;
   margin-top: 30px;
   margin: 0 auto;
}

/* sub4_콘텐츠 css 추가 */
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
       window.open("${path}/import/music_search.do", "a", "width=600, height=400, left=100, top=50"); 
    }
        
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
       window.open("${path}/import/popup.do", "a", "width=600, height=800, left=100, top=50"); 
    }
   
   
   function myfunction(){
      alert("s");
   }
   

/* sub2_콘텐츠 script 추가 */
    </script>

<body class="w3-theme-l5">

   <!-- 2017-05-25 (html & script) -->
   <!-- Recommendation Page - sub1.jsp -->

   <div id="includePage">
      <jsp:include page="../include_files/header.jsp"></jsp:include>
   </div>

   <div style="width: 100%; padding-top: 42px;">
      <div class="mypage-padding"
         style="background: url(${path}/resources/img/Opa.png);">
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
                  style="width: 25%;">마이 피드</div>
            </a> <a href="${path}/linked/mylist.do">
               <div
                  class="w3-third tablink mypage-bottombar w3-hover-light-grey mypage-padding-tab"
                  style="width: 25%;">마이 리스트</div>
            </a> <a href="${path}/linked/follow.do">
               <div
                  class="w3-third tablink mypage-bottombar w3-hover-light-grey mypage-padding-tab"
                  style="width: 25%;">팔로워 소식</div>
            </a> <a href="${path}/linked/userInfo.do">
               <div
                  class="w3-third tablink mypage-bottombar w3-hover-light-grey mypage-padding-tab mypage-border-color"
                  style="width: 25%;">정보 수정</div>
            </a>
         </div>
      </div>


      <!-- myList & Content write(edit) -->

      <!-- Page Container -->
      <div class="w3-container"
         style="width: 1020px; margin-top: 30px !important; margin: 0 auto; padding: 0;">

         <br>


         <!-- Page Container -->


         <!-- 정보수정 추가란 -->
         <!-- 블럭 시작 -->
         <div id="info_id">
            <div id="wrap">
               <form class="info_form">
                  <h2>계정</h2>
                  <br />
                  <div class="login_info">
                     <div class="login_info_id">
                        <div class="group_label">
                           <h4>아이디</h4>
                        </div>
                        <div class="group_content">
                           <!--                   <input type="text" value="아이디,비번 수정안됨" style="width:100%; height: 45px;" readonly> -->
                           <input type="text" class="form-control">
                        </div>
                     </div>

                     <div class="login_info_password group_effect">
                        <div class="group_label">
                           <h4>비밀번호</h4>
                        </div>
                        <div>
                           <div class="group_content" style="float: left;">
                              <input type="password" id="pwd" class="form-control"
                                 style="width: 600px;">
                              <!-- <input type="password" id="user_id" value="1234" style="width:100%; height: 45px;" readonly> -->
                           </div>
                           <div class="group_content" style="float: right;">
                              <span style="float: center; font-size: 20px;"><button
                                    type="button" class="btn btn-primary" style="width: 100px;"
                                    onClick="profile();">비번확인</button></span>
                           </div>
                        </div>
                     </div>
                  </div>

                  <br />
                  <br />

                  <div class="login_info">
                     <div class="login_info_id group_effect"
                        style="margin-bottom: 50px;">
                        <div class="group_label">
                           <h4>닉네임</h4>

                        </div>
                        <div class="group_content">
                           <input type="text" class="form-control">
                           <!-- <input type="text" id="user_id" value="홍길동" style="width: 100%; height: 45px;" > -->
                        </div>
                     </div>


                     <div class="login_info_password group_effect"
                        style="overflow: hidden;">
                        <div class="group_label" style="float: left;">
                           <h4>프로필사진</h4>
                        </div>
                        <div class="group_content"
                           style="margin-top: 5px; float: right;">
                           <span style="float: center; font-size: 20px;"><button
                                 type="button" class="btn btn-primary" style="width: 100px;"
                                 onClick="profile();">사진추가</button></span>
                        </div>
                     </div>
                  </div>

                  <br />
                  <br />

                  <div>
                     <div class="footer group_effect">
                        <div id="ubtn">
                           <!--                   <span style="font-size:20px;"><input type="button" value="수정" ></span> -->
                           <span style="font-size: 20px;"><button type="button"
                                 class="btn btn-primary" style="width: 100px;">수정</button></span>
                        </div>
                        <div id="dbtn">
                           <button type="button" class="btn btn-default"
                              style="width: 100px; color: white;">취소</button>
                           <!--                   <span style="font-size:20px;"><input type="button" value="취소" ></span> -->
                        </div>
                     </div>

                  </div>

                  <br />
                  <br />

               </form>
            </div>

            <!-- 정보수정 추가란 -->

         </div>
      </div>
      <!-- End Grid -->

      <!-- End Page Container -->
      <br>
   </div>
</body>
</html>