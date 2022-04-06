<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	#calupdatetable {
		width: 800px;
	}
	
	#calupdateline {
		height: 73px;
	}
	th {
		color: black;
		background-color: white;
		text-align: center;
	}
</style>
<div class="content-wrapper">
	<div class="d-xl-flex justify-content-between align-items-start">
		<h1 class="text-dark font-weight-bold mb-2">일정 수정</h1>
	</div>
	<div id=calupdateline class="d-sm-flex justify-content-between align-items-center transaparent-tab-border">
	</div>
	<div class="row">
	<br>

		<div class="col-md-12">
			<form id="calendarupdateform" method="post" action="calendarUpdate.do">
				<div align="center">
					<table border="1" id="calupdatetable" class="table-bordered">
						<tbody>
							<tr>
								<th>번호</th>
								<td><input type="text" class="form-control" id="cno" name="cno" readonly value="${calendar.cno}"></td>
							</tr>
							<tr>
								<th>일정</th>
								<td><input type="text" class="form-control" id="ctitle" name="ctitle" value="${calendar.ctitle}"></td>
							</tr>
							<tr>
								<th>시작일</th>
								<td><input type="text" class="form-control" id="cstart" name="cstart" value="${calendar.cstart}"
										placeholder="YYYY-MM-DD"></td>
							</tr>
							<tr>
								<th>종료일</th>
								<td><input type="text" class="form-control" id="cend" name="cend" value="${calendar.cend}"
										placeholder="YYYY-MM-DD :: 당일 일정인 경우 입력X ::"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<br>
			<div align="center">
				<button type="button" class="btn btn-primary" onclick="calendarUpdate()">수 정</button>
				<button type="button" class="btn btn-primary" onclick="calendarDelete()">삭 제</button>
				<button type="button" class="btn btn-primary" onclick="history.back()">취 소</button>
			</div>
		</div>
	</div>
</div>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function calendarUpdate() {
		var cno = document.getElementById("cno").value;
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

		if (confirm("수정하시겠습니까?")) {
			$("#calendarupdateform").submit();
		}
	}

	function calendarDelete() {
		if (confirm("삭제하시겠습니까?")) {
			var cno = document.getElementById("cno").value;
			location.href = "calendarDelete.do?cno=" + cno;
		}
	}
</script>