<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- <head>
<script type="text/javascript">
	function joinMember() {
		window.open('http://www.naver.com', 'child02', 'top=200px, left=200px, height=700px, width=700px');
	}
</script>
</head> -->
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<style>
		#rvsubject {
			width: 100%;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #311e00;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
		}
	</style>
</head>


<section class="breadcrumb-section set-bg"
	data-setbg="resources/images/lib.PNG">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>도서 상세</h2>
				</div>
			</div>
		</div>
	</div>
</section>


<section class="product-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<c:if test="${empty book.ppicture }"><img class="product__details__pic__item--large" src="/filePath/1234.PNG" alt="" height="500px"></c:if>
						<c:if test="${not empty book.ppicture }"><img class="product__details__pic__item--large" src="/filePath/${book.ppicture }" alt=""  width="380px"  height="500px"></c:if>
					</div>

				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>${book.title }</h3>
					<div class="product__details__rating">
						<c:if test="${reviewavg eq 1 }">
							<img src="resources/images/star1.png"><img src="resources/images/outstar1.png"><img src="resources/images/outstar1.png">
							<img src="resources/images/outstar1.png"><img src="resources/images/outstar1.png">
						</c:if>
						<c:if test="${reviewavg eq 2 }">
							<img src="resources/images/star1.png"><img src="resources/images/star1.png"><img src="resources/images/outstar1.png">
							<img src="resources/images/outstar1.png"><img src="resources/images/outstar1.png">
						</c:if>
						<c:if test="${reviewavg eq 3 }">
							<img src="resources/images/star1.png"><img src="resources/images/star1.png"><img src="resources/images/star1.png">
							<img src="resources/images/outstar1.png"><img src="resources/images/outstar1.png">
						</c:if>
						<c:if test="${reviewavg eq 4 }">
							<img src="resources/images/star1.png"><img src="resources/images/star1.png"><img src="resources/images/star1.png">
							<img src="resources/images/star1.png"><img src="resources/images/outstar1.png">
						</c:if>
						<c:if test="${reviewavg eq 5 }">
							<img src="resources/images/star1.png"><img src="resources/images/star1.png"><img src="resources/images/star1.png">
							<img src="resources/images/star1.png"><img src="resources/images/star1.png">
						</c:if>
					</div>
					
					
					<ul style="border-bottom: 1px solid #ebebeb; padding-bottom: 40px;">
						<li><b>ISBN</b> <span>${book.isbn } </span></li>
						<li><b>카테고리</b> 
							<c:if test="${book.bclass eq '100' }"><span>철학</span></c:if>
							<c:if test="${book.bclass eq '200' }"><span>종교</span></c:if>
							<c:if test="${book.bclass eq '300' }"><span>사회과학</span></c:if>
							<c:if test="${book.bclass eq '400' }"><span>자연과학</span></c:if>
							<c:if test="${book.bclass eq '500' }"><span>기술과학</span></c:if>
							<c:if test="${book.bclass eq '600' }"><span>예술</span></c:if>
							<c:if test="${book.bclass eq '700' }"><span>언어</span></c:if>
							<c:if test="${book.bclass eq '800' }"><span>문학</span></c:if>
							<c:if test="${book.bclass eq '900' }"><span>역사</span></c:if>
						</li>
						<li><b>저자</b> <span>${book.writer } </span></li>
						<li><b>출판사</b> <span>${book.publisher }</span></li>
						<li><b>출판연도</b> <span>${book.pyear }</span></li>
						<li id="countli"><b>대출가능권수</b> <span id="countbook">${book.total - book.brow} / ${book.total }</span></li>
					</ul>
					<br>
					<input type="hidden" value="${book.isbn }" id="rentisbn">
					<input type="hidden" value="${id }" id="loginid">
					<!-- <a href="jazvascript:joinMember()" class="primary-btn">대출</a> -->
					<c:if test="${book.status eq 'D' }">
						<div style="color: red;">* 지금은 대출할 수 없는 상태입니다.</div>
					</c:if>
					<c:if test="${book.status ne 'D' }">
					<c:if test="${empty id }">
						<button class="site-btn" onclick="javascript:alert('로그인 후 대출가능합니다.')">대출</button>
						<a class="heart-icon" onclick="javascript:alert('로그인 후 가능합니다.')"><span id="hearticon" class="icon_heart_alt"></span></a>
					</c:if>
					
					<c:if test="${not empty id }">
						<c:if test="${empty rentbook }">
							<c:if test="${rentCheck > 4 }">
								<button class="site-btn" onclick="javascript:alert('1인 6권 이상 빌릴 수 없습니다.')">대출</button>
							</c:if>
							<c:if test="${rentCheck < 5 }">
								<button class="site-btn dialog-btn">대출</button>
							</c:if>
						</c:if>
						<c:if test="${not empty rentbook }">
							<c:if test="${rentbook.deliveryn eq 'N'}">
								<button class="site-btn ebook">Ebook</button>
								<button class="site-btn dialog-btn2">반납</button>
								<button class="site-btn dialog-btn3">연장</button>
							</c:if>
							<c:if test="${rentbook.deliveryn eq 'Y'}">
								<c:choose>
									<c:when test="${rentbook.deliverstate eq '배송중'}">
										<button class="site-btn" onclick="javascript:alert('배송중엔 반납할수 없습니다.')">반납</button>
										<button class="site-btn dialog-btn3">연장</button>
									</c:when>
									<c:when test="${rentbook.deliverstate eq '수거요청'}">
										<button class="site-btn" onclick="javascript:alert('수거요청 중입니다. \n수거 완료 후 자동반납처리됩니다.')">반납</button>
										<button class="site-btn" onclick="javascript:alert('수거요청 중입니다. \n수거 완료 후 재대출을 이용해주세요.')">연장</button>
									</c:when>
									<c:when test="${rentbook.deliverstate eq '수거중'}">
										<button class="site-btn" onclick="javascript:alert('수거중입니다. \n수거 완료 후 자동반납처리됩니다.')">반납</button>
										<button class="site-btn" onclick="javascript:alert('수거중입니다. \n수거 완료 후 재대출을 이용해주세요.')">연장</button>
									</c:when>
									<c:otherwise>
										<button class="site-btn dialog-btn2">반납</button>
										<button class="site-btn dialog-btn3">연장</button>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:if>
					
						<c:if test="${not empty likebook }">
							<a href="#" class="heart-icon" id="heartbook"><span id="hearticon" class="fa fa-heart"></span></a>
						</c:if>
						<c:if test="${empty likebook }">
							<a href="#" class="heart-icon" id="heartbook"><span id="hearticon" class="icon_heart_alt"></span></a>
						</c:if>
					</c:if>
					</c:if>
					<button class="site-btn site-btn3" style="float: right;" onclick="history.back()">목록으로</button>
				</div><br>
				<div>
					<span style="color: red; font:bold; font-size: 15px;" >* Delivery 대출은 도서배송/수거일을 포함하여 14일입니다. <br> &nbsp; 기한에 주의하여 대출/반납해주세요.</span>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">도서 소개</a>
						</li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-4" role="tab" aria-selected="false">저자 소개</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">목 차</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-3" role="tab" aria-selected="false" id="reviews">리 뷰</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>도서 소개</h6>
								<p><pre>${book.subject }</pre></p>
							</div>
						</div>
						<div class="tab-pane" id="tabs-4" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>저자 소개</h6>
								<p><pre>${book.wsubject }</pre></p>
							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>목 차</h6>
								<p><pre>${book.chapter }</pre></p>
							</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="product__details__tab__desc">
							<form id="cmtform" name="cmtform" method="post">
								<div align="center" style="border-bottom :1px solid #ebebeb; height: 250px" >
									<table>
										<tr>
											<td height="50px">
												<!-- <span>평 점 : &nbsp;&nbsp;</span> -->
											 	<img id="image1" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="resources/images/outstar1.png">
											 	<img id="image2" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="resources/images/outstar1.png">
											 	<img id="image3" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="resources/images/outstar1.png">
											 	<img id="image4" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="resources/images/outstar1.png">
											 	<img id="image5" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="resources/images/outstar1.png">
											 </td>
										</tr>
										<tr>
											<td><textarea rows="5" cols="80" id="rvsubject" name="subject"></textarea></td>
											<td width="20"></td>
											<td>
												<c:if test="${empty id }">
													<button type="button" class="site-btn site-btn4" style="height: 50px;" onclick="javascript:alert('로그인 후 작성가능합니다.')">리뷰 작성</button>												
												</c:if>
												<c:if test="${not empty id }">
													<c:if test="${empty reviewCheck }">
														<button type="button" class="site-btn site-btn4" id="rvInsertBtn" onclick="rvBtnFun()" style="height: 50px;">리뷰 작성</button>												
													</c:if>
													<c:if test="${not empty reviewCheck }">
														<script>$("#rvsubject").attr("placeholder","이미 작성하셨습니다.")</script>
														<button type="button" class="site-btn site-btn4" style="height: 50px;" onclick="javascript:alert('이미 작성했습니다.')">리뷰 작성</button>												
													</c:if>
												</c:if>
											</td>
										</tr>
										<input type="hidden" id="starvalue" value=0>
									</table>									
								</div>
							</form>
								<input type="hidden" id="reInsertV" name="star" value="">
								<div style="height: 20px"></div>
								<div class="shoping__cart__table">
								
								<table id="reviewstb">
									<thead>
										<tr>
											<th>작성자</th>
											<th width="500px">내용</th>
											<th>평점</th>
											<th>작성일자</th>
										</tr>
									</thead>
									<tbody id="reviewstbody">
										 									
									</tbody>									
								</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	var dialog = (function(obj) {
		obj.init();
		$(obj.onLoad);
		return obj;
	})((function() {
		var $dialog = $('<div class="dialog"></div>');
		return {
			init : function() {

			},
			onLoad : function() {
				$("body").prepend($dialog);
				$dialog.dialog({
					autoOpen : false,
				});
			},
			set : function(option) {
				$dialog.dialog(option);
			},
			open : function(body) {
				$dialog.html(body);
				$dialog.dialog("open");
			},
			close : function() {
				$dialog.dialog("close");
			},
			get : function() {
				return $dialog;
			}
		}
	})());
	
		$(function() {
			// 옵션을 설정한다.
			dialog.set({
				// 타이틀 설정
				title : "도서 대출",
				// 모달 여부
				modal : true,
				// 버튼 설정
				buttons : {
					ebook : ebookclick,
					delivery : deliveryclick,
					cancel : function() {
						dialog.close();
					}
				}
			});		
		});
		
		
		//////////
		var dialog2 = (function(obj) {
			obj.init();
			$(obj.onLoad);
			return obj;
		})((function() {
			var $dialog2 = $('<div class="dialog2"></div>');
			return {
				init : function() {

				},
				onLoad : function() {
					$("body").prepend($dialog2);
					$dialog2.dialog({
						autoOpen : false,

					});
				},
				set : function(option) {
					$dialog2.dialog(option);
				},
				open : function(body) {
					$dialog2.html(body);
					$dialog2.dialog("open");
				},
				close : function() {
					$dialog2.dialog("close");
				},
				get : function() {
					return $dialog2;
				}
			}
		})());
		
			$(function() {
				// 옵션을 설정한다.
				dialog2.set({
					// 타이틀 설정
					title : "도서 반납",
					// 모달 여부
					modal : true,
					// 버튼 설정
					buttons : {
						반납 : bookreclick,
						취소 : function() {
							dialog2.close();
						}
					}
				});		
			});
		
		$(".dialog-btn").on("click", function() {
			// 다이얼로그를 연다.
			var bisbn = $("#rentisbn").val();
			if(${rentCheck > 4 }){
				alert("1인당 6권이상 빌릴 수 없습니다.");
				return;
			}else{
				if(${book.total - book.brow} == 0){
					$.ajax({
						url: "bookbendDate.do",
						type: "post",
						data: {bisbn:bisbn},
						dataType: "text",
						success: function (result) {
							if(result != null) {				
								alert('모두 대출되어 대출할 수 없습니다 \n빠른 반납날짜 : '+result);
								return;
							}
						},
						error: function () {
							console.log("fail");
						}
					});
				}else{
					dialog.open("<p>대출하시겠습니까?</p>");
				}
			}
		});
		
		function ebookclick() {
			var bisbn = $("#rentisbn").val();
			var deliveryn = "N";
				$.ajax({
					url: "rentBook.do",
					dataType: "text",
					type : "post",
					data: {deliveryn : deliveryn, bisbn : bisbn},
					success: function (data) {
						if(data != null){
							dialog.close();
							alert('대출되었습니다! \n예상반납일: '+data);
							location.reload();
						}else{
							alert('실패했습니다. 관리자에게 문의하세요.');
						}
					}
				});
		}
		
		function deliveryclick() {
			var address = '${member.address}  ${member.addressdetail}';
			if(confirm("주소 : " + address + "로 배송됩니다. \n해당 주소가 아닐시 회원정보 변경 후 이용해주세요.")){
				var bisbn = $("#rentisbn").val();
				var deliveryn = "Y";
					$.ajax({
						url: "rentBook.do",
						dataType: "text",
						type : "post",
						data: {deliveryn:deliveryn, bisbn: bisbn},
						success: function (data) {
							if(data != null){
								dialog.close();
								alert('대출되었습니다! \n예상반납일: '+data);
								location.reload();
							}else{
								alert('실패했습니다. 관리자에게 문의하세요.');
							}
						}
					});
			}
		}
		
	$("#heartbook").on("click", function() {
		var id = $("#loginid").val();
		var isbn = $("#rentisbn").val();
		if($("#hearticon").attr("class") == "icon_heart_alt"){	
			$.ajax({
				url: "likeBookInsert.do",
				data: {id:id, isbn: isbn},
				dataType: "text",
				type : "post",
				success: function (data) {
					if(data == 'T'){
						$("#hearticon").attr("class","fa fa-heart");
						alert('관심도서에 등록하였습니다.');															
					}
				}
			}); 
		}else{
			$.ajax({
				url: "likeBookDelete.do",
				data: {id:id, isbn: isbn},
				dataType: "text",
				type : "post",
				success: function (data) {
					if(data == 'T'){
						$("#hearticon").attr("class","icon_heart_alt");
						alert('관심도서에서 삭제하였습니다.');															
					}
				}
			}); 
		}
		
	});
	
	
	$(".dialog-btn2").on("click", function () {
		dialog2.open("<p>반납하시겠습니까?</p>");
	});
	
	function bookreclick() {
		var bisbn = $("#rentisbn").val();
		$.ajax({
			url: "returnBook.do",
			dataType: "text",
			type : "post",
			data: {bisbn: bisbn},
			success: function (data) {
				if(data == 'T'){
					dialog2.close();
					if(${rentbook.deliveryn eq 'Y'}){
						if(${rentbook.deliverstate eq '배송요청'})
							alert('반납되었습니다!');
						else
							alert('수거요청 처리되었습니다. \n수거 완료 후 자동 반납처리됩니다.');
					}else{
						alert('반납되었습니다!');						
					}
					location.reload();
				}else{
					alert('실패했습니다. 관리자에게 문의하세요.');
				}
			}
		});
	}
	
	
	$(".ebook").on("click", function () {
		window.open('resources/cloud-reader/index.html?epub=epub_content/${book.isbn }',"height=800px, width=1200px");

	});
	
	$("#reviews").on("click", function () {
		var isbn = $("#rentisbn").val();
		$.ajax({
			url: "reviewsBook.do",
			dataType: "json",
			type:"post",
			data: {isbn: isbn},
			success: function (result) {
				if (result.length >= 1) {
					result.forEach(function(breview) {
						$tr = $("<tr>").attr("class", "reviewstr")
						$("<td>").text(breview.id).appendTo($tr)
						$("<td>").text(breview.subject).appendTo($tr)
 						
 						$td = $("<td>");
 						for(var i = 0 ; i < breview.star; i++){
							$td.append($("<img>").attr("src","resources/images/star1.png"))
						}	 
						$tr.append($td);
						
						$("<td>").text(breview.wdate).appendTo($tr)
						if(`${id}` == breview.id){
							$td = $("<td>").append($("<button>").html("삭제").attr("type","button").attr("class","site-btn").attr("onclick","rvdelBtn(this)"));
							$td.appendTo($tr);
						}else{
							$("<td>").appendTo($tr);
						}
						$('#reviewstbody').append($tr)
					})
				} 
				$('#reviewstb').show();				
			}
		});
		
	});
	
	
	function show(star){
		if($("#starvalue").val() == 1)
			return;
		var i;
		var image;
		var el;
		var e = document.getElementById('startext');
		var stateMsg;
		
		for(i=1; i<=star; i++){
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "resources/images/star1.png";
		}
	}
	
	function noshow(star) {
		if($("#starvalue").val() == 1)
			return;
		var i;
		var image;
		var el;
		for(i=1;i<=star;i++){
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "resources/images/outstar1.png";
		}
	}
	
	function lock(star) {
		show(star);
		$("#starvalue").val("1");
	}
	
	function mark(star) {
		lock(star);	
		document.getElementById("reInsertV").value = star;
	}
	
	function rvBtnFun() {
	
		var isbn = $("#rentisbn").val();
		var subject = $("#rvsubject").val();
		var star = $("#reInsertV").val();
		if(star == 0){
			alert("평점을 선택해주세요.");
			return;
		}else if(subject == ''){
			alert("내용을 입력해주세요.");
			return;
		}
		
		$.ajax({
			url: "reviewInsert.do",
			data: {isbn:isbn, subject:subject, star:star},
			type: "post",
			dataType: "json",
			success: function (breview) {
				alert("등록했습니다.");
				console.log(breview);
				$tr = $("<tr>").attr("class", "reviewstr")
				$("<td>").text(breview.id).appendTo($tr)
				$("<td>").text(breview.subject).appendTo($tr)
				$td = $("<td>");
				for(var i = 0 ; i < breview.star; i++){
					$td.append($("<img>").attr("src","resources/images/star1.png"))
				}	 
				$tr.append($td);
				
				$("<td>").text(breview.wdate).appendTo($tr)
				$td = $("<td>").append($("<button>").html("삭제").attr("type","button").attr("class","site-btn").attr("onclick","rvdelBtn(this)"));
							$td.appendTo($tr);
				$('#reviewstbody').prepend($tr)
				
				$('#reviewstb').show();
				
				$("#rvInsertBtn").attr("onclick","alert('이미 작성하셨습니다.')");
				$("#rvsubject").val('');
				$("#image1").attr("src", "resources/images/outstar1.png");	
				$("#image2").attr("src", "resources/images/outstar1.png");	
				$("#image3").attr("src", "resources/images/outstar1.png");	
				$("#image4").attr("src", "resources/images/outstar1.png");	
				$("#image5").attr("src", "resources/images/outstar1.png");	
				$("#rvsubject").attr("placeholder","이미 작성하셨습니다.");
				
			}
		}); 
	}
	
	function rvdelBtn(btn) {
		var isbn = $("#rentisbn").val();
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url: "reviewDelete.do",
				dataType: "text",
				type:"post",
				data: {isbn: isbn},
				success: function (result) {
					if(result == "T"){
						alert("삭제되었습니다.");
						$(btn).parent().parent().remove();
						
						$("#rvInsertBtn").attr("onclick","rvBtnFun()");
						$("#rvsubject").attr("placeholder","");
						$("#starvalue").val("0");
					}
				}
			});
		}
	}
	
	
	var dialog3 = (function(obj) {
		obj.init();
		$(obj.onLoad);
		return obj;
	})((function() {
		var $dialog3 = $('<div class="dialog3"></div>');
		return {
			init : function() {

			},
			onLoad : function() {
				$("body").prepend($dialog3);
				$dialog3.dialog({
					autoOpen : false,

				});
			},
			set : function(option) {
				$dialog3.dialog(option);
			},
			open : function(body) {
				$dialog3.html(body);
				$dialog3.dialog("open");
			},
			close : function() {
				$dialog3.dialog("close");
			},
			get : function() {
				return $dialog3;
			}
		}
	})());
	
		$(function() {
			// 옵션을 설정한다.
			dialog3.set({
				// 타이틀 설정
				title : "도서 연장",
				// 모달 여부
				modal : true,
				// 버튼 설정
				buttons : {
					연장 : extensionAjaxFnc,
					취소 : function() {
						dialog3.close();
					}
				}
			});		
		});
	
	$(".dialog-btn").on("click", function() {
		// 다이얼로그를 연다.
		var bisbn = $("#rentisbn").val();
		if(${book.total - book.brow} == 0){
			$.ajax({
				url: "bookbendDate.do",
				type: "post",
				data: {bisbn:bisbn},
				dataType: "text",
				success: function (result) {
					if(result != null) {				
						alert('모두 대출되어 대출할 수 없습니다 \n빠른 반납날짜 : '+result);
						return;
					}
				},
				error: function () {
					console.log("fail");
				}
			});
		}else{
			dialog.open("<p>대출하시겠습니까?</p>");
			
		}
	});
	
	
	$(".dialog-btn3").on("click", function () {
		dialog3.open("<p>연장하시겠습니까?</p>");
	});
	
	
	function extensionAjaxFnc(){
		  var isbn = ${book.isbn};
		  var renewcnt = ${rentbook.renewcnt}
	       console.log(isbn,renewcnt)
       
            $.ajax({
                url:"extensionAjax.do",
                type:"POST",
                data:{id:'${id}',isbn:isbn,renewcnt:renewcnt},
                success:function(data){
                	console.log(data);
                	
                    if(data=="T"){
                        alert("일주일 연장되었습니다.");
                        location.reload();
                    }else if(data=="F"){
                    	alert("연장횟수 초과했습니다.");
                    	location.reload();
                    }
                },error:function(error){
                	console.log(error)
                }
            })
        } 
	    
</script>