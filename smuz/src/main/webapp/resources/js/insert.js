$(document).ready(function(){
           $("#mainContent").css("opacity","1");
           $("#mainContent").css("margin-top","-200px");
            
           $("#uid").keyup(function(){
                var val = $(this).val(),
                regex = /^[A-Za-z0-9+]{5,15}$/;

                if(val==""||val==null){
                    $("#id_wrong").css("display","block");
                    $("#id_wrong").html("아이디를 입력해주세요.");
                    $("#check1").attr("value","false");
                }else if(!regex.test(val)){
                    $("#id_wrong").css("display","block");
                    $("#id_wrong").html("영문,숫자 총 5자 이상 15자 이하로 작성해주세요.");
                    $("#check1").attr("value","false");
                }else{
                    $("#id_wrong").html("");
                    $("#id_wrong").css("display","none");
                    $("#check1").attr("value","true");
                }
           });
           $("#idcheck").click(function(){
               var check =$("#check1").val();
               if(check!="false"){   
            	   var idcheck =$("#uid").val();
                   $.ajax({
                  		url:"member/check.do",
                          dataType:"text",
                          type:"post",
                          data:idcheck,
                          processData: false,
                          contentType: "application/json", 
                          success:function(data){   
                              if(data=="0"){
                              	alert("사용 가능한 아이디 입니다.");
                              	$("#check2").attr("value","true");
                              }else{
                              	alert("이미 있는 아이디 입니다.");
                              	$("#check2").attr("value","false");
                              	$("#uid").val("");
                              }
                          },error:function(e){  
                              alert("error");  
                          }  
                      });
                   
                   
                   $("#check2").attr("value","true");
               }else{
                   alert("아이디 값이 조건에 일치하지 않습니다."); 
                   $("#check2").attr("value","false");
               }
            	   
               
           });
           $("#password").keyup(function(){
                var val = $(this).val();
                if(val.length<6){
                    $("#result").css("display","block");
                    $("#result").html("비밀번호가 짧아요..ㅠ");
                    $("#check3").attr("value","false");
                }else{
                    $("#result").html("");
                    $("#result").css("display","none");
                    $("#check3").attr("value","false");
                }
            })
            $("#password_checked").keyup(function(){
                var val = $(this).val();
                var val2 = $("#password").val();
                if(val==val2){
                    $("#result_pass").html("");
                    $("#result_pass").css("display","none");
                    $("#check3").attr("value","true");
                }else{
                    $("#result_pass").css("display","block");
                    $("#result_pass").html("비밀번호가 안맞아요..ㅠ");
                    $("#check3").attr("value","false");
                }
            });
           var check1,check2;
           var id,pass,name,birth1,birth2,birth3,birth,sex;
            $("#nextBtn").click(function(){
                        /*$("#insertcontain_absolute").css("left","-500px");*/
                        check1=$("#check2").val();
                        check2=$("#check3").val();
                        
                        id=$("#uid").val();
                        pass=$("#password").val();
                        name=$("#name").val();
                        birth1=$("#birth1").val();
                        birth2=$("#birth2").val();
                        birth3=$("#birth3").val();
                        sex=$("#sex").val();
                        if(check1=="true"&&check2=="true"){
                            /*alert("아이디 비밀번호 확인");*/
                            if(name==null||name==""){
                                alert("이름을 입력해주세요");
                            }else if(birth1==null||birth1==""||birth1.length!=4||
                                    birth2==null||birth2==""||birth2.length==0||
                                    birth3==null||birth3==""||birth3.length==0){
                                alert("생년월일을 입력해주세요");
                            }else if(sex==null||sex==""){
                                alert("성별을 눌러주세요");
                            }else{
                                birth = birth1+"/"+birth2+"/"+birth3;
                                /*alert(id+":"+pass+":"+name+":"+birth+":"+sex);*/
                               $("#insertcontain_absolute").css("left","-500px");
                            }
                        }else if(check1=="false"){
                            alert("아이디 중복 체크를 해주세요.");
                        }else{
                            alert("비밀번호가 일치하지 않습니다.");
                        }
                        
                    });
            $(".imgbox").mouseenter(function(){
                $(this).find(".imgtext").css("background-color","rgba(0,0,0,0.7)");
                $(this).find(".musictitle").css("display","block");
            });
            $(".imgbox").mouseleave(function(){
                $(this).find(".imgtext").css("background-color","rgba(0,0,0,0.2)");
                $(this).find(".musictitle").css("display","none");
            });
            var count=0;
            var music_data,cnt;
            $(".imgbox").on("click",function(){
                var a = $(this).find(".selectbox").attr("cho");
                if(a==1){
                    $(this).find(".selectbox").css("display","block");
                    $(this).find(".selectbox").attr("cho","2");
                    count++;
                }else{
                    $(this).find(".selectbox").css("display","none");
                    $(this).find(".selectbox").attr("cho","1");
                    count--;
                }
                        
                if(count<3){
                    $("#alltext").css("display","none");
                    $("#alltesttxt").css("display","block");
                }else{
                    $("#alltext").css("display","block");
                    $("#alltesttxt").css("display","none");
                                                        
                    music_data = Array();
                    cnt = 0;
                    $(".selectbox").each(function(){
                        var text = $(this).attr("cho");
                        if(text=="2"){
                            music_data[cnt]=$(this).text();
                            cnt++;
                        }
                    });
                            
                }
            })/*img click 이벤트 발생*/
            $("#resultMusicData").click(function(){
            	var data = new Object();
            	/*var ff = service.register(id,pass,name);*/
            	
            	data.sid = id;
            	data.spass = pass;
            	data.sname = name;
            	data.sbirth = birth;
            	data.ssex = sex;
            	data.smusicdata = music_data;
            	console.log(data);
            	$.ajax({
            		url:"member/insert.do",
                    dataType:"text",
                    type:"post",
                    data:JSON.stringify(data),
                    processData: false,
                    contentType: "application/json", 
                    success:function(data){   
                        if(data=="true"){
                        	alert("회원가입이 성공");
                        	location.href="/smuz";
                        }else{
                        	alert("회원가입이 실패");
                        	location.href="/smuz";
                        }
                    },error:function(e){  
                        alert("error");  
                    }  
                });
            	
            });
            
        });/*document ready 종료*/
        
        function pageinsert(){
           $("#mainContent").css("opacity","0");
           $("#mainContent").css("margin-top","-50px");
            
           $("#insertcontain").css("display","block");
           setTimeout(function(){ 
               $("#insertcontain").css("opacity","1");
               $("#insertcontain").css("margin-top","-330px");
           },50);


           
        }
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