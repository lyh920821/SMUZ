<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="shortcut icon" href="${path}/resources/icon/icon.png">
	<title>s:muz</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href='http://fonts.googleapis.com/css?family=Lato:400,300,100,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${path}/resources/css/normalize.css" />
	<link rel="stylesheet" href="${path}/resources/css/styles.css?ver=1" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="${path}/resources/js/insert.js?ver=4"></script>
</head>

<body>

	<!-- Video Markup -->
	<section class="masthead">
		<video class="masthead-video" autoplay loop muted poster="${path}/resources/img/poster.jpg">
			<source src="${path}/resources/videos/ss2.mp4" type="video/mp4">
			<source src="${path}/resources/videos/dreamscapes.webm" type="video/webm">
		</video>
		<div class="masthead-overlay">
        </div>
        
        <div id="mainContent" class="contentEvent">
            <h1>S:MUZ</h1>
            <form method="post" id="loginForm">
                <input type="text" placeholder="UserName" id="user_id"/>
                <br/>
                <input type="password" placeholder="Password" id="user_pass"/>
                <br/>
                <input type="button" id="pageform" value="Log In" />
            </form>
            <script type="text/javascript">
            	$(document).ready(function(){
            		$("#pageform").on("click",function(){
            			var id = $("#user_id").val();
            			var pw = $("#user_pass").val();
            			var data = new Object();
            			data.sid = id;
                    	data.spass = pw;
            			$.ajax({
                    		url:"${path}/member/login.do",
                            dataType:"text",
                            type:"post",
                            data:JSON.stringify(data),
                            processData: false,
                            contentType: "application/json", 
                            success:function(data){   
                                if(data=="0"){
                                	alert("ID,비밀번호를 확인해주세요.");
                                }else{
                                	location.href="${path}/linked/loding.do";
                                }
                            },error:function(e){  
                                alert("error");  
                            }  
                        });
            		});
            	});
            </script>
            <div class="subtexta">
                <a href="#" onclick="pageinsert()">회원 가입</a>
                <br/>
                <span>Copyright(c)2017 s:muz All rights reserved. </span>
            </div>
        </div>
        
