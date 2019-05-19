<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="{pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d28c77afa06b8d3797cd516b310f0f&libraries=services"></script>
<style>
    .hide {
        display: none;
    }

    .btn-outline-warning.focus, .btn-outline-warning:focus,
    .btn-outline-warning:not(:disabled):not(.disabled).active:focus,
    .btn-outline-warning:not(:disabled):not(.disabled):active:focus,
    .show>.btn-outline-warning.dropdown-toggle:focus {
        box-shadow: none;
    }
    
    #like_n:hover, #like_a:hover, #bring_n:hover, #bring_a:hover {
    	color: #ffc107;
    }
    #detail_info p {
    	margin: 0;
    	text-align: left;
    }
</style>

<main class="page landing-page">
    <section id="detail-header" style="padding:0; margin:0 0 50px;">
        <div class="info">
            <h2>${place.title }<br><br></h2>
            <div style="font-size:22px;margin-bottom:5px;">
            	<i class="fa fa-star"></i>
            	<i class="fa fa-star"></i>
            	<i class="fa fa-star"></i>
            	<i class="fa fa-star"></i>
            	<i class="fa fa-star"></i>
           	</div>
            <p>${place.minorcategory }</p>
            
            <input type="hidden" id="placeno" value="${place.placeno }">
            <input type="hidden" id="title" value="${place.title }">
            <input type="hidden" id="addr" value="${place.address }">
            <input type="hidden" id="userid" value="${userLoggedIn.userId}">
            
            
            <div class="table-responsive info-table">
                <table class="table">
                    <thead>
                        <tr>
                            <th colspan="2" style="font-size:20px">기본정보</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="font-size:14px;">주소</td>
                            <td style="font-size:14px;">${place.address }<br></td>
                        </tr>
                        <tr>
                            <td style="font-size:14px;">연락처</td>
                            <td style="font-size:14px;">(+82) ${place.phone }<br></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- <div>
                <button class="btn btn-outline-warning btn-lg" type="button" data-toggle="button">
                    <i class="fa fa-thumbs-o-up"></i>좋아요</button>
                <button class="btn btn-outline-warning btn-lg" type="button" data-toggle="button" style="margin-left:10px;"><i class="fa fa-heart"></i>찜하기</button>
            </div> -->
        </div>
        <div class="mx-auto" style="width: 1902px">
	        <img src="${path }/resources/upload/spot/mainimage/${place.mainimage}" style="width:100%; height:560px;">
        </div>
        </section>
    <section id="detail-body">
        <div class="container">
            <div class="row" style="text-align:center;">
                <div class="col">
                    <c:choose>
						<c:when test="${userLoggedIn ne null}">
		                    <a href='javascript: fn_like();'>
		                    <c:choose>
								<c:when test="${like_ck}">
			                        <i class="fa fa-thumbs-o-up detail-icon" id="like_a" style="color:#ffc107; padding: 8px 16px;"></i>
			                    </c:when>
			                    <c:otherwise>
			                    	<i class="fa fa-thumbs-o-up detail-icon" id="like_a" style="padding: 8px 16px;"></i>
			                    </c:otherwise>
		                    </c:choose>
		                    </a>
						</c:when>
						<c:otherwise>
						    <a href='javascript: login_need();'>
		                        <i class="fa fa-thumbs-o-up detail-icon" id="like_n" style="padding: 8px 16px;"></i>
		                    </a>
						</c:otherwise>
					</c:choose>
                    
                    <h5 style="color:rgb(150,150,150);">좋아요</h5>
                    <h5 style="color:#ffb53c;" id="like_cnt">${place.goodcount }</h5>
                </div>
                <div class="col" style="border-left:1px solid #e5e5e5">
                    <c:choose>
						<c:when test="${userLoggedIn ne null}">
		                    <a href='javascript: fn_bring();'>
		                    <c:choose>
								<c:when test="${like_ck}">
			                        <i class="fa fa-heart m-0 detail-icon" id="bring_a" style="color:#ffc107; padding: 8px 16px;"></i>
			                    </c:when>
			                    <c:otherwise>
			                    	<i class="fa fa-heart m-0 detail-icon" id="bring_a" style="padding: 8px 16px;"></i>
			                    </c:otherwise>
		                    </c:choose>
		                    </a>
						</c:when>
						<c:otherwise>
						    <a href='javascript: login_need();'>
		                        <i class="fa fa-heart m-0 detail-icon" id="bring_n" style="padding: 8px 16px;"></i>
		                    </a>
						</c:otherwise>
					</c:choose>
                    <h5 style="color:rgb(150,150,150);">찜하기</h5>
                    <h5 style="color:#ffb53c;" id="bring_cnt">${place.bringcount }</h5>
                </div>
                <div class="col" style="border-right: 1px solid #e5e5e5;border-left: 1px solid #e5e5e5;">
                    <i class="fa fa-commenting-o detail-icon" style="padding: 8px 16px"></i>
                    <h5 style="color:rgb(150,150,150);">리뷰</h5>
                    <h5 style="color:#ffb53c;">${place.replycount }</h5>
                </div>
                <div class="col">
                    <i class="fa fa-check detail-icon" style="padding: 8px 16px"></i>
                    <h5 style="color:rgb(150,150,150);">조회수</h5>
                    <h5 style="color:#ffb53c;">${place.hitscount }</h5>
                </div>
            </div>
        </div>
    </section>
    <section id="detail">
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item" style="min-width:150px; text-align:center; font-size:20px"><a id="btn_info" class="nav-link active">상세 정보</a></li>
                <li class="nav-item" style="min-width:150px; text-align:center; font-size:20px"><a id="btn_map" class="nav-link text-body">지도</a></li>
                <li class="nav-item" style="min-width:150px; text-align:center; font-size:20px"><a id="btn_review" class="nav-link text-body">리뷰</a></li>
            </ul>
            
        </div>
    </section>
    
    <section id="detail_info" >
        <div class="detail-content container">
            <h5 style="line-height: 2.5;font-size: 1.15rem">${place.content }</h5>
        </div>
    </section>
    <section id="map" class="hide">
        <div class="container">
            <div class="detail-content">
                <div id="map-container" style="width:100%; margin: 0 0 auto;">
                    <div id="map-d" style="width:100%; height:500px;"></div>
                </div>
            </div>
        </div>
    </section>
    <section id="review">
    <div class="container">
        <div class="row">
            <div class="col-md-11">
              <div class="page-header mb-3 mt-5" style="border-bottom: solid 1px black; height: 50px;">
                <button type="button" class="btn btn-outline-warning float-right"  data-toggle="modal" data-target="#replyWriteModal" onclick="return loginCheck()">댓글등록</button>
                <h4>이 모임에 대한 의견(<span style="color: #f19221">${fn:length(placeReplyList) }</span>)</h4>  
              </div> 
               <div class="mb-5">
              
                <c:forEach items="${placeReplyList}" var="reply" varStatus="b">
                    <div>
                   <c:if test="${reply.PLACEREPLYLEVEL ==1 }">
                   <c:set var="a" value="${b.index }"/>
                    <!-- 댓글하나시작 -->
                        <div class="media mb-3 " style="border-bottom: rgb(228, 224, 224) solid 1px;">
                            <a class="media-left" href="#">
                               <img src="${path }/resources/upload/profile/${reply.PICTURE}" alt="이미지가 없습니다." width="70px;" height="70px;" class="rounded-circle mr-3">
                            </a>
                            <div class="media-body mb-3">
                                <span style="color: #1b1b1b; font-size: 17px;" class="mr-2">${reply.NICKNAME}</span>
                                <span style=" color: #959595; font-size: 16px;">${reply.WRITEDATE}</span>
                                <button type="button" class="btn float-right p-1 btn-replyGood" value="${reply.REPLYNO }" style="background: white; border: 1px solid #f19221;"><span style="font-size: 12px; color: #f19221;">추천 ${reply.GOODCOUNT }</span></button>
                                <br><br>
                                <span style="font-size: 14.5px;  color: #535353;">${reply.CONTENT }</span>                                   
                                <br>
                                <c:forEach items="${placeAttList }" var="att" >
                                     <c:if test="${att.REPLYNO==reply.REPLYNO }">
                                        <a class="pop"><img src="${path}/resources/upload/replyPicture/${att.RENAMED}" alt="" width="50px;" height="50px"></a>
                                     </c:if>
                                </c:forEach>
                                 <br>
                                <button type="button" class="btn mt-2 p-1  " onclick="btn_replySee(${a})" style="background: white; border: 1px solid #959595; "> <span style="font-size: 12px; color: #959595;">댓글${reply.REPLYCOUNT }</span> </button>
                                
                                <button type="button" class="btn mt-2 ml-2 p-1 btn-replyWrite" value="${reply.REPLYNO }"  style="background: white; border: 1px solid #959595;" > <span style="font-size: 12px; color: #959595;">댓글 쓰기</span> </button>
                          <c:if test="${userLoggedIn != '' || userLoggedIn ne null }">
                            <c:if test="${reply.USERID eq userLoggedIn.userId }">
                                      <button type="button" class="btn mt-2 ml-2 p-1 btn-replyDelte" value="${reply.REPLYNO }" style="background: white; border: solid 1px #ccc;"  > <span style="font-size: 12px; color: #959595;">삭제</span> </button>
                                   </c:if>
                                </c:if>
                            </div>
                       </div>
                   <!--댓글하나 끝-->
                   </c:if>
                     <c:if test="${reply.PLACEREPLYLEVEL==2 }">
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
                                           <button type="button" class="btn float-right p-1 btn-replyGood" value="${reply.REPLYNO }" style="background: white; border: 1px solid #f19221;"><span style="font-size: 12px; color: #f19221;">추천  ${reply.GOODCOUNT }</span></button>
                                           <br><br>
                                           <span style="font-size: 14.5px;  color: #535353;">${reply.CONTENT }</span>
                                          
                                           <br>
                                           <c:if test="${userLoggedIn != '' || userLoggedIn ne null }">
                                       <c:if test="${reply.USERID eq userLoggedIn.userId }">
                                                 <button type="button" class="btn mt-2 ml-2 p-1 btn-replyDelte" value="${reply.REPLYNO }" style="background: white; border: solid 1px #ccc;"  > <span style="font-size: 12px; color: #959595;">삭제</span> </button>
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
                
                 <form action="${path}/place/placeReplyWrite.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="placeNo" value="${place.placeno }">
                    <input type="hidden" name="userId" value="${userLoggedIn.userId }">
                    <input type="hidden" name="placeReplyLevel" value="1">
                    <div class="card-body ">
                            
                              <div class="row">
                                <label class="col-md-2 col-form-label" style="font-weight: bold;">댓글</label>
                                <div class="col-md-10">
                                  <div class="form-group has-default bmd-form-group">
                                    <textarea name="content" class="form-control" required></textarea>
                             
                                  </div>
                                </div>
                              </div>
                              <button type="button" id="btn_fileSee">파일첨부</button>
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
          <!-- 리턴페이지 유지위해  -->
          <input type="hidden" name="placeNo" value="${place.placeno }">
    
        </form>
        
        <!--댓글추천 적용시키기 위한 폼-->
        <form name="replyGood">
          <input type="hidden" name="replyNo">
         <!-- 리턴페이지 유지위해  -->
          <input type="hidden" name="placeNo" value="${place.placeno }">
          <c:if test="${userLoggedIn != '' || userLoggedIn ne null }">
             <input type="hidden" name="userId" value="${userLoggedIn.userId }">
          </c:if>
        </form>
        <%-- <div class="container">
            <div class="review-area">
                <div class="table-responsive review-form">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="user-photo"><img class="rounded-circle" src="${path }/resources/img/spot/user.jpg" width="100%"></th>
                                <th colspan="3">Column 2</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Jia*********<br></td>
                                <td rowspan="2" colspan="2">스쿠터 대여해서 한바퀴 돌고 왔는데 너무 좋았어요 ~<br></td>
                            </tr>
                            <tr>
                                <td><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div> --%>
    </section>
    <c:if test="${userLoggedIn.userLevel==1}">
	    <button class="btn btn-outline-warning btn-block" type="button" onclick="fn_spotUpdatego()">장소 수정</button>
    </c:if>
