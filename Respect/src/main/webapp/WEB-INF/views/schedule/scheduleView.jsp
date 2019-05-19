<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

   
 <style>

  	.hidetext
        {
                display: none;
        }
        
    .user_name{
    font-size:14px;
    font-weight: bold;
}
.comments-list .media{
    border-bottom: 1px dotted #ccc;
}

    #map{
        
        margin-left: 3%;
        margin-right: 3%;
    }
  

@media screen and (max-width: 768px) {
    body {
        background-color: lightgreen;
    }
}
@media screen and (min-width: 769px) {
   /* 데스크탑에서 사용될 스타일을 여기에 작성합니다. */
}

    .time1{width:20%;}
        .time2{width:80%;}
        .timeline th{background:black; color:orange;}
        .timeline{text-align: center; width:100%}
        .timeline tr{height:50px;}
        .time2 button{color:orange; background:black;}
        .schedule_width{overflow: hidden; width:100%;}
        #timeline-wrap{position: relative; overflow: hidden; width:100%; }
        .day a{text-decoration: none; color:orange;}
</style>

<!-- 지도 라이브러리  -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f&libraries=services"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script>


function fn_updateReport(scheduleNo)
{
	location.href="${path}/schedule/updateReport?scheduleNo="+scheduleNo;
}

function fn_deleteReport(scheduleNo)
{
	if(confirm("정말 삭제하시겠습니까?"))
	{
		location.href="${path}/schedule/deleteReport?scheduleNo="+scheduleNo;
	}
}
 
 function fn_toggle(ev)
 {
    var btnId=ev.target.value;
    console.log(btnId);
    $("#content"+btnId).toggle();
 }
 

$(function(){
    var writeFlag = 0;
    $('.btn-replyDelte').on('click',function(){
       var flag = confirm("정말로 삭제 하시겠습니까?");
       if(flag==false){
            return;
          }
       var num = $(this).val();
        replyDelete.replyNo.value=num;
        var url="${path}/scheduleReply/scheduleReplyDelete.do";
        replyDelete.action=url
        replyDelete.method="post";
        replyDelete.submit();
    });
    //답글의반응
    $('.btn-replyWrite').on('click',function(){
       <c:choose>
          <c:when test="${userLoggedIn eq null }">
             alert("로그인후 이용해주세요.");
           </c:when>
           <c:otherwise>
              if(writeFlag == 1){
                  $('.replyWriteForm').remove();
                  writeFlag=0;
                  return;
              }
              
              
              var form=$("<form action='${path}/scheduleReply/scheduleReplyWrite2.do' method='post' class='replyWriteForm'></form>");//<form>요소를 만듬!
              var html="<div class='row form-group pl-5 '>";
              html+= "<textarea rows='3' name='content' style='resize: none; width: 85%' class='mr-3' required></textarea>";
              html+= "<input type='hidden' name='scheduleNo' value='${viewList.SCHEDULENO }'/>";
              html+= "<input type='hidden' name='userId' value='${userLoggedIn.userId }'/>";
              html+= "<input type='hidden' name='scheduleReplyLevel' value='2'/>";
              html+= "<input type='hidden' name='replyRef' value='"+$(this).val()+"'/>";
              html+="<button type='submit' class='btn pull-right' style='width: 70px; background:#f19221;'>등록</button>"
              form.html(html);
              form.insertAfter($(this).parent().parent());
              writeFlag = 1
           
           </c:otherwise>

        </c:choose>
    });
    
    $('.btn-replyGood').on('click',function(){
       <c:choose>
          <c:when test="${userLoggedIn eq null }">
             alert("로그인후 이용해주세요.");
           </c:when>
           <c:otherwise>
              var num = $(this).val();
              replyGood.replyNo.value=num;
               var url="${path}/scheduleReply/scheduleReplyGood.do";
              replyGood.action=url
              replyGood.method="post";
              replyGood.submit();
          </c:otherwise>

        </c:choose>
    });
    
    /* $('.btn_replySee').on('click',function(a){
       alert(a);
        if($(".replySee("+a+")").css('display')=="none"){
           $(".replySee("+a+")").css('display','inline');
        }else{
           $(".replySee("+a+")").css('display','none');
        }
    }); */
    $('#btn_fileSee').on('click',function(){
        if($('#fileSee').css('display')=="none"){ 
            $('#fileSee').css('display','inline');
        }else{
            $('#fileSee').css('display','none');
        }

    });
    
    $('.pop').on('click', function() {
     $('.imagepreview').attr('src', $(this).find('img').attr('src'));
     $('#imagemodal').modal('show');   
  });   


});

