<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/js/jquery-3.3.1.min.js"></script>

<div class="content-wrapper">
	<div class="d-xl-flex justify-content-between align-items-start">
		<h1 class="text-dark font-weight-bold mb-2">일정 관리</h1>
	</div>	
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border">
				<br>
				<div class="d-md-block d-none">
					<button type="button" class="btn btn-primary" style="margin-bottom: 10px;" onclick="location.href ='calendarInsertForm.do'">일정 등록</button>
				</div>
			</div>
			<div class="tab-content tab-transparent-content">
				<div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<form>
									<table class="table table-bordered" id="calList">
										<thead>
											<tr>
												<th>번호</th>
												<th>일정</th>
												<th>시작일</th>
												<th>종료일</th>
											</tr>
										</thead>
										<tbody class="calListBody" id="calListBody">
											<c:forEach items="${calendarlist }" var="calendar">
												<tr onclick="location.href='calendarUpdateForm.do?cno=${calendar.cno}'">
													<td>${calendar.cno}</td>
													<td>${calendar.ctitle }</td>
													<td>${calendar.cstart }</td>
													<td>${calendar.cend }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>