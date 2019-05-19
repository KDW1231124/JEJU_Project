<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>

<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<head>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous">
</script>

<%-- <link href="${path }/resources/bootstrap/css/bootstrap.css" rel="stylesheet"> --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${path }/resources/css/datepicker.css" rel="stylesheet" type="text/css">
<link href="${path }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${path }/resources/js/datepicker.min.js"></script>

</head>


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
        var url="${path}/meet/meetReplyDelete.do";
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
              
              
              var form=$("<form action='${path}/meet/meetReplyWrite2.do' method='post' class='replyWriteForm'></form>");//<form>요소를 만듬!
              var html="<div class='row form-group pl-5 '>";
              html+= "<textarea rows='3' name='content' style='resize: none; width: 85%' class='mr-3' required></textarea>";
              html+= "<input type='hidden' name='meetNo' value='${meet.meetNo }'/>";
              html+= "<input type='hidden' name='userId' value='${userLoggedIn.userId }'/>";
              html+= "<input type='hidden' name='meetReplyLevel' value='2'/>";
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
               var url="${path}/meet/meetReplyGood.do";
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

<section>
	<div class="container">
	<br><br>
		<div class="justify-content-center" align="center">
			<h1>${meet.title }</h1>
		</div>
		<br>
		<div id="bung-img" class="card mb-4 img-thumbnail" align="center">
			<img alt="thumbnail" src="${path }/resources/upload/meet/thumbnail/${meet.thumbnail }" style="max-width: 800px; max-height: 600px;">
		</div>
		<br>
		
		<div class="card mb-4 justify-content-center" align="center">
			
	        <div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">닉네임</label>
				   	<div class="col-sm-3">
				       	${meet.nickName }
				    </div>
				    <div class="col-sm-3" style="float:right;">
						<button class="btn btn-outline-warning" onclick="sendM()">쪽지보내기</button>
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">주소</label>
				   	<div class="col-sm-3">
				       	${meet.address }
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">성별</label>
				   	<div class="col-sm-3">
				       	${meet.gender=='M'?'남':'여' }자
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">나이</label>
				   	<div class="col-sm-3">
				       	${meet.age} 살
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">날짜</label>
				   	<div class="col-sm-3">
				       	${meetDate }
				    </div>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group row">
				   	<label for="gender" class="col-sm-2 col-form-label">시간</label>
				   	<div class="col-sm-3">
				       	${meet.meetTime }
				    </div>
				</div>
			</div>
			<hr>
			<div class="justify-content-center" align="center">
	       		${meet.content }
	    	</div>
		</div>
		
	   	
		
		<c:if test="${userLoggedIn.userId==meet.userId }">
			<div class="justify-content-center" align="center">
				<button class="btn btn-outline-warning" onclick="meetUpdate(${meet.meetNo})" value="${meet.meetNo }">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button class="btn btn-danger" onclick="meetDelete(${meet.meetNo})" value="${meet.meetNo }">삭제</button>
				<button class="btn btn-outline-warning" onclick="goList()" style="float:right;">목록으로</button>
			</div>
		</c:if>
		<c:if test="${userLoggedIn.userId!=meet.userId }">
			<div style="float:right;">
				<button class="btn btn-outline-warning" onclick="goList()" style="float:right;">목록으로</button>
			</div>
		</c:if>
		<br><br>
		<hr>
		
		
		<!-- 댓글영역 -->
		
		<div class="container">
        <div class="row">
            <div class="col-md-11">
              <div class="page-header mb-3 mt-5" style="border-bottom: solid 1px black; height: 50px;">
                <button type="button" class="btn btn-outline-warning float-right"  data-toggle="modal" data-target="#replyWriteModal" onclick="return loginCheck()">댓글등록</button>
                <h4>이 모임에 대한 의견(<span style="color: #f19221">${fn:length(meetReplyList) }</span>)</h4>  
              </div> 
               <div class="mb-5">
              
                <c:forEach items="${meetReplyList}" var="reply" varStatus="b">
                    <div>
                   <c:if test="${reply.MEETREPLYLEVEL ==1 }">
                   <c:set var="a" value="${b.index }"/>
                    <!-- 댓글하나시작 -->
                        <div class="media mb-3 " style="border-bottom: rgb(228, 224, 224) solid 1px;">
                            <a class="media-left" href="#">
                               <img src="${path }/resources/upload/profile/${reply.PICTURE}" alt="위에꺼" width="70px;" height="70px;" class="rounded-circle mr-3">
                            </a>
                            <div class="media-body mb-3">
                                <span style="color: #1b1b1b; font-size: 17px;" class="mr-2">${reply.NICKNAME}</span>
                                <span style=" color: #959595; font-size: 16px;">${reply.WRITEDATE}</span>
                                <button type="button" class="btn float-right p-1 btn-replyGood" value="${reply.REPLYNO }" style="background: white; border: 1px solid #f19221;"><span style="font-size: 12px; color: #f19221;">추천 ${reply.GOODCOUNT }</span></button>
                                <br><br>
                                <span style="font-size: 14.5px;  color: #535353;">${reply.CONTENT }</span>                                   
                                <br>
                                <c:forEach items="${meetAttList }" var="att" >
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
                     <c:if test="${reply.MEETREPLYLEVEL==2 }">
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
                
                 <form action="${path}/meet/meetReplyWrite.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="meetNo" value="${meet.meetNo }">
                    <input type="hidden" name="userId" value="${userLoggedIn.userId }">
                    <input type="hidden" name="meetReplyLevel" value="1">
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
          <input type="hidden" name="meetNo" value="${meet.meetNo }">
    
        </form>
        
        <!--댓글추천 적용시키기 위한 폼-->
        <form name="replyGood">
          <input type="hidden" name="replyNo">
         <!-- 리턴페이지 유지위해  -->
          <input type="hidden" name="meetNo" value="${meet.meetNo }">
          <c:if test="${userLoggedIn != '' || userLoggedIn ne null }">
             <input type="hidden" name="userId" value="${userLoggedIn.userId }">
          </c:if>
        </form>
		
		
	</div>
	
	<br><br><br>
	<script>
		function sendM(){
			if(${userLoggedIn==null})
			{
				alert("로그인 후 이용 가능합니다.");
				location.href="${path}/user/userLogin.do";
				return;
			}else{
				
				var bool = confirm("쪽지를 보내시겠습니까?");
				
				if(bool)
				{
					location.href="${path}/message/sendMessage.do";
				}
				else
				{
					alert("취소되었습니다.");
					e.preventDefault();
				}
			}
		}
		
		function goList()
		{
			var bool = confirm("목록으로 돌아가시겠습니까?");
			if(bool)
			{
				location.href="${path}/meet/meetList.do";
			}else{
				alert("취소되었습니다.");
				e.preventDefault();
			}
		}
		
		function meetUpdate(meetNo)
		{
			
			var bool = confirm("정말 수정하시겠습니가?");
			
			if(bool)
			{
				location.href="${path}/meet/meetUpdate.do?meetNo="+meetNo;
			}
			else
			{
				alert("취소되었습니다.");
				e.preventDefault();
			}
		}
		
		function meetDelete(meetNo)
		{
			console.log(meetNo);
			var bool = confirm("정말 삭제하시겠습니가?");
			if(bool)
			{
				location.href="${path}/meet/meetDelete.do?meetNo="+meetNo;
			}
			else
			{
				alert("취소되었습니다.");
				e.preventDefault();
			}
		}
		
		
		
	</script>
	
</section>

<!-- 푸터 -->
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





