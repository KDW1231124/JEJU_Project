<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script>
        $(function(){
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
          
          $('#userProfileDelete').on('click',function(){
              location.href="${path}/user/userProfileDelete.do";
            });
          
          $("#imgInp").on('change', function(){
              readURL(this);
          });
          
        });
        
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
            		
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }else{
      
    	    	$('#blah').attr('style','display: none;');
    	    	
            }
        }
        
        function check(){
        	var name = $('#imgInp').val();
        	if(name==''){
        		alert("사진을 선택해 주세요.");
        		return false;
        	}
        }
    </script>

<body>

	<div class="container mt-5" style="text-align: center;">
    
        <h1>마이 페이지</h1>
        <br>
        
        <div class="btn-group m-2" style="display: inline-block;">
            <button id="updatePage" type="button" class="btn btn-outline-warning">정보 수정</button>
            <button id="updatePw" type="button" class="btn btn-outline-warning">비밀번호 변경</button>
            <button id="updateProfile" type="button" class="btn btn-warning">프로필사진 변경</button>
            
            <button id="deleteMember" type="button" class="btn btn-outline-warning">회원 탈퇴</button>
		</div>
		<div class="p-3 pb-3" >
			<div class="container col-sm-7" align="center">
				<h1 class="mt-3"> 프로필사진 변경 <button id="userProfileDelete" type="button" class="btn" style="background: #f19221;">사진 삭제</button></h1>
		            <hr>
		            <div class="col-sm-10" >
			            <c:if test="${userLoggedIn.picture!=null}">
			            	<img id="blah" src="${path }/resources/upload/profile/${userLoggedIn.picture}" style=" width: 281.406px; height: 281.406px; max-width: 100%; max-height: 100%;">
			            </c:if>
			            <c:if test="${userLoggedIn.picture==null}">
			            	<img id="blah" src="${path }/resources/upload/profile/basicprofile.jpg" style=" width: 281.406px; height: 281.406px; max-width: 100%; max-height: 100%;">
			            </c:if>
			            <div class="mt-4">
			            	<div class="m-2">
			            		<form action="${path }/user/userUpdateProfileEnd.do" method="post" enctype="multipart/form-data" >
			            			<input type="hidden" name="userId" value="${userLoggedIn.userId }">
			            			<input type="file" class="form-control-file border" name="upFile" id="imgInp">
			            			
	           						<button id="updatePw" type="submit" class="btn mt-3" style="background: #f19221;" onclick="return check()">변경사진 적용</button>
			            		</form>
			            	</div>
			            </div>
		            </div>
			</div>
		</div>
		
	</div>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