</main>

<!-- <script type="text/javascript">
	$(document).ready(function(){
		var placeNo = $("#placeno").val();
		var userId = $("#userid").val();
		
		$.ajax({
		    url: "${path}/spot/likeAndBring.do",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: sendData,
		    success: function(data) {
		    	if(data.like_ck) {
					$('#like_a').attr('style', 'color:#ffc107;padding: 8px 16px;');
					if(data.bring_ck) {
						$('#bring_a').attr('style', 'color:#ffc107;padding: 8px 16px;');
			    	}
			    	else {
			    		$('#bring_a').attr('style', 'padding: 8px 16px;');
			    	}
		    	}
		    	else {
		    		$('#like_a').attr('style', 'padding: 8px 16px;');
		    		if(data.bring_ck) {
						$('#bring_a').attr('style', 'color:#ffc107;padding: 8px 16px;');
			    	}
			    	else {
			    		$('#bring_a').attr('style', 'padding: 8px 16px;');
			    	}
		    	}
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	});
</script> -->

<script>
	function fn_spotUpdatego() {
		location.href="${path}/spot/spotUpdate.do?placeno=${place.placeno }";
	}
</script>

<script>
$(function(){
    var writeFlag = 0;
    $('.btn-replyDelte').on('click',function(){
       var flag = confirm("정말로 삭제 하시겠습니까?");
       if(flag==false){
            return;
          }
       var num = $(this).val();
        replyDelete.replyNo.value=num;
        var url="${path}/place/placeReplyDelete.do";
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
              
              
              var form=$("<form action='${path}/place/placeReplyWrite2.do' method='post' class='replyWriteForm'></form>");//<form>요소를 만듬!
              var html="<div class='row form-group pl-5 '>";
              html+= "<textarea rows='3' name='content' style='resize: none; width: 85%' class='mr-3' required></textarea>";
              html+= "<input type='hidden' name='placeNo' value='${place.placeno }'/>";
              html+= "<input type='hidden' name='userId' value='${userLoggedIn.userId }'/>";
              html+= "<input type='hidden' name='placeReplyLevel' value='2'/>";
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
               var url="${path}/place/placeReplyGood.do";
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
</script>

<script>

$(document).ready(function(){
	$('#btn_map').click(function(){
		var state = $('#map').css('display');
        if(state == 'none'){
            $('#detail_info').hide();
            $('#map').show();
            $('#review').hide();
            
            $('#btn_info').removeClass('active');                
            $('#btn_map').addClass('active');
            $('#btn_review').removeClass('active');
        }
        
	    var mapContainer = document.getElementById('map-d'), // 지도를 표시할 div 
	        mapOption = {
	            center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	            level: 4 // 지도의 확대 레벨
	        };
	    
	    // 지도를 생성합니다    
	    var map = new daum.maps.Map(mapContainer, mapOption); 
	    
	    // 주소-좌표 변환 객체를 생성합니다
	    var geocoder = new daum.maps.services.Geocoder();
	    
	    var addr = $("input[id=addr]").val();
	    
	    // 주소로 좌표를 검색합니다
	    geocoder.addressSearch(addr , function(result, status) {
	    
	        // 정상적으로 검색이 완료됐으면 
	         if (status === daum.maps.services.Status.OK) {
	    
	            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	    
	            // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new daum.maps.Marker({
	                map: map,
	                position: coords
	            });
	            
	         	// 인포윈도우로 장소에 대한 설명을 표시합니다
	            var infowindow = new daum.maps.InfoWindow({
	                content: '<div style="width:150px;text-align:center;">${place.title }</div>'
	            });
	            infowindow.open(map, marker);
	            
	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	        } 
	    });
	});
});
</script>

<script>
    $(document).ready(function(){
        $('#btn_info').click(function(){
            var state = $('#detail_info').css('display');
            if(state == 'none'){
                $('#detail_info').show();
                $('#map').hide();
                $('#review').hide();
                
                $('#btn_info').addClass('active');                
                $('#btn_map').removeClass('active');
                $('#btn_review').removeClass('active');
            }
        });

        /* $('#btn_map').click(function(){
            var state = $('#map').css('display');
            if(state == 'none'){
                $('#detail_info').hide();
                $('#map').show();
                $('#review').hide();
                
                $('#btn_info').removeClass('active');                
                $('#btn_map').addClass('active');
                $('#btn_review').removeClass('active');
            }
        }); */

        $('#btn_review').click(function(){
            var state = $('#review').css('display');
            if(state == 'none'){
                $('#detail_info').hide();
                $('#map').hide();
                $('#review').show();
                
                $('#btn_info').removeClass('active');                
                $('#btn_map').removeClass('active');
                $('#btn_review').addClass('active');
            }
        });
    });
</script>
<script type="text/javascript">
	function login_need() {
		alert("로그인이 필요합니다.")
	}

	function fn_like() {
		var placeNo = $("#placeno").val();
		var userId = $("#userid").val();
		
		var sendData = {"placeno":$('#placeno').val(), "userid":$('#userid').val()};
		
		console.log("boardno, userid : " + placeNo +","+ userId);
		
		$.ajax({
		    url: "${path}/spot/like.do",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: sendData,
		    success: function(data) {
		    	var msg = '';
		    	msg += decodeURIComponent(data.msg);
		    	alert(msg);
		    	
		    	if(data.like_ck) {
					$('#like_a').attr('style', 'color:#ffc107;padding: 8px 16px;');
					
		    	}
		    	else {
		    		$('#like_a').attr('style', 'padding: 8px 16px;');
		    	}
		    	$('#like_cnt').html(data.like_cnt);
		    	
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
	
	function fn_bring() {
		var placeNo = $("#placeno").val();
		var userId = $("#userid").val();
		
		var sendData = {"placeno":$('#placeno').val(), "userid":$('#userid').val()};
		
		console.log("boardno, userid : " + placeNo +","+ userId);
		
		$.ajax({
		    url: "${path}/spot/bring.do",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: sendData,
		    success: function(data) {
		    	var msg = '';
		    	msg += decodeURIComponent(data.msg);
		    	alert(msg);
		       
		    	if(data.bring_ck) {
					$('#bring_a').attr('style', 'color:#ffc107;padding: 8px 16px;');
		    	}
		    	else {
		    		$('#bring_a').attr('style', 'padding: 8px 16px;');
		    	}
		    	$('#bring_cnt').html(data.bring_cnt);
		    	
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>