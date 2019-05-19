<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
    th{
        font-size: 18px;
        border-right: 1px solid #e5e5e5;
        width: 100px;
    }
    pre{
        font-size: 16px;
    }
</style>

<script>
	function fileDownload(oName, rName) {
		//한글파일명이 있을 수 있으므로, 명시적으로 encoding
		oName = encodeURIComponent(oName);
		location.href = "${pageContext.request.contextPath}/notice/fileDownload.do?oName="
				+ oName + "&rName=" + rName;
	}
</script>
    <div class="container">
        <div class="row my-5">
            <div class="col text-center">
             <h4>공지</h4>
             <p class="mt-3">제주도의 공지사항을 알려드립니다.</p>
            </div>
        </div>
	
        <div class="table">
            <table class="table">
                <tbody>
               	<c:forEach items="${list}" var="nv">
                    <tr style="border-top: 2px solid black;">
                    	<th>글번호</th>
                    	<td>${nv.noticeNo}</td>
                    </tr>
                    <tr>
                    	<th>제목</th>
                        <td>${nv.title}</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <p>
				                ${nv.content}
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>관리자</td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td>${nv.writeDate}</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #e5e5e5;">
                        <th>조회수</th>
                        <td>${nv.hitsCount}</td>
                    </tr>
                    
                    <tr>
                    	<th>첨부파일</th>
                    	<td>
                    		<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				                <button type="button" class="btn btn-outline-warning btn-block"
				                    onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">
				                   	 첨부파일 - ${a.originalFileName }</button>
				            </c:forEach>
                    	</td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
		
		
        <div class="row text-center my-5">
        <c:if test="${userLoggedIn.userId=='admin'}">
            <!-- <div class="col text-right" >
                <a class="btn btn-warning" href="#" onClick='fn_update()'>수정</a>
            </div> -->
            <div class="col">
                <a class="btn btn-warning" href="${path}/notice/notice-del.do?noticeNo=${nv.noticeNo}">삭제</a>
            </div>
            </c:if>
        </div>
        
		</c:forEach>
		
    </div>
<!-- <script>

function fn_update(){
	
	var form = document.getElementById("noticeView");
	form.action = "<c:url value='${path}/notice/noticeUpdate.do?noticeNo=${nv.noticeNo}'/>";
	form.submit();
}

</script> -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>