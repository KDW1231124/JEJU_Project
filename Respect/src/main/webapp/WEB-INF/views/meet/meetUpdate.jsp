<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set value="${pageContext.request.contextPath}" var="path"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<head>

<title>Insert title here</title>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${path }/resources/css/datepicker.css" rel="stylesheet" type="text/css">
<link href="${path }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${path }/resources/js/datepicker.min.js"></script>
<script src="${path }/resources/js/i18n/datepicker.en.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<%-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="${path }/resources/js/summernote.js"></script>
<script src="${path }/resources/js/summernote.min.js"></script> --%>
<script src="${path }/resources/js/summernote-ko-KR.js"></script>



</head>

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
	
	//datepicker
	// Initialization
	$('.datepicker-here').datepicker({
		autoClose : true
	});
	// Access instance of plugin
	$('#my-element').data('datepicker');
	
</script>

<section class="container">
	<br><br><br><br><br><br><br><br><br>
	<div class="container">
		<div class="card mb-4">
	        
	        <div class="card-body">
	        
	            <form action="${path }/meet/meetUpdateEnd.do" enctype="multipart/form-data" method="POST" accept-charset="UTF-8">
	            	<input type="hidden" name="meetNo" value="${meet.meetNo }">
	                <div class="form-group row">
	                    <label for="??????" class="col-sm-2 col-form-label">??????</label>
	                    <div class="col-sm-8">
	                        <input type="text" class="form-control" id="inputEmail3" name="title" value="${meet.title }" placeholder="??????">
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="area" class="col-sm-2 col-form-label">??????</label>
	                    <div class="col-sm-8">
	                        <input type="text" class="form-control" id="area" name="area" value="${meet.area }" placeholder="???/???/???">
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="area" class="col-sm-2 col-form-label">??????</label>
	                    <div class="col-sm-8">
	                        <%-- <input type="text" class="form-control" id="address" name="address" value="${meet.address }" placeholder="????????????"> --%>
                        	<select class="form-control" name="area" required>
	                            <option value="" selected>????????? ???????????????</option>
	                            <optgroup label="?????????">
	                            <option value="????????????">????????????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            </optgroup>
	                            <optgroup label="????????????">
	                            <option value="???????????????">???????????????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="??????">??????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            </optgroup>
	                            <optgroup label="????????? ???">
	                            <option value="?????????">?????????</option>
	                            <option value="??????">??????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            <option value="?????????">?????????</option>
	                            </optgroup>
                           	</select>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label for="inputPassword3" class="col-sm-2 col-form-label">?????????</label>
	                    <div class="col-sm-3">
	                        <input type="text" class="form-control" id="writer"  value="${userLoggedIn.nickName }" readonly="readonly">
	                        <input type="hidden" name="userId" value="${userLoggedIn.userId }">
	                    </div>
	                </div>
					<div class="form-group row">
					   	<label for="gender" class="col-sm-2 col-form-label">??????</label>
					   	<div class="col-sm-3">
					       	<input type="text" class="form-control" name="gender" placeholder="???/???" value="${userLoggedIn.gender=='M'?'???':'???' }" readonly="readonly"> 
					    </div>
					</div>
	              	
	                <!-- ?????? ????????? -->
	                <div class="form-group row">
	                	<label for="date" class="col-sm-2 col-form-label">??????</label>
	                	<div class="col-sm-3">
	                		<input type='text' class='form-control datepicker-here' data-language='en' value="${meetDate }" name="meetDate"/>
	                	</div>
	                </div>
	                <div class="form-group row">
	                	<label for="date" class="col-sm-2 col-form-label">??????</label>
	                	<div class="col-sm-3">
	                		<input type="time" class="form-control" name="meetTime" value="${meetTime }">
	                	</div>
	                </div>
	                <!-- ???????????? ????????? ?????? -->
					<div class="form-group row">
	                    <label for="??????" class="col-sm-2 col-form-label">??????</label>
	                    <textarea id="summernote" name="content" class="col-sm-8" style="resize: none;">${meet.content }</textarea>
	                </div>
	                <div class="justify-content-center" align="center">
				        <div class="card-footer bg-white" style="align-content:center;">
				            <button type="submit" class="btn btn-outline-warning">??????</button>
				            &nbsp;&nbsp;
				            <button type="button" onclick="fn_cancel(${meet.meetNo})" class="btn">??????</button>
				        </div>
			        </div>
	            </form>
	            
	        </div>
	    </div>
	</div>
	<script>
		/* ???????????? */
		function fn_cancel(meetNo)
		{
			alert("?????????????????????.");
			location.href="${path}/meet/meetView.do?meetNo="+meetNo;
		}
	</script>
	
	
</section>


<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>


















