<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 	<script src="resources/js/jquery-3.3.1.min.js"></script>
<style>
.card .card-body {
	background-color: #f0f1f6;
}

table {
	background-color: #ffffff;
}

.form-control{
	width: 200px;
	display: inline-block;
}
</style>
<div class="content-wrapper">           
          <div class="d-xl-flex justify-content-between align-items-start">
            <h1 class="text-dark font-weight-bold mb-2"> 도서 관리 </h1>
          </div>
          <div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="col-md-12">
				           	<select id="searchType" name="searchType" class="form-control">
				              	<option value="isbn">ISBN</option>
				                <option value="title">제목</option>
				                <option value="writer">저자</option>
				                <option value="publisher">출판사</option>
				 
				              </select>  
				              <input type="text" id="searchinput" name="searchinput" class="form-control">
				              <button type="button" class="btn btn-light btn-rounded btn-fw" onclick="bookASearch()" id="asearchbtn" >검색</button> 
				              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 			  <button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="location.href ='bookinsertForm.do'" id="ainsertbtn">도서 등록</button>
            			<br>
		          <div class="row">
		            <div class="col-md-12">
		              <div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
		                <br>
		            
		              </div>
		              <div class="tab-content tab-transparent-content">
		                <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">                    
		                  <div class="row">
		                    <div class="col-12 grid-margin">
		                      <div class="card">
		                      <form>
		                        <table class="table table-bordered" id="booklist">
			                        <thead>
			                        	<tr align="center">
			                        		<th>ISBN</th>
			                        		<th>제목</th>
			                        		<th>저자</th>
			                        		<th>주제/분류</th>
			                        		<th>출판사</th>
			                        		<th>총 권수</th>
			                        		<th>상태</th>
			                        		<th>추천도서</th>
			                        	</tr>
			                        </thead>
			                        <tbody class="booklistTb" id="booklistTb">
		                        	<c:forEach items="${booklist }" var="book">
		                        		<tr >
		                        		<td class="booklisttr" onclick="location.href='bookupdateForm.do?isbn=${book.isbn}'">${book.isbn }</td>
		                        		<td>${book.title }</td>
		                        		<td>${book.writer }</td>
		                        		<td>${book.bclass }</td>
		                        		<td>${book.publisher }</td>
		                        		<td>${book.total }</td>
		                        		<td align="center">${book.status }</td>
		                        		<c:if test="${book.recommyn eq 'Y'}">
		                        			<td align="center"><button type="button" class="btn btn-outline-secondary btn-rounded btn-icon" onclick="recommBtn('${book.isbn }', this)">
		                        				<i class="mdi mdi-heart-outline text-danger" ></i>
		                        			</button></td>
		                        		</c:if>
		                        		<c:if test="${book.recommyn eq 'N'}">
		                        			<td align="center"><button type="button" class="btn btn-outline-secondary btn-rounded btn-icon" onclick="recommBtn('${book.isbn }', this)">
		                        				<i class="mdi mdi-heart-outline"></i>
		                        			</button></td>
		                        		</c:if>
		                        		
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
					</div>
				</div>			
            </div>
        </div>
        
        
    <script type="text/javascript">
		
		// 검색~~~~~~~~~~~~~~~~
		function bookASearch() {
		$.ajax({
			type : "post",
			url : "bookASearch.do",
			data : { "searchType" : $("#searchType").val(), "searchinput" : $("#searchinput").val() },
			dataType : "json",
			success : function(result) {
				$('#booklistTb').empty();
				if (result.length >= 1) {
					result.forEach(function(book) {
						$tr = $("<tr>")
						$("<td>").text(book.isbn).attr("class", "booklisttr").appendTo($tr)
						$("<td>").text(book.title).appendTo($tr)
						$("<td>").text(book.writer).appendTo($tr)
						$("<td>").text(book.bclass).appendTo($tr)
						$("<td>").text(book.publisher).appendTo($tr)
						$("<td>").text(book.total).appendTo($tr)
						$("<td>").text(book.status).appendTo($tr)
						if(book.recommyn == "N"){
							$btn = $("<button>").attr("class", "btn btn-outline-secondary btn-rounded btn-icon").attr("onclick", "recommBtn('${book.isbn}', this)")
							.append($("<i>").attr("class","mdi mdi-heart-outline"));
							$td = $("<td>").append($btn);
							$td.appendTo($tr)
						}else{
							$btn = $("<button>").attr("class", "btn btn-outline-secondary btn-rounded btn-icon").attr("onclick", "recommBtn('${book.isbn}', this)")
							.append($("<i>").attr("class","mdi mdi-heart-outline text-danger"));
							$td = $("<td>").append($btn);
							$td.appendTo($tr)
						}
						$('#booklistTb').append($tr)
					})
					// tr 누르면 수정폼으로 이동하게
					$(".booklisttr").bind("click", function() {
						isbn = $(event.currentTarget).html();
						console.log(isbn);
						location.href = "bookupdateForm.do?isbn=" + isbn;
				    });
				} else {
					$tr = $("<tr>")
					$td = $("<td>").text("조회 결과 없음").attr("colspan", "8")
					$tr.append($td)
					$('#booklistTb').append($tr)
				}
				$('#booklistTb').show();				
			}
		});
	}
		// 검색 버튼 엔터
		$("#searchinput").keypress(function() {
			if (event.keyCode == 13) {
				asearchbtn.click();
			}
		});
	
		
		 $(function(){
			 $(".booklistTb").on("mouseover", function(){
		         $(event.target).parent().css("background-color","rgb(219, 218, 218)");
		         $(event.target).parent().css("color","white");
		     });
			 
			 $(".booklistTb").on("mouseout", function(){
		         $(event.target).parent().css("background-color","");
		         $(event.target).parent().css("color","");
		     });
		
		})
		
	function recommBtn(isbn, btn){		
		if($(btn).children().attr("class") == "mdi mdi-heart-outline text-danger"){
			if(confirm("추천도서에서 삭제하시겠습니까?")){
				$.ajax({
					url: "bookrecommUpdate.do",
					data: {isbn:isbn, recommyn: "N"},
					type: "post",
					dataType: "text",
					success: function (data) {
						alert("추천도서에서 삭제하였습니다.");
						$(btn).children().attr("class", "mdi mdi-heart-outline");
					}
				});
			}	 
		}else{
			if(confirm("추천도서로 등록하시겠습니까?")){
				$.ajax({
					url: "bookrecommUpdate.do",
					data: {isbn:isbn, recommyn: "Y"},
					type: "post",
					dataType: "text",
					success: function (data) {
						alert("추천도서로 등록되었습니다.");
						$(btn).children().attr("class", "mdi mdi-heart-outline text-danger");
					}
				});
			}
		}
		
	 }
	
</script>
        