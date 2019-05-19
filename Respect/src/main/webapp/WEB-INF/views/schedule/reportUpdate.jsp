<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>

@media screen and (min-width: 769px) {
   /* 데스크탑에서 사용될 스타일을 여기에 작성합니다. */
}
	#map
	{
		background:black;	
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
        
        .hidetext
        {
            display: none;
        }
        
     .contact-form{ margin-top:15px;}
     .contact-form .textarea{ min-height:220px; resize:none;}
     .form-control{ box-shadow:none; border-color:#eee; height:49px;}
     .form-control:focus{ box-shadow:none; border-color:#e15002;}
     
     .main-btn:hover{ background:#e15002;color:#fff;}
</style>

<!-- 지도 라이브러리  -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f&libraries=services"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="${path }/resources/js/summernote.js"></script>
<script src="${path }/resources/js/summernote.min.js"></script>
<script src="${path }/resources/js/summernote-ko-KR.js"></script>

<script>
$(document).ready(function() {
    $('.summernote').summernote({
    height : 400,                 // set editor height
    lang : 'ko-KR', // default: 'en-US'
		callbacks : {
			onImageUpload : function(files, editor, welEditable){
				sendFile(files, editor, welEditable);
			}
		}
    });
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
         $('.summernote').summernote('insertImage', "${path}/resources/uploadImg/"+data[i],data[i]);
      }
   },
   error:function(obj,a,b){
	   console.log(obj);
	   console.log(b);
   }
});
}

	
	function fn_reviewDelete(scheduleNo)
	{
		
	}
	
	function fn_updateEnd(scheduleNo)
	{
		
		  var titleflag=0;
		   var contentflag=0;
		   
		   	var title=$("input[name='reportTitle']");
		   	var content=$("textarea[name='reportContent']");
		   	
		   for(var i=0;i<title.length;i++)
		   {
			   if(title[i].value=="")
			   {
					alert((i+1)+"일차 제목을 입력하세요");
					return;
			   }
			   else
		   	   {
					titleflag=1;	   
			   }
			   
		   }
		   for(var j=0;j<content.length;j++)
		   {
			   if(content[j].value=="")
			   {
					alert((j+1)+"일차 내용을 입력하세요");
					return;
			   }
			   else
		   	   {
					contentflag=1;	   
			   }
			   
		   }
		   
		   if(titleflag==1&&contentflag==1)
		   {
			   $("#reportUpdate").submit();
		   }
		   else
		   {
			   return;
		   }
	}
     
     function fn_toggle(ev)
     {
    	ev.preventDefault();
        var btnId=ev.target.value;
        console.log(btnId);
        $("#content"+btnId).toggle();
     }
     

</script>

<body>
        <div class="container">
                <div class="col-md-12 mt-4" align='center'>
                        <ul class="nav nav-tabs row justify-content-center"  id="myTab">
                                <li class="nav-item">
                                        <a id="timeTable" class="nav-link active" data-toggle="tab" href="#timeTableTab">여행일정</a>
                                </li>
                                <li class="nav-item">
                                        <a id="sendMessage" class="nav-link" data-toggle="tab" href="#Review">여행후기 </a>
                                </li>
                        </ul>
            <div class="tab-content">
            <div class="row tab-pane active" id="timeTableTab">
                    <!-- side bar -->
                    <div class="col-md-8 mt-4" style="border:solid 1px rgb(208, 203, 203); height:100%" align='center'>
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
                        </div>
              
                        <!-- 사이드바 끝  -->
                           <div class="pl-1 col-md-8" >
                                <div class="mt-4" id="map" style=" width:100%; height:353px; border-radius:0;"></div> 
                                <p id="timetableList"></p>
                                <fmt:parseDate value="${viewList.STARTDATE }" var="startDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="startDay"></fmt:parseNumber>
								<fmt:parseDate value="${viewList.ENDDATE }" var="endDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDay"></fmt:parseNumber>
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
                                                    		<td id='6' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                            
                                                    </tr>
                                                    <tr>
                                                           <td class='time1'>07:00</td>
                                                    		<td id='7' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>08:00</td>
                                                    		<td id='8' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>09:00</td>
                                                    		<td id='9' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>10:00</td>
                                                    		<td id='10' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>11:00</td>
                                                    		<td id='11' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>12:00</td>
                                                    		<td id='12' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>13:00</td>
                                                    		<td id='13' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>14:00</td>
                                                    		<td id='14' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>15:00</td>
                                                    		<td id='15' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>16:00</td>
                                                    		<td id='16' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>17:00</td>
                                                    		<td id='17' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>18:00</td>
                                                    		<td id='18' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>19:00</td>
                                                    		<td id='19' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>20:00</td>
                                                    		<td id='20' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>21:00</td>
                                                    		<td id='21' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>22:00</td>
                                                    		<td id='22' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>23:00</td>
                                                    		<td id='23' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
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
                                                    		<td id='6' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                            
                                                    </tr>
                                                    <tr>
                                                           <td class='time1'>07:00</td>
                                                    		<td id='7' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>08:00</td>
                                                    		<td id='8' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>09:00</td>
                                                    		<td id='9' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>10:00</td>
                                                    		<td id='10' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>11:00</td>
                                                    		<td id='11' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>12:00</td>
                                                    		<td id='12' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>13:00</td>
                                                    		<td id='13' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>14:00</td>
                                                    		<td id='14' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>15:00</td>
                                                    		<td id='15' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>16:00</td>
                                                    		<td id='16' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>17:00</td>
                                                    		<td id='17' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>18:00</td>
                                                    		<td id='18' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>19:00</td>
                                                    		<td id='19' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>20:00</td>
                                                    		<td id='20' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>21:00</td>
                                                    		<td id='21' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>22:00</td>
                                                    		<td id='22' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
                                                    </tr>
                                                    <tr>
                                                            <td class='time1'>23:00</td>
                                                    		<td id='23' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td>
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
                            
                                </div>
                              
                              
                              <div class="tabe-pane fade" id="Review">
                              <br>
                              <br>
                                
							     <button class="btn-outline-warning btn btn-large" onclick="fn_updateEnd(${viewList.SCHEDULENO})">수정</button>
							          
							      <br>
                                 
                                <br>  
                                 <form name="reportUpdate" id="reportUpdate" action="${path }/schedule/reportUpdateEnd" method='post'> 
                                <input type="hidden" name="scheduleNo" value="${viewList.SCHEDULENO }">
                                
                                <c:forEach items="${rList }"  var="r">
                                <input type="hidden" name="day" value="${r.reportDay }">
                               
                                <button class="btn btn-outline-dark" value="${r.reportDay }" onclick="fn_toggle(event)">${r.reportDay }일차</button><br>
                                <br>
                                <div id="content${r.reportDay }"  class="hidetext">
                                <div class="container">
                                        
                                        <h5 class="col-md-7">제목</h5>
                                        <div class="col-md-7">
                                                <div class="form-group">
                                                   <input type="text" class="form-control" name="reportTitle" autocomplete="off" id="reportTitle" placeholder="title" value="${r.title}">
                                                </div>
                                        </div>
                                        <h5 class="col-md-7">내용</h5>
                                                <div class="col-md-7">
                                                <div class="form-group">
                                                     <textarea class="form-control textarea summernote" rows="3" name="reportContent" id="reportContent" placeholder="content"   resize: none;">${r.content }</textarea>
                                                </div>
                                                </div>
                                        <br>
                                        </div>
                                </div>
                                <br>
                                </c:forEach>
                                   </form>   

                              </div>
                              </div>
      
                    <br>
                </div>
                </div>
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

			
			
		},1000);
	};

	
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
