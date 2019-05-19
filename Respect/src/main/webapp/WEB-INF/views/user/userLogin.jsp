<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% Cookie[] cookies=request.getCookies();
   String saveId=null;
   if(cookies!=null)
   {
      for(Cookie c:cookies)
      {
         if(c.getName().equals("saveId"))
         {
            saveId=c.getValue();
         }
      }
   }%>
<c:set var="path" value="<%=request.getContextPath()%>"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>니가가라 제주도</title>
    <link rel="shortcut icon" href="${path }/resources/img/main/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${path }/resources/css/style.css">

    <style>
    #logo{color:black; font-size: 30px; }
    #logo img{width:40px;}
/*     html, body, blockquote, caption, dl, dd, dt, div, fieldset, form, frame, h1, h2, h3, h4, h5, h6, hr, iframe, input, legend, li, object, ol, p,
pre, q, select, table, textarea, ul, tr, td, button{margin:0; padding:0; font-family: "NanumSquare", "Nanum Gothic", "나눔고딕", "맑은 고딕", "Malgun Gothic", "Open Sans", "Dotum", "돋움", arial, sans-serif} */
    </style>
</head>
<body style="background: #f1f1f1">
    <div class="container mt-5 p-5">

        <div class="p-4 jejuhallasan" align="center"><label><a id="logo" class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp"><img src="${path }/resources/img/main/logo.png" > 니가가라 제주도</a></label></div>

        <div class="container col-sm-5 shadow p-4 rounded" style="background:white;">
            <form action="${path }/user/loginEnd" method="post">
                <div class="form-group">
                    <label for="userId">ID </label>
                    <div class="form-group form-check-inline float-right">
                        <label class="form-check-label ml-3">
                            <input class="form-check-input" type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked":"" %>>ID기억하기
                        </label>
                    </div>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="ID를 입력하세요" value='<%=saveId!=null?saveId:"" %>' required>
                </div>
                <div class="form-group">
                    <label for="userPw">Password</label>
                    <input type="password" class="form-control" id="userPw" name="password" placeholder="비밀번호를 입력하세요" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-outline-warning" align="center">로그인</button>
                    <div class="float-right">
                            <a href="${path }/user/userEnroll.do"  class="p-2">회원가입</a>
                            <a href="${path }/user/findPassword.do"  class="p-2">비밀번호찾기</a>
                    </div>
                </div>
            
            </form>
        </div>
    </div>
</body>
</html>