<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <script>
        $(function(){
        	
        	var pw2Flag=0;
        	var pw3Flag=0;
        	var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
        	
        	$('#userPw2').on('keyup',function(){
        		if(passwordRules.test($("#userPw2").val())){
        			$("#pwd2Result").html("사용가능한 비밀번호입니다").css("color","green");;
        			pw2Flag=1;
        		}else{
        			$("#pwd2Result").html("사용불가능한 비밀번호입니다").css("color","red");
        			pw2Flag=0
        		}
        	});
        	
        	 $("#userPw3").keyup(function(){   
        	    	    	
  	    	      if($("#userPw2").val()!=$("#userPw3").val())
  	    	      {
  	    	          $("#pwd3Result").html("비밀번호 불일치").css("color","red");
  	    	          pw3Flag=0;
  	    	      }
  	    	      else
  	    	      {
  	    	          $("#pwd3Result").html("비밀번호 일치").css("color","green");
  	    	          pw3Flag=1;
  	    	      }
    	    });
        	 
        	 $("#updatePasswordForm").submit(function(event){
     	  		
     	  		if(!(pw2Flag==1&&pw3Flag==1))
     	  		{
     	  			
     	  			if(pw2Flag==0){
     	  				event.preventDefault();
     		  			alert("사용가능한 비밀번호를 입력해주세요.");
     		  			$("#userPw2").focus();
     		  			return;
     	  			}
     	  			
     	  			if(pw3Flag==0){
     	  				event.preventDefault();
     		  			alert("같은 비밀번호를 입력해 주세요.");
     		  			$("#userPw3").focus();
     		  			return;
     	  			}
     	  			
     		  		
     	  		}
     	  		
     	  	});
        	 
        	
        	
       		$('#updatePage').on('click',function(){
               location.href="${path}/user/userUpdate.do";
             });

             $('#updatePw').on('click',function(){
               location.href="${path}/user/userUpdatePassword.do";
             });

             $('#updateProfile').on('click',function(){
                 location.href="${path}/user/userUpdateProfile.do";
               });
             
             
             
             $('#deleteMember').on('click',function(){
               location.href="${path}/user/userDelete.do";
             });
          
          
        })
    </script>
</head>
<body>
    <div class="container mt-5" style="text-align: center;">
    
            <h1>마이 페이지</h1>
            <br>
            
            <div class="btn-group m-2" style="display: inline-block;">
                <button id="updatePage" type="button" class="btn btn-outline-warning">정보 수정</button>
                <button id="updatePw" type="button" class="btn btn-warning">비밀번호 변경</button>
                <button id="updateProfile" type="button" class="btn btn-outline-warning">프로필사진 변경</button>
                
                <button id="deleteMember" type="button" class="btn btn-outline-warning">회원 탈퇴</button>
            </div>
            <div class="p-3 pb-3">
                <div class="container col-sm-7">
                <h1 class="mt-3">비밀번호 변경</h1>
                <hr>
                
                    <div class="container p-4 rounded" style="text-align: left;">
                        <form action="${path }/user/userUpdatePasswordEnd.do" method="post" id="updatePasswordForm" enctype="multipart/form-data">	
                            
                            <input type="hidden" name="userId" value="${userLoggedIn.userId}">
                            
                            <div class="form-group">
                                <label for="userPw">현재 비밀번호</label><label id="pwd1Result" class="float-right"></label>
                                <input type="password" class="form-control" id="userPw1" name="userPw1" placeholder="현재 비밀번호를 입력해주세요." required>
                            </div>
                            
                            <div class="form-group">
                                <label for="userPw">새 비밀번호</label><label id="pwd2Result" class="float-right"></label>
                                <input type="password" class="form-control" id="userPw2" name="userPw2" placeholder="8글자이상 16글자이하의 영문,숫자,특수문자조합" required>
                            </div>
                                
                                <div class="form-group">
                                <label for="userPw2">새 비밀번호 확인</label><label id="pwd3Result" class="float-right"></label>
                                <input type="password" class="form-control" id="userPw3" name="userPw3" placeholder="비밀번호를 한번더 입력하세요" required>
                            </div>
                        
                        <div class="form-group " align="center">
                            <button type="submit" class="btn mt-2" style="background: #f19221;" >변경하기</button>
                        </div>
                    </form>
                </div>                     
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

