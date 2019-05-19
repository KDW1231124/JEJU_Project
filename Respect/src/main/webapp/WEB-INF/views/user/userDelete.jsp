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
             
             
             $("#deleteFrm").submit(function(event){
     	    	var flag=confirm("정말 탈퇴하시겠습니까?");
     	    	if(!flag)
         		{
     	    		event.preventDefault();
     	    		return;
         		}
     	    	
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
                <button id="updatePw" type="button" class="btn btn-outline-warning">비밀번호 변경</button>
                <button id="updateProfile" type="button" class="btn btn-outline-warning">프로필사진 변경</button>
                
	            <button id="deleteMember" type="button" class="btn btn-warning">회원 탈퇴</button>
            </div>
            <div class="p-3 pb-3">
                <div class="container col-sm-7">
                <h1 class="mt-3">회원 탈퇴</h1>
                <hr>
                <div class="breadcrumb" style="text-align: left;">
	                 <table id="text">
	                     <tr>
	                         <td>* 본인 확인을 위해 비밀번호를 한 번 더 입력해 주세요.</td>
	                     </tr>
	                     <tr>
	                         <td>* 탈퇴한 회원의 ID와 E-Mail은 다시 사용이 불가능 합니다.</td>
	                     </tr>
	                 </table>
	             </div>
	             <hr>
	            	<div class="container p-4 rounded" style="text-align: left;" >
	                	<form id="deleteFrm" action="${path }/user/userDeleteEnd.do" method="post">
	                    	<div class="form-group">
	                        	<label for="memberId">ID</label><label id="idResult" class="float-right"></label>
	                        	<input type="text" class="form-control" id="memberId" name="userId" value="${userLoggedIn.userId}" readonly>
	                    	</div>
	                    	<div class="form-group">
	                        	<label for="password">Password</label>
	                        	<input type="password" class="form-control" id="password" name="password" placeholder="현재 비밀번호를 입력하세요" required>
	                     </div>
	                     <div class="form-group " align="center">
	                         <button type="submit" id="pwCheck" class="btn mt-2" style="background: #f19221;">탈퇴하기</button>
	                         <button type="reset" class="btn mt-2">취소</button>
	                     </div>
	                 </form>
	             </div>
                                        
            </div>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>