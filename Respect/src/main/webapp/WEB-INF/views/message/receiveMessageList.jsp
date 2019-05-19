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

    
<script>
    $(function()
    {
       $('#customCheck').click(function()
       {
            if($('#customCheck').prop("checked"))
            {
                $('input[type=checkbox]').prop('checked',true);
            }
            else
            {
                $('input[type=checkbox]').prop('checked',false);
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
       
       $("#receiveMessageDelete").on('click',function(){
    	   var chkval=[];
    	   $(".chk").each(function(){
    		if($(this).prop('checked')){
    			chkval.push($(this).val())
    			location.href="${path}/message/receiveMessageDelete.do?val="+chkval+"&userId=${userLoggedIn.userId}&cPage=${cPage}"
    		}
    	   });
       });
       
       
    });

</script>
</head>
<body>
        <div class="container mt-3">
            <h4 style="text-align: center;">${userLoggedIn.nickName}님의 쪽지함</h4>
            <button type="button" class="btn btn-warning" id="receiveMessageList">받은쪽지함</button>
            <button type="button" class="btn btn-outline-warning" id="writeMessageList">보낸쪽지함</button>
            <button type="button" class="btn btn-outline-warning" id="sendMessage">쪽지보내기</button>
            <hr/>
            <h5 style="display: inline-block;">받은 쪽지함</h5> 안읽은 쪽지 : ${userLoggedIn.noReadMessage} , 총 받은쪽지 : ${receiveMessageTotalCount}
            <table class="table table-hover"  style="table-layout:fixed; word-break:break-all;">
                    <tbody>
                        
                        <tr class="bg-warning btn-sm">
                            <th>
                                <input type="checkbox" class="mr-2" id="customCheck">
                                <button class="btn btn-dark btn-sm" id="receiveMessageDelete">삭제</button>
                            </th>
                            <th>제목</th>
                            <th>보낸이</th>
                            <th>받은날짜</th>
                        </tr>
                        <!-- 실질적인거들어가라! -->
                        <c:forEach items="${receiveMessageList}" var="m">
	                        
		                        <tr>
	                                <th> 
                                        <input type="checkbox" value="${m.MSGNO}" class="chk" >
	                                </th>
	                                <c:if test="${m.READFLAG==1 }">
	                                	<td><a href="${path }/message/receiveMessageView.do?msgNo=${m.MSGNO}&cPage=${cPage}">${m.TITLE }</a></td>
	                                </c:if>
	                                <c:if test="${m.READFLAG==0 }">
	                                	<td><a href="${path }/message/receiveMessageView.do?msgNo=${m.MSGNO}&cPage=${cPage}">${m.TITLE }<img class="align-top" src="${path }/resources/upload/profile/ic_new.gif" alt="새로운쪽지"></a></td>
	                                </c:if>
	                                <td>${m.NICKNAME}</td>
	                                <td><fmt:formatDate value="${m.WRITEDATE}" pattern="yy.MM.dd hh:mm"/></td>
		                        </tr>
	                      
                        </c:forEach>
                        
                </tbody>
            </table>
            <div class="container">
                <div class="form-group">
                    <nav class="align-content-center">
                        ${pageBar}  
                    </nav>
                </div>
            </div>        
        </div>
        
</body>
</html>