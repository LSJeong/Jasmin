<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href='resources/fullcalendar-5.10.1/lib/main.css' rel='stylesheet' />
<style>
	#calendar {
		width: 900px;
		height: 700px;
	}
</style>
<script src='resources/fullcalendar-5.10.1/lib/main.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
	let xhtp = new XMLHttpRequest();
	xhtp.open('get', 'CalendarList.do');
	xhtp.send();
	xhtp.onload = function() {
		let dbData = JSON.parse(xhtp.responseText);
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',			
			dayMaxEvents: true, // allow "more" link when too many events
			events: dbData
	});
		calendar.render();
	}	
});
</script>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="resources/images/2.jpg">
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
							<li><a href="location.do">도서관 위치</a></li>
							<li><a href="calendar.do" style="color: var(--main-light-brown);"><b>도서관 일정</b></a></li>
							<li><a href="rules.do">이용지침</a></li>
							<li><a href="tutorial.do">이용방법</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>도서관 일정</h2>
					</div>
					<div class="row">
						<!-- 자리 -->
						<div id='calendar'></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->