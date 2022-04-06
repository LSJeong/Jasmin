<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content-wrapper">
	<div class="d-xl-flex justify-content-between align-items-start">
		<h1 class="text-dark font-weight-bold mb-2">일정 등록</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border">
				<form id="calendarinsertform" method="post" action="calendarUpload.do">
					<div align="center">
						<table border="1" class="table-bordered">
							<tbody>
								<tr>
									<th>일정</th>
									<td><input type="text" id="ctitle" name="ctitle"></td>
									<th>시작일</th>
									<td><input type="text" id="cstart" name="cstart" placeholder="YYYY-MM-DD"></td>
									<th>종료일</th>
									<td><input type="text" id="cend" name="cend" placeholder="YYYY-MM-DD, 당일 일정인 경우 입력X"></td>
								</tr>								
							</tbody>
						</table>
					</div>
				</form>
				<br>
				<div align="center">
					<button type="button" class="btn btn-outline-secondary btn-md" onclick="calendarInsert()">등 록</button>
					<button type="button" class="btn btn-outline-secondary btn-md" onclick="history.back()">취 소</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function calendarInsert() {	
	var ctitle = document.getElementById("ctitle").value;
	var cstart = document.getElementById("cstart").value;
	var cend = document.getElementById("cend").value;
	
	if (ctitle == '') {
		alert("일정을 입력하세요.")
		return false;
	} else if (cstart == '') {
		alert("일정 시작일을 입력하세요.")
		return false;
	} 
	$("#calendarinsertform").submit();
}
</script>