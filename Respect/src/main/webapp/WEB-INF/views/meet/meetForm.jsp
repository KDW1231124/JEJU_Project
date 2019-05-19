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



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>





<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> -->


<!-- Latest compiled JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->


<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> --> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>







<%-- <script src="${path }/resources/js/jquery.min.js"></script> --%>
<%-- <script src="${path }/resources/bootstrap/js/bootstrap.min.js"></script> --%>
<link rel="stylesheet" href="${path }/resources/css/Footer-Dark.css">
<%-- <link rel="stylesheet" href="${path }/resources/bootstrap/css/bootstrap.min.css"> --%>
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



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${path }/resources/css/datepicker.css" rel="stylesheet" type="text/css">
<link href="${path }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${path }/resources/js/datepicker.min.js"></script>
<script src="${path }/resources/js/i18n/datepicker.en.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"> -->
<%-- <script src="${path }/resources/js/summernote.js"></script>
<script src="${path }/resources/js/summernote.min.js"></script> --%>
<script src="${path }/resources/js/summernote-ko-KR.js"></script>

<style type="text/css">
	.custom-file-input {
        min-width: 14rem;
        max-width: 100%;
        height: calc(2.25rem + 2px);
        margin: 0;
        opacity: 0;
    }
    .custom-file-control {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    z-index: 5;
    height: calc(2.25rem + 2px);
    padding: 0.375rem 0.75rem;
    line-height: 1.5;
    color: #495057;
    pointer-events: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-color: #fff;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    }
</style>
<!-- <script>
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
			//날씨
			/* alert(data.weather.minutely[0].sky.name); */
			//온도
			/* alert(data.weather.minutely[0].temperature.tc); */
			
			var skyName=data.weather.minutely[0].sky.name;
			var temp=data.weather.minutely[0].temperature.tc;
			
			
			switch (skyName) {
				case '맑음': $(".weather-picture").html("<i class='wi wi-day-sunny'></i>"); break;
				case '구름조금': $(".weather-picture").html("<i class='wi wi-day-cloudy'></i>"); break;
				case '구름많음': $(".weather-picture").html("<i class='wi wi-day-cloudy-high'></i>"); break;
				case '구름많고 비': $(".weather-picture").html("<i class='wi wi-day-rain'></i>"); break;
				case '구름많고 눈': $(".weather-picture").html("<i class='wi wi-day-snow'></i>"); break;
				case '구름많고 비 또는 눈': $(".weather-picture").html("<i class='wi wi-day-rain-mix'></i>"); break;
				case '흐림': $(".weather-picture").html("<i class='wi wi-day-fog'></i>"); break;
				case '흐리고 비': $(".weather-picture").html("<i class='wi wi-rain'></i>"); break;
				case '흐리고 눈': $(".weather-picture").html("<i class='wi wi-snow'></i>"); break;
				case '흐리고 비 또는 눈': $(".weather-picture").html("<i class='wi wi-rain-mix'></i>"); break;
				case '흐리고 낙뢰': $(".weather-picture").html("<i class='wi wi-lightning'></i>"); break;
				case '뇌우/비': $(".weather-picture").html("<i class='wi wi-thunderstorm'></i>"); break;
				case '뇌우/눈': $(".weather-picture").html("<i class='wi wi-storm-showers'></i>"); break;
				default: $(".weather-picture").html("<i class='wi wi-storm-showers'></i>"); break;
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
		
		
		

	
});

</script> -->

