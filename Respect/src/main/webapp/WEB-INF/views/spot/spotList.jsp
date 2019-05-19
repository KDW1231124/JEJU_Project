<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="{pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
	#detail .place_card a, #detail .place_card a:hover {
		color: #000;
		text-decoration: none;
	}
	.pagination_jeju {
		margin-top: 50px;
	}
	.pagination_jeju .page-item .page-link {
		color: #000;
	}
	.pagination_jeju .page-item.active .page-link {
		color: #fff;
		background-color: #ffb53c;
		border-color: #ffb53c;
	}
	#detail .container .card-deck .card {
		box-shadow: 3px 4px 5px 0 rgba(2,2,2,.2);
	}
	.map-row {
		border: 1px solid #e5e5e5;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var temp = $('#minorcategory').val();
		if(temp=='자연') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c1').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='문화관광') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c2').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='레저/체험') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c3').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='테마관광지') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c4').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='섬속의섬') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c5').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='도보') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c6').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='포토스팟') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c7').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='4.3 70주년') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c8').prop('style', 'background: #ffb53c;color: #fff;')
		}
		if(temp=='템플스테이') {
			$('.tag-all').prop('style', 'padding:0;')
			$('.cate').removeProp('style', 'background: #ffb53c;color: #fff;')
			$('#c9').prop('style', 'background: #ffb53c;color: #fff;')
		}
	});
</script>



<style>
.layer_map_area {
	position: relative;
	margin: 0 auto;
	width: 866px;
	height: auto;
	margin-top: 52px;
}

.layer_map_area .layer_map ul {
	position: relative;
	height: 400px;
	background: url(${path }/resources/img/spot/222.png) no-repeat center 0;
}

.layer_map_area .layer_map ul li {
	list-style: none;
}

.layer_map_area .layer_map a {
	display: inline-block;
	margin: 0;
	padding: 10px 20px;
	position: absolute;
	left: 50%;
	color: transparent;
	background: transparent
}

.layer_map_area .layer_map ul.jejusi {
	background-position: center -400px
}

.layer_map_area .layer_map ul.jocheon {
	background-position: center -801px
}

.layer_map_area .layer_map ul.gujwa {
	background-position: center -1202px
}

.layer_map_area .layer_map ul.seongsan {
	background-position: center -1603px
}

.layer_map_area .layer_map ul.pyoseon {
	background-position: center -2004px
}

.layer_map_area .layer_map ul.namwon {
	background-position: center -2405px
}

.layer_map_area .layer_map ul.seogwipo {
	background-position: center -2806px
}

.layer_map_area .layer_map ul.jungmun {
	background-position: center -3207px
}

.layer_map_area .layer_map ul.andeok {
	background-position: center -3608px
}

.layer_map_area .layer_map ul.daejong {
	background-position: center -4009px
}

.layer_map_area .layer_map ul.hangyeong {
	background-position: center -4410px
}

.layer_map_area .layer_map ul.halim {
	background-position: center -4810px
}

.layer_map_area .layer_map ul.aewol {
	background-position: center -5211px
}

.layer_map_area .layer_map ul.chusado {
	background-position: center -5613px
}

.layer_map_area .layer_map ul.biyangdo {
	background-position: center -6014px
}

.layer_map_area .layer_map ul.chagwido {
	background-position: center -6415px
}

.layer_map_area .layer_map ul.gapado {
	background-position: center -6815px
}

.layer_map_area .layer_map ul.marado {
	background-position: center -7216px
}

.layer_map_area .layer_map ul.udo {
	background-position: center -7615px
}

.layer_map_area .layer_map a.jejusi {
	margin-left: -70px;
    top: 70px;
    width: 130px;
    height: 90px;
}

.layer_map_area .layer_map a.aewol {
	margin-left: -140px;
    top: 90px;
    width: 70px;
    height: 100px;
}

.layer_map_area .layer_map a.halim {
	margin-left: -220px;
    top: 160px;
    height: 35px;
}

.layer_map_area .layer_map a.hangyeong {
	margin-left: -250px;
    top: 200px;
    width: 70px;
    height: 30px;
}

.layer_map_area .layer_map a.jocheon {
	margin-left: 70px;
    top: 41px;
    width: 35px;
    height: 110px;
}

.layer_map_area .layer_map a.gujwa {
    margin-left: 120px;
    top: 19px;
    width: 90px;
    height: 110px;
}

.layer_map_area .layer_map a.seogwipo {
	margin-left: -10px;
    top: 200px;
    height: 80px;
    width: 50px;
}

.layer_map_area .layer_map a.daejong {
    margin-left: -220px;
    top: 240px;
    width: 48px;
    height: 70px;
}

.layer_map_area .layer_map a.andeok {
	margin-left: -170px;
    top: 210px;
    height: 76px;
    width: 50px;
}