function loginCheck(){
   <c:if test="${userLoggedIn == null }">
      alert('로그인후 등록이 가능합니다.');
       location.href="${path}/user/userLogin.do";
    </c:if>
}

function btn_replySee(a){

   if($(".replySee"+a).css('display')=="none"){
       $(".replySee"+a).css('display','inline');
    }else{
       $(".replySee"+a).css('display','none');
    }
}




	function fn_update(scheduleNo)
	{
		location.href="${path }/schedule/updateSchedule?scheduleNo="+scheduleNo;
	}
	
	function fn_delete(scheduleNo)
	{
		if(confirm("정말 삭제하시겠습니까?"))
		{
			location.href="${path}/schedule/deleteSchedule?scheduleNo="+scheduleNo;
		}
	}

	function fn_review(scheduleNo)
	{
		
		location.href="${path}/schedule/scheduleReport?scheduleNo="+scheduleNo;
	}

	function fn_like()
	{
		var scheduleNo = ${viewList.SCHEDULENO};
		var userId = '${userLoggedIn.userId}';
		var scheduleID= '${viewList.USERID}';
		if(userId==scheduleID)
	      {
	         alert("본인의 게시물은 좋아요를 누를 수 없습니다.");
	         return;         
	      }
		

		<c:if test="${userLoggedIn == null }">
			alert("로그인후 이용 가능합니다.");
			location.href="${path}/user/userLogin.do";
		</c:if>
		if (${userLoggedIn != null}){
			
			$.ajax({
				url:"<%=request.getContextPath()%>/schedule/goodCountUpdate",
				type:"POST",
				data:{scheduleNo:scheduleNo,userId:userId},
				success:function(data)
				{
					$(".btn-like").html(data);
				}
			});
		}
		
	}
	function fn_put(scheduleNo)
	{
		$.ajax({
			url:"${path}/schedule/bringSchedule",
			type:"POST",
			data:{scheduleNo:scheduleNo},
			success:function(data)
			{
				alert(data);
			}
		});
		
	}
	
	function fn_zzim()
	{
		var scheduleNo = ${viewList.SCHEDULENO};
		var userId = '${userLoggedIn.userId}';
		var scheduleID= '${viewList.USERID}';
		if(userId==scheduleID)
	      {
	         alert("본인의 게시물은 찜할수 없습니다.");
	         return;         
	      }
		<c:if test="${userLoggedIn == null }">
			alert("로그인후 이용 가능합니다.");
			location.href="${path}/user/userLogin.do";
		</c:if>
		if (${userLoggedIn != null}){
			
			$.ajax({
				url:"<%=request.getContextPath()%>/schedule/bringCountUpdate",
				type:"POST",
				data:{scheduleNo:scheduleNo,userId:userId},
				success:function(data)
				{
					$(".btn-jjim").html(data);
				}
			});
		}
		
	};
		
		
	

