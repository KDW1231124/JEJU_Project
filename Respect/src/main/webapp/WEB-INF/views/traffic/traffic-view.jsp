<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>

$(function(){
        // 교통내용
        $(".tmenu>a").click(function(){

                $(this).parents(".tmenu").css("background","orange");
                $(this).parents(".tmenu").siblings().css("background","white");
                $(this).css("color","white");
                $(this).parents(".tmenu").siblings().children().css("color","gray");
        });
        
        // $("#boat-table").hide();
        $("#taxi-table").hide();
        $("#rcar-table").hide();
        $("#bus-table").hide();

        

        $("#boat-btn>a").click(function(){
            $("#boat-table").show();
            $("#taxi-table").hide();
            $("#rcar-table").hide();
            $("#bus-table").hide();
        });

        $("#taxi-btn>a").click(function(){
            $("#boat-table").hide();
            $("#rcar-table").hide();
            $("#bus-table").hide();
            $("#taxi-table").show();
        });

        $("#rcar-btn>a").click(function(){
            $("#boat-table").hide();
            $("#taxi-table").hide();
            $("#bus-table").hide();
            $("#rcar-table").show();
        });

        $("#bus-btn>a").click(function(){
            $("#boat-table").hide();
            $("#taxi-table").hide();
            $("#rcar-table").hide();
            $("#bus-table").show();

        });


        

    });
    
</script>

<style>
<!--
.row>.col-sm{
                border: 1px solid #e5e5e5;
                border-right: 0;
               
            }
    .row>.col-sm>a{
        text-decoration: none;
        color: gray;
    }
    .lineTitle::before{
        content:"";
        display: block;
        width: 100%;
        height: 1px;
        background: #e2e2e2;
        position: absolute;
        top: 13px;
        left: 0;
    }
    .table tr td{
        vertical-align: middle !important;
    }

    #bus-table>.row>p{
        font-size: 14px;
        color: #959595;
    }
