<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	td>a{
		text-decoration: none;
		color:black;
	}
</style>
<script>
	function fn_goNoticeWrite() {
		
		location.href='${pageContext.request.contextPath}/notice/noticeWrite.do';
	}
	
	function check() {

		if(fr.searchText.value == "") {

		  alert("검색어를 입력해 주세요.");

		  fr.searchText.focus();

		  return false;

		}else{
		 return true;
		    }
		}
</script>

	<div class="container">
        <h4 class="text-center pt-5">공지</h1>
        <p class="text-center py-4">제주도의 공지사항을 알려드립니다</p>
       	<c:if test="${userLoggedIn.userId=='admin'}">
        	<input type="button" value="글쓰기" style="float:right;" class="btn btn-outline-warning mb-3" onclick="fn_goNoticeWrite()"/>
        </c:if>
        <div class="table-responsive">
            <table class="table text-center">
                <thead>
                    <tr id="ta-header">
                        <th>글번호</th>
                        <th style="width: 400px;">제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>첨부파일</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="nb">
                    <tr>
                        <td>${nb.NOTICENO}</td>
                        <td><a href="${pageContext.request.contextPath}/notice/notice-view.do?noticeNo=${nb.NOTICENO}&searchText=null">${nb.TITLE}</a></td>
                        <td><fmt:formatDate value="${nb.WRITEDATE}" pattern="yyyy년MM월dd일 E요일"/></td>
                        <td>${nb.HITSCOUNT}</td>
                        
                        <td align="center">
				            <c:if test="${nb.FILECOUNT>0}">
				                <img alt="첨부파일" src="${pageContext.request.contextPath}/resources/img/main/if_files-folders-48_808600.png">
				            </c:if>
				        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <nav class="d-flex justify-content-center pt-4 pb-3">
            ${pageBar}<br>
        </nav>

		<form name="fr" method="get" action="${path}/notice/noticeSearch" onsubmit="return check()">
	        <div class="row mb-5 justify-content-center" style="background-color:#efefef;">
	        	
	            <div class="input-group w-50 my-2">
				  <input type="text" class="form-control" placeholder="제목 또는 내용 입력" name="searchText">
				  <div class="input-group-append">
				    <button class="btn btn-warning" type="submit">검색</button> 
				  </div>
				</div>
				
	        </div>
	  	</form>
        
        
        
    </div>
    
<%@ include file="/WEB-INF/views/common/footer.jsp"%>