<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
     <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	
	var nickFlag=1
	
	$("#userNick").on('keyup',function(){
			
  			$.ajax({
  				url:"${pageContext.request.contextPath}/user/checkNick.do",
  				data:{userNick:$("#userNick").val().trim()},
  				dataType:"json",
  				success:function(data){
  
						if(data.flag==true){
	  						nickFlag=1;
	  						}
	  					else{
	  						nickFlag=0;
	  						}
  					},error:function(xhr,status,errormsg)
				/* error:function(xhr) */
				{
					console.log(xhr);
					console.log(status);
					console.log(errormsg);
				}
  			});
		});
	
	$("#sendForm").submit(function(event){
		if(nickFlag==0){
			event.preventDefault();
  			alert("존재하지 않는 유저입니다.");
  			$("#userNick").focus();
  			return;
		}
		if("${userLoggedIn.nickName}"==$("#userNick").val().trim()){
			event.preventDefault();
  			alert("자신에게 쪽지전송은 불가능합니다.");
  			$("#userNick").focus();
  			return;
		}
		if($("#messageTitle").val().length>17){
			event.preventDefault();
			alert("제목이 너무 깁니다.");
			$("#messageTitle").focus();
			return;
		}
		if($("#messageContent").val().length>667){
			event.preventDefault();
			alert("내용이 너무 깁니다.");
			$("#messageContent").focus();
			return;
		}
	});

	
	 $('#receiveMessageList').on('click',function(){
  	   location.href="${path}/message/receiveMessageList.do?userId=${userLoggedIn.userId}";
     });
     
     $('#writeMessageList').on('click',function(){
  	   location.href="${path}/message/writeMessageList.do?userId=${userLoggedIn.userId}";
     });
     
     $('#sendMessage').on('click',function(){
  	   location.href="${path}/message/sendMessage.do";
     });
});
</script>
</head>
<body>
        <div class="container mt-3">
                <h4 style="text-align: center;">${userLoggedIn.nickName}님의 쪽지함</h4>
	            <button type="button" class="btn btn-outline-warning" id="receiveMessageList">받은쪽지함</button>
	            <button type="button" class="btn btn-outline-warning" id="writeMessageList">보낸쪽지함</button>
	            <button type="button" class="btn btn-warning" id="sendMessage">쪽지보내기</button>
                <hr/>
                <h5 style="display: inline-block;" >쪽지보내기</h5>
                <form action="${path }/message/sendMessageEnd.do" id="sendForm" method="post">
                    <table class="table table-hover" style="border-top: none">
                        <tr>
                            <th>
                                <h6>받는 사람</h6>
                                <input class="form-control col-md-2"type="text" name="receiverNick" placeholder="닉네임" id="userNick" value="${receiverNick}" readonly required >
                            </th>
                        </tr>
                        <tr>
                            <th >
                                <h6>제목</h6>
                                <input class="form-control  col-md-6" type="text" name="messageTitle" placeholder="제목" id="messageTitle" required>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <h6>내용</h6>
                                <textarea class="form-control" name='messageContent' cols="150" rows="11" style='resize: none;' required id="messageContent" ></textarea>
                            </th>
                        </tr>
                    </table>
                    <input type="hidden" name="writeId" value="${userLoggedIn.userId }"/>  
                    <button type="submit" class="btn m-2 alert-danger">보내기</button>
                    <button type="reset" class="btn alert-danger">취소</button>
                </form>
        </div>
                
</body>
</html>