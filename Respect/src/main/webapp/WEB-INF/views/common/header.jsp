<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path"/>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>니가가라 제주도</title>



<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> -->





<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> --> 
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->






<%-- <script src="${path }/resources/js/jquery.min.js"></script> --%>
<%-- <script src="${path }/resources/bootstrap/js/bootstrap.min.js"></script> --%>
<link rel="stylesheet" href="${path }/resources/css/Footer-Dark.css">
<link rel="stylesheet" href="${path }/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/resources/css/style.css">
<link rel="stylesheet" href="${path }/resources/fonts/font-awesome.min.css">
<link rel="stylesheet" href="${path }/resources/fonts/ionicons.min.css">
<link rel="shortcut icon" href="${path }/resources/img/main/favicon.ico">

<link rel="stylesheet" href="${path}/resources/css/weather-icons-master/css/weather-icons-wind.css">
<link rel="stylesheet" href="${path}/resources/css/weather-icons-master/css/weather-icons-wind.min.css">
<link rel="stylesheet" href="${path}/resources/css/weather-icons-master/css/weather-icons.css">
<link rel="stylesheet" href="${path}/resources/css/weather-icons-master/css/weather-icons.min.css">
<script src="${path}/resources/js/Simple-Slider.js"></script>
<link rel="stylesheet" href="${path}/resources/css/styles2.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">

<script>

