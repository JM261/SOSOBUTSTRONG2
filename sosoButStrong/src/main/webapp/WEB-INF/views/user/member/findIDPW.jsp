<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/user/member/findIDPW.css">
<!-- 제이쿼리 --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <!-- 자바스크립트 -->
 <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>

	<div class="outer"> <!--header 아래 모든 부분 감싸는 div-->
        <div class="content">
		<!-- 여기는 content div입니다 -->
		    <div class="left">
		    	<div id="header1"><h3>아이디 찾기</h3></div>
		    	<div id="text1"><h6>회원가입 시 입력하신 이름 + 이메일 주소로 <br>아이디를 확인하실 수 있습니다.</h6></div>
		    	<br>
		    	<div id="content1">
			        <form action="findID.me" method="post">
				        <div>
				           <h6>이름</h6>
				           <span class="box">
				               <input type="text" class="int" name="userName" placeholder="이름">
				           </span>
				        </div>
				        <div>
				           <h6>이메일</h6>
				           <span class="box">
				               <input type="text" class="int" name="email" placeholder="이메일">
				            </span>
				        </div>
				        <!-- BTN -->
				        <div class="btn_area" align="center"> 
				           <button type="submit" id="btnFindID">아이디 찾기</button>
				    	</div>
					</form>
				</div>
		    </div><!-- left 영역 끝 -->
		    <div class="right">
		    	<div id="header2"><h3>비밀번호 찾기</h3></div>
		    	<div id="text2"><h6>가입하신 아이디 + 이메일 주소를 입력하시면<br>임시 비밀번호를 발급해드립니다.</h6></div>
		    	<br>
		    	<div id="content2">
			        <form action="" method="post">
				        <div>
				           <h6>아이디</h6>
				           <span class="box">
				               <input type="text" class="int" name="userId" placeholder="아이디">
				           </span>
				        </div>
				        <div>
				           <h6>이메일</h6>
				           <span class="box">
				               <input type="text" class="int" name="email" placeholder="이메일">
				            </span>
				        </div>
				        <!-- BTN -->
				        <div class="btn_area" align="center"> 
				           <button type="submit" id="btnFindPWD" data-toggle="modal" data-target="#login_searchPwd">비밀번호 찾기</button>
				    	</div>
					</form>
				</div>
		    </div><!-- right 영역 끝 -->
		</div> 
		<!--div class="content" 영역 끝-->
    </div>
    
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp"/>	
	        <!-- 비번찾기용 모달 -->
    <div class="modal" id="login_searchPwd">
        <div class="modal-dialog">
            <div class="modal-content">
            
            <!-- Modal Header -->
                <div class="modal-header">
                    <div class="modal-title">
                        임시비밀번호발급
                    </div>
                </div>

              <!-- Modal body -->
            <form action="" method="post">
                <div class="modal-body">
                    <div id="login_modal_content">
                        <div style="padding-left: 15px; line-height: 50px;">본인인증</div>
                        <hr style="margin: 0px;">

                        <div id="searchPwd_form">
                            <table id="login_searchPwd_information">
                                <tr>
                                    <td class="login_td1">아이디</td>
                                    <td class="login_td2"><input type="text"><br></td>
                                </tr>
                                <tr>
                                    <td class="login_td1">이름</td>
                                    <td class="login_td2"><input type="text"><br></td>
                                </tr>
                                <tr>
                                    <td class="login_td1">이메일</td>
                                    <td class="login_td2"><input type="text" style="width: 200px;"><button>인증</button><br></td>
                                </tr>
                                <tr>
                                    <td class="login_td1">인증번호</td>
                                    <td class="login_td2"><input type="text" style="width: 200px;"><button>확인</button><br></td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 5px;"></td>
                                    <td style="height: 5px;"><br>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="submit">등록</button>
                            <button type="button" data-dismiss="modal">취소</button>
                        </div>
                    </div><!-- 로그인모달content -->
                </div> <!-- 바디 -->
            </form>
            </div> <!-- 모달content -->
        </div><!-- dialog -->
    </div><!-- 비번찾기모달끝 -->
    
    <script>
    
    window.onload = $(function(){
    	$('#email_vali').hide();
    	
    })
    
    $(function(){
    	
	    $('#searchId').click(function(){
	    	$('#vali_result').text("");
	    	$("#searchId_btn").attr("disabled",true);
	    	$('#email').text('');
	    })
	    	
	    $('#email_btn').click(function(){
	    		
	    		var $email = $('#email').val();
		    	var $name = $('#name').val();
				var $emailVali = $('#email_chk').val();

	    		$.ajax({
	    			url : "email.chk",
	    			data : {email : $email},
	    			type : "post",					
	    			complete : function(){
						console.log("성공이든 실패든간에 실행");
						$('#email_result').text("이메일 전송이 완료되었습니다.").css("color","gray");
					}
	    			
	    		})
	    		
	    	})
	    })
	    
	    $('#email_chk').blur(function(){
			var $emailVali = $('#email_chk').val();
	    	var $name = $('#name').val();
			var $email = $('#email').val();
			
	
			$.ajax({
				url : "emailVali.chk",
				data : {emailVali : $emailVali},
				type : "post",
				success : function(result){
					console.log(result);
					if(result>0){ //result 1이상 == 일치결과있음
						console.log(result)
						$('#vali_result').text("굿").css("color","gray");
						
					} else{
						$('#vali_result').text($emailVali + "은(는) 잘못된 인증번호입니다. 다시 입력하세요.").css("color","red");
						$('#email_chk').val('');				
					}
				},
				complete : function(){
					if($name!=null&&$email!=null&&$emailVali!=null)
						$("#searchId_btn").attr("disabled",false);
				}
			})
	})
    </script>
	
	
</body>
</html>