<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container col-sm-5">
        <div class="row my-5">
            <h4>공지글 작성</h4>
        </div>

        <form action="${pageContext.request.contextPath}/notice/noticeWriteEnd.do" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" required/>
            </div>
            <div class="form-group">
                <label for="cont">내용</label>
                <input type="text" class="form-control" id="cont" name="content" placeholder="내용을 입력해주세요" required/>
            </div>

            <div class="input-group mt-5" style="padding:0px;">
                 <div class="custom-file">
                     <input class="form-control-file border" type="file"  name="upFile" id="upFile"/>
                 </div>
             </div>


            <div class="row justify-content-center mt-5">
                <div class="col text-right">
                    <input type="submit" value="등록" class="btn btn-warning"/>
                </div>
                <div class="col">
                    <a class="btn btn-warning" href="${path}/notice/notice-board.do">취소</a>
                </div>
            </div> 
        </form>
    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>