$(function(){

	var latitude="";
	var longitude="";
	
	//제주시청기준
	if($("#weather-temp1").children().text().trim()=="제주시"){
		
		latitude="33.4996015";
		longitude="126.5290653";
	}
	
	//서귀포시청기준
	if($("#weather-temp2").children().text().trim()=="서귀포시"){
		
		latitude="33.2541658";
		longitude="126.5597051";
	} 
	
	 $.ajax({
		type : "get",
		crossDomain:true,
		url : "https://api2.sktelecom.com/weather/current/minutely",
		dataType: "json",
		async : false,
		data : {lat:latitude,lon:longitude,version:"1"},
		headers	: { appkey:"2e648883-2070-4bfe-aa3d-9b4c67e97171" },
		beforeSend: function(){
		},
		success : function(data){
			
			
			var skyName=data.weather.minutely[0].sky.name;
			var temp=data.weather.minutely[0].temperature.tc;
			
			
			switch (skyName) {
				case '맑음': $(".weather-picture").html("<i class='wi wi-day-sunny'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '구름조금': $(".weather-picture").html("<i class='wi wi-day-cloudy'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '구름많음': $(".weather-picture").html("<i class='wi wi-day-cloudy-high'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '구름많고 비': $(".weather-picture").html("<i class='wi wi-day-rain'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '구름많고 눈': $(".weather-picture").html("<i class='wi wi-day-snow'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '구름많고 비 또는 눈': $(".weather-picture").html("<i class='wi wi-day-rain-mix'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '흐림': $(".weather-picture").html("<i class='wi wi-day-fog'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '흐리고 비': $(".weather-picture").html("<i class='wi wi-rain'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '흐리고 눈': $(".weather-picture").html("<i class='wi wi-snow'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '흐리고 비 또는 눈': $(".weather-picture").html("<i class='wi wi-rain-mix'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '흐리고 낙뢰': $(".weather-picture").html("<i class='wi wi-lightning'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '뇌우/비': $(".weather-picture").html("<i class='wi wi-thunderstorm'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				case '뇌우/눈': $(".weather-picture").html("<i class='wi wi-storm-showers'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
				default: $(".weather-picture").html("<i class='wi wi-storm-showers'></i>").css({'font-size':'30px', 'color': '#808080'}); break;
			}
			
			$("#weather-temp1").children().children().after("<sub>"+temp+" ℃"+"</sub>");
			$("#weather-temp2").children().children().after("<sub>"+temp+" ℃"+"</sub>");
			
		},
		complete: function(){
		},
		error	: function(xhr, status, error){
			
			console.log("ajax실패!");
	        console.log(jxhr);
	        console.log(textStatus);
	        console.log(error);
		}
		}); 
		
	   $('#message').on('click',function(){
           window.open('${path}/message/receiveMessageList.do?userId=${userLoggedIn.userId}','message','top=50px, left=100px, height=600px, width=800px, resizable=no');
      }); 
	   
	   	
});

</script>


</head>
<body>
<div class="sticky-top" style="background: white; border-bottom: 1px solid #e5e5e5;">


   <div class="container mt-1">
    <div class="row">
    <div class="col">
    <nav class="navbar" style="overflow: hidden;">
        <div class="row ml-3">
            <div id="rank-list">
                <ol>
                    <li>
                        <div class="row ml-3 mt-1 pt-2">
                            <div id="weather-temp1" class="mr-4">
                                <a href="http://jejutour.ecobrain.net/">
                                    <p>제주시</p>
                                </a>
                            </div>
                            <div class="weather-picture" style="padding-top: 10px;">
                            	<br>
                            	<br>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="row ml-3 mt-2 pt-3">
                            <div id="weather-temp2" class="mr-2">
                                <a href="http://jejutour.ecobrain.net/">
                                    <p>서귀포시</p>
                                </a>
                            </div>
                            <div class="weather-picture" style="padding-top: 10px;">
                           		
                            </div>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
        
            <div class="row justify-content-between mr-3">
                <c:if test="${userLoggedIn==null }">
	                <div class="col-6">
	                    <a class="btn btn-outline-warning" href="${path}/user/userEnroll.do">회원가입</a>
	                </div>         
	                <div class="col-6">
	                    <a class="btn btn-outline-warning" href="${path}/user/userLogin.do">로그인</a> 
	                </div>
	                
	                
                </c:if>
                <c:if test="${userLoggedIn!=null }">
                	<div class="col-3">
	                    <a class="btn btn-outline-warning" href="${path}/mySchedule/allMySchedule.do?userId=${userLoggedIn.userId}">나의 일정관리</a>
	                </div>
	                <div class="col-3">
	                    <a class="btn btn-outline-warning" href="${path}/user/userUpdate.do">나의 정보관리</a>
	                </div>
	                <div class="col-3">
	                    <c:if test="${userLoggedIn.noReadMessage>0}">
			            	<button id="message" type="button" class="btn btn-outline-warning">쪽지함<img class="align-top" src="${path }/resources/upload/profile/ic_new.gif" alt="새로운쪽지"></button>
			            </c:if>
			            <c:if test="${userLoggedIn.noReadMessage==0}">
			            	<button id="message" type="button" class="btn btn-outline-warning">쪽지함</button>
			            </c:if>
	                </div>
	                <div class="col-3">
	                    <a class="btn btn-outline-warning" href="${path }/user/userLogout.do">로그아웃</a>
	                </div>
                </c:if>   
            </div>
        </nav>
        </div>
        </div>
        </div>

        <hr style="margin: 0; padding:0; border-top: 1px solid #dfdfdf;">
        
        <div class="container">
        <nav class="navbar navbar-light navbar-expand-md">
            <a class="navbar-brand" href="${path}">
            	<img class="img-fluid" src="${path }/resources/img/main/logo.png" style="max-width: 50px; max-height: 50px;">
            </a>
                <div class="jejuhallasan">
                    <h1>니가가라 제주도</h1>
                </div>
                <button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav ml-auto mx-auto">
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path}/spot/placeList.do">관광지</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path}/spot/accommList.do">숙소</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path}/spot/foodList.do">음식점</a></li>
                        
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link"  href="${path}/notice/notice-board.do">공지사항</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link"  href="${path}/notice/traffic-board.do">교통</a></li>
                         
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path }/meet/meetList.do">모임</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path}/schedule/scheduleList">여행일정</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path}/schedule/scheduleWrite">일정 만들기</a></li>
                    </ul>
                </div>
            </nav>
        </div>
     </div>
