<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.respect.user.model.vo.User"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">

<style>

    #map{
        background:indigo;
    }
  

    @media  (max-width: 420px) {
        .timeline1 {
            margin-top: 0;
        }
    }

        
    .schedule_wrap{display: block;}
	.left-view{border:2px solid orange; padding-left: 0;}
	.time1{width:20%;}
	.place{width:80%;}
	.timeline th{background:black; color:orange;}
	.timeline{text-align: center; width:100%}
	.timeline tr{height:50px;}
	/* .place button{color:orange; background:black;} */
	
	#timeline-wrap{position: relative; overflow: hidden; width:100%; }
	.day{position: relative; display: inline-block; width:100%; height:100%; }
	.day a{text-decoration: none; color:orange;}
	.delbtn{background:black; color:orange; width:30px; height:30px; text-align: center; border:0;}
	
</style>


<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> -->

<!-- 지도 라이브러리  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f&libraries=services"></script>

<!-- 달력JQuery -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<title>Insert title here</title>
</head>
<body>


    <div class="container">
    
            <div class="row">
                    <h2 class="pt-4 ml-2">나의 여행 일정</h2>
                    
                   <div class="pt-4 ml-2 col col-lg-8" style="margin-top:2px; float:right;" align='right'>
                    	<button class='btn btn-outline-warning' onclick="fn_submit()">등록하기</button>
                    </div>
                     
            </div> 
            
            <div class="row">
                <!-- side bar -->
            <div class="col-md-3">
                <div class="mt-4" style="border:solid 1px rgb(208, 203, 203);" align='center'>
                    
                        <br>          
                            <h6>제목</h6>
                            <div class="input-group ">
                                <input style="margin-left: 3%; margin-right: 3%; border-radius:0; " name="title" type="text" class="form-control" placeholder="일정의 제목을 입력하세요." aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                                                        
                            <br>
                            <h6>기간</h6>
                            <div class="input-group row" >
                                    <input style="margin-left: 1%; margin-right: 1%; border-radius:0;" type="text" class="form-control" name="startDate" id="start_date" required> <p>~</p>
                                    <input style="margin-left: 1%; margin-right: 1%; border-radius:0;" type="text" class="form-control" name="endDate" id="end_date" required>
                                    
                            </div>
                            <br>
                            <div>
                                <h6 style="float:left;">&nbsp;&nbsp;인원</h6>
                                <h6 style="float:none;">&nbsp;&nbsp;일행</h6>
                            </div>
                            <div class="input-group row" >
                                    <input style="margin-left: 3%; width:25%; border-radius:5%;"  name="people" type="number" class="form-control" min="1" max="1000" required >&nbsp;&nbsp;&nbsp;&nbsp;
                                    <select style="margin-right: 3%; width:30%; border-radius:0;" name='partyName'  class="form-control" required>
                                            <option value="혼자">나홀로여행</option>
                                            <option value="친구">친구와함께</option>
                                            <option value="커플">커플</option>
                                            <option value="단체">단체여행</option>
                                    </select>   
                            </div>
                            <br>
                            <h6 style="float:none;">&nbsp;&nbsp;여행테마</h6>
                            <div class="input-group row" >
                                    
                                    <select style="margin-right: 3%; width:30%; border-radius:0;" name='travelTheme'  class="form-control" required>
                                            <option value="휴식">휴식과 치유 여행</option>
                                            <option value="걷기">천천히 걷기</option>
                                            <option value="식도락">식도락 여행</option>
                                            <option value="유산">제주의 문화유산</option>
                                            <option value="행사">전시와 행사</option>
                                        
                                    </select>   
                            </div>
                            
                            <br>
                            <h6>여행일정 공개여부</h6>
                            <div style="display:inline-block">
                                <input type="radio" id="open" name="openflag" value='1'>&nbsp;공개
                                <input type="radio" id="private" name="openflag" class="ml-2" value="0">&nbsp;비공개
                            </div>
                         
                         
                            <br><br>
                            
                            
                            <br>
                    
                        </div>
                         <!-- 여행지 검색 side-bar -->
                
                       <div class="col-md-12 mt-4" style="border:solid 1px rgb(208, 203, 203);" align='center'>
                        <ul class="nav nav-tabs row justify-content-center"  id="myTab">
                           <li class="nav-item">
                          	    <a id="receiveMessage" class="nav-link active" data-toggle="tab" href="#searchPlace">여행지 검색</a>
                           </li>
                           <li class="nav-item">
                          		<a id="sendMessage" class="nav-link" data-toggle="tab" href="#zzim">찜한 여행지</a>
                           </li>
                           <li class="nav-item">
                               <a id="sendMessage" class="nav-link" data-toggle="tab" href="#myAdd">내가만든장소</a>
                           </li>
                        </ul>
                        <div class="tab-content">
                        <div class="container tab-pane active" id="searchPlace" >
                            
                            <div class="row mt-2" style="overflow: auto;">
                            	
		                            <input class="form-control " type="text"  name="keyword" autocomplete="off" placeholder="검색어 입력" style="width:70%" id="searchKeyword">
		                               <button class='btn btn-outline-warning text-center' onclick="fn_search()" style="width:30%">검색</button>
                               
                               <br>
                               <div class='mt-1 col-md-12' id='pList'>  
                                   
                                       <hr>
                                       <c:forEach var="place" items="${list }" >
                                       		
                                           <div class=" col-md-13 mt-3 justify-content-center" >
                                   			
                                               <img class="mb-2" src="${path }/resources/upload/spot/thumbnail/${place.thumbnail}" style="width:85px;" height="60px;">
                                               <br><p>${place.title }</p>
                                               <button class="btn btn-outline-warning btn-sm mb-2" value="${place }" onclick="fn_add(event)">일정등록</button>
                                           </div>
                                           
                                           <hr>
                                           
                                      </c:forEach>
                                           <br>
                                       <nav aria-label="Page navigation example">
                                               ${listBar }
                                       </nav>
                               </div>
                           </div>
                        </div>
                        
                        <div class="container tab-pane fade" id="zzim">
                               <div class="mt-2 col-md-13" id="putList">
                                   
                                   <hr>
                                   <c:forEach var="pPlace" items="${putList }" >
                                       		
                                           <div class=" col-md-13 mt-3 justify-content-center" >
                                   			
                                               <img class="mb-2" src="${path }/resources/upload/spot/thumbnail/${pPlace.thumbnail}" style="width:85px;" height="60px;">
                                               <br><p>${pPlace.title }</p>
                                               <button class="btn btn-outline-warning btn-sm mb-2" value="${pPlace }" onclick="fn_add(event)">일정등록</button>
                                           </div>
                                           
                                          <hr>
                                           
                                      </c:forEach>
                                           <br>
                                       <nav aria-label="Page navigation example">
                                               ${putListBar }
                                       </nav>
                               </div>
                            </div>
                             <div class="container tab-pane fade"  align='center' id="myAdd">
                    	<div class='mt-1 col-md-13' id='userList'>  
                                   
                                       <hr>
                                       <c:forEach var="uPlace" items="${userList }" >
                                       		
                                           <div class=" col-md-13 mt-3 justify-content-center" >
                                   			
                                               
                                               <br><p>${uPlace.title }</p>
                                               <div class='row justify-content-center'>
                                               <button class="btn btn-outline-warning btn-sm mb-2 mr-1" value="${uPlace }" onclick="fn_addUPlace(event)">일정등록</button>
                                               <button class="btn btn-outline-warning btn-sm mb-2" value="${uPlace }" onclick="fn_deleteUserPlace(event)">장소삭제</button>
                                               </div>
                                           </div>
                                           
                                          <hr>
                                           
                                      </c:forEach>
                                           <br>
                                       <nav aria-label="Page navigation example">
                                               ${userListBar }
                                       </nav>
                               </div>
                             <hr>
                            <br>
                            

                  			 </div>
                           </div>
                    </div>
                    </div>

                       <br><br>
                       
                       <div class="p-0 ml-0 col-md-9" >
                            <div class="mt-4" id="map"  style="width:100%; height:300px; box-shadow: 3px 4px 5px 0 rgba(2,2,2,.2); border-radius:0;"></div> 
                            <p id="timetableList"></p>
                                    <!-- The slideshow(타임테이블) -->
                         
                                  
                                    
                                    
                                  </div>
                        </div>
  
                <br>
                
            </div>
          

