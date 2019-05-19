<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f"></script> -->
    <!-- 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f"></script>
    
    <script>
    function check(){
       var chk = confirm("삭제하시겠습니까?")
       if(chk==false){
          return false;
       }
       
       if(chk==true){
        return true;  
       }
       
    }
    

    </script>
    
    <style>
      

  
        #user_name{
    font-size: 25px;
    font-weight: 800;
    color: #ef8321;
    line-height: 25px;
    display: inline-block;
    }
    #text_tit{
        margin-top: 4px;
    font-size: 18px;
    color: #1b1b1b;
    display: inline-block;
  
    }
    #text_myInfo_key{
        font-size: 17px;
        color: #1b1b1b;
        line-height: 17px
    }
    #text_myInfo_value{

        color: #ef8321;
        font-size: 17px
    }
    #text_myTripSchedule{
      color: #ef8321; font-size: 18px; line-height: 40px; font-weight:bold;
    }

    #card_line{
      height: 200px ; width: 100%; box-shadow: 3px 4px 5px 0 rgba(2,2,2,.2);
    }

    #card_line_noshadow{
      height: 200px ; width: 100%;
    }

    #more_title{
      font-size: 18px; line-height: 90%; color: #ef8321;
    }

    #more_num{
      font-size: 18px; color: #ef8321; font-size: 42px;  font-weight: 400; line-height: 1%;
    }
    
    #div_title{
      height: 50px; width: 100%; border: 3px solid #f8c990; border-radius: 10px;
    }

    #p_title{
      font-size: 17px; color: black; text-align: center; font-weight: bold;
    }

    #span_info{
      font-size: 14px; color: black; text-align: center; font-weight: 300;
    }
    #where{
      height: 22px; background-color: #333; color: #fff;font-size: 13px;line-height: 6px; position: absolute; top: 16px; left: 16px;
    }

    </style>
    
        
    <div class="container p-0">
       
            <div class="card card-register mx-auto mt-5" style="background: #f4f4f4; border: 1px solid #e5e5e5;">
                    
                    <div class="card-body">
                        <div class="form-group">
                          <div class="form-row">
                            <div class="col-md-2" style="border-right: 1px solid #e5e5e5" >
                              <div class="form-label-group">
                                  <!--사진 (경로를 잘 찾아라!!)-->
                                <c:if test="${userLoggedIn.picture ne null }">
                                  <img src="${path }/resources/upload/profile/${userLoggedIn.picture}" alt="프로필사진" width="100%"  height= "157px" style="max-height: 100%" class="rounded-circle" >
                              </c:if>
                              <c:if test="${userLoggedIn.picture eq null }">
                                  <img src="${path }/resources/upload/profile/basicprofile.jpg" alt="프로필사진" width="100%"  height= "157px" style="max-height: 100%" class="rounded-circle" >
                              </c:if>
                              </div>
                            </div>
                            <div class="col-md-10" >
                              <div class="form-label-group" style="border-bottom: 1px solid #e5e5e5">
                                    <!--유저닉넴이나 이름-->
                                    <span id="user_name" class="ml-4 mb-3">${userLoggedIn.nickName}</span>
                                    <span id="text_tit">님의 제주여행</span>
                              </div>
                              <div class="form-group mt-4 ml-4">
                                    <div class="form-row">
                                      <div class="col-md-4">
                                        <div class="form-label-group ">
                                          <span id="text_myInfo_key">나의 여행일정 : </span>
                                          <!--등록한 여행일정의 수-->
                                          <span id="text_myInfo_value">${myScheduleNum}</span>
                                        </div>
                                      </div>
                                      <div class="col-md-4">
                                        <div class="form-label-group">
                                                <span id="text_myInfo_key">&nbsp;&nbsp;찜한 여행지 : </span> 
                                                <!--찜한여행지의 수-->
                                                <span id="text_myInfo_value">&nbsp;${putPlaceNum }</span>
                                        </div>
                                      </div>
                                      <div class="col-md-4">
                                            <div class="form-label-group">
                                                    <span id="text_myInfo_key">&nbsp;&nbsp;안읽은 쪽지 : </span>
                                                    <!--읽지않은 쪽지의 수-->
                                                    <span id="text_myInfo_value">&nbsp;${userLoggedIn.noReadMessage }</span>
                                            </div>
                                          </div>
                                    </div>
                                  </div>
                                  <div class="form-group mt-4 ml-4">
                                        <div class="form-row">
                                          <div class="col-md-4">
                                            <div class="form-label-group ">
                                              <span id="text_myInfo_key ">찜한 여행일정 : </span>
                                              <!--찜한 여행일정의 수-->
                                              <span id="text_myInfo_value">${putScheduleNum }</span>
                                            </div>
                                          </div>
                                          <div class="col-md-4">
                                            <div class="form-label-group">
                                                    <span id="text_myInfo_key">나의 여행후기 : </span>
                                                    <!--자신이 작성한 여행후기의 수-->
                                                     <span id="text_myInfo_value">${myScheduleReportNum }</span>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    
                            </div>
                          </div>
                        </div>            
                    </div>
                  </div>
          
          
          <div class="mt-5">
              <span style="font-size: 24px">찜한 여행지(${putPlaceNum })</span>
          </div>

          <!--클릭한거에 따라 색깔지정 잘해라!!-->
          <div class="mt-4">
              <a href="${path }/mySchedule/putScheduleList.do?userId=${userLoggedIn.userId}" style="text-decoration:none !important;"><span style="font-size: 16px; color: #959595;" id="go_jjimTripScheduleList">찜한 여행일정(${putScheduleNum })</span></a>
              <span style="font-size: 16px; color: #d4cfcf;" class="ml-3 mr-3">l </span>
              <a href="${path }/mySchedule/putPlaceList.do?userId=${userLoggedIn.userId}" style="text-decoration:none !important;"><span style="font-size: 16px; color: black;" id="go_jjimPlaceList">찜한 여행지(${putPlaceNum })</span></a>
              
         </div>

         <!--지도-->
         <div class="mt-4" style="width: 100%; height: auto;">
             
                <div class="mt-4" id="map"  style="width:100%; height:300px;"></div> 
          
         </div>
         
         <div class="container p-0">
          <div class="row">
          
             <c:forEach items="${putPlaceList }" var="ppl">
                <div class="col-md-3 col-sm-6 portfolio-item mt-3">
                  <a class="portfolio-link"  href="${path }/spot/spotViewLogin.do?spotno=${ppl.placeno}&userid=${userLoggedin.userId}" style="text-decoration:none !important">
                      <div class="portfolio-hover mt-3">
                        <div class="portfolio-hover-content">
                          
                        </div>
                      </div>
                      <div id="card_line" style="height: auto;">
              
                        <img src="${path }/resources/upload/spot/thumbnail/${ppl.thumbnail}" alt="" width="100%" height="130px">
                        <a href="${path }/mySchedule/putPlaceDelete.do?cPage=${cPage }&placeNo=${ppl.placeno }&userId=${userLoggedIn.userId}" style="text-decoration:none !important" onclick="return check()"><img src="${path }/resources/upload/profile/xButton.png" alt="" width="20px" style="position: absolute; top: 25px; right: 25px;"></a>
                        <span id="where" class="p-2"><c:if test="${ppl.majorcategory=='관광지'}">관광지</c:if><c:if test="${ppl.majorcategory=='숙소'}">숙소</c:if><c:if test="${ppl.majorcategory=='음식점'}">음식점</c:if></span>
                        <!--관광지 제목,장소??(관광지리스트확인)-->
                        <p id="p_title" class="p-2">${ppl.title }<br> <span id="span_info" >${ppl.area }</span></p>
                        
                    </div>
                    </a>
                </div>
             
             
             </c:forEach>
                  
           

                </div>
                 
                 <c:if test="${fn:length(putPlaceList)==0}">
               <p class="text-center">등록된 정보가 없습니다.</p>
            </c:if>
            
            </div>
            
            <div class="container mt-5">

              <div class="form-group">
                <nav class="align-content-center">
                  ${pageBar} 
                </nav>
              </div>
            </div>

    </div>
    
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.361425, 126.529418), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };  

   var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   
   var size = '${fn:length(addList)}'; //주소의 수를 저장합니다
   
   var geocoder = new daum.maps.services.Geocoder();

   
   
   if('${addList[0]}'!=null){
   // 주소로 좌표를 검색합니다
   geocoder.addressSearch('${addList[0]}', function(result, status) {

       // 정상적으로 검색이 완료됐으면 
        if (status === daum.maps.services.Status.OK) {

           var coords = new daum.maps.LatLng(result[0].y, result[0].x);

           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new daum.maps.Marker({
               map: map,
               position: coords
           });

        // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
           var iwContent = '<div style="padding:5px; display:inline; border: 1px solid black; float:left; width: 300px;"><div style=" padding:10px; display:inline; float:left;"><a href="${path }/spot/spotView.do?spotno=${putPlaceList[0].placeno}"><img src="${path }/resources/upload/spot/thumbnail/${putPlaceList[0].thumbnail}" width=100px height=100px></a></div><div class="mt-2"><div style="display:inline;float:left; "><span style="font-weight:bold;">${putPlaceList[0].title}</span></div><br><div><span style="color: #676767; font-size: 13px">${putPlaceList[0].address}</span></div><div><span style="color: #ef8321; font-size: 12px"> 추천 ${putPlaceList[0].goodcount} </span><span style="font-size: 12px">ㅣ</span> <span style="color: #ef8321; font-size: 12px"> 리뷰 ${putPlaceList[0].replycount} </span></div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
               iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

           // 인포윈도우를 생성합니다
           var infowindow = new daum.maps.InfoWindow({
               content : iwContent,
               removable : iwRemoveable
           });

           // 마커에 클릭이벤트를 등록합니다
           daum.maps.event.addListener(marker, 'click', function() {
                 // 마커 위에 인포윈도우를 표시합니다
                 infowindow.open(map, marker);  
                 
           });

          
       } 
   });    
   
   }
   
   if('${addList[1]}'!=null){
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${addList[1]}', function(result, status) {

          // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new daum.maps.Marker({
                  map: map,
                  position: coords
              });

           // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
              var iwContent = '<div style="padding:5px; display:inline; border: 1px solid black; float:left; width: 300px;"><div style=" padding:10px; display:inline; float:left;"><a href="${path }/spot/spotView.do?spotno=${putPlaceList[1].placeno}"><img src="${path }/resources/upload/spot/thumbnail/${putPlaceList[1].thumbnail}" width=100px height=100px></a></div><div class="mt-2"><div style="display:inline;float:left; "><span style="font-weight:bold;">${putPlaceList[1].title}</span></div><br><div><span style="color: #676767; font-size: 13px">${putPlaceList[1].address}</span></div><div><span style="color: #ef8321; font-size: 12px"> 추천 ${putPlaceList[1].goodcount} </span><span style="font-size: 12px">ㅣ</span> <span style="color: #ef8321; font-size: 12px"> 리뷰 ${putPlaceList[1].replycount} </span></div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                  iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

              // 인포윈도우를 생성합니다
              var infowindow = new daum.maps.InfoWindow({
                  content : iwContent,
                  removable : iwRemoveable
              });

              // 마커에 클릭이벤트를 등록합니다
              daum.maps.event.addListener(marker, 'click', function() {
                    // 마커 위에 인포윈도우를 표시합니다
                    infowindow.open(map, marker);  
              });

             
          } 
      });    
      
      }
   
   
   if('${addList[2]}'!=null){
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${addList[2]}', function(result, status) {

          // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new daum.maps.Marker({
                  map: map,
                  position: coords
              });

           // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
              var iwContent = '<div style="padding:5px; display:inline; border: 1px solid black; float:left; width: 300px;"><div style=" padding:10px; display:inline; float:left;"><a href="${path }/spot/spotView.do?spotno=${putPlaceList[2].placeno}"><img src="${path }/resources/upload/spot/thumbnail/${putPlaceList[2].thumbnail}" width=100px height=100px></a></div><div class="mt-2"><div style="display:inline;float:left; "><span style="font-weight:bold;">${putPlaceList[2].title}</span></div><br><div><span style="color: #676767; font-size: 13px">${putPlaceList[2].address}</span></div><div><span style="color: #ef8321; font-size: 12px"> 추천 ${putPlaceList[2].goodcount} </span><span style="font-size: 12px">ㅣ</span> <span style="color: #ef8321; font-size: 12px"> 리뷰 ${putPlaceList[2].replycount} </span></div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                  iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

              // 인포윈도우를 생성합니다
              var infowindow = new daum.maps.InfoWindow({
                  content : iwContent,
                  removable : iwRemoveable
              });

              // 마커에 클릭이벤트를 등록합니다
              daum.maps.event.addListener(marker, 'click', function() {
                    // 마커 위에 인포윈도우를 표시합니다
                    infowindow.open(map, marker);  
              });

             
          } 
      });    
      
      }
   
   
   if('${addList[3]}'!=null){
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${addList[3]}', function(result, status) {

          // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new daum.maps.Marker({
                  map: map,
                  position: coords
              });

           // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
              var iwContent = '<div style="padding:5px; display:inline; border: 1px solid black; float:left; width: 300px;"><div style=" padding:10px; display:inline; float:left;"><a href="${path }/spot/spotView.do?spotno=${putPlaceList[3].placeno}"><img src="${path }/resources/upload/spot/thumbnail/${putPlaceList[3].thumbnail}" width=100px height=100px></a></div><div class="mt-2"><div style="display:inline;float:left; "><span style="font-weight:bold;">${putPlaceList[3].title}</span></div><br><div><span style="color: #676767; font-size: 13px">${putPlaceList[3].address}</span></div><div><span style="color: #ef8321; font-size: 12px"> 추천 ${putPlaceList[3].goodcount} </span><span style="font-size: 12px">ㅣ</span> <span style="color: #ef8321; font-size: 12px"> 리뷰 ${putPlaceList[3].replycount} </span></div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                  iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

              // 인포윈도우를 생성합니다
              var infowindow = new daum.maps.InfoWindow({
                  content : iwContent,
                  removable : iwRemoveable
              });

              // 마커에 클릭이벤트를 등록합니다
              daum.maps.event.addListener(marker, 'click', function() {
                    // 마커 위에 인포윈도우를 표시합니다
                    infowindow.open(map, marker);  
              });

             
          } 
      });    
      
      }
   
   
   if('${addList[4]}'!=null){
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${addList[4]}', function(result, status) {

          // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new daum.maps.Marker({
                  map: map,
                  position: coords
              });

           // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
              var iwContent = '<div style="padding:5px; display:inline; border: 1px solid black; float:left; width: 300px;"><div style=" padding:10px; display:inline; float:left;"><a href="${path }/spot/spotView.do?spotno=${putPlaceList[4].placeno}"><img src="${path }/resources/upload/spot/thumbnail/${putPlaceList[4].thumbnail}" width=100px height=100px></a></div><div class="mt-2"><div style="display:inline;float:left; "><span style="font-weight:bold;">${putPlaceList[4].title}</span></div><br><div><span style="color: #676767; font-size: 13px">${putPlaceList[4].address}</span></div><div><span style="color: #ef8321; font-size: 12px"> 추천 ${putPlaceList[4].goodcount} </span><span style="font-size: 12px">ㅣ</span> <span style="color: #ef8321; font-size: 12px"> 리뷰 ${putPlaceList[4].replycount} </span></div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                  iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

              // 인포윈도우를 생성합니다
              var infowindow = new daum.maps.InfoWindow({
                  content : iwContent,
                  removable : iwRemoveable
              });

              // 마커에 클릭이벤트를 등록합니다
              daum.maps.event.addListener(marker, 'click', function() {
                    // 마커 위에 인포윈도우를 표시합니다
                    infowindow.open(map, marker);  
              });

             
          } 
      });    
      
      }
   
   
   if('${addList[5]}'!=null){
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${addList[5]}', function(result, status) {

          // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new daum.maps.Marker({
                  map: map,
                  position: coords
              });

           // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
              var iwContent = '<div style="padding:5px; display:inline; border: 1px solid black; float:left; width: 300px;"><div style=" padding:10px; display:inline; float:left;"><a href="${path }/spot/spotView.do?spotno=${putPlaceList[5].placeno}"><img src="${path }/resources/upload/spot/thumbnail/${putPlaceList[5].thumbnail}" width=100px height=100px></a></div><div class="mt-2"><div style="display:inline;float:left; "><span style="font-weight:bold;">${putPlaceList[5].title}</span></div><br><div><span style="color: #676767; font-size: 13px">${putPlaceList[5].address}</span></div><div><span style="color: #ef8321; font-size: 12px"> 추천 ${putPlaceList[5].goodcount} </span><span style="font-size: 12px">ㅣ</span> <span style="color: #ef8321; font-size: 12px"> 리뷰 ${putPlaceList[5].replycount} </span></div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                  iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

              // 인포윈도우를 생성합니다
              var infowindow = new daum.maps.InfoWindow({
                  content : iwContent,
                  removable : iwRemoveable
              });

              // 마커에 클릭이벤트를 등록합니다
              daum.maps.event.addListener(marker, 'click', function() {
                    // 마커 위에 인포윈도우를 표시합니다
                    infowindow.open(map, marker);  
              });

             
          } 
      });    
      
      }
   
   
   if('${addList[6]}'!=null){
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${addList[6]}', function(result, status) {

          // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new daum.maps.Marker({
                  map: map,
                  position: coords
              });

           // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
              var iwContent = '<div style="padding:5px; display:inline; border: 1px solid black; float:left; width: 300px;"><div style=" padding:10px; display:inline; float:left;"><a href="${path }/spot/spotView.do?spotno=${putPlaceList[6].placeno}"><img src="${path }/resources/upload/spot/thumbnail/${putPlaceList[6].thumbnail}" width=100px height=100px></a></div><div class="mt-2"><div style="display:inline;float:left; "><span style="font-weight:bold;">${putPlaceList[6].title}</span></div><br><div><span style="color: #676767; font-size: 13px">${putPlaceList[6].address}</span></div><div><span style="color: #ef8321; font-size: 12px"> 추천 ${putPlaceList[6].goodcount} </span><span style="font-size: 12px">ㅣ</span> <span style="color: #ef8321; font-size: 12px"> 리뷰 ${putPlaceList[6].replycount} </span></div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                  iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

              // 인포윈도우를 생성합니다
              var infowindow = new daum.maps.InfoWindow({
                  content : iwContent,
                  removable : iwRemoveable
              });

              // 마커에 클릭이벤트를 등록합니다
              daum.maps.event.addListener(marker, 'click', function() {
                    // 마커 위에 인포윈도우를 표시합니다
                    infowindow.open(map, marker);  
              });

             
          } 
      });    
      
      }
   
   
   if('${addList[7]}'!=null){
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${addList[7]}', function(result, status) {

          // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new daum.maps.Marker({
                  map: map,
                  position: coords
              });

           // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
              var iwContent = '<div style="padding:5px; display:inline; border: 1px solid black; float:left; width: 300px;"><div style=" padding:10px; display:inline; float:left;"><a href="${path }/spot/spotView.do?spotno=${putPlaceList[7].placeno}"><img src="${path }/resources/upload/spot/thumbnail/${putPlaceList[7].thumbnail}" width=100px height=100px></a></div><div class="mt-2"><div style="display:inline;float:left; "><span style="font-weight:bold;">${putPlaceList[7].title}</span></div><br><div><span style="color: #676767; font-size: 13px">${putPlaceList[7].address}</span></div><div><span style="color: #ef8321; font-size: 12px"> 추천 ${putPlaceList[7].goodcount} </span><span style="font-size: 12px">ㅣ</span> <span style="color: #ef8321; font-size: 12px"> 리뷰 ${putPlaceList[7].replycount} </span></div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                  iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

              // 인포윈도우를 생성합니다
              var infowindow = new daum.maps.InfoWindow({
                  content : iwContent,
                  removable : iwRemoveable
              });

              // 마커에 클릭이벤트를 등록합니다
              daum.maps.event.addListener(marker, 'click', function() {
                    // 마커 위에 인포윈도우를 표시합니다
                    infowindow.open(map, marker);  
              });

             
          } 
      });    
      
      }
   
  
   
   
   
   
   
   
   
    </script>
    
    <div class="mb-5"></div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>