<script>
	$(function(){
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
                                <a href="#">
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
                        <div class="row ml-3 mt-1 pt-3">
                            <div id="weather-temp2" class="mr-2">
                                <a href="#">
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
                        <li class="dropdown mr-3"><a class="dropdown-toggle nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#">제주이야기 </a>
                            <div class="dropdown-menu" role="menu">
                            	<a class="dropdown-item" role="presentation" href="${path}/notice/notice-board.do">공지사항</a>
                            	<a class="dropdown-item" role="presentation" href="${path}/notice/traffic-board.do">교통</a>
                          	</div>
                        </li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path }/meet/meetList.do">모임</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path}/schedule/scheduleList">여행일정</a></li>
                        <li class="nav-item mr-3" role="presentation"><a class="nav-link" href="${path}/schedule/scheduleWrite">일정 만들기</a></li>
                    </ul>
                </div>
            </nav>
        </div>
     </div>








<script type="text/javascript">
	//summernote
	$(document).ready(function() {
  	    $('#summernote').summernote({
            height : 300,                 // set editor height
            lang : 'ko-KR', // default: 'en-US'
      		callbacks : {
      			onImageUpload : function(files, editor, welEditable){
      				sendFile(files, editor, welEditable);
      			}
      		}
  	    });
  	});
	
	$(document).ready(function(){
		//datepicker
		// Initialization
		/* $('.datepicker-here').datepicker({
			autoClose : true
		}); */
		// Access instance of plugin
		$('#my-element').data('datepicker');
	});
	
	function sendFile(file, editor, welEditable){
	    data = new FormData();
	    console.log(file);
	    for(var i=0;i<file.length;i++){
	       data.append("uploadFile", file[i]);
	    }
	    console.log(data.getAll('uploadFile'));
	    $.ajax({
	       data:data,
	       url:"${path}/imageUpload.do",
	       type:"POST",
	       cache:false,
	       contentType:false,
	       processData:false,
	       dataType:"json",
	       success:function(data){
	    	  alert(data);
	          console.log(data);
	          for(var i=0;i<data.length;i++)
	          {
	             //$('#test').append('<img src=/resources/uploadImg/'+data.list[i]+'>');
	             $('#summernote').summernote('insertImage', "${path}/resources/uploadImg/"+data[i],data[i]);
	          }
	       },
	       error:function(obj,a,b){
	    	   console.log(obj);
	    	   console.log(b);
	       }
	    });
	}
	
</script>

<section class="container">
	<br><br>
	<div class="container">
		<div class="card mb-4">
	        <div class="card-body">
	            <form action="${path }/meet/meetFormEnd.do" enctype="multipart/form-data" method="POST" accept-charset="UTF-8">
	            
	                <div class="form-group row">
	                    <label for="제목" class="col-sm-2 col-form-label">제목</label>
	                    <div class="col-sm-8">
	                        <input type="text" class="form-control" id="inputEmail3" name="title" placeholder="제목" required="required">
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="제목" class="col-sm-2 col-form-label">대표이미지</label>
	                    <div class="col-sm-8">
							<input type="file" accept="image/*" id="thumbnail" name="thumbnail" required="required">
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="area" class="col-sm-2 col-form-label">지역</label>
	                    <div class="col-sm-8">
	                        <!-- <input type="text" class="form-control" id="area" name="area" placeholder="동/읍/면" required="required"> -->
	                        <select class="form-control" name="area" required>
                                    <option value="" selected>지역을 선택하세요</option>
                                    <optgroup label="제주시">
                                    <option value="제주시내">제주시내</option>
                                    <option value="조천읍">조천읍</option>
                                    <option value="구좌읍">구좌읍</option>
                                    <option value="애월읍">애월읍</option>
                                    <option value="한림읍">한림읍</option>
                                    <option value="한경면">한경면</option>
                                    </optgroup>
                                    <optgroup label="서귀포시">
                                    <option value="서귀포시내">서귀포시내</option>
                                    <option value="남원읍">남원읍</option>
                                    <option value="표선읍">표선읍</option>
                                    <option value="성산읍">성산읍</option>
                                    <option value="중문">중문</option>
                                    <option value="안덕면">안덕면</option>
                                    <option value="대정읍">대정읍</option>
                                    </optgroup>
                                    <optgroup label="섬속의 섬">
                                    <option value="추자도">추자도</option>
                                    <option value="우도">우도</option>
                                    <option value="차귀도">차귀도</option>
                                    <option value="가파도">가파도</option>
                                    <option value="마라도">마라도</option>
                                    <option value="비양도">비양도</option>
                                    </optgroup>
                                </select>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="area" class="col-sm-2 col-form-label">주소</label>
	                    <div class="col-sm-8">
	                        <!-- <input type="text" class="form-control" id="address" name="address" placeholder="상세주소"> -->
	                        <input type="text" class="form-control" id="address" name="address" placeholder="상세주소" required="required"><br>
							<input type="button" class="btn btn-outline-warning" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
							
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f&libraries=services"></script>
							<script>
							    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
							        mapOption = {
							            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
							            level: 5 // 지도의 확대 레벨
							        };
								
							    //지도를 미리 생성
							    var map = new daum.maps.Map(mapContainer, mapOption);
							    //주소-좌표 변환 객체를 생성
							    var geocoder = new daum.maps.services.Geocoder();
							    //마커를 미리 생성
							    var marker = new daum.maps.Marker({
							        position: new daum.maps.LatLng(37.537187, 127.005476),
							        map: map
							    });
								
								
							    function sample5_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var fullAddr = data.address; // 최종 주소 변수
							                var extraAddr = ''; // 조합형 주소 변수
											
							                // 기본 주소가 도로명 타입일때 조합한다.
							                if(data.addressType === 'R'){
							                    //법정동명이 있을 경우 추가한다.
							                    if(data.bname !== ''){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있을 경우 추가한다.
							                    if(data.buildingName !== ''){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
							                }
											
							                // 주소 정보를 해당 필드에 넣는다.
							                document.getElementById("address").value = fullAddr;
							                // 주소로 상세 정보를 검색
							                geocoder.addressSearch(data.address, function(results, status) {
							                    // 정상적으로 검색이 완료됐으면
							                    if (status === daum.maps.services.Status.OK) {
							
							                        var result = results[0]; //첫번째 결과의 값을 활용
							
							                        // 해당 주소에 대한 좌표를 받아서
							                        var coords = new daum.maps.LatLng(result.y, result.x);
							                        // 지도를 보여준다.
							                        mapContainer.style.display = "block";
							                        map.relayout();
							                        // 지도 중심을 변경한다.
							                        map.setCenter(coords);
							                        // 마커를 결과값으로 받은 위치로 옮긴다.
							                        marker.setPosition(coords)
							                    }
							                });
							            }
							        }).open();
							    }
							</script>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="inputPassword3" class="col-sm-2 col-form-label">작성자</label>
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" id="writer"  value="${userLoggedIn.nickName }" readonly="readonly">
	                        <input type="hidden" name="userId" value="${userLoggedIn.userId }">
	                    </div>
	                </div>
					<div class="form-group row">
					   	<label for="gender" class="col-sm-2 col-form-label">성별</label>
					   	<div class="col-sm-3">
					       	<input type="text" class="form-control" name="gender" value="${userLoggedIn.gender=='M'?'남':'여' }" readonly="readonly"> 
					    </div>
					</div>
	              	<div class="form-group row">
					   	<label for="gender" class="col-sm-2 col-form-label">나이</label>
					   	<div class="col-sm-3">
					       	<input type="text" class="form-control" name="age" value="${userLoggedIn.birth }" readonly="readonly"> 
					    </div>
					</div>
	                <!-- 날자 정하기 -->
	                <div class="form-group row">
	                	<label for="date" class="col-sm-2 col-form-label">날짜</label>
	                	<div class="col-sm-3">
	                		<input type='text' class='datepicker-here form-control' name="meetDate" data-language='en' required="required"/>
	                	</div>
	                </div>
	                <div class="form-group row">
	                	<label for="date" class="col-sm-2 col-form-label">시간</label>
	                	<div class="col-sm-3">
	                		<input type="time" class="form-control" name="meetTime" required="required">
	                	</div>
	                </div>
	                <!-- 썸머노트 에디터 사용 -->
					<div class="form-group row">
	                    <label for="제목" class="col-sm-2 col-form-label">내용</label>
	                    <textarea id="summernote" name="content" class="col-sm-8" style="resize: none;" required="required"></textarea>
	                </div>
	                <div class="justify-content-center" align="center">
				        <div class="card-footer" style="align-content:center;">
				            <button type="submit" class="btn btn-outline-warning">확인</button>
				            &nbsp;&nbsp;
				            <button type="button" onclick="fn_cancel()" class="btn">취소</button>
				        </div>
			        </div>
	            </form>
	        </div>
	    </div>
	</div>
	<script>
		/* 취소버튼 */
		function fn_cancel()
		{
			alert("취소되었습니다.");
			location.href="${path}/meet/meetList.do";
		}
		
		
		
	</script>
	
	
</section>


<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>


