</body>
<!-- 지도 스크립트 -->





<script>
	function fn_deleteUserPlace(ev)
	{ //타임테이블 값 삭제, 핀삭제, 장소삭제
		var confirmflag=confirm("정말 삭제 하시겠습니까?");
		var place1=ev.target.value;
	    var place2=place1.split(",");
	    var placeno=place2[0];
	    var active=$("input[name='placevalue']");
		if(confirmflag)
		{
			
	        for(var i=0; i<active.length;i++)
        	{
	        	
	        	var active2=active[i].value.split(",");
	        	var seq_num=active2[3];
	        	if(placeno==active2[0])
        		{
        			for(var j=0; j<markers.length;j++)
        			{
        				if(markers[j]!=null)
        				{
        						if(markers[j].marks.getTitle()==seq_num)
        						{
        							markers[j].marks.setMap(null);
        							markers[j].iw.close();
        							markers[j]=null;
        						}
        				}
        			}
        			var targetdiv=document.getElementById("data"+seq_num);
        			targetdiv.parentElement.classList.remove("disable");
        			targetdiv.remove();
        		} 	
        	}
	        $.ajax
			({
					
					url:"<%=request.getContextPath()%>/schedule/deletePlace",
					type:"POST",
					data:{placeno:placeno},
					success:function(data)
					{
						$("#userList").html(data);
					},
					error:function()
					{
						alert("ajax 실행실패");
					}
					
			});
	        
		}
		else
		{
			return;
		}
		
	}
	
	function fn_search()
	{
		var keyword=$("input[name=keyword]").val();
		$.ajax
		({
				url:"<%=request.getContextPath()%>/schedule/placeSearch",
				type:"POST",
				data:{keyword:keyword},
				success:function(data)
				{
					$("#pList").html(data);
				}
		});
	}
	function fn_paging(cPage,sort)
	{
		
		if(sort==1)
		{
			var keyword=$("input[name=keyword]").val();
			$.ajax
			({
					url:"<%=request.getContextPath()%>/schedule/placeList",
					type:"POST",
					data:{cPage:cPage,keyword:keyword},
					
					success:function(data)
					{
						$("#pList").html(data);
					}
			});
		}
		else if(sort==2)
		{
			$.ajax
			({
					url:"<%=request.getContextPath()%>/schedule/userList",
					type:"POST",
					data:{cPage:cPage},
					
					success:function(data)
					{
						$("#userList").html(data);
					}
			});
		}
		else if(sort==3)
		{
			$.ajax
			({
					url:"<%=request.getContextPath()%>/schedule/putList",
					type:"POST",
					data:{cPage:cPage},
					
					success:function(data)
					{
						$("#putList").html(data);
					}
			});
		}
	};
	
	var title;
	
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
    
    
    $(function() {
$("#start_date").on("click",function()
{
   	
	var sDate=$("#start_date").val();
	var eDate=$("#end_date").val();
	
	if(sDate!=""&&eDate!="")
	{
		
		
		var flag=confirm("시작날짜를 변경할 경우 일정이 초기화될 수 있습니다 계속 하시겠습니까?");
		if(flag)
		{
			$("#demo").remove();
			$("#start_date").val("");
			$("#end_date").val("");
		}
		else
			{
			
			return;
			}
	
	}
});
   
   $("#end_date").on("click",function()
   		{

			var eDate=$("#end_date").val();
			/* 끝날짜에 밸류가 있을때 */
			if(eDate!="")
			{
				var flag=confirm("끝날짜를 변경할 경우 일정이 초기화됩니다. 계속 하시겠습니까?");
				if(flag)
				{
					var eDate=$("#end_date").val("");
					$("#demo").remove();						
				}
				else
				{
				
					
					return;
				}
			}				
   		});
    	
    $("#start_date").datepicker({
        dateFormat: 'yy-mm-dd',
        onSelect: showDays
    });
    
    
    $("#end_date").datepicker({
        dateFormat: 'yy-mm-dd',
        midDate:$('#start_date').datepicker('getDate'),
        onSelect: showDays
        
    });
    
    $('#start_date').datepicker("option", "maxDate", $("#end_date").val());
    $('#start_date').datepicker("option", "onClose", function ( selectedDate ) {
        $("#end_date").datepicker( "option", "minDate", selectedDate );
    });
    $('#end_date').datepicker("option", "minDate", $("#start_date").val());
    $('#end_date').datepicker("option", "onClose", function ( selectedDate ) {
        $("#start_date").datepicker( "option", "maxDate", selectedDate );
    });
    
    
   function showDays() {
        var start = $('#start_date').datepicker('getDate');
        var end = $('#end_date').datepicker('getDate');
        
        if (!start || !end) return;
        var days = (end - start) / 1000 / 60 / 60 / 24;
        if($("#demo")!=null)
        	{
        	 $("#demo").remove();	
        	 for(var j=0; j<markers.length;j++)
      		{
      			if(markers[j]!=null)
      			{
      				
 					markers[j].marks.setMap(null);
 					markers[j].iw.close();
 					markers[j]=null;
      				
      			}
      			
      		}
        	}
        
        var printHTML="<div id='demo' class='carousel slide' data-ride='carousel' data-interval='false'><div class='carousel-inner'>"
        				+ "<form id='timetableForm' action='${path}/schedule/scheduleWriteEnd' method='post'>"
        				+ "<input type='hidden' name='partyName2'><input type='hidden' name='title2'><input type='hidden' name='startDate2'><input type='hidden' name='endDate2'><input type='hidden' name='people2'><input type='hidden' name='travelTheme2'><input type='hidden' name='openflag2'>";
        for(i=0; i<=days; i++)
      	{
        	
        	if(i==0)
       		{
	        	printHTML+="<div class='carousel-item active' >";   		
       		}else
   			{
       			printHTML+="<div class='carousel-item' >";
   			}
        	printHTML+="<div class='day'>";
        	printHTML+="<table class='table-bordered timeline' id='"+(i+1)+"'>";
        	printHTML+="<tr><th class='time1'>TIME</th>";
        	printHTML+="<th class='place'>";
        	printHTML+="<a class='float-left' onclick='fn_move()' href='#demo'  data-slide='prev'>&lt;</a>";
         	printHTML+="DAY "+(i+1);       		
            printHTML+="<a class='float-right' onclick='fn_move()' href='#demo'  data-slide='next'>&gt;</a>";
            
            printHTML+="</th></tr>"
            printHTML+="<tr><td class='time1'>06:00</td><td id='6' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>07:00</td><td id='7' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>08:00</td><td id='8' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>09:00</td><td id='9' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>10:00</td><td id='10' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>11:00</td><td id='11' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>12:00</td><td id='12' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>13:00</td><td id='13' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>14:00</td><td id='14' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>15:00</td><td id='15' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>16:00</td><td id='16' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>17:00</td><td id='17' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>18:00</td><td id='18' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>19:00</td><td id='19' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>20:00</td><td id='20' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>21:00</td><td id='21' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>22:00</td><td id='22' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="<tr><td class='time1'>23:00</td><td id='23' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></td></tr>";
            printHTML+="</table></div></div>";
      	}
        	printHTML+="</form></div></div>";
        	
   		 	$('#timetableList').append(printHTML);
   		 
    }
   
});
    var clicktarget;
	function allowDrop(ev) {
	    ev.preventDefault();
	}
	
	function drag(ev) {
	    clicktarget=ev.target.parentElement.parentElement.parentElement;
	     console.log(clicktarget);
	    clicktarget.classList.remove("disable");
	    ev.dataTransfer.setData("text", ev.target.parentElement.parentElement.id);
	}
	
	function drop(ev) {

	    ev.preventDefault();
	    var data = ev.dataTransfer.getData("text");
	    var td=$(".active TD[class='place']");
	    
	    if(ev.target.className=="place")
	    {
	        ev.target.classList.add("disable");
	        ev.target.appendChild(document.getElementById(data));
	        var dayoftable=ev.target.parentElement.parentElement.parentElement.id;
	        ev.target.firstChild.childNodes[4].value=dayoftable+","+ev.target.id;
	        console.log(ev.target.firstChild.childNodes[4]);
	        console.log(dayoftable);
	        console.log(ev.target.id);
	    }
	    else
	    {
	        clicktarget.classList.add("disable");
	    }
		
	}

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
	function fn_add(event)
	{
			
			
		    var place1=event.target.value;
		    
		    var place2=place1.split(",");
		    
		    var seq_no=seq();
		    seq_num=seq_no
		    var active=$(".active TD[class='place']:first");
	        active[0].classList.add("disable");
	      	tableday=active[0].parentElement.parentElement.parentElement.id;
	      	
	        var html="<div id='data"+seq_no+"' ><small style='color:orange'>대표장소선택 </small> <input class='mr-2' type='radio' name='represent' value='"+place2[0]+"'>"+place2[1]+"<input type='hidden' name='timevalue' value='"+tableday+","+active[0].id+"'><input type='hidden' name='placevalue' value='"+place1+","+seq_no+"' class='placelist'><span class='float-right' class='drag' id='drag"+seq_no+"' draggable='true' ondragstart='drag(event)'> <img src='${path}/resources/img/arrow.png' style='width:50px; height:30px;'></span><button class='float-right delbtn' onclick='fn_delete("+seq_no+")'>X</button></div>";
	        
	        active.append(html);
	        var loc=place2[2];
	        title=seq_no;
	        placename=place2[1];
	        ps.addressSearch(loc,placesSearchCB);
	        
	}
	
	function fn_addUPlace(event)
	{
		var place1=event.target.value;
	    
	    var place2=place1.split(",");
	    
	    var seq_no=seq();
	    seq_num=seq_no
	    var active=$(".active TD[class='place']:first");
        active[0].classList.add("disable");
      	tableday=active[0].parentElement.parentElement.parentElement.id;
      	
        var html="<div id='data"+seq_no+"' >"+place2[1]+"<input type='hidden' name='blank'><input type='hidden' name='blank'><input type='hidden' name='blank'><input type='hidden' name='timevalue' value='"+tableday+","+active[0].id+"'><input type='hidden' name='placevalue' value='"+place1+","+seq_no+"' class='placelist'><span class='float-right' class='drag' id='drag"+seq_no+"' draggable='true' ondragstart='drag(event)'> <img src='${path}/resources/img/arrow.png' style='width:50px; height:30px;'></span><button class='float-right delbtn' onclick='fn_delete("+seq_no+")'>X</button></div>";
        
        active.append(html);
        var loc=place2[2];
        title=seq_no;
        placename=place2[1];
        ps.addressSearch(loc,placesSearchCB);
	}
	//장소 검색 완료시 호출되는 콜백 함수
	function placesSearchCB (data, status, pagination)
	{
		
		if(status === daum.maps.services.Status.OK)
		{
			//검색된 장소 위치를 기준으로 좌표 추가
			/* var bounds = new daum.maps.LatLngBounds(); */
			
			for(var i=0; i<data.length; i++)
			{
				
				displayMarker(data[i]);
				/* bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x)); */
			}
			//검색된 장소 위치를 기준으로 지도 표기
			/* map.setBounds(bounds); */
		}
	};
	
	//지도 마커 표기하는 함수
	function displayMarker(place)
	{
		
		//위치를 지도에 표기
		var marker = new daum.maps.Marker({
			map:map,
			title:seq_num,
			position:new daum.maps.LatLng(place.y, place.x),
			clickable: true 
			
		});
		
		
		
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new daum.maps.InfoWindow({
	        removable:iwRemoveable
	    }); 
	    infowindow.setContent('<div style="padding:5px; font-size:12px;">'+placename+'</div>');
		daum.maps.event.addListener(marker, 'click', function()
		{
			
			//마커 클릭시 장소명이 인포윈도우에 표출
			
			infowindow.open(map,marker);
		});
		var daymarker = {days:tableday,marks:marker,iw:infowindow};
		
		markers.push(daymarker);
		
	};

	
	
	
	
	
	function fn_delete(num)
	{
		
		var active=$(".active table[class='table-bordered timeline']");
		console.log(active[0].id);
		console.log(markers);
		for(var i=0; i<markers.length;i++)
		{
			if(markers[i]!=null)
			{
				if(markers[i].days==active[0].id)
				{
					if(markers[i].marks.getTitle()==num)
					{
						markers[i].marks.setMap(null);
						markers[i].iw.close();
						markers[i]=null;
					}
				}
			}
			
		}
		
		var targetdiv=document.getElementById("data"+num);
		
		targetdiv.parentElement.classList.remove("disable");
		targetdiv.remove();
		
	};

	
    function fn_move()
	{
    	var origin=$(".active table[class='table-bordered timeline']");
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
			
			var active=($(".active table[class='table-bordered timeline']"));
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

	function fn_submit(){
		var title=$("input[name='title']").val();
		var startDate=$("input[name='startDate']").val();
		var endDate=$("input[name='endDate']").val();
		var people=$("input[name='people']").val();
		var travelTheme=$("select[name='travelTheme']").val();
		console.log(travelTheme);
		var openflag=$("input[name='openflag']:checked").val();
		
		var partyName=$("select[name='partyName']").val();
		if(openflag==null){
			alert("공개여부를 체크해주세요");
			return;
		}
		if($("#timetableForm input[name='represent']:checked").val()==null)
		{
			alert("대표장소를 선택해주세요");
			return;
		}
		$("#timetableForm input[name='title2']").val(title);
		$("#timetableForm input[name='startDate2']").val(startDate);
		$("#timetableForm input[name='endDate2']").val(endDate);
		$("#timetableForm input[name='travelTheme2']").val(travelTheme);
		$("#timetableForm input[name='openflag2']").val(openflag);
		$("#timetableForm input[name='people2']").val(people);
		
		$("#timetableForm input[name='partyName2']").val(partyName);
		$("#timetableForm").submit();
	} 

	var custommarker = new daum.maps.Marker({
        map:map,
        clickable: true 
    });
	var detailAddr;
	 function test3()
	 	  {
			 var url="${path}/schedule/myPlaceAddView?detailAddr="+detailAddr;
		     var w1=window.open(url,'popup','width=700,height=350, resizable=no');
	       	 custommarker.setMap(null);
	       	infowindow2.close();
/* 	       var w1=window.open("",'popup','width=300,height=350, resizable=no');
	       var html='<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">';
	    	   html+='<META HTTP-EQUIV="Content-type" CONTENT="text/html;charset=UTF-8">';
	       	   html+='<meta http-equiv="X-UA-Compatible" content="ie=edge">'
	       	   html+='<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">';
	           html+='<title>내 장소 추가</title></head><body>';
	           html+='<form action="${path}//schedule/scheduleTest" method="get">';
	           html+='<div class="container"><div class="form-group">';
	           html+='<label for="recipient-name" class="form-control-label">제목</label>';
	           html+='<input type="text" name="mTitle" class="form-control" id="recipient-name"></div>';
	           html+='<div class="form-group">';
	           html+='<label for="recipient-name" class="form-control-label">주소</label>';
	           html+='<input type="text" name="addr" class="form-control" id="recipient-name" value="'+detailAddr+'" readonly></div>';
	           html+='<div class="form-group"><label for="message-text" class="form-control-label">상세설명</label>';
	           html+='<textarea name="text1" class="form-control" id="message-text" style="resize: none;"></textarea></div>';
	           html+='<div><button type="submit" class="btn btn-warning">등록</button>';
	           html+='</div></div></form>';
	           html+='</body></html>';
	               
	           console.log(html);

	       w1.document.write(html); */
	   }
	   /* 추가 */
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	   daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	       searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	           if (status === daum.maps.services.Status.OK) {
	               detailAddr = result[0].address.address_name;
	               
	              
	               var content = '<div class="ml-3 justify-content-center" style="width:110px; height:50px" align="center"><div class="row mt-2 justify-content-center" align="center" >'+
     				 '<button type="button" class="btn justify-content-center btn-outline-warning" onclick = "test3()">내 장소 추가</button>'+
       				 '</div>';
	               				 
       				
	               				

	               // 마커를 클릭한 위치에 표시합니다 
	               custommarker.setPosition(mouseEvent.latLng);
	               custommarker.setMap(map);

	               // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	               infowindow2.setContent(content);
	              
	               infowindow2.open(map, custommarker);
	           }   
	       });
	   });

	   // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	   daum.maps.event.addListener(map, 'idle', function() {
	       searchAddrFromCoords(map.getCenter());
	   });

	   function searchAddrFromCoords(coords, callback) {
	       // 좌표로 행정동 주소 정보를 요청합니다
	       ps.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	   }

	   function searchDetailAddrFromCoords(coords, callback) {
	       // 좌표로 법정동 상세 주소 정보를 요청합니다
	       ps.coord2Address(coords.getLng(), coords.getLat(), callback);
	   }
	   
	   $("#searchKeyword").keyup(function(){
		   $.ajax({
 				url:"<%=request.getContextPath()%>/schedule/autoComplete",
 				type:"post",
 				data:{keyword:$("#searchKeyword").val()},
 				dataType:"JSON",
 				success:function(data)
 				{
 					$("#searchKeyword").autocomplete({
 						source: data,
 						select:function(event,ui){
 							$("#searchKeyword").val(ui.item);
 						}
 					});
 				}
 			}); 
	   });
</script>

	
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>