</script>
<body>
    <div class="container">
            <div class="row">
                    <h2 class="pt-4 ml-2">${viewList.TITLE}</h2>
                    <div class='row ml-5' style="margin-top:35px;">
                        <h6>조회</h6><h6 class="ml-2" style="color:#f19221;">${viewList.HITSCOUNT }</h6>
                        &nbsp;&nbsp;
                        <h6>|</h6>
                        &nbsp;&nbsp;
                        <h6 onclick="fn_zzim()" style="cursor:pointer">찜하기</h6>
                        <c:choose>
	                        <c:when test="${userLoggedIn eq null }">
	              
		                        <div class="btn-jjim" >
		                        	<h6 class="ml-2" style="color:rgb(208, 203, 203);">${viewList.BRINGCOUNT }</h6>
		                        </div>
	                        </c:when>
	                        <c:when test="${userLoggedIn ne null || userLoggedIn != '' }">
	                        	<c:if test="${bringCheck ==0 }">
	                        		<div class="btn-jjim" >
										<h6 class="ml-2" style="color:rgb(208, 203, 203);">${viewList.BRINGCOUNT }</h6>
									</div>               	
	                        	</c:if>
	                        	<c:if test="${bringCheck >0 }">
	                        		<div class="btn-jjim" >
										<h6 class="ml-2" style="color:#f19221;">${viewList.BRINGCOUNT }</h6>
									</div>                 	
	                        	</c:if>
	                        </c:when>
                        </c:choose>
                        &nbsp;&nbsp;
                        <h6>|</h6>
                        &nbsp;&nbsp;
                        <h6 onclick="fn_like()" style="cursor:pointer">좋아요</h6>
                        <c:choose>
	                        <c:when test="${userLoggedIn eq null }">
	              
		                        <div class="btn-like" >
		                        	<h6 class="ml-2" style="color:rgb(208, 203, 203);">${viewList.GOODCOUNT }</h6>
		                        </div>
	                        </c:when>
	                        <c:when test="${userLoggedIn ne null || userLoggedIn != '' }">
	                        	<c:if test="${goodCheck ==0 }">
	                        		<div class="btn-like" >
										<h6 class="ml-2" style="color:rgb(208, 203, 203);">${viewList.GOODCOUNT }</h6>
									</div>               	
	                        	</c:if>
	                        	<c:if test="${goodCheck >0 }">
	                        		<div class="btn-like" >
										<h6 class="ml-2" style="color:#f19221;">${viewList.GOODCOUNT }</h6>
									</div>                 	
	                        	</c:if>
	                        </c:when>
                        </c:choose>
                    </div>
             </div> 
            <div class="row">
                <!-- side bar -->
                <div class="col-md-3 mt-4 ml-1" style="border:solid 1px rgb(208, 203, 203); height:100%" align='center'>
                    <br>          
                        <h4>${viewList.NICKNAME}의 여행일정</h4>
                        <hr>
                        <div class="row justify-content-center">
                            <h6>제목</h6>
                            <h6 style="color:rgb(174, 166, 166);" class="ml-4">${viewList.TITLE }</h6>
                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <h6>기간</h6>
                            <h6 style="color:rgb(174, 166, 166);" class="ml-4">${viewList.STARTDATE1 }</h6>&nbsp;<h6 style="color:rgb(174, 166, 166);">~</h6> &nbsp;<h6 style="color:rgb(174, 166, 166);">${viewList.ENDDATE1 }</h6>
                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <h6>인원</h6><h6 class="ml-4" style="color:rgb(174, 166, 166);">${viewList.PEOPLENUM}명</h6>
                            <h6 class="ml-5">일행</h6><h6 class="ml-4" style="color:rgb(174, 166, 166);">${viewList.PARTYNAME}</h6> 
                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <h6>여행 구분</h6>
                            <h6 style="color:rgb(174, 166, 166);" class="ml-4">${viewList.TRAVELTHEME}</h6>
                        </div>
                        <br>
                        <div align='center'class='row justify-content-center'>
                            <c:if test="${userLoggedIn != null and viewList.USERID == userLoggedIn.userId}">
	                             <input class="btn btn-outline-warning btn-sm mr-1" type="button" value="일정 수정" onclick="fn_update(${viewList.SCHEDULENO})">
	                             <input class="btn btn-outline-warning btn-sm " type="button" value="일정 삭제" onclick="fn_delete(${viewList.SCHEDULENO})">
	                             <c:if test="${viewList.REPORTFLAG==0 }">
	                           	 <input class="btn btn-outline-warning btn-sm ml-1" type="button" value="후기 등록" onclick="fn_review(${viewList.SCHEDULENO})">
	                           	 </c:if>
                            </c:if>
                            <c:if test="${userLoggedIn != null and viewList.USERID != userLoggedIn.userId}">
                            <input class="btn btn-outline-warning" type="button" value="내일정으로 만들기" onclick="fn_put(${viewList.SCHEDULENO});">
                            </c:if>
                        </div>
                        <br>
                    </div>
                    <br>
                    <!-- 사이드바 끝  -->
                    
                       <div class="pl-0 col-md-8" >
                            <div class="mt-4" id="map"  style="width:98%; height:352px; border-radius:0;"></div> 
                            </div>
                        </div>
                           	<p id="timetableList"></p>
                           	 <div class="col-md-12 mt-4" align='center'>
            		    <ul class="nav nav-tabs row justify-content-center"  id="myTab">
			                        <li class="nav-item">
			                                <a  class="nav-link active" data-toggle="tab" href="#timeTableTab">타임테이블</a>
			                        </li>
			                        <li class="nav-item">
			                                <a  class="nav-link" data-toggle="tab" href="#Review">여행후기 </a>
			                        </li>
			             			   </ul>
           			   <div class="tab-content">
					   <div class="row tab-pane active" id="timeTableTab">
              			<fmt:parseDate value="${viewList.STARTDATE }" var="startDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="startDay"></fmt:parseNumber>
						<fmt:parseDate value="${viewList.ENDDATE }" var="endDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDay"></fmt:parseNumber>
                        <!-- 타임테이블 -->
                        <div id='demo' class='carousel slide mt-3' data-ride='carousel' data-interval='false'>
                            <!-- The slideshow -->
                            
        				    
                            <div class="carousel-inner">
                            <c:forEach var="v" begin='1' end='${endDay - startDay +1}' varStatus="s">
	                            <c:choose>
	                              <c:when test="${s.index==1}">
	                              	<div class="carousel-item active">
	                              	<div class="day">
                                            <table class="table-bordered timeline" id='${s.count }'>
                                                    <tr>
                                                        <th class="time1">TIME</th>
                                                        <th class="place">
                                                                <a class='float-left' onclick='fn_move()' href='#demo'  data-slide='prev'>&lt;</a>
                                                                DAY ${s.count }
                                                                <a class='float-right' onclick='fn_move()' href='#demo'  data-slide='next'>&gt;</a>
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                    		<td class='time1'>06:00</td>
                                                    		<td id='6'></td>
                                                            
                                                    </tr>
                                                    <tr>
                                                           <td class='time1'>07:00</td>
                                                    		<td id='7'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>08:00</td>
                                                    		<td id='8'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>09:00</td>
                                                    		<td id='9'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>10:00</td>
                                                    		<td id='10'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>11:00</td>
                                                    		<td id='11'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>12:00</td>
                                                    		<td id='12'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>13:00</td>
                                                    		<td id='13'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>14:00</td>
                                                    		<td id='14'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>15:00</td>
                                                    		<td id='15'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>16:00</td>
                                                    		<td id='16'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>17:00</td>
                                                    		<td id='17'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>18:00</td>
                                                    		<td id='18'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>19:00</td>
                                                    		<td id='19'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>20:00</td>
                                                    		<td id='20'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>21:00</td>
                                                    		<td id='21'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>22:00</td>
                                                    		<td id='22'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>23:00</td>
                                                    		<td id='23'></td>
                                                    </tr>
                                            
                                            </table>
                                    </div>
                                    </div>
	                              </c:when>
	                              	<c:otherwise>
	                              		<div class="carousel-item">
	                              		<div class="day">
                                            <table class="table-bordered timeline" id='${s.count }'>
                                                    <tr>
                                                        <th class="time1">TIME</th>
                                                        <th class="place">
                                                                <a class='float-left' onclick='fn_move()' href='#demo'  data-slide='prev'>&lt;</a>
                                                                DAY ${s.count }
                                                                <a class='float-right' onclick='fn_move()' href='#demo'  data-slide='next'>&gt;</a>
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                    		<td class='time1'>06:00</td>
                                                    		<td id='6' class='place'></td>
                                                            
                                                    </tr>
                                                    <tr>
                                                           <td class='time1'>07:00</td>
                                                    		<td id='7' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>08:00</td>
                                                    		<td id='8' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>09:00</td>
                                                    		<td id='9' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>10:00</td>
                                                    		<td id='10' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>11:00</td>
                                                    		<td id='11' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>12:00</td>
                                                    		<td id='12' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>13:00</td>
                                                    		<td id='13' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>14:00</td>
                                                    		<td id='14' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>15:00</td>
                                                    		<td id='15' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>16:00</td>
                                                    		<td id='16' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>17:00</td>
                                                    		<td id='17' class='place' ></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>18:00</td>
                                                    		<td id='18' class='place'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>19:00</td>
                                                    		<td id='19' class='place' ></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>20:00</td>
                                                    		<td id='20' class='place' ></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>21:00</td>
                                                    		<td id='21' class='place' ></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>22:00</td>
                                                    		<td id='22' class='place' ></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>23:00</td>
                                                    		<td id='23' class='place'></td>
                                                    </tr>
                                            
                                            </table>
                                    </div>
                                    </div>
	                              	</c:otherwise>
	                              </c:choose>
                                    
                                   </c:forEach>
                              </div>
                             
                              
                             
                            </div>
                            </div>  
                            
                            

                            <div class="tabe-pane fade" id="Review">
                         
                        <br>  
                      <c:choose>
                      	<c:when test="${viewList.REPORTFLAG==0 }">
                      		<img src="${path }/resources/upload/profile/noScheduleReport.png" alt="" width="250px;"height="196px;">
                      	</c:when>
                      	<c:otherwise>
                      	<c:if test="${userLoggedIn != null and viewList.USERID == userLoggedIn.userId and viewList.REPORTFLAG==1}">
                      		<button type="button" class="btn-outline-warning btn mb-3 mr-3" onclick="fn_updateReport(${viewList.SCHEDULENO})">후기수정</button>
                      		<button type="button" class="btn-outline-warning btn mb-3" onclick="fn_deleteReport(${viewList.SCHEDULENO})">후기삭제</button>
                      		<br>
                      	</c:if>	
                      		<c:forEach items="${reportList }" var="sr" begin='0' end='${endDay - startDay +1}' varStatus="s">
	                    <button class="btn btn-outline-dark" value="${s.count }" onclick="fn_toggle(event)" style="width:200px;">${s.count }일차</button><br>
	                    <br>
	                    <div id="content${s.count }"  class="hidetext">
	                    <div class="container">
	                    <div class="justify-content-center" align='center'>
	                      <div class="col-md-8">
	                        <div>
	                                <h3>${sr.title }</h3>
	                                <div class="row">
	                                    <h6><i class="far fa-id-badge"></i>&nbsp;${sr.userId}</h6>
	                                    <h6 class="col col-lg-8" style="margin-top:2px; float:right;" align='right'><h6><i class="far fa-calendar-alt"></i>${sr.writeDate1 }</h6>  
	                                </div>
	                                <hr class="my-3">
	                                <div>
	                                    <h6>${sr.content }</h6>
	                                </div>
	                                
	                                <br>
	                                <br>
	                        </div>
	                                
	                     </div>
	                            </div>        
	                        </div>
	                    </div>
                    </c:forEach>
                      	
                      	
                      	</c:otherwise>
                      	
                      </c:choose>
                  
                   
                                       
               </div>
                       </div>     
                          </div>
  
                <br>
            </div>

            <div class="row justify-content-center" align='center'>
      		
      	</div>

          
         <br>
  
      	
      	<br>
      	<br>
      	<div class="container">
        <div class="row">
            <div class="col-md-11">
              <div class="page-header mb-3 mt-5" style="border-bottom: solid 1px black; height: 50px;">
                <button type="button" class="btn btn-outline-warning float-right"  style="background: #f19221;" data-toggle="modal" data-target="#replyWriteModal" onclick="return loginCheck()">댓글등록</button>
                <h4>이 일정에 대한 의견(<span style="color: #f19221">${fn:length(scheduleReplyList)}</span>)</h4>  
              </div> 
               <div class="mb-5">
              
                <c:forEach items="${scheduleReplyList}" var="reply" varStatus="b">
                    <div>
                   <c:if test="${reply.SCHEDULEREPLYLEVEL ==1 }">
                   <c:set var="a" value="${b.index }"/>
                    <!-- 댓글하나시작 -->
                        <div class="media mb-3 " style="border-bottom: rgb(228, 224, 224) solid 1px;">
                            <a class="media-left" href="#">
                               <img src="${path }/resources/upload/profile/${reply.PICTURE}" alt="위에꺼" width="70px;" height="70px;" class="rounded-circle mr-3">
                            </a>
                            <div class="media-body mb-3">
                                <span style="color: #1b1b1b; font-size: 17px;" class="mr-2">${reply.NICKNAME}</span>
                                <span style=" color: #959595; font-size: 16px;">${reply.WRITEDATE}</span>
                                <button type="button" class="btn float-right p-1 btn-outline-warning btn-replyGood" value="${reply.REPLYNO }" style="background: white; border: 1px solid #f19221;"><span style="font-size: 12px; color: #f19221;">추천 ${reply.GOODCOUNT }</span></button>
                                <br><br>
                                <span style="font-size: 14.5px;  color: #535353;">${reply.CONTENT }</span>                                   
                                <br>
                                <c:forEach items="${scheduleAttList }" var="att" >
                                     <c:if test="${att.REPLYNO==reply.REPLYNO }">
                                      <a class="pop"><img src="${path}/resources/upload/replyPicture/${att.RENAMED}" alt="" width="50px;" height="50px"></a>
                                     </c:if>
                                </c:forEach>
                                 <br>
                                <button type="button" class="btn btn-outline-warning mt-2 p-1  " onclick="btn_replySee(${a})" style="background: white; border: 1px solid #959595; "> <span style="font-size: 12px; color: #959595;">댓글${reply.REPLYCOUNT }</span> </button>
                                   
                                <button type="button" class="btn  btn-outline-warning mt-2 ml-2 p-1 btn-replyWrite" value="${reply.REPLYNO }"  style="background: white; border: 1px solid #959595;" > <span style="font-size: 12px; color: #959595;">댓글 쓰기</span> </button>
                          <c:if test="${userLoggedIn != '' || userLoggedIn ne null }">
                            <c:if test="${reply.USERID eq userLoggedIn.userId || userLoggedIn.userLevel==1 }">
                                      <button type="button" class="btn btn-outline-warning mt-2 ml-2 p-1 btn-replyDelte" value="${reply.REPLYNO }" style="background: white; border: solid 1px #ccc;"  > <span style="font-size: 12px; color: #959595;">삭제</span> </button>
                                   </c:if>
                                </c:if>
                            </div>
                       </div>
                   <!--댓글하나 끝-->
                   </c:if>
                     <c:if test="${reply.SCHEDULEREPLYLEVEL==2 }">
                              <!--답글 처움-->
                             <div style="display: none;" class="replySee${a}">
                                 <div class="media mb-3 " style="border-bottom: rgb(228, 224, 224) solid 1px;">
                                      <img src="${path }/resources/upload/replyPicture/ic_reply.png" alt="" style="position: relative; left: 40px">
                                      <a class="media-left" href="#">
                                          <img src="${path }/resources/upload/profile/${reply.PICTURE}" width="70px;" height="70px;" class="rounded-circle ml-5">
                                    </a>
                                     <div class="media-body ml-3 mb-3">
                                           <span style="color: #1b1b1b; font-size: 17px;" class="mr-2">${reply.NICKNAME}</span>
                                           <span style=" color: #959595; font-size: 16px;">${reply.WRITEDATE}</span>
                                           <button type="button" class="btn btn-outline-warning float-right p-1 btn-replyGood" value="${reply.REPLYNO }" style="background: white; border: 1px solid #f19221;"><span style="font-size: 12px; color: #f19221;">추천  ${reply.GOODCOUNT }</span></button>
                                           <br><br>
                                           <span style="font-size: 14.5px;  color: #535353;">${reply.CONTENT }</span>
                                       
                                           <br>
                                           <c:if test="${userLoggedIn != '' || userLoggedIn ne null }">
                                       <c:if test="${reply.USERID eq userLoggedIn.userId || userLoggedIn.userLevel==1 }">
                                                 <button type="button" class="btn  btn-outline-warning mt-2 ml-2 p-1 btn-replyDelte" value="${reply.REPLYNO }" style="background: white; border: solid 1px #ccc;"  > <span style="font-size: 12px; color: #959595;">삭제</span> </button>
                                              </c:if>
                                           </c:if>
                                       </div>
                                 </div>
                           
                            </div>
                              <!--답글 하나끝-->  
                          </c:if>
                   </div>
            </c:forEach>
               </div>                                             
            </div>
        </div>
    </div>

    <div class="modal fade" id="replyWriteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title " id="exampleModalLabel">댓글 쓰기</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                
                 <form action="${path}/scheduleReply/scheduleReplyWrite.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="scheduleNo" value="${viewList.SCHEDULENO }">
                    <input type="hidden" name="userId" value="${userLoggedIn.userId }">
                    <input type="hidden" name="scheduleReplyLevel" value="1">
                    <div class="card-body ">
                            
                              <div class="row">
                                <label class="col-md-2 col-form-label" style="font-weight: bold;">댓글</label>
                                <div class="col-md-10">
                                  <div class="form-group has-default bmd-form-group">
                                    <textarea name="content" class="form-control" required></textarea>
                             
                                  </div>
                                </div>
                              </div>
                              <button type="button" id="btn_fileSee" class="btn btn-outline-warning">파일첨부</button>
                              <div class="row" style="display: none" id="fileSee">
                                
                                <div class="col-md-12">
                                  <div class="form-group bmd-form-group">
                                        <div class="input-group mb-3" style="padding:0px;">
                                            <div class="input-group-prepend" style="padding:0px;">
                                                <span style="font-weight: bold;" class="align-middle mr-3">첨부파일1</span>
                                            </div>
                                            <input type="file" name="upFile" id="upFile1">
                                                
                                        </div>
                                        <div class="input-group mb-3" style="padding:0px;">
                                            <div class="input-group-prepend" style="padding:0px;">
                                                <span style="font-weight: bold;" class="align-middle mr-3">첨부파일2</span>
                                            </div>
                                            <input type="file" name="upFile" id="upFile2">  
                                        </div>
                                        <div class="input-group mb-3" style="padding:0px;">
                                            <div class="input-group-prepend" style="padding:0px;">
                                                <span style="font-weight: bold;" class="align-middle mr-3">첨부파일3</span>
                                            </div>
                                            <input type="file" name="upFile" id="upFile3">  
                                        </div>
                                        <div class="input-group mb-3" style="padding:0px;">
                                            <div class="input-group-prepend" style="padding:0px;">
                                                <span style="font-weight: bold;" class="align-middle mr-3">첨부파일4</span>
                                            </div>
                                            <input type="file" name="upFile" id="upFile4">  
                                        </div>
                                        <div class="input-group mb-3" style="padding:0px;">
                                            <div class="input-group-prepend" style="padding:0px;">
                                                <span style="font-weight: bold;" class="align-middle mr-3">첨부파일5</span>
                                            </div>
                                            <input type="file" name="upFile" id="upFile5">  
                                        </div>
                                  </div>
                                </div>
                              </div>
                              
                          </div>
                <div class="modal-footer">
                  <button type="submit" class="btn btn-outline-warning" >댓글 등록</button>
                  <button type="button" class="btn btn-outline-warning" data-dismiss="modal">취소</button>
                  
                  
                </div>
               </form>
              </div>
            </div>
          </div>
          <div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-dialog" data-dismiss="modal">
                 <div class="modal-content">              
                   <div class="modal-body">
                       <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                     <img src="" class="imagepreview" style="width: 100%;" >
                   </div> 
                  </div>
                </div>
           </div>
           
          <!-- 댓글삭제를 적용시키기 위한 폼 -->
        <form name="replyDelete">
          <input type="hidden" name="replyNo">
         <!--   리턴페이지 유지위해  -->
          <input type="hidden" name="scheduleNo" value="${viewList.SCHEDULENO }">
          <c:if test="${userLoggedIn != '' || userLoggedIn ne null }">
             <input type="hidden" name="userId" value="${userLoggedIn.userId }">
          </c:if>
    
        </form>
        
        <!-- 댓글추천 적용시키기 위한 폼 -->
        <form name="replyGood">
          <input type="hidden" name="replyNo">
         <!-- 리턴페이지 유지위해 -->
          <input type="hidden" name="scheduleNo" value="${viewList.SCHEDULENO }">
          <c:if test="${userLoggedIn != '' || userLoggedIn ne null }">
             <input type="hidden" name="userId" value="${userLoggedIn.userId }">
          </c:if>
        </form>
      	</div>
      </body>
      
      
  <script>
  

	
	var createSeq = function(){
		var no=0;
		return function(){
			return ++no;
		}
	};
	
	var seq= createSeq();
	var markers=[];
	
	var seq_num;
	var ps= new daum.maps.services.Geocoder();
	
	//지도상에 마커를 클릭하면 장소명을 표출할 인포윈도우
	var infowindow2=new daum.maps.InfoWindow({zIndex:1,removable:true});

	//지도를 담을 영역의 DOM (지도표기)
	var container = document.getElementById('map');
	var options = {//지도 옵션 설정
			center : new daum.maps.LatLng(33.361425, 126.529418),//지도 중심좌표
			level:10
	};
	var map= new daum.maps.Map(container, options);
	var tableday;
	var placename;
	

	
	function fn_move()
	{
    	
    	var origin=$("div[class='carousel-item active'] table[class='table-bordered timeline']");
    	console.log(origin);
		if(markers!=null)
		{
			for(var i=0; i<markers.length;i++)
			{
				if(markers[i]!=null)
				{
					if(markers[i].days==origin[0].id)
					{
						markers[i].marks.setVisible(false);
						
						markers[i].iw.close();
					}
				}
				
			}
		}
		
		
		
		setTimeout(function(){
			
			var active=($("div[class='carousel-item active'] table[class='table-bordered timeline']"));
			if(markers!=null)
			{
				for(var i=0; i<markers.length;i++)
				{
					if(markers[i]!=null)
					{
						if(markers[i].days==active[0].id)
						{
							markers[i].marks.setVisible(true);
						}
					}
				}
			}

			
			
		},1000)
	}

	
	 
		
		
		
		
		


	
	   var list=${tt};
	   var dataList=[];
	   
	   var idx=0;
		for(var i=0; i<list.length;i++)
		{
			console.log(list[i]);
			var pplaceno=list[i].PLACENO;
			var pday=list[i].DAY;
			var ptime=list[i].TIME;
			var ptitle=list[i].TITLE;
			var paddress=list[i].ADDRESS;
			var pseq_no=seq();
		  	
		  	var html="<div id='data"+pseq_no+"' >"+ptitle+"<input type='hidden' name='timevalue' value='"+pday+","+ptime+"'><input type='hidden' name='placevalue' value='"+pplaceno+","+ptitle+","+paddress+","+pseq_no+"' class='placelist'></div>";

		    var tables=$("table[class='table-bordered timeline']");
		    var pdata={pseq_no:pseq_no,ptitle:ptitle,paddress:paddress,pday:pday,idx:i};
		    
		    dataList.push(pdata);
		  
		    for(var k=0; k<tables.length;k++)
	    	{
				if(tables[k].id==pday)
				{
					
					var targettd=$("table[id='"+pday+"'] td[id='"+ptime+"']");
					
					targettd.attr('class',"place disable");
					targettd.append(html);
				}
	    	}
		    ps.addressSearch(dataList[i].paddress,function(data,status)
  		{
		    	if(status === daum.maps.services.Status.OK)
				{
					
					
					for(var b=0; b<data.length; b++)
					{
						
						makeMarker(data[b]);
					} 
					
				}
			}); 		
		}
		
		function makeMarker(data)
		{
			var marker = new daum.maps.Marker({
				map:map,
				position:new daum.maps.LatLng(data.y, data.x),
				clickable: true 
			});
			
			
			
		    iwRemoveable = true;
		    
		    var infowindow = new daum.maps.InfoWindow({
		        removable:iwRemoveable
		    }); 
		    
			daum.maps.event.addListener(marker, 'click', function()
			{
				infowindow.open(map,marker);
			});
			
			
			var daymarker = {days:0,marks:marker,iw:infowindow,idx:idx++,data1:data};
			markers.push(daymarker);
			
		
			
				for(var bb=0;bb<markers.length;bb++)
				{
					for(var aaa=0;aaa<dataList.length;aaa++)
					{
						if(markers[bb].data1.address_name==dataList[aaa].paddress)
						{
							markers[bb].days=dataList[aaa].pday;
							markers[bb].marks.setTitle(dataList[aaa].pseq_no);
							markers[bb].iw.setContent('<div style="padding:5px; font-size:12px;">'+dataList[aaa].ptitle+'</div>');
						}
					}
					
					console.log(markers);
					if(markers[bb].days!=1)
					{
						
						markers[bb].marks.setVisible(false);		
					}
					
				}
		}
		
		
		
		
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>