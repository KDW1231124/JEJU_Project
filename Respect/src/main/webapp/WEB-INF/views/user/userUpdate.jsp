<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <script>
    $(function(){
    	
    	var nickFlag=1;
    	
    	$("#userNick").keyup(function()
    	  		{	
    	  			if($("#userNick").val().trim().length>=2){
    	  				$.ajax({
    	      				url:"${pageContext.request.contextPath}/user/checkNick.do",
    	      				data:{userNick:$("#userNick").val().trim()},
    	      				dataType:"json",
    	      				success:function(data){
    	      
    	    						if(data.flag==true){
    	    	  						if($("#userNick").val().trim()!=$("#userNickOrigin").val())
    	    	  						{
    	    	  							$("#nickResult").html("이미 존재하는 닉네임").css("color","red");
    	    	  	  						nickFlag=0;
    	    	  						}
    	    	  					}
    	    	  					else{
    	    	  						$("#nickResult").html("사용 가능한 닉네임").css("color","green");
    	    	  						nickFlag=1;
    	    	  						}
    	      					},error:function(xhr,status,errormsg)
    	    				/* error:function(xhr) */
    	    				{
    	    					console.log(xhr);
    	    					console.log(status);
    	    					console.log(errormsg);
    	    				}
    	      			});
    	  			}else{
    	  				$("#nickResult").html("닉네임은 2글자 이상입니다.").css("color","red");
	  						nickFlag=0;
    	  			}
    	  		});
    	
			$("#updateForm").submit(function(event){
	  		
	  		
		  		if(nickFlag==0)
		  		{
		  			event.preventDefault();
		  			alert("사용가능한 닉네임을 입력해 주세요.");
		  			$("#userNick").focus();
			  		return;
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
        
        
      });
    </script>
</head>
<body>
        <div class="container mt-5" style="text-align: center;">
        
                <h1>마이 페이지</h1>
                <br>
                
                <div class="btn-group m-2" style="display: inline-block;">
                    <button id="updatePage" type="button" class="btn btn-warning">정보 수정</button>
                    <button id="updatePw" type="button" class="btn btn-outline-warning">비밀번호 변경</button>
                    <button id="updateProfile" type="button" class="btn btn-outline-warning">프로필사진 변경</button>
                    
                    <button id="deleteMember" type="button" class="btn btn-outline-warning">회원 탈퇴</button>
                </div>
                <div class="p-3 pb-3">
                    <div class="container col-sm-7">
                    <h1 class="mt-3">정보 수정</h1>
                    <hr>
                    
                     <div class="container p-4 rounded" style="text-align: left;">
                        <form action="${path }/user/userUpdateEnd.do" method="post" id="updateForm" enctype="multipart/form-data">	
                          <div class="form-group">
                            <label for="userId">ID</label>
                            <input type="text" class="form-control" id="userId" name="userId" value="${userLoggedIn.userId }" readonly="readonly">
                          </div>

                              
                        <div class="form-group">
                            <label for="userNick">닉네임</label><span> *</span><label id="nickResult" class="float-right"></label>
                            <input type="text" class="form-control" id="userNick" name="nickName" value="${userLoggedIn.nickName}" placeholder="2글자 이상 입력하세요" required>
                            <input type="hidden" id="userNickOrigin" name="userNickOrigin" value="${userLoggedIn.nickName}">
                        </div>
                              
                        <div class="form-group">
                            <label for="userEmail" class="mb-0">E-Mail</label><span> *</span>
                            <input type="email" class="form-control" id="userEmail" name="email" value="${userLoggedIn.email }"  readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="userEmail" class="mb-0">성별</label><span> *</span>
                            <input type="email" class="form-control" id="userEmail" name="gender" value="${userLoggedIn.gender }"  readonly>
                            
                        </div>
                              
                              
                        <div class="form-group">
                        <label for="userBirth">생년월일</label><span> *</span>
                            <input type="date" class="form-control" id="userBirth" name="birth" value="${userLoggedIn.birth }" readonly>
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