<div id="insertcontain">
<div id="insertcontain_relative">
<div id="insertcontain_absolute">
        <div id="mainInsert">
            <h1>S:MUZ</h1>
            <p>회원가입</p>
            <!--%%%%%%%%%%%%%%%%%%%%%%%-->
            <form action="#" id="join_form" method="post">
            <div class="input-group">
               <input type="text" id="uid" name="sm_id" placeholder="아이디">
               <div id="id_wrong">아이디를 입력해주세요.</div>
               <div class="input-group-addon">
                 <!-- <button type="button" id="sm_check"
                     style="display: inline-block; background: none; border: none">중복확인</button>-->
                     <input type="button" id="idcheck" value="중복확인"/>
                     <input type="hidden" id="check1" value="false">
                     <input type="hidden" id="check2" value="false">
               </div>
            </div>
            
            <div class="input-group">
               <input type="password" id="password" name="sm_password" placeholder="비밀번호(6자 이상)">
            </div>
            <div id="result"></div>

            <div class="input-group passwck">
               <input type="password" id="password_checked" name="password_checked" placeholder="비밀번호 확인">
               <input type="hidden" id="check3" value="false">
            </div>
            <div id="result_pass"></div>
            <div class="input-group">
               <input type="text" id="name" name="sm_name" placeholder="이름">
            </div>
            
            <div class="input-group birthbox">
               <input type="text" class="birth" id="birth1" placeholder="출생년도" style="width: 130px;" maxlength="4">
               <div class="bir">/</div>
               <input type="text" class="birth" id="birth2" placeholder="월"
               style="width: 65px;" maxlength="2">
               <div class="bir">/</div>
               <input type="text" class="birth" id="birth3" placeholder="일"
               style="width: 65px;" maxlength="2">
            </div>
            <div class="input-group boxbox">
               <input type="button" class="sexValue" id="man" value="남" onclick="gender(value)">
               <input type="button" class="sexValue" id="woman" value="여" onclick="gender(value)">
               <input type="hidden" id="sex" name="sm_sex" value="">
            </div>
            <script>
                function gender(test){
                    if(test!="여"){
                        $("#woman").css("background-color","rgba(255,255,255,0.3)");
                        $("#man").css("background-color","#5285c4");
                        $("#sex").attr("value","남");
                    }else{
                        $("#man").css("background-color","rgba(255,255,255,0.3)");
                        $("#woman").css("background-color","#5285c4");
                        $("#sex").attr("value","여");
                    }
                }
                function locationback(){
                	location.href="/smuz";
                }
            </script>
            
            <div class="input-group" style="clear:both">
                <input type="button" value="다음" id="nextBtn">
            </div>
            <a href="#" onclick="locationback()" id="backsrc" 
            	style="display:block;text-decoration:none;color:#fff;margin:0 auto;text-align:center;margin-top:20px;font-size:10.5pt;">
            	돌아가기</a>
            
            
         </form>
           <!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--> 
        </div>
        
        <div id="subInsert">
          <div id="allimgbox">
              <div class="imgbox">
               <div class="selectbox" cho="1">댄스</div>
               <div class="imgtext"><span class="musictitle">댄스</span></div>
               <img src="${path}/resources/img/a.jpeg" alt="">
              </div>
              <div class="imgbox">
               <div class="selectbox" cho="1">발라드</div>
               <div class="imgtext"><span class="musictitle">발라드</span></div>
               <img src="${path}/resources/img/b.jpeg" alt="">
              </div>
              <div class="imgbox">
               <div class="selectbox" cho="1">랩/힙합</div>
               <div class="imgtext"><span class="musictitle">랩/힙합</span></div>
               <img src="${path}/resources/img/c.jpeg" alt="">
              </div>
              <div class="imgbox">
               <div class="selectbox" cho="1">OST</div>
               <div class="imgtext"><span class="musictitle">OST</span></div>
               <img src="${path}/resources/img/d.jpeg" alt="">
              </div>
              <div class="imgbox">
               <div class="selectbox" cho="1">POP</div>
               <div class="imgtext"><span class="musictitle">POP</span></div>
               <img src="${path}/resources/img/e.jpeg" alt="">
              </div>
              <div class="imgbox">
               <div class="selectbox" cho="1">EDM</div>
               <div class="imgtext"><span class="musictitle">EDM</span></div>
               <img src="${path}/resources/img/f.jpeg" alt="">
              </div>
              <div class="imgbox">
               <div class="selectbox" cho="1">록/메탈</div>
               <div class="imgtext"><span class="musictitle">록/메탈</span></div>
               <img src="${path}/resources/img/g.jpeg" alt="">
              </div>
              <div class="imgbox">
               <div class="selectbox" cho="1">인디밴드</div>
               <div class="imgtext"><span class="musictitle">인디밴드</span></div>
               <img src="${path}/resources/img/h.jpeg" alt="">
              </div>
              <div class="imgbox">
               <div class="selectbox" cho="1">클래식</div>
               <div class="imgtext"><span class="musictitle">클래식</span></div>
               <img src="${path}/resources/img/i.jpeg" alt="">
              </div>
          </div>
          <div id="alltext">
              <input type="button" value="가입하기!" id=resultMusicData>
          </div>
          <div id="alltesttxt">
              선호하는 장르를 선택하여 주세요!
          </div>
          <a href="#" onclick="locationback()" id="backsrc" 
            	style="display:block;text-decoration:none;color:#fff;margin:0 auto;text-align:center;margin-top:10px;font-size:10.5pt;">
            	돌아가기</a>
        </div>  
</div>
</div>        
</div>
            
	</section>
	

	<!-- Load Scripts -->
	
	<script src="${path}/resources/js/covervid.js"></script>
	<script src="${path}/resources/js/scripts.js"></script>

	<!-- Call CoverVid -->
	<script type="text/javascript">
			coverVid(document.querySelector('.masthead-video'), 640, 360);
	</script>

</body>

</html>