.layer_map_area .layer_map a.jungmun {
	margin-left: -90px;
    top: 190px;
    width: 80px;
    height: 100px;
}

.layer_map_area .layer_map a.namwon {
    margin-left: 50px;
    top: 160px;
    width: 70px;
    height: 100px;
}

.layer_map_area .layer_map a.pyoseon {
    margin-left: 140px;
    top: 130px;
    height: 90px;
    width: 60px;
}

.layer_map_area .layer_map a.seongsan {
    margin-left: 195px;
    top: 110px;
    width: 50px;
    height: 80px;
}

.layer_map_area .layer_map a.chusado {
	margin-left: -190px;
    top: 9px;
    width: 80px;
    height: 50px;
}

.layer_map_area .layer_map a.biyangdo {
    margin-left: -270px;
    top: 120px;
}

.layer_map_area .layer_map a.chagwido {
	margin-left: -340px;
    top: 200px;
    height: 30px;
}

.layer_map_area .layer_map a.gapado {
    margin-left: -240px;
    top: 320px;
}

.layer_map_area .layer_map a.marado {
    margin-left: -240px;
    top: 370px;
}

.layer_map_area .layer_map a.udo {
	margin-left: 270px;
    top: 44px;
    height: 42px;
    width: 40px;
}
</style>

