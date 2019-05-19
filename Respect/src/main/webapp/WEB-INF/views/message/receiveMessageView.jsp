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
    $(function(){
    		$('#back').on('click',function(){
    			location.href="${path}/message/receiveMessageList.do?cPage=${cPage}&userId=${userLoggedIn.userId}";
    		});
    		
    		$('#answer').on('click',function(){
    			location.href="${path}/message/messageAnswer.do?receiverNick=${message.nickName}";
    		});
    		
    	})
    </script>
</head>
<body>
        <table class="table table-hover ">
                <tr>
                    <th>
                     <h6>발신자</h6>
                     <input class="form-control col-md-2"type="text" value="${message.nickName }" readonly>
                    </th>
                </tr>
                <tr>
                    <th>
                     <h6>제목</h6>
                     <input class="form-control  col-md-6" type="text" value="${message.title }" readonly>
                    </th>
                </tr>
                <tr>
                    <th>
                     <h6>내용</h6>
                     <textarea class="form-control" name='messageTextarea' cols="150" rows="11" style='resize: none;' readonly>${message.content}</textarea>
                    </th>
                </tr>
            </table>
            <button id="back" type="button" class="btn m-2 alert-danger">뒤로가기</button>
            <button id="answer" type="button" class="btn m-2 alert-danger">답장</button>
</body>
</html>