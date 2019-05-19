<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

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
      font-size: 18px; line-height: 250%; color: #ef8321;
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
      height: 22px; background-color: #333; color: #fff;font-size: 13px;line-height: 6px; position: absolute; top: 66px; left: 16px;
    }

    
</style>
<body>
    <div class="container p-0" >
    <div class="container p-0">
        <div class="card card-register mx-auto" style="background: #f4f4f4; border: 1px solid #e5e5e5; margin-top: 185px;">
                
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
      </div>


      <div class="container p-0">
        <div class="row">
          <div class="col-md-3 col-sm-6 portfolio-item mt-5">
            
              <div class="portfolio-hover">
                <div class="portfolio-hover-content" >
                  
                </div>
              </div>
              <div id="div_title" class="text-center">
                  <a class="portfolio-link" href="${path }/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=all" style="text-decoration:none !important">
                    <!-- 나의여행일정 수 -->
                    <span id="text_myTripSchedule">나의 여행일정 (${myScheduleNum })</span>
                  </a>
              </div>
            
            
            	<c:if test="${fn:length(myScheduleList)==0}">
            		<div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noMyScheduleList.PNG" alt="" width="100%" height="196px">
		                
		            </div>
		            
		            <div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noMyScheduleList.PNG" alt="" width="100%" height="196px">
		            </div>
            	</c:if>
            	
            	<c:if test="${fn:length(myScheduleList)==1}">
            		<c:forEach items="${myScheduleList }" var="msl">
            			<a class="portfolio-link" href="${path }/schedule/scheduleView?scheduleNo=${msl.SCHEDULENO }&userId=${userLoggedIn.userId}" style="text-decoration:none !important">
			              <div class="portfolio-hover mt-3 ">
			                <div class="portfolio-hover-content">
			                  
			                </div>
			              </div>
			              <div id="card_line" style="height: auto;" >
			                  <img src="${path }/resources/upload/spot/thumbnail/${msl.THUMBNAIL}" alt="" width="100%" height="130px">
			                  
			                  <!--여행일정의 제목, 끝날짜-시작날짜(몇박며칠), 누구와함께?, 성향-->
			                  <fmt:parseDate value="${msl.STARTDATE }" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${msl.ENDDATE }" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
			
			                  <p id="p_title" class="p-2">${msl.TITLE }<br> <span id="span_info"> ${endDate - strDate }박${endDate - strDate +1}일ㅣ${msl.PARTYNAME}ㅣ${msl.TRAVELTHEME}</span></p>
			                
			              </div>
			            </a>
            		</c:forEach>
		            
		            <div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noMyScheduleList.PNG" alt="" width="100%" height="196px">
		            </div>
            	</c:if>
            	
            	<c:if test="${fn:length(myScheduleList)==2}">
            		<c:forEach items="${myScheduleList }" var="msl">
            			<a class="portfolio-link" href="${path }/schedule/scheduleView?scheduleNo=${msl.SCHEDULENO }&userId=${userLoggedIn.userId}" style="text-decoration:none !important">
			              <div class="portfolio-hover mt-3 ">
			                <div class="portfolio-hover-content">
			                  
			                </div>
			              </div>
			              <div id="card_line" style="height: auto;" >
			                  <img src="${path }/resources/upload/spot/thumbnail/${msl.THUMBNAIL}" alt="" width="100%" height="130px">
			                  <!--여행일정의 제목, 끝날짜-시작날짜(몇박며칠), 누구와함께?, 성향-->
			                  <fmt:parseDate value="${msl.STARTDATE }" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${msl.ENDDATE }" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
			
			                  <p id="p_title" class="p-2">${msl.TITLE }<br> <span id="span_info"> ${endDate - strDate }박${endDate - strDate +1}일ㅣ${msl.PARTYNAME}ㅣ${msl.TRAVELTHEME}</span></p>
			                
			              </div>
			            </a>
            		</c:forEach>
            	</c:if>
            	
           

              
              <div class="portfolio-hover mt-3" >
                <div class="portfolio-hover-content">
                  
                </div>
              </div>

              <div id="card_line" style=" border: 1px solid #ef8321; text-align: center;" >
                  <a class="portfolio-link" href="${path }/mySchedule/myScheduleList.do?userId=${userLoggedIn.userId}&sort=all" style="text-decoration:none !important">
                    <br><br>
                <p id="more_title" class="mt-1">나의 여행일정 더보기</p><br>
                <!-- 나의여행일정수 - 2 -->
                <p id="more_num">+<c:if test="${myScheduleNum-2 <=0 }">0</c:if><c:if test="${myScheduleNum-2 >=1 }">${myScheduleNum-2}</c:if></p>
                  </a>
              </div>
          </div>
          
          <!--찜한여행일정 줄-->
          <div class="col-md-3 col-sm-6 portfolio-item mt-5">
            
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  
                </div>
              </div>
              <div id="div_title" class="text-center">
                  <a class="portfolio-link" href="${path }/mySchedule/putScheduleList.do?userId=${userLoggedIn.userId}" style="text-decoration:none !important">
                    <!--찜한 여행일정 수 -->
                    <span id="text_myTripSchedule">찜한 여행일정 (${putScheduleNum})</span>
                    
                  </a>
              </div>
              
              
              <c:if test="${fn:length(putScheduleList)==0}">
            		<div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noPutScheduleList.PNG" alt="" width="100%" height="196px">
		                
		            </div>
		            
		            <div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noPutScheduleList.PNG" alt="" width="100%" height="196px">
		            </div>
            	</c:if>
            	
            	
            	<c:if test="${fn:length(putScheduleList)==1}">
            		<c:forEach items="${putScheduleList }" var="psl">
            			<a class="portfolio-link" href="${path }/schedule/scheduleView?scheduleNo=${psl.SCHEDULENO }&userId=${userLoggedIn.userId}" style="text-decoration:none !important">
			              <div class="portfolio-hover mt-3 ">
			                <div class="portfolio-hover-content">
			                  
			                </div>
			              </div>
			              <div id="card_line" style="height: auto;" >
			                  <img src="${path }/resources/upload/spot/thumbnail/${psl.THUMBNAIL}" alt="" width="100%" height="130px">
			                  <!--여행일정의 제목, 끝날짜-시작날짜(몇박며칠), 누구와함께?, 성향-->
			                  <fmt:parseDate value="${psl.STARTDATE }" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${psl.ENDDATE }" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
			
			                  <p id="p_title" class="p-2">${psl.TITLE }<br> <span id="span_info"> ${endDate - strDate }박${endDate - strDate +1}일ㅣ${psl.PARTYNAME}ㅣ${psl.TRAVELTHEME}</span></p>
			                
			              </div>
			            </a>
            		</c:forEach>
		            
		            <div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noPutScheduleList.PNG" alt="" width="100%" height="196px">
		            </div>
            	</c:if>
            	
            	<c:if test="${fn:length(putScheduleList)==2}">
            		<c:forEach items="${putScheduleList }" var="psl">
            			<a class="portfolio-link" href="${path }/schedule/scheduleView?scheduleNo=${psl.SCHEDULENO }&userId=${userLoggedIn.userId}" style="text-decoration:none !important">
			              <div class="portfolio-hover mt-3 ">
			                <div class="portfolio-hover-content">
			                  
			                </div>
			              </div>
			              <div id="card_line" style="height: auto;" >
			                  <img src="${path }/resources/upload/spot/thumbnail/${psl.THUMBNAIL}" alt="" width="100%" height="130px">
			                  <!--여행일정의 제목, 끝날짜-시작날짜(몇박며칠), 누구와함께?, 성향-->
			                  <fmt:parseDate value="${psl.STARTDATE }" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${psl.ENDDATE }" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
			
			                  <p id="p_title" class="p-2">${psl.TITLE }<br> <span id="span_info"> ${endDate - strDate }박${endDate - strDate +1}일ㅣ${psl.PARTYNAME}ㅣ${psl.TRAVELTHEME}</span></p>
			                
			              </div>
			            </a>
            		</c:forEach>
            	</c:if>
              
              
            
                
                    <div class="portfolio-hover mt-3">
                      <div class="portfolio-hover-content">
                        
                      </div>
                    </div>
                    <div id="card_line" style=" border: 1px solid #ef8321; text-align: center;" >
                        <a class="portfolio-link" href="${path }/mySchedule/putScheduleList.do?userId=${userLoggedIn.userId}" style="text-decoration:none !important">
                          <br><br>
                      <p id="more_title" class="mt-1">찜한 여행일정 더보기</p><br>
                      <!-- 찜한여행일정수 - 2 -->
                      <p id="more_num">+<c:if test="${putScheduleNum-2 <=0 }">0</c:if><c:if test="${putScheduleNum-2 >=1 }">${putScheduleNum-2}</c:if></p>
                        </a>
                    </div>

            
          </div>
          <div class="col-md-3 col-sm-6 portfolio-item mt-5">
            
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  
                </div>
              </div>
              <div id="div_title" class="text-center">
                  <a class="portfolio-link" href="${path }/mySchedule/putPlaceList.do?userId=${userLoggedIn.userId}" style="text-decoration:none !important">
                    <span id="text_myTripSchedule">찜한 여행지 (${putPlaceNum })</span>
                  </a>
              </div>
              
              
              
              <c:if test="${fn:length(putPlaceList)==0}">
            		<div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noPutPlaceList.PNG" alt="" width="100%" height="196px">
		                
		            </div>
		            
		            <div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noPutPlaceList.PNG" alt="" width="100%" height="196px">
		            </div>
            	</c:if>
            	
            	
            	<c:if test="${fn:length(putPlaceList)==1}">
            		<c:forEach items="${putPlaceList }" var="ppl">
            			<a class="portfolio-link" href="${path }/spot/spotViewLogin.do?spotno=${ppl.placeno}&userid=${userLoggedin.userId}" style="text-decoration:none !important">
				              <div class="portfolio-hover mt-3">
				                <div class="portfolio-hover-content">
				                  
				                </div>
				              </div>
				              <div id="card_line" style="height: auto;">
				              
				                  <img src="${path }/resources/upload/spot/thumbnail/${ppl.THUMBNAIL}" alt="" width="100%" height="130px">
				                  <span id="where" class="p-2"><c:if test="${ppl.MAJORCATEGORY=='관광지'}">관광지</c:if><c:if test="${ppl.MAJORCATEGORY=='숙박'}">숙박</c:if><c:if test="${ppl.MAJORCATEGORY=='음식점'}">음식점</c:if></span>
				                  <!--관광지 제목,장소??(관광지리스트확인)-->
				                  <p id="p_title" class="p-2">${ppl.TITLE }<br> <span id="span_info" >${ppl.AREA }</span></p>
				                  
				              </div>
				          </a>
            		</c:forEach>
		            
		            <div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noPutPlaceList.PNG" alt="" width="100%" height="196px">
		            </div>
            	</c:if>
            	
            	
            	<c:if test="${fn:length(putPlaceList)==2}">
            		<c:forEach items="${putPlaceList }" var="ppl">
            			
            			<a class="portfolio-link" href="${path }/spot/spotView.do?spotno=${ppl.PLACENO}" style="text-decoration:none !important">
				              <div class="portfolio-hover mt-3">
				                <div class="portfolio-hover-content">
				                  
				                </div>
				              </div>
				              <div id="card_line" style="height: auto;">
				              
				                  <img src="${path }/resources/upload/spot/thumbnail/${ppl.THUMBNAIL}" alt="" width="100%" height="130px">
				                  
				                  <!--관광지 제목,장소??(관광지리스트확인)-->
				                  <p id="p_title" class="p-2">${ppl.TITLE }<br> <span id="span_info" >${ppl.AREA }</span></p>
				                  
				              </div>
				          </a>
				        
            		</c:forEach>
            	</c:if>
              
              
             
                
                    <div class="portfolio-hover mt-3">
                      <div class="portfolio-hover-content">
                        
                      </div>
                    </div>
                    <div id="card_line" style=" border: 1px solid #ef8321; text-align: center;" >
                        <a class="portfolio-link" href="${path }/mySchedule/putPlaceList.do?userId=${userLoggedIn.userId}" style="text-decoration:none !important">
                          <br><br>
                      <p id="more_title" class="mt-1">찜한 여행지 더보기</p><br>
                      <!-- 나의여행일정수 - 2 -->
                      <p id="more_num">+<c:if test="${putPlaceNum-2 <=0 }">0</c:if><c:if test="${putPlaceNum-2 >=1 }">${putPlaceNum-2}</c:if></p>
                        </a>
                    </div>

            
          </div>

          <div class="col-md-3 col-sm-6 portfolio-item mt-5">
              
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content">
                    
                  </div>
                </div>
                <div id="div_title" class="text-center">
                    <a class="portfolio-link" href="${path }/mySchedule/myScheduleReportList.do?userId=${userLoggedIn.userId}" style="text-decoration:none !important">
                      <span id="text_myTripSchedule">나의 여행후기 (${myScheduleReportNum })</span>
                    </a>
                </div>
                
                
                <c:if test="${fn:length(myScheduleReportList)==0}">
            		<div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noMyScheduleReportList.PNG" alt="" width="100%" height="196px">
		                
		            </div>
		            
		            <div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noMyScheduleReportList.PNG" alt="" width="100%" height="196px">
		            </div>
            	</c:if>
            	
            	
            	<c:if test="${fn:length(myScheduleReportList)==1}">
            		<c:forEach items="${myScheduleReportList }" var="msrl">
            			<a class="portfolio-link" href="${path }/schedule/scheduleView?scheduleNo=${msrl.SCHEDULENO }&userId=${userLoggedIn.userId}" style="text-decoration:none !important">
			              <div class="portfolio-hover mt-3">
			                <div class="portfolio-hover-content">
			                  
			                </div>
			              </div>
			              <div id="card_line" style="height: auto;">
			              
			                  <img src="${path }/resources/upload/spot/thumbnail/${msrl.THUMBNAIL}" alt="" width="100%" height="130px">
			                  <!--여행일정의 제목, 끝날짜-시작날짜(몇박며칠), 누구와함께?, 성향-->
			                  <fmt:parseDate value="${msrl.STARTDATE }" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${msrl.ENDDATE }" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
			
			                  <p id="p_title" class="p-2">${msrl.SPTITLE }<br> <span id="span_info"> ${endDate - strDate }박${endDate - strDate +1}일ㅣ${msrl.PARTYNAME}ㅣ${msrl.TRAVELTHEME}</span></p>
			                  
			              </div>
			            </a>
            		</c:forEach>
            		
            	
            		<div class="portfolio-hover mt-3">
		                <div class="portfolio-hover-content">
		                  
		                </div>
		              </div>
		              <div id="card_line_noshadow" style="height: auto;">
		            
		                <img src="${path }/resources/upload/profile/noMyScheduleReportList.PNG" alt="" width="100%" height="196px">
		            </div>
            	</c:if>
            	
            	
            	<c:if test="${fn:length(myScheduleReportList)==2}">
            		<c:forEach items="${myScheduleReportList }" var="msrl">
            			<a class="portfolio-link" href="${path }/schedule/scheduleView?scheduleNo=${msrl.SCHEDULENO }&userId=${userLoggedIn.userId}" style="text-decoration:none !important">
			              <div class="portfolio-hover mt-3">
			                <div class="portfolio-hover-content">
			                  
			                </div>
			              </div>
			              <div id="card_line" style="height: auto;">
			              
			                  <img src="${path }/resources/upload/spot/thumbnail/${msrl.THUMBNAIL}" alt="" width="100%" height="130px">
			                  <!--여행일정의 제목, 끝날짜-시작날짜(몇박며칠), 누구와함께?, 성향-->
			                  <fmt:parseDate value="${msrl.STARTDATE }" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${msrl.ENDDATE }" var="endPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
			
			                  <p id="p_title" class="p-2">${msrl.SPTITLE }<br> <span id="span_info"> ${endDate - strDate }박${endDate - strDate +1}일ㅣ${msrl.PARTYNAME}ㅣ${msrl.TRAVELTHEME}</span></p>
			                  
			              </div>
			            </a>
            		</c:forEach>
            	</c:if>
                
                
 

                      <div class="portfolio-hover mt-3">
                        <div class="portfolio-hover-content">
                          
                        </div>
                      </div>
                      <div id="card_line" style=" border: 1px solid #ef8321; text-align: center;" >
                          <a class="portfolio-link" href="${path }/mySchedule/myScheduleReportList.do?userId=${userLoggedIn.userId}" style="text-decoration:none !important">
                            <br><br>
                        <p id="more_title" class="mt-1">나의 여행후기 더보기</p><br>
                        <!-- 나의여행일정수 - 2 -->
                        <p id="more_num">+<c:if test="${myScheduleReportNum-2 <=0 }">0</c:if><c:if test="${myScheduleReportNum-2 >=1 }">${myScheduleReportNum-2}</c:if></p>
                          </a>
                      </div>
  
              
            </div>
          
        </div>
      </div>
    </div>
    <div class="mb-5"></div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>