<main class="page landing-page">
	<input type="hidden" id="minorcategory" name="minorcategory2" value="${minorcategory}" />
	<input type="hidden" id="area" name="area2" value="${area}" />
	<input type="hidden" id="page" name="page" value="" />
	
	
	<section class="clean-block slider dark" style="padding:0;margin:0 0 100px;">
		<img src="${path }/resources/img/spot/성산일출봉.gif" style="width:100%;">
	</section>
	<section id="map-index">
	    <div class="container">
	        <h2>제주도 모든 여행지를 한 눈에…<br></h2>
	        <h5>내가 가본 제주는 어디까지일까? 수많은 제주의 아름다운 여행지를 취향에 맞게 선택해보자. 368개의 크고 작은 오름을 비롯하여 눈 돌리면 어디에서나 마주치는 한라산 그리고 푸른 바다…. 제주의 보석 같은 여행지가 여러분의 선택을 기다린다.<br></h5>
	        	
			<div class="layer_map_area">
				<div class="layer_map">
					<ul>
						<li><a href="javascript:void(0)" class="jejusi">제주시</a></li>
						<li><a href="javascript:void(0)" class="aewol">애월</a></li>
						<li><a href="javascript:void(0)" class="halim">한림</a></li>
						<li><a href="javascript:void(0)" class="hangyeong">한경</a></li>
						<li><a href="javascript:void(0)" class="jocheon">조천</a></li>
						<li><a href="javascript:void(0)" class="gujwa">구좌</a></li>
						<li><a href="javascript:void(0)" class="seogwipo">서귀포</a></li>
						<li><a href="javascript:void(0)" class="daejong">대정</a></li>
						<li><a href="javascript:void(0)" class="andeok">안덕</a></li>
						<li><a href="javascript:void(0)" class="jungmun">중문</a></li>
						<li><a href="javascript:void(0)" class="namwon">남원</a></li>
						<li><a href="javascript:void(0)" class="pyoseon">표선</a></li>
						<li><a href="javascript:void(0)" class="seongsan">성산</a></li>
						<li><a href="javascript:void(0)" class="udo">우도</a></li>
						<li><a href="javascript:void(0)" class="chusado">추자도</a></li>
						<li><a href="javascript:void(0)" class="marado">마라도</a></li>
						<li><a href="javascript:void(0)" class="biyangdo">비양도</a></li>
						<li><a href="javascript:void(0)" class="chagwido">차귀도</a></li>
						<li><a href="javascript:void(0)" class="gapado">가파도</a></li>
					</ul>
				</div>
				<button class="btn btn-outline-warning map-btn" type="button" onclick="fn_searchAll()">전체지역</button>
			</div>

       	</div>
	</section>
	<section id="map-tag">
	    <div class="container">
	        <div class="row map-row">
	            <div class="col-xl-1 tag-all cate" style="padding:0px;background: #ffb53c;color: #fff;">
	        	<a href="javascript:fn_searchAll()">
	                <h5>전체</h5>
	            </a>
	            </div>
	            <div class="col">
	                <a href="javascript:fn_search('자연')">
                	<div class="row cate" id="c1">
	                	<div class="col">
	                        <h5>자연</h5>
	                    </div>
	                </div>
	                	
	                </a>
	                <a href="javascript:fn_search('섬속의섬')">
	                <div class="row cate" id="c5">
	                    <div class="col">
	                        <h5>섬속의섬</h5>
	                    </div>
	                </div>
	                </a>
	                <a href="javascript:fn_search('템플스테이')">
	                <div class="row cate" id="c9">
	                    <div class="col">
	                        <h5>템플스테이</h5>
	                    </div>
	                </div>
	                </a>
	            </div>
	            <div class="col">
	            	<a href="javascript:fn_search('문화관광')">
	                <div class="row cate" id="c2">
	                    <div class="col">
	                        <h5>문화관광</h5>
	                    </div>
	                </div>
	                </a>
	                <a href="javascript:fn_search('도보')">
	                <div class="row cate" id="c6">
	                    <div class="col">
	                        <h5>도보</h5>
	                    </div>
	                </div>
	                </a>
	                <div class="row">
	                    <div class="col">
	                        <h5>-</h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col">
	            	<a href="javascript:fn_search('레저/체험')">
	                <div class="row cate" id="c3">
	                    <div class="col">
	                        <h5>레저/체험<br></h5>
	                    </div>
	                </div>
	                </a>
	                <a href="javascript:fn_search('포토스팟')">
	                <div class="row cate" id="c7">
	                    <div class="col">
	                        <h5>포토/스팟</h5>
	                    </div>
	                </div>
	                </a>
	                <div class="row">
	                    <div class="col">
	                        <h5>-</h5>
	                    </div>
	                </div>
	            </div>
	            <div class="col">
	            	<a href="javascript:fn_search('테마관광지')">
	                <div class="row cate" id="c4">
	                    <div class="col">
	                        <h5>테마관광지</h5>
	                    </div>
	                </div>
	                </a>
	                <a href="javascript:fn_search('4.3 70주년')">
	                <div class="row cate" id="c8">
	                    <div class="col">
	                        <h5>4.3 70주년</h5>
	                    </div>
	                </div>
	                </a>
	                <div class="row">
	                    <div class="col">
	                        <h5>-</h5>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<section id="detail">
	    <div class="container">
		    <div class="d-flex justify-content-between">
				<h4 style="margin: 10px 0 0 ;">전체&nbsp;<small>${totalContents }</small></h4>
				
		        <div class="btn-group">
		            <input type="text" class="form-control" name="keyword" placeholder="이름 또는 주소">&nbsp;&nbsp;
		            <button class="btn btn-outline-secondary" type="button" onclick="fn_selectSearch22()">검색</button>
	            </div>
            </div>
	        <div class="card-deck row place_card" style="display: flex;flex-wrap: wrap;">
	        	<c:forEach items="${list}" var="p">
	        	<div class="col-4 mt-4 px-3">
		        	<div class="card m-0">
		        		<img class="card-img-top" src="${path }/resources/upload/spot/thumbnail/${p.thumbnail}" style="height: 200px">
		                <div class="card-body">
		                <c:choose>
		                <c:when test="${userLoggedIn ne null}">
		                    <h4 class="text-center card-title"><a href="${path }/spot/spotViewLogin.do?spotno=${p.placeno}&userid=${userLoggedIn.userId}">${p.title}</a></h4>
		                </c:when>
						<c:otherwise>
		               		<h4 class="text-center card-title"><a href="${path }/spot/spotView.do?spotno=${p.placeno}">${p.title}</a></h4>
						</c:otherwise>
						</c:choose>
		                    <p class="text-center card-text" style="margin:0;">${p.area}</p>
		                    <p class="text-center" style="color:#ffb53c;">#${p.minorcategory}</p>
		                    <div class="row row-icon">
		                        <div class="col"><i class="fa fa-thumbs-o-up icon" style="font-size: 20px;"></i>
		                            <p>좋아요</p>
		                            <p>${p.goodcount}</p>
		                            
		                        </div>
		                        <div class="col"><i class="fa fa-heart icon" style="font-size: 20px;"></i>
		                            <p>찜하기</p>
		                            <p>${p.bringcount}</p>
		                        </div>
		                        <div class="col"><i class="fa fa-commenting-o icon" style="font-size: 20px;"></i>
		                            <p>리뷰</p>
		                            <p>${p.replycount}</p>
		                        </div>
		                    </div>
		                </div>
		            </div>
	            </div>
	            </c:forEach>
            </div>
            ${pageBar }<br/>
        </div>
        <c:if test="${userLoggedIn.userLevel==1}">
        	<button class="btn btn-outline-warning btn-block" type="button" onclick="fn_spotEnrollgo()">장소 등록</button>
        </c:if>
    </section>
</main>
	
