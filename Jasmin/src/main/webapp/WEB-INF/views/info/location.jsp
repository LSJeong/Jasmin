<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.infoli { padding-bottom: 20px; }
</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="resources/images/banner/bookshelves-bookcase-zoom-virtual-backgrounds-free-download-background.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>이용안내</h2>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>이용안내</h4>
						<ul>
							<li><a href="location.do" style="color: var(--main-light-brown);"><b>도서관 위치</b></a></li>
							<li><a href="calendar.do">도서관 일정</a></li>
							<li><a href="rules.do">이용지침</a></li>
							<li><a href="tutorial.do">이용방법</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>도서관 위치</h2>
					</div>
					<div class="product__details__text">
						<br> <br>
						<h3>찾아오시는 길</h3>
						<div id="map" style="width: 100%; height: 350px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ebd834bbf55ba97b00c541cb519a9cb"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
									center : new kakao.maps.LatLng(35.86923, 128.59323), // 지도의 중심좌표
									level : 3 // 지도의 확대 레벨
									};
							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							// 마커가 표시될 위치입니다
							var markerPosition = new kakao.maps.LatLng(35.86923, 128.59323);
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({ position : markerPosition });
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
							// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
							// marker.setMap(null);
						</script>

						<ul>
							<li class="infoli"><b>[주소]</b><br>
								<span>대구광역시 중구 남일동 135-1</span>
							</li>
							<li class="infoli"><b>[교통편]</b><br>
								<span>중앙로역 2번 출구 / 약령시 앞 버스정류장</span>
							</li>
							<li class="infoli"><b>[주차장 이용안내]</b><br>
								<span>유료 운영시간 : 06:00 ~ 22:00</span><br>
								<span>주차요금 : 도서관 이용 시 2시간 무료</span><br>
								<span>주차장이 혼잡하므로 가급적 대중교통을 이용하여 주시기 바랍니다.</span>
							</li>
							<li class="infoli"><b>[도서관 SNS]</b><br>
								<div class="share">
									<a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a>
									<a href="https://twitter.com"><i class="fa fa-twitter"></i></a>
									<a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->