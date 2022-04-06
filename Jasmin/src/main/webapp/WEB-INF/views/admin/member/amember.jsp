<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
.card .card-body {
	background-color: #f0f1f6;
}

table {
	background-color: #ffffff;
}
</style>

<div class="content-wrapper">
	<div class="d-xl-flex justify-content-between align-items-start">
		<h1 class="text-dark font-weight-bold mb-2">전체 회원 목록</h1>
	</div>
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div>
					<select id="key" name="key">
						<option value="name" selected>이름</option>
						<option value="id">아이디</option>
					</select> <input type="text" id="keyword" name="keyword">
					<button type="button" class="btn btn-primary btn-sm" id="btns"
						onclick="ajaxGetSearchList()">검색</button>
				</div>
				<br>
				<table id="list" class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>이름</th>
							<th>주소</th>
							<th>연락처</th>
							<th>생년월일</th>
							<th>E-mail</th>
							<th>가입상태</th>
						</tr>
					</thead>
					<tbody id="listbody">
						<c:forEach items="${members }" var="member">
							<tr class="trid">
								<td>${member.id }</td>
								<td>${member.name }</td>
								<td>${member.address }${member.addressdetail }</td>
								<td>${member.tel }</td>
								<td>${member.birth }</td>
								<td>${member.email }</td>
								<td>${member.status }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
	function ajaxGetSearchList() {
		$.ajax({
			type : "post",
			url : "ajaxGetSearchList.do",
			data : {
				"key" : $("#key").val(),
				"keyword" : $("#keyword").val()
			},
			dataType : "json",
			success : function(result) {
				$('#listbody').empty();
				if (result.length >= 1) {
					console.log(result);
					result.forEach(function(member) {
						$tr = $("<tr>").attr("class", "trid")
						$("<td>").text(member.id).appendTo($tr)
						$("<td>").text(member.name).appendTo($tr)
						$("<td>").text(
								member.address + " " + member.addressdetail)
								.appendTo($tr)
						$("<td>").text(member.tel).appendTo($tr)
						$("<td>").text(member.birth).appendTo($tr)
						$("<td>").text(member.email).appendTo($tr)
						$("<td>").text(member.status).appendTo($tr)
						$('#listbody').append($tr)
					})
				} else {
					$tr = $("<tr>")
					$td = $("<td>").text("조회 결과 없음").attr("colspan", "6")
					$tr.append($td)
					$('#listbody').append($tr)
				}
				$('#list').show();
				$(".trid").bind("click", function() {
					infoid = $(event.currentTarget).find("td:eq(0)").html();
					console.log(infoid);
					location.href = "aRent.do?infoid=" + infoid;
				});
			}
		});
	}
	// 검색 엔터 처리
	$("#keyword").keypress(function() {
		if (event.keyCode == 13) {
			btns.click();
		}
	});

	$(".trid").bind("click", function() {
		infoid = $(event.currentTarget).find("td:eq(0)").html();
		console.log(infoid);
		location.href = "aRent.do?infoid=" + infoid;
	});
</script>