<script>
$(document).ready(function() {
	$('.jejusi').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('jejusi');
		location.href="${path}/spot/searchAreaList.do?area=제주시내&major=관광지";
	});
	$('.aewol').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('aewol');
		location.href="${path}/spot/searchAreaList.do?area=애월읍&major=관광지";
	});
	$('.halim').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('halim');
		location.href="${path}/spot/searchAreaList.do?area=한림읍&major=관광지";
	});
	$('.hangyeong').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('hangyeong');
		location.href="${path}/spot/searchAreaList.do?area=한경면&major=관광지";
	});
	$('.jocheon').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('jocheon');
		location.href="${path}/spot/searchAreaList.do?area=조천읍&major=관광지";
	});
	$('.gujwa').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('gujwa');
		location.href="${path}/spot/searchAreaList.do?area=구좌읍&major=관광지";
	});
	$('.seogwipo').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('seogwipo');
		location.href="${path}/spot/searchAreaList.do?area=서귀포시내&major=관광지";
	});
	$('.daejong').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('daejong');
		location.href="${path}/spot/searchAreaList.do?area=대정읍&major=관광지";
	});
	$('.andeok').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('andeok');
		location.href="${path}/spot/searchAreaList.do?area=안덕면&major=관광지";
	});
	$('.jungmun').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('jungmun');
		location.href="${path}/spot/searchAreaList.do?area=중문&major=관광지";
	});
	$('.namwon').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('namwon');
		location.href="${path}/spot/searchAreaList.do?area=남원읍&major=관광지";
	});
	$('.pyoseon').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('pyoseon');
		location.href="${path}/spot/searchAreaList.do?area=표선읍&major=관광지";
	});
	$('.seongsan').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('seongsan');
		location.href="${path}/spot/searchAreaList.do?area=성산읍&major=관광지";
	});
	$('.udo').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('udo');
		location.href="${path}/spot/searchAreaList.do?area=우도&major=관광지";
	});
	$('.chusado').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('chusado');
		location.href="${path}/spot/searchAreaList.do?area=추자도&major=관광지";
	});
	$('.marado').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('marado');
		location.href="${path}/spot/searchAreaList.do?area=마라도&major=관광지";
	});
	$('.biyangdo').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('biyangdo');
		location.href="${path}/spot/searchAreaList.do?area=비양도&major=관광지";
	});
	$('.chagwido').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('chagwido');
		location.href="${path}/spot/searchAreaList.do?area=차귀도&major=관광지";
	});
	$('.gapado').click(function() {
		$(this).parent().parent().removeAttr('class').attr('class', '');
		$(this).parent().parent().addClass('gapado');
		location.href="${path}/spot/searchAreaList.do?area=가파도&major=관광지";
	});
});


	function fn_selectSearch22() {
		location.href="${path}/spot/selectSearchList.do?keyword="+$('input[name=keyword]').val();
	}

	function fn_spotEnrollgo() {
		location.href="${path}/spot/spotEnroll.do";
	}
	
	function fn_search(minorcategory) {
		location.href="${path}/spot/searchCategoryList.do?minorcategory="+minorcategory;
	}
	
	function fn_searchAll() {
		location.href="${path}/spot/placeList.do";
	}
	
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var temp2 = $('#area').val();
		if(temp2=='제주시내') {
			$('.jejusi').parent().parent().addClass('jejusi');
		}
		if(temp2=='조천읍') {
			$('.jocheon').parent().parent().addClass('jocheon');
		}
		if(temp2=='구좌읍') {
			$('.gujwa').parent().parent().addClass('gujwa');
		}
		if(temp2=='애월읍') {
			$('.aewol').parent().parent().addClass('aewol');
		}
		if(temp2=='한림읍') {
			$('.halim').parent().parent().addClass('halim');
		}
		if(temp2=='한경면') {
			$('.hangyeong').parent().parent().addClass('hangyeong');
		}
		if(temp2=='서귀포시내') {
			$('.seogwipo').parent().parent().addClass('seogwipo');
		}
		if(temp2=='남원읍') {
			$('.namwon').parent().parent().addClass('namwon');
		}
		if(temp2=='표선읍') {
			$('.pyoseon').parent().parent().addClass('pyoseon');
		}
		if(temp2=='성산읍') {
			$('.seongsan').parent().parent().addClass('seongsan');
		}
		if(temp2=='중문') {
			$('.jungmun').parent().parent().addClass('jungmun');
		}
		if(temp2=='안덕면') {
			$('.andeok').parent().parent().addClass('andeok');
		}
		if(temp2=='대정읍') {
			$('.daejong').parent().parent().addClass('daejong');
		}
		if(temp2=='추자도') {
			$('.chusado').parent().parent().addClass('chusado');
		}
		if(temp2=='우도') {
			$('.udo').parent().parent().addClass('udo');
		}
		if(temp2=='차귀도') {
			$('.chagwido').parent().parent().addClass('chagwido');
		}
		if(temp2=='가파도') {
			$('.gapado').parent().parent().addClass('gapado');
		}
		if(temp2=='마라도') {
			$('.marado').parent().parent().addClass('marado');
		}
		if(temp2=='비양도') {
			$('.biyangdo').parent().parent().addClass('biyangdo');
		}
	});
</script>
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>