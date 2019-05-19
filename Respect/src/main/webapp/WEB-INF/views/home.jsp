<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="{pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 메인페이지 -->
<script src="${path}/resources/js/Simple-Slider.js"></script>
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<link rel="stylesheet" href="${path}/resources/css/weather-icons-master/css/weather-icons-wind.css">
<link rel="stylesheet" href="${path}/resources/css/weather-icons-master/css/weather-icons-wind.min.css">
<link rel="stylesheet" href="${path}/resources/css/weather-icons-master/css/weather-icons.css">
<link rel="stylesheet" href="${path}/resources/css/weather-icons-master/css/weather-icons.min.css">
<link rel="stylesheet" href="${path}/resources/css/styles2.css">


    
    <div class="container" style="height: 170px;">
        빈공간 생성용
    </div>
    <!-- header -->

    <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="row">
            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li class="item1 active" data-target="#demo" data-slide-to="0" class="active"></li>
              <li class="item2" data-target="#demo" data-slide-to="1"></li>
              <li class="item3" data-target="#demo" data-slide-to="2"></li>
            </ul>
            
            <!-- The slideshow -->
            <div class="carousel-inner col-12 px-0">
              <div class="carousel-item active">
                <img class="img-fluid" src="https://www.visitjeju.net/ckImage/201611/ckeditor_7681234462167691262.jpg" alt="" style="max-height: 550px;">
              </div>
              <div class="carousel-item">
                <img class="img-fluid" src="https://www.visitjeju.net/ckImage/201706/web/ckeditor_1273371715073741195.jpg" alt="" style="max-height: 550px;">
              </div>
              <div class="carousel-item">
                <img class="img-fluid" src="https://www.visitjeju.net/ckImage/201611/ckeditor_5877082166042270343.jpg" alt="" style="max-height: 550px;">
              </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev col-sm-6" href="#myCarousel" data-slide="prev">
              <span><img class="img-fluid" src="${path }/resources/img/main/prev.png" style="width: 50px; height: 46px;"/></span>
            </a>
            <a class="carousel-control-next col-sm-6" href="#myCarousel" data-slide="next">
              <span><img class="img-fluid" src="${path }/resources/img/main/next.png" style="width: 50px; height: 46px;"/></span>
            </a>
        </div>
    </div>
    
    <div id="meeting-category" class="container my-5">
        
        <div class="row justify-content-center ">
            <h3 style="font-weight: bold">여행 친구 구하기</h3>
        </div>

        <div class="row justify-content-center mb-5">
            <p style="font-size:20px; color: #959595;">당신의 여행 친구가 필요하신가요?</p>
        </div>

        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6  py-0 pl-3 pr-1 mt-4 featcard">
                <div id="featured" class="carousel slide carousel-fade" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="card bg-dark text-white">
                                <img class="card-img img-fluid" src="${path }/resources/img/main/여행친구1.jpg" alt="">
                                <div class="card-img-overlay d-flex linkfeat">
                                    <a href="#" class="align-self-end">
                                        <span class="badge">여행친구</span>
                                        <h4 class="card-title">즐거운 여행! 혼자하긴 심심하시죠? 드루와 다 드루와~</h4>
                                        <p class="textfeat" style="display: none;">내용 불라불라~내용 불라불라~더 많은 내용을 볼려면 클릭 클릭!!
                                        </p>
                                    </a>
                                </div>
                            </div>
                        </div>
                                    
                        <div class="carousel-item">
                            <div class="card bg-dark text-white">
                                <img class="card-img img-fluid" src="${path }/resources/img/main/여행친구2.jpg" alt="">
                                <div class="card-img-overlay d-flex linkfeat">
                                    <a href="#" class="align-self-end">
                                        <span class="badge">여행친구</span>
                                        <h4 class="card-title">즐거운 여행! 혼자하긴 심심하시죠? 드루와 다 드루와~</h4>
                                        <p class="textfeat" style="display: none;">내용 불라불라~내용 불라불라~</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="carousel-item">
                            <div class="card bg-dark text-white">
                                <img class="card-img img-fluid" src="${path }/resources/img/main/여행친구3.jpg" alt="">
                                <div class="card-img-overlay d-flex linkfeat">
                                    <a href="#" class="align-self-end">
                                        <span class="badge">여행친구</span>
                                        <h4 class="card-title">즐거운 여행! 혼자하긴 심심하시죠? 드루와 다 드루와~</h4>
                                        <p class="textfeat" style="display: none;">내용 불라불라~내용 불라불라~</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="card bg-dark text-white">
                                <img class="card-img img-fluid" src="${path }/resources/img/main/여행친구6.jpg" alt="">
                                <div class="card-img-overlay d-flex linkfeat">
                                    <a href="#" class="align-self-end">
                                        <span class="badge">여행친구</span>
                                        <h4 class="card-title">즐거운 여행! 혼자하긴 심심하시죠? 드루와 다 드루와~</h4>
                                        <p class="textfeat" style="display: none;">내용 불라불라~내용 불라불라~</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">			 
                            <div class="card bg-dark text-white">
                                <img class="card-img img-fluid" src="${path }/resources/img/main/여행친구5.jpg" alt="">
                                <div class="card-img-overlay d-flex linkfeat">
                                    <a href="#" class="align-self-end">
                                        <span class="badge">여행친구</span> 
                                        <h4 class="card-title">즐거운 여행! 혼자하긴 심심하시죠? 드루와 다 드루와~</h4>
                                        <p class="textfeat" style="display: none;">내용 불라불라~내용 불라불라~</p>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="carousel-item">			  
                            <div class="card bg-dark text-white">
                                <img class="card-img img-fluid" src="${path }/resources/img/main/게스트하우스4.gif" alt="">
                                <div class="card-img-overlay d-flex linkfeat">
                                    <a href="#" class="align-self-end">
                                        <span class="badge">여행친구</span> 
                                        <h4 class="card-title">즐거운 여행! 혼자하긴 심심하시죠? 드루와 다 드루와~</h4>
                                        <p class="textfeat" style="display: none;">내용 불라불라~내용 불라불라~</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- friend-left-category -->

            <div class="col-6 py-0 px-1 mt-4 d-none d-lg-block">
                <div class="row">
                    <div class="col-6 pb-2 mg-1	">
                        <div class="card bg-dark text-white">
                            <img class="card-img img-fluid" src="${path }/resources/img/main/술자리1.jpg" alt="" style="max-height: 148.5px;">
                            <div class="card-img-overlay d-flex">
                                <a href="http://gerbong.id/bi-atur-standarisasi-qr-code" class="align-self-end">
                                <span class="badge">모임</span> 
                                <h6 class="card-title">즐거운 술자리~</h6>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-6 pb-2 mg-2	">
                        <div class="card bg-dark text-white">
                            <img class="card-img img-fluid" src="${path }/resources/img/main/밤길1.jpg" alt="" style="max-height: 148.5px;">
                            <div class="card-img-overlay d-flex">
                                <a href="http://gerbong.id/ptsp-bp-batam-masuk-10-terbaik-di-indonesia" class="align-self-end">
                                <span class="badge">모임</span> 
                                <h6 class="card-title">아름다운 밤길~</h6>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-6 pb-2 mg-3	">
                        <div class="card bg-dark text-white">
                            <img class="card-img img-fluid" src="${path }/resources/img/main/파티1.jpg" alt="" style="max-height: 148.5px;">
                            <div class="card-img-overlay d-flex">
                                <a href="http://gerbong.id/review-gsp-amerika-ingin-perdagangan-saling-menguntungkan" class="align-self-end">
                                <span class="badge">모임</span> 
                                <h6 class="card-title">파티 파티 파티~</h6>
                                </a>
                            </div>
                        </div>
                    </div>
                                
                    <div class="col-6 pb-2 mg-4	">
                        <div class="card bg-dark text-white">
                            <img class="card-img img-fluid" src="${path }/resources/img/main/밤길2.jpg" alt="" style="max-height: 148.5px;">
                            <div class="card-img-overlay d-flex">
                                <a href="http://gerbong.id/dpr-setujui-penambahan-anggaran-bp-batam-rp565-miliar" class="align-self-end">
                                <span class="badge">모임</span> 
                                <h6 class="card-title">쓸말이 없다...</h6>
                                </a>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!-- friend-right-category -->
        </div>
        <!-- friend-category -->

    </div>

    <div class="pt-2 pb-4" style="background: #ebebeb; width: 100% !important;">
        <div id="gusthouse-category" class="container my-5">

            <div class="row justify-content-center">
                <h3 style="font-weight: bold">G U E S T H O U S E</h3>
            </div>

            <div class="row justify-content-center">
                <h4 style="color: #959595;">숙소</h4>
            </div>
        
            <div class="accordian mt-5">
                    <ul>
                        <li>
                            <div class="image_title">
                                <a href="https://www.youtube.com/channel/UCXTfDJ60DBmA932Du6B1ydg">숙소1</a>
                            </div> 
                            <a href="#">
                                <img src="${path }/resources/img/main/게스트하우스5.jpg"/>
                            </a>
                        </li>
                        <li>
                            <div class="image_title">
                                <a href="https://www.youtube.com/channel/UCXTfDJ60DBmA932Du6B1ydg">숙소2</a>
                            </div>
                            <a href="#">
                                <img src="${path }/resources/img/main/게스트하우스4.gif"/>
                            </a>
                        </li>
                        <li>
                            <div class="image_title">
                                <a href="https://www.youtube.com/channel/UCXTfDJ60DBmA932Du6B1ydg">숙소3</a>
                            </div>
                            <a href="#">
                                <img src="${path }/resources/img/main/게스트하우스3.jpg"/>
                            </a>
                        </li>
                        <li>
                            <div class="image_title">
                                <a href="#">숙소4</a>
                            </div>
                            <a href="#">
                                <img src="${path }/resources/img/main/게스트하우스2.gif"/>
                            </a>
                        </li>
                        <li>
                            <div class="image_title">
                                <a href="#">숙소5</a>
                            </div>
                            <a href="#">
                                <img src="${path }/resources/img/main/게스트하우스1.jpg"/>
                            </a>
                        </li>
                    </ul>
                </div>
            
            </div>
        </div>

        <div class="container my-5" id="place-category">
            <div class="row justify-content-center">
                <h3 style="font-weight: bold">H O T P L A C E</h3>
            </div>

            <div class="row justify-content-center">
                <h4 style="color: #959595;">관광지</h4>
            </div>
            
        
            <div class="accordian mt-5">
                <ul>
                    <li>
                        <div class="image_title">
                            <a href="https://www.youtube.com/channel/UCXTfDJ60DBmA932Du6B1ydg">관광지1</a>
                        </div> 
                        <a href="#">
                            <img src="${path }/resources/img/main/관광지1.jpg"/>
                        </a>
                    </li>
                    <li>
                        <div class="image_title">
                            <a href="https://www.youtube.com/channel/UCXTfDJ60DBmA932Du6B1ydg">관광지2</a>
                        </div>
                        <a href="#">
                            <img src="${path }/resources/img/main/관광지2.gif"/>
                        </a>
                    </li>
                    <li>
                        <div class="image_title">
                            <a href="https://www.youtube.com/channel/UCXTfDJ60DBmA932Du6B1ydg">관광지3</a>
                        </div>
                        <a href="#">
                            <img src="${path }/resources/img/main/관광지3.jpg"/>
                        </a>
                    </li>
                    <li>
                        <div class="image_title">
                            <a href="#">관광지4</a>
                        </div>
                        <a href="#">
                            <img src="${path }/resources/img/main/관광지4.jpg"/>
                        </a>
                    </li>
                    <li>
                        <div class="image_title">
                            <a href="#">관광지5</a>
                        </div>
                        <a href="#">
                            <img src="${path }/resources/img/main/관광지5.jpg"/>
                        </a>
                    </li>
                </ul>
            </div>
                
        </div>

    <!-- 관광지 끝 -->

    <div class="pt-2 pb-4" style="background: #ebebeb; width: 100% !important;">
        <div class="container py-5">
            <div class="row justify-content-center">
                <h3 style="font-weight: bold">N O T I C E</h3>
            </div>

            <div class="row justify-content-center mb-5">
                <h4 style="color: #959595;">후기 및 공지</h4>
            </div>


            <div class="row justify-content-center">
                <div class="col-sm-12 col-lg-6 mr-3" style="border-top:1px solid orange;">
                    <h3 class="my-3"><a href="#">후기글</a></h3>
                    <div class="row align-items-center">
                        <div class="col-lg-6 col-md-12 col-sm-6">
                            <a href="#"><img class="img-fluid" src="${path }/resources/img/main/여행친구4.jpg" alt=""></a>
                        </div>
                        <div class="col">
                            <p class="mb-2">2018-08-29</p>
                            <h4><a href="#">공항 탐방썰 푼다 주작 아님 ㄹㅇ루다가</a></h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 item" style="border-top:1px solid orange;">
                    <h3 class="col-12 my-3"><a href="#">공지사항</a></h3>
                    <a href="#"><img class="img-fluid px-3 mx-auto" src="${path }/resources/img/main/관광지6.jpg" alt=""></a>
                    <div class="row justify-content-center">
                        <p class="my-2">2018-08-29</p>
                        <h5><a href="#">공지사항 안내드려요~ 다들 주목~</a></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 공지 끝! -->
    
<%@ include file="/WEB-INF/views/common/footer.jsp"%>