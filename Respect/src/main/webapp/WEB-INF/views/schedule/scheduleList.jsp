<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<style>
	
	.fa-1x{
		color: darkorange;
	}
	.ml-1{
		color:dimgray;
	}
</style>
<body>
    
        <div class="container p-3">
            <div class="row p-1">
                <div class="col-md-3 mt-4" style="border:solid 1px rgb(208, 203, 203); height:100%" align='center'>
                    <form action="${path }/schedule/scheduleFilter" method="post">
                        <br>          
                            <h6>검색범위 및 정렬방식</h6>
                            	<div class="btn-group btn-group-toggle col-md-12" data-toggle="buttons">
                                    <label class="btn btn-outline-secondary mt-1 ml-1" style="width:100%; border-radius:0;">
                                      <input type="radio" name="sort" id="option1" value="on" > 최신순
                                    </label>
                                    <label class="btn btn-outline-secondary mt-1 ml-1" style="width:100%;  border-radius:0;">
                                      <input type="radio" name="sort" id="option2" value="off" > 인기순
                                    </label>
                            </div>
                                 <br>
                        <br>
                        <div data-toggle="buttons">
                            <h6>여행 구분</h6>
                            
                            
                            <div class="btn-group btn-group-toggle col-md-12">
                                <label class="btn btn-outline-secondary mt-1 ml-1" style="width:100%; border-radius:0;">
                                  <input type="radio" name="tripType" id="beforeTrip" value='0'> 여행전
                                </label>
                                <label class="btn btn-outline-secondary mt-1 ml-1" style="width:100%; border-radius:0;">
                                  <input type="radio" name="tripType" id="afterTrip"  value='1'> 여행후 
                                </label>
                       		 </div>
                        </div>
						<br>
						
                       <div data-toggle="buttons">
							<h6>여행 테마</h6>
							
							<div class="btn-group btn-group-toggle col-md-12">
								<label class="btn btn-outline-secondary mt-1 ml-1" style="width:100%; border-radius:0;">
									<input type="radio" name="tripPartner" id="soloTheme" value="혼자"> 나홀로 여행
								</label>
								<label class="btn btn-outline-secondary mt-1 ml-1" style="width:100%; border-radius:0;">
									<input type="radio" name="tripPartner" id="friendTheme"  value="친구"> 친구와 함께
								</label>
							</div>
							

							<div class="btn-group btn-group-toggle col-md-12">
									<label class="btn btn-outline-secondary mt-1 ml-1" style="width:100%; border-radius:0;">
										<input type="radio" name="tripPartner" id="coupleTheme" value="커플"> 커플
									</label>
									<label class="btn btn-outline-secondary mt-1 ml-1" style="width:100%; border-radius:0;">
										<input type="radio" name="tripPartner" id="groupTheme" value="단체"> 단체여행
									</label>
								</div>
						 </div>
								<div>
									<input class="btn btn-outline-warning mt-3" type="submit" value="검색하기">
								</div>
                        <br>
                        
                    </form> 
				</div>
				


				<div class="p-0 ml-0 row col-md-9 ">
					<c:forEach items="${list }" var="sc">
						<c:if test="${sc.PUBLICFLAG==1}">
							<div class="col-lg-6 col-sm-6 mt-4">
									<div class="card pp" align='center' style="box-shadow: 3px 4px 5px 0 rgba(2,2,2,.2); border-radius:0;">
									<!-- Card image -->
										<img class="card-img-top" src="${path }/resources/upload/spot/thumbnail/${sc.THUMBNAIL}" style="border-radius:0;" height="220px;">
									<!-- Card content -->
									<div class="card-body">
									
										<!-- Title -->
										<a href="${path}/schedule/scheduleView?scheduleNo=${sc.SCHEDULENO}&userId=${userLoggedIn.userId}"><h4 class="card-title">${sc.TITLE}</h4></a>
										<!-- text -->
										
										<fmt:parseDate value="${sc.STARTDATE }" var="startDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="startDay"></fmt:parseNumber>
										<fmt:parseDate value="${sc.ENDDATE }" var="endDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDay"></fmt:parseNumber>
										<p class="mt-1 card-text btn-outline-secondary">
											${endDay - startDay }박${endDay - startDay +1}일 ㆍ ${sc.TRAVELTHEME} ㆍ ${sc.REPORTFLAG==0?"여행 전":"여행 후"} 
										</p>
											<div class="row pt-1" align='center'style="width:250px">
												<i class="ml-4 far fa-thumbs-up fa-1x"></i><h6 class="ml-1">${sc.GOODCOUNT }</h6>
												<i class="ml-5 far fa-heart fa-1x"></i><h6 class="ml-1">${sc.BRINGCOUNT }</h6>
												<i class="ml-5 far fa-eye fa-1x"></i><h6 class="ml-1">${sc.HITSCOUNT }</h6>
											</div>
										</div>
									</div>
								  </div>
							  </c:if>
						  </c:forEach>
					</div>
		</div>
		<br><br>
			${pageBar}
		</div>
		

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
    <script>
            $(document).ready(function(){
        
                $('.pp').hover(
                    // trigger when mouse hover
                    function(){
                        $(this).animate({
                            marginTop: "-=1%",
                        },200);
                    },
        
                    // trigger when mouse out
                    function(){
                        $(this).animate({
                            marginTop: "0%"
                        },200);
                    }
                );
            });
        </script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>