-->
</style>
    <div class="container mt-5 justify-content-center">
        <div class="row">
            <div class="col text-center">
                <h3 class="mb-4">교통정보안내</h3>
                <p>제주도를 오가기 위해서는 지형적 특징으로 하늘길과 바닷길, 항공과 여객선을 이용해야 한다. <br>
                    제주 내에서 이동수단은 렌터카, 버스, 전세버스, 택시 등 다양해 여정과 예산에 따라 알맞게 이용할 수 있다.</p>
            </div>
        </div>

        <div class="row text-center mt-5">
            <div id="boat-btn" class="col-sm py-3 tmenu" style="background-color: orange;"><a href="#" style="color: white;">여객선/도항선</a></div>
            <div id="bus-btn" class="col-sm py-3 tmenu"><a href="#">제주버스</a></div>
            <div id="taxi-btn" class="col-sm py-3 tmenu"><a href="#">택시</a></div>
            <div id="rcar-btn" class="col-sm py-3 tmenu" style="border-right: 1px solid #e5e5e5;"><a href="#">렌터카</a></div>
        </div>


        <div id="boat-table">
                <div class="row mt-5">
                    <div class="col text-center mt-5">
                        <h3 style="letter-spacing: -2px;">다양한 지역에서 출발이 가능한 여객선/도항선</h3>
                        <p class="mt-2">바다의 낭만과 함께, 여유롭고 합리적인 가격으로 제주여행을 할 수 있다.</p>
                    </div>
                </div>
        
                <div class="row mt-5">
                    <div class="col text-center">
                        <h4 class="lineTitle">
                            <em class="px-2" style="display: inline-block; background: white; position: relative; font-style: normal;">여객선정보</em>
                        </h4>
                    </div>
                </div>
        
                
                <table class="table table-bordered text-center mt-5">
                    <thead>
                        <tr style="background-color: #f0f0f0;">
                            <th>항로</th>
                            <th>소요시간</th>
                            <th>선박명</th>
                            <th>연락처</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowspan="2">제주 ↔ 부산</td>
                            <td rowspan="2">12:20</td>
                            <td>레드스타</td>
                            <td rowspan="2">제주 064-805-9117<br>
                                부산 051-461-0064
                            </td>
                            <td rowspan="2">(주)동북아카훼리</td>
                        </tr>
                        <tr>
                            <td>블루스타</td>
                        </tr>
                        <tr>
                                <td>제주 ↔ 목포</td>
                                <td>4:30</td>
                                <td>산타루치노</td>
                                <td rowspan="2">제주 064-758-4234<br>
                                    목표 061-243-1927<br>
                                    우수영 061-537-5500
                                </td>
                                <td rowspan="2">씨월드고속훼리(주)</td>
                        </tr>
                        <tr>
                                <td>제주 ↔ 우수영(추자)</td>
                                <td>3:00</td>
                                <td>퀸스타2</td>
                        </tr>
                        <tr>
                                <td rowspan="3">제주 ↔ 완도</td>
                                <td>2:50</td>
                                <td>한일카훼리1호</td>
                                <td rowspan="3">제주 064-751-5050<br>
                                    완도 061-554-3294
                                </td>
                                <td rowspan="3">㈜한일고속</td>
                        </tr>
                        <tr>
                                <td>2:00</td>
                                <td>블루나래호</td>
                        </tr>
                        <tr>
                                <td>4:00</td>
                                <td>한일레드펄</td>
                        </tr>
        
                        <tr>
                                <td>제주 ↔ 녹동</td>
                                <td>5:00</td>
                                <td>남해고속카훼리7호</td>
                                <td>제주 064-723-9700<br>
                                        녹동 061-842-6111
                                </td>
                                <td>㈜남해고속</td>
                        </tr>
        
                        <tr>
                            <td>제주 ↔ 여수</td>
                            <td>5:10</td>
                            <td>골드스텔라</td>
                            <td>제주 064-751-5050<br>
                                여수 061-554-8000
                            </td>
                            <td>㈜한일고속</td>
                        </tr>
        
                        <tr>
                            <td rowspan="2">모슬포 ↔
                                가파, 마라도</td>
                            <td>0:35</td>
                            <td>21삼영호</td>
                            <td rowspan="2">064-794-5490
                            </td>
                            <td rowspan="2">㈜아름다운섬나라</td>
                        </tr>
        
                        <tr>
                            <td>0:30</td>
                            <td>모슬포2호</td>
                        </tr>
        
                        <tr>
                            <td rowspan="2">송악산 ↔ 마라도</td>
                            <td rowspan="2">0:30</td>
                            <td>송악산101호</td>
                            <td rowspan="2">064-794-6661
                            </td>
                            <td rowspan="2">㈜마라도가는여객선</td>
                        </tr>
        
                        <tr>
                            <td>송악산102호</td>
                        </tr>
        
                    </tbody>
                </table>
        
        
                <div class="row my-5">
                    <div class="col text-center">
                        <h4 class="lineTitle">
                            <em class="px-2" style="display: inline-block; background: white; position: relative; font-style: normal;">도항선정보</em>
                        </h4>
                    </div>
                </div>
        
                
                <table class="table table-bordered text-center mt-5">
                    <thead>
                        <tr style="background-color: #f0f0f0;">
                            <th>항로</th>
                            <th>관할</th>
                            <th>선박명</th>
                            <th>연락처</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowspan="7">성산 ↔ 우도</td>
                            <td rowspan="7">서귀포시</td>
                            <td>우도사랑1호</td>
                            <td rowspan="7">064-782-5671
                            </td>
                            <td rowspan="8">우도해운(주)<br>
        
                                우림해운(주)<br>
                                
                                우도랜드(주)
                            </td>
                        </tr>
                        <tr>
                            <td>우도사랑2호</td>
                        </tr>
                        <tr>
                            <td>우일훼리호</td>
                        </tr>
                        <tr>
                            <td>우도카훼리</td>
                        </tr>
                        <tr>
                            <td>우도훼리호</td>
                        </tr>
                        <tr>
                            <td>우도랜드1호</td>
                        </tr>
                        <tr>
                            <td>우도랜드2호</td>
                        </tr>
        
                        <tr>
                            <td>종달 ↔ 우도</td>
                            <td>서귀포시</td>
                            <td>덕일훼리호</td>
                            <td>064-782-7719
                            </td>
                        </tr>
        
                        <tr>
                            <td>한림 ↔ 비양도</td>
                            <td>제주시</td>
                            <td>비양호</td>
                            <td>064-796-7522
                            </td>
                            <td></td>
                        </tr>
        
                    </tbody>
                </table>
                
                <div class="row text-center my-5">
                    <div class="col" style="font-size: 18px;">
                        상기 정보는 여객선사 사정 및 선박검사 일정에 의해 변경 될 수 있습니다.<br>
                        운항스케줄과 결항여부는 한국해운조합 여객선 예약 홈페이지'가고싶은 섬' 또는 여객선사로 직접 확인 바랍니다.
                    </div>
                </div>
        
                <div class="row mb-5 text-center">
                    <div class="col">
                        <a class=" btn btn-warning py-2 px-4" style="color: white;" href="http://island.haewoon.co.kr/" target="_blank">한국해운조합 여객선 정보 및 예약 홈페이지 바로가기</a>
                    </div> 
                </div>
            
        </div>
        <!-- boat-table -->

        <div id="taxi-table">
            <div class="row mt-5">
                <div class="col text-center mt-5">
                    <h3>콜택시</h3>
                    <p class="mt-2">제주여행을 하다보면 택시를 이용해야 할 때가 있다.<br>
                            대략적인 내 위치만 알려주면 콜택시가 내가 있는 곳으로 찾아온다.</p>
                </div>
            </div>

            <table class="table table-bordered text-center my-5">
                <thead>
                    <tr style="background-color: #f0f0f0;">
                        <th>지역</th>
                        <th>호출(콜)택시명</th>
                        <th>대표번호1</th>
                        <th>대표번호2</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td rowspan="14">제주시</td>
                        <td>제주개인브랜드콜</td>
                        <td>064-727-1111</td>
                        <td>064-733-1111</td>
                    </tr>

                    <tr>
                        <td>제주사랑호출택시</td>
                        <td>064-726-1000</td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>VIP콜택시</td>
                        <td>064-711-6666</td>
                        <td>064-712-6666</td>
                    </tr>

                    <tr>
                        <td>개인위성콜택시</td>
                        <td>064-711-8282</td>
                        <td>064-725-3800</td>
                    </tr>

                    <tr>
                        <td>삼화콜택시</td>
                        <td>064-756-9090</td>
                        <td>064-702-5522</td>
                    </tr>

                    <tr>
                        <td>서부/외도호출봉사회</td>
                        <td>064-743-0404</td>
                        <td>064-743-1704</td>
                    </tr>

                    <tr>
                        <td>남양콜택시</td>
                        <td>064-743-3033</td>
                        <td>064-743-3036</td>
                    </tr>

                    <tr>
                        <td>봉개콜택시</td>
                        <td>064-723-3999</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>에쿠스다이너스티콜</td>
                        <td>064-711-1950</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>평화로콜택시</td>
                        <td>064-747-1011</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>한라산호출택시</td>
                        <td>064-755-1950</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>5.16콜택시</td>
                        <td>064-751-6516</td>
                        <td>064-762-6516</td>
                    </tr>
                    <tr>
                        <td>부두콜택시</td>
                        <td>064-751-4321</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>제주K관광콜택시</td>
                        <td>064-721-2570</td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>우도면</td>
                        <td>우도콜택시</td>
                        <td>064-725-7788</td>
                        <td>064-725-7789</td>
                    </tr>

                    <tr>
                        <td rowspan="3">조천읍</td>
                        <td>교래번영로콜택시</td>
                        <td>064-727-0082</td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>조천만세콜택시</td>
                        <td>064-784-7477</td>
                        <td>064-784-7377</td>
                    </tr>
                    <tr>
                        <td>조천/함덕콜택시</td>
                        <td>064-784-8288</td>
                        <td>064-783-8288</td>
                    </tr>

                    <tr>
                        <td rowspan="3">구좌읍</td>
                        <td>만장콜택시</td>
                        <td>064-784-5500</td>
                        <td>064-783-5500</td>
                    </tr>
                    <tr>
                        <td>김녕콜택시</td>
                        <td>064-784-9910</td>
                        <td>064-782-2777</td>
                    </tr>
                    <tr>
                        <td>구좌콜개인택시</td>
                        <td>064-783-4994</td>
                        <td>064-784-4994</td>
                    </tr>

                    <tr>
                        <td rowspan="2">애월읍</td>
                        <td>애월하귀연합콜택시</td>
                        <td>064-799-5003</td>
                        <td>064-799-7009</td>
                    </tr>
                    <tr>
                        <td>애월콜택시</td>
                        <td>064-799-9007</td>
                        <td>064-799-9006</td>
                    </tr>

                    <tr>
                        <td rowspan="3">한림읍</td>
                        <td>한림서부콜택시</td>
                        <td>064-796-9595</td>
                        <td>064-796-9596</td>
                    </tr>

                    <tr>
                        <td>한수풀콜택시</td>
                        <td>064-796-9191</td>
                        <td>064-796-9192</td>
                    </tr>

                    <tr>
                        <td>한림호출개인택시</td>
                        <td>064-796-8020</td>
                        <td>064-796-4242</td>
                    </tr>

                    <tr>
                        <td>한경면</td>
                        <td>한경개인택시</td>
                        <td>064-772-1818</td>
                        <td>064-772-5882</td>
                    </tr>

                    <tr>
                        <td rowspan="6">서귀포</td>
                        <td>서귀포브랜드콜택시</td>
                        <td>064-762-4244</td>
                        <td>064-763-4244</td>
                    </tr>
                    <tr>
                        <td>OK콜택시</td>
                        <td>064-732-0082</td>
                        <td>064-733-0082</td>
                    </tr>
                    <tr>
                        <td>중문호출개인택시</td>
                        <td>064-738-1700</td>
                        <td>064-738-1701</td>
                    </tr>
                    <tr>
                        <td>서귀포콜택시</td>
                        <td>064-762-0100</td>
                        <td>064-739-1100</td>
                    </tr>
                    <tr>
                        <td>서귀포인성호출택시</td>
                        <td>064-732-6199</td>
                        <td>064-733-0008</td>
                    </tr>
                    <tr>
                        <td>중문천제연</td>
                        <td>064-738-5880</td>
                        <td></td>
                    </tr>

                    <tr>
                        <td rowspan="2">남원읍</td>
                        <td>남원개인 24시</td>
                        <td>064-764-3535</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>남원콜택시</td>
                        <td>064-764-9191</td>
                        <td>064-764-8282</td>
                    </tr>
                    
                    <tr>
                        <td rowspan="2">표선면</td>
                        <td>표선24시콜택시</td>
                        <td>064-787-3787</td>
                        <td>064-787-0082</td>
                    </tr>
                    <tr>
                        <td>표선호출개인택시</td>
                        <td>064-787-2420</td>
                        <td>064-787-5252</td>
                    </tr>

                    <tr>
                        <td rowspan="3">성산읍</td>
                        <td>동성콜택시</td>
                        <td>064-782-8200</td>
                        <td>064-784-8200</td>
                    </tr>

                    <tr>
                        <td>성산월드호출택시</td>
                        <td>064-784-0500</td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>성산포호출개인택시</td>
                        <td>064-784-3030</td>
                        <td>064-784-3031</td>
                    </tr>

                    <tr>
                        <td rowspan="2">안덕면</td>
                        <td>이어도콜택시</td>
                        <td>064-748-0067</td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>안덕개인콜택시</td>
                        <td>064-794-1400</td>
                        <td></td>
                    </tr>

                    <tr>
                        <td rowspan="2">대정읍</td>
                        <td>모슬포호출개인택시</td>
                        <td>064-794-0707</td>
                        <td>064-792-0082</td>
                    </tr>

                    <tr>
                        <td>대안콜택시</td>
                        <td>064-794-8400</td>
                        <td></td>
                    </tr>

                </tbody>
            </table>

        </div>
        <!-- 택시 테이블 끝 -->

        <div id="rcar-table">
            <div class="row mt-5">
                <div class="col text-center mt-5">
                    <h3>렌터카</h3>
                    <p class="mt-4" style="font-size: 14px;">제주는 제주시내 중심을 제외하고는 복잡한 곳이 없어 운전하는 것이 어렵지 않은 편이다. 제주지역의 특징을 알면 직접 운전하는 것이 여행 시간을 절약할 수 
                            있다. 제주는 회전 교차로가 많으므로 회전 교차로에서는 네비게이션 상에서 들어가고 나가는 방향을 잘 확인하자. 동물, 오토바이, 스쿠터가 갑자기 튀어 나올
                            수 있으니 도로 및 마을 안 한적한 곳에서도 속도를 줄이자. 제주의 해안도로와 일주도로는 평지로 되어 있다. 한라산(1131번 도로, 1100도로) 올라가는 길만 
                            주의하면 비교적 도로여건은 좋지만 저녁부터는 야생동물이 길에 나오므로 이 지역은 야간운전을 피하는 것이 좋다.</p>
                </div>
            </div>

            <table class="table table-bordered text-center my-5">
                <thead>
                    <tr style="background-color: #f0f0f0;">
                        <th>업체명</th>
                        <th>사무실</th>
                        <th>연락처</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>㈜한성</td>
                        <td>제주시 도령로13길5(연동)</td>
                        <td>747-2100</td>
                    </tr>
                    <tr>
                        <td>㈜동아</td>
                        <td>제주시 용문로88(용담2동)</td>
                        <td>743-1515</td>
                    </tr>
                    <tr>
                        <td>㈜뉴아리랑</td>
                        <td>제주시 탑동로89(삼도2동)</td>
                        <td>749-2139</td>
                    </tr>
                    <tr>
                        <td>㈜제주아산</td>
                        <td>제주시 연미길44(오라3동)</td>
                        <td>743-9991</td>
                    </tr>
                    <tr>
                        <td>㈜월드</td>
                        <td>제주시 오일장종길 39(도두1동)</td>
                        <td>743-1007</td>
                    </tr>
                    <tr>
                        <td>㈜한국</td>
                        <td>제주시 월광로25(노형동)</td>
                        <td>748-5005</td>
                    </tr>
                    <tr>
                        <td>㈜탐라</td>
                        <td>제주시 공항로5(용담2동)</td>
                        <td>742-3300</td>
                    </tr>
                    <tr>
                        <td>㈜써니빌</td>
                        <td>제주시 오일장길6(도두1동)</td>
                        <td>748-1600</td>
                    </tr>
                    <tr>
                        <td>㈜용두암</td>
                        <td>제주시 용해로74(용담2동)</td>
                        <td>711-0388</td>
                    </tr>
                    <tr>
                        <td>㈜장수</td>
                        <td>제주시 월광로154(노형동)</td>
                        <td>746-8400</td>
                    </tr>
                    <tr>
                        <td>㈜가자제주</td>
                        <td>제주시 억삼길10(이호2동)</td>
                        <td>744-2002</td>
                    </tr>
                    <tr>
                        <td>㈜오름</td>
                        <td>제주시 연미길12(오라3동)</td>
                        <td>712-8570</td>
                    </tr>
                    <tr>
                        <td>㈜제주렌트카</td>
                        <td>제주시 용문로8(용담2동)</td>
                        <td>1588-3301</td>
                    </tr>
                    <tr>
                        <td>㈜오케이</td>
                        <td>제주시 용문로64(용담2동)</td>
                        <td>743-4000</td>
                    </tr>
                    <tr>
                        <td>㈜제주씽씽</td>
                        <td>제주시 한북로79(오등동)</td>
                        <td>746-8466</td>
                    </tr>
                    <tr>
                        <td>㈜굿모닝</td>
                        <td>제주시 오광로65(이호2동)</td>
                        <td>742-8003</td>
                    </tr>
                    <tr>
                        <td>(유)제주공항</td>
                        <td>제주시 오광로24(이호2동)</td>
                        <td>744-4800</td>
                    </tr>
                    <tr>
                        <td>㈜매트로</td>
                        <td>제주시 억삼길10(이호2동)</td>
                        <td>712-6555</td>
                    </tr>
                    <tr>
                        <td>㈜한길</td>
                        <td>제주시 우정로88(외도1동)</td>
                        <td>712-6161</td>
                    </tr>
                    <tr>
                        <td>㈜대진</td>
                        <td>제주시 월성로30(용담2동)</td>
                        <td>712-9501</td>
                    </tr>
                    <tr>
                        <td>㈜대진</td>
                        <td>제주시 월성로30(용담2동)</td>
                        <td>712-9501</td>
                    </tr>
                    <tr>
                        <td>㈜발리</td>
                        <td>제주시 도리로110(도평동)</td>
                        <td>743-3727</td>
                    </tr>
                    <tr>
                        <td>㈜렌트파크</td>
                        <td>제주시 용해로80-7(용담2동)</td>
                        <td>711-1665</td>
                    </tr>
                    <tr>
                        <td>㈜하나클래식</td>
                        <td>제주시 성화로1길5(용담2동)</td>
                        <td>711-9611</td>
                    </tr>
                    <tr>
                        <td>㈜행운</td>
                        <td>제주시 도령로54(노형동)</td>
                        <td>745-9119</td>
                    </tr>
                    <tr>
                        <td>㈜제주사랑</td>
                        <td>제주시 연미길 103(연동)</td>
                        <td>712-0091</td>
                    </tr>
                    <tr>
                        <td>㈜한라산</td>
                        <td>제주시 오일장중길27(도두1동)</td>
                        <td>748-8222</td>
                    </tr>
                    <tr>
                        <td>㈜특별한</td>
                        <td>제주시 우정로22(외도1동)</td>
                        <td>805-8005</td>
                    </tr>
                    <tr>
                        <td>㈜올레</td>
                        <td>제주시 우평로178(도평동)</td>
                        <td>743-7300</td>
                    </tr>
                    <tr>
                        <td>㈜제주하늘</td>
                        <td>제주시 도령로66(연동)</td>
                        <td>744-0204</td>
                    </tr>
                    <tr>
                        <td>㈜제주드림</td>
                        <td>제주시 일주서로7843(연동)</td>
                        <td>744-3939</td>
                    </tr>
                    <tr>
                        <td>㈜제주여행</td>
                        <td>제주시 연삼로27(연동)</td>
                        <td>711-6111</td>
                    </tr>
                    <tr>
                        <td>㈜좋은</td>
                        <td>제주시 서해안로224-8(도두1동)</td>
                        <td>745-0017</td>
                    </tr>
                    <tr>
                        <td>㈜KD</td>
                        <td>제주시 정존13길4(노형동)</td>
                        <td>745-0753</td>
                    </tr>

                    <tr>
                        <td>㈜제주평화</td>
                        <td>제주시 용해로 119(용담2동)</td>
                        <td>742-9944</td>
                    </tr>
                    <tr>
                        <td>(유)제주현대</td>
                        <td>제주시 절물1길10(외도1동)</td>
                        <td>742-0089</td>
                    </tr>

                    <tr>
                        <td>㈜쏘카</td>
                        <td>제주시 도령로15길6(연동)</td>
                        <td>1661-3315</td>
                    </tr>
                    <tr>
                        <td>㈜썬렌트카</td>
                        <td>제주시 제성1길36(도두2동)</td>
                        <td>773-8000</td>
                    </tr>
                    <tr>
                        <td>㈜뉴제주올레</td>
                        <td>제주시 서광로94(오라3동)</td>
                        <td>1588-6869</td>
                    </tr>
                    <tr>
                        <td>㈜스마트</td>
                        <td>제주시 백포남길10(이호2동)</td>
                        <td>745-7272</td>
                    </tr>
                    <tr>
                        <td>㈜포시즌</td>
                        <td>제주시 오남로20(오라1동)</td>
                        <td>712-7121</td>
                    </tr>
                    <tr>
                        <td>㈜무지개</td>
                        <td>제주시 제성1길30(도두2동)</td>
                        <td>746-3500</td>
                    </tr>
                    <tr>
                        <td>㈜뉴대한</td>
                        <td>제주시 서광로 129(용담2동)</td>
                        <td>712-7811</td>
                    </tr>
                    <tr>
                        <td>㈜우리렌트카</td>
                        <td>제주시 용해로50(용담2동)</td>
                        <td>745-9797</td>
                    </tr>
                    <tr>
                        <td>㈜제주신화렌트카</td>
                        <td>제주시 우평로40(도평동)</td>
                        <td>713-6663</td>
                    </tr>
                    <tr>
                        <td>㈜비전렌터카</td>
                        <td>제주시 아연로 256(오라2동)</td>
                        <td>745-2004</td>
                    </tr>
                    <tr>
                        <td>㈜공항렌터카</td>
                        <td>제주시 오광로24(이호2동)</td>
                        <td>745-4801</td>
                    </tr>
                    <tr>
                        <td>㈜레츠고</td>
                        <td>제주시 용해로50(용담2동)</td>
                        <td>745-6566</td>
                    </tr>
                    <tr>
                        <td>㈜힐렌터카</td>
                        <td>제주시 용해로35(용담3동)</td>
                        <td>744-0234</td>
                    </tr>
                    <tr>
                        <td>㈜통일렌터카</td>
                        <td>제주시 제성1길30(도두이동)</td>
                        <td>745-4500</td>
                    </tr>
                    <tr>
                        <td>㈜더쎄븐렌트카</td>
                        <td>제주시 오광로 67(이호1동)</td>
                        <td>763-0007</td>
                    </tr>
                    <tr>
                        <td>㈜금강렌트카</td>
                        <td>제주시 용문로21길(용담2동)</td>
                        <td>749-2900</td>
                    </tr>
                    <tr>
                        <td>㈜메이저렌트카</td>
                        <td>제주시 제성1길28(도두1동)</td>
                        <td>743-1000</td>
                    </tr>
                    <tr>
                        <td>㈜갤럭시렌트카</td>
                        <td>제주시 일주서로7822(연동)</td>
                        <td>744-1116</td>
                    </tr>
                    <tr>
                        <td>㈜유명렌트카</td>
                        <td>제주시 제성1길28(도두1동)</td>
                        <td>712-5100</td>
                    </tr>
                    <tr>
                        <td>㈜조아렌트카</td>
                        <td>제주시 노형로120-1(해안동)</td>
                        <td>727-2000</td>
                    </tr>
                    <tr>
                        <td>㈜메이스렌트카</td>
                        <td>제주시 오남로20(오라1동)</td>
                        <td>722-7373</td>
                    </tr>
                    <tr>
                        <td>㈜오라렌트카</td>
                        <td>제주시 제성1길30(도두1동)</td>
                        <td>746-0700</td>
                    </tr>
                    <tr>
                        <td>㈜케이렌트카</td>
                        <td>제주시 남성로30(용담일동)</td>
                        <td>727-8877</td>
                    </tr>
                    <tr>
                        <td>(유)제주삼성렌트카</td>
                        <td>제주시 오광로 93(이호이동)</td>
                        <td>745-7070</td>
                    </tr>
                    <tr>
                        <td>㈜에이제이</td>
                        <td>제주시 제주시 용문로48(용담2동)</td>
                        <td>726-3322</td>
                    </tr>
                    <tr>
                        <td>㈜케이티렌탈</td>
                        <td>제주시 용해로80-21(용담2동)</td>
                        <td>751-8000</td>
                    </tr>
                    <tr>
                        <td>㈜차세대</td>
                        <td>제주시 명신1길20(용담2동)</td>
                        <td>711-9030</td>
                    </tr>
                    <tr>
                        <td>㈜SK</td>
                        <td>제주시 일주서로7582(이호2동)</td>
                        <td>726-6461</td>
                    </tr>
                    <tr>
                        <td>㈜경동</td>
                        <td>제주시 오광로141(노형동)</td>
                        <td>744-7475</td>
                    </tr>
                    <tr>
                        <td>㈜한진</td>
                        <td>제주시 용문로16(연동)</td>
                        <td>748-6100</td>
                    </tr>
                    <tr>
                        <td>㈜동부</td>
                        <td>제주시 용문로24(노형동)</td>
                        <td>712-7368</td>
                    </tr>
                    <tr>
                        <td>㈜디알</td>
                        <td>제주시 신광로13(연동)</td>
                        <td>713-2656</td>
                    </tr>
                    <tr>
                        <td>㈜레드캡</td>
                        <td>제주시 용문로56-7(용담2동)</td>
                        <td>803-0391</td>
                    </tr>
                    <tr>
                        <td>㈜하이렌트카</td>
                        <td>제주시 용해로58-7(용담2동)</td>
                        <td>805-1500</td>
                    </tr>
                    <tr>
                        <td>㈜제주스타렌탈</td>
                        <td>제주시 용문로20(용담2동)</td>
                        <td>1588-3340</td>
                    </tr>
                    <tr>
                        <td>㈜제주제일렌터카</td>
                        <td>제주시 공항로5(용담2동)</td>
                        <td>747-5670</td>
                    </tr>
                    <tr>
                        <td>㈜하나로오토렌탈</td>
                        <td>제주시 도령로40(노형동)</td>
                        <td>749-0588</td>
                    </tr>
                    <tr>
                        <td>㈜채영렌트카</td>
                        <td>제주시 연삼로145(오라3동)</td>
                        <td>748-2990</td>
                    </tr>
                    <tr>
                        <td>㈜해피넥트웩스</td>
                        <td>제주시 일주서로7581(이호2동)</td>
                        <td>711-7935</td>
                    </tr>
                </tbody>
            </table>

        </div>
        



        <div id="bus-table">

            <!-- <div id="bus-area1"> -->
                <!-- <div class="row justify-content-center mx-auto my-5">
                    <ul class="list-inline">
                        <li class="list-inline-item px-3" style="border-right: 1px solid #959595;">
                            <a href="#" style="color:black; text-decoration: none;">버스이용 안내</a>
                        </li>
                        <li class="list-inline-item px-3" style="border-right: 1px solid #959595;">
                            <a href="#" style="color:#959595; text-decoration: none;">관광지 순환버스</a>
                        </li>
                        <li class="list-inline-item px-3" style="border-right: 1px solid #959595;">
                            <a href="#" style="color:#959595; text-decoration: none;">공항 리무진버스</a>
                        </li>
                        <li class="list-inline-item px-3">
                            <a href="#" style="color:#959595; text-decoration: none;">전세버스</a>
                        </li>
                    </ul>
                </div> -->

                <div class="row mt-5">
                    <div class="col text-center mt-5">
                        <h3>버스이용 안내</h3>
                        <p class="mt-3">2017년 8월 26일부터 시행 된 제주형 대중교통 체계 개편으로 버스를 이용한 제주여행이 더 빠르고, 더 편하고, 더 저렴해 졌다.</p>
                    </div>
                </div>

                <div class="row" style="margin-top: 6rem !important;">
                    <h5>1,200원으로 제주 전지역 어디든지!</h4>
                    <p style="font-size: 14px;">제주 전지역 시내버스화를 통해 1,200원이면 제주 전지역으로 이동가능. 교통카드를 이용하면 1,150원으로 이용가능 (급행버스는 2,000원에서 최대 3,000원)</p>
                </div>

                <div class="row mt-5">
                    <h5>급행버스 8개 노선, 제주공항 기•종점 운행</h4>
                    <p style="font-size: 14px;">제주국제공항과 도내 모든 환승정류장을 연결하는 급행노선이 신설되어 공항에서 출발해서 도내 전지역을 1시간 내외로 이동 가능</p>
                </div>

                <div class="row mt-5">
                    <h5>동•서부 주요 관광지를 연결하는 관광지 순환버스 운행</h4>
                    <p style="font-size: 14px;">대천교차로(동부지역)와 동광교차로(서부)를 기종점으로 인근 주요관광지를 연결하는 관광지 순환버스가 운행</p>
                </div>

                <div class="row mt-5">
                    <h5>대중교통 우선차로제로 제주시내 관광도 빠르게!</h4>
                    <p style="font-size: 14px;">대중교통 차량만 이용 가능한 중앙차로제와 가변차로제로 막히는 제주시내 관광도 교통체증 없이 빠르고 쾌적하게 이용 가능</p>
                </div>

                <div class="row mt-5">
                    <h5>버스 증차, 디자인 변경, 무료 Wi-Fi 제공</h4>
                    <p style="font-size: 14px;">개선 이전 530대의 버스가 797대로 267대 증가. 급행, 간선, 지선, 관광지 순환버스를 한눈에 알아볼 수 있도록 디자인(색상)이 변경되었으며, 모든 버스에서 무료 Wi-Fi가 제공되어 스마트한 여행 가능</p>
                </div>
                

                <div class="row mt-3">
                    <div class="col">
                        <img class="img-fluid" src="${path}/resources/img/main/tourInfoTraffic_img03.png" alt="">
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col text-center">
                        <a class="btn btn-warning" href="http://bus.jeju.go.kr/search/route" target="_blank" style="color: white;">노선검색</a>
                    </div>
                </div>
            </div>

        <!-- </div> -->

    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
