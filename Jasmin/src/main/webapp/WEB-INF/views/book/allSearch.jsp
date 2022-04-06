<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<style>
	#bstitle{
		border: #8E5F46 4px solid;
		border-radius: 5px;
		width: 580px;
		height: 60px;
	}
	.nice-select{
		margin-bottom: 25px;
	}
</style>
<body>
<section class="breadcrumb-section set-bg" data-setbg="resources/images/lib2.PNG">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>통합검색</h2>
                       
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
                            <h4>도서자료</h4>
                            <ul id="topMenu">
                                <li><a href="allSearch.do" style="color: var(--main-light-brown);">통합 검색</a></li>
                                <li><a href="newbook.do">올해 신간도서</a></li>
                                <li><a href="bestbook.do">베스트도서</a></li>
                                <li><a href="chapter.do?bclass=100">주제별</a></li>
								<li><a href="chapter.do?bclass=100"> - 철학</a></li>
								<li><a href="chapter.do?bclass=200"> - 종교</a></li>
								<li><a href="chapter.do?bclass=300"> - 사회과학 </a></li>
								<li><a href="chapter.do?bclass=400"> - 자연과학</a></li>
								<li><a href="chapter.do?bclass=500"> - 기술과학</a></li>
								<li><a href="chapter.do?bclass=600"> - 예술</a></li>
								<li><a href="chapter.do?bclass=700"> - 언어</a></li>
								<li><a href="chapter.do?bclass=800"> - 문학</a></li>
								<li><a href="chapter.do?bclass=900"> - 역사</a></li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>통합 검색</h2>
                        </div>
                       	<div align="center" >
                        	<form id="allSearchForm" name="allSearchForm" >
                        	<div align="center" style="height: 100px; ">
                        		<input type="text" id="bstitle" name="title" placeholder="도서제목을 입력하세요." >
                        	</div>
                        	
                        	<table style="margin-bottom: 30px;">
                        		<tr style="height: 70px;">
                        		
                        			<th style="width: 100px;"><div class="checkout__input">주제</div></th>
                        			<td>
										<select style="width: 200px;" id="bsbclass" name="bclass">
										<option value="0">선택하세요.</option>
										<option value="100">100 철학</option>
										<option value="200">200 종교</option>
										<option value="300">300 사회과학</option>
										<option value="400">400 자연과학</option>
										<option value="500">500 기술과학</option>
										<option value="600">600 예술</option>
										<option value="700">700 언어</option>
										<option value="800">800 문학</option>
										<option value="900">900 역사</option>
										</select>
									</td>
                        			<th style="width: 100px;"><div class="checkout__input">ISBN</div></th>
                        			<td><div class="checkout__input"><input type="text" id="bsisbn" name="isbn"></div></td>
                        		</tr>
                        		<tr style="height: 70px;">
                        			<th><div class="checkout__input">저자</div></th>
                        			<td><div class="checkout__input"><input type="text" id="bswriter" name="writer" style="width: 180px"></div></td>
                        			<th><div class="checkout__input">출판사</div></th>
                        			<td><div class="checkout__input"><input type="text" id="bspublisher" name="publisher"></div></td>
                        		</tr>
                        		<tr style="height: 70px;">
                        			<th><div class="checkout__input">출판연도</div></th>
                        			<td colspan="2"><div class="checkout__input"><input type="number" id="bssyear" name="pyear" maxlength="4" style="width: 180px"> &nbsp;&nbsp; ~ &nbsp;&nbsp; 
                        			<input type="number" id="bseyear" name="eyear" maxlength="4" style="width: 180px"> </div>
                        			</td>
                        		</tr>
                        	</table>
                        	</form>
                        	<button type="button" class="site-btn" onclick="allSearchBook()">검색하기</button>
                        	<button type="reset" class="site-btn site-btn3">검색초기화</button>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span></span> Books found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                 <div class="row" id="searchResult">
                    <div id="allsearchList" ></div>  
                    <c:forEach items="${mainBookSearchs }" var="mainBookSearch">
                    	<div class="col-lg-4 col-md-6 col-sm-6">
	                    	<div class="product__item">
		                    	<div class="product__item__pic set-bg" data-setbg="/filePath/${mainBookSearch.ppicture }">
		                    		<ul class="product__item__pic__hover">
		                    			<li><a href="#"><i class="fa fa-heart"></i></a></li>
		                    		</ul>
		                    	</div>
		                    	<div class="product__discount__item__text">
									<span>${mainBookSearch.writer }</span>
									<h5><strong>${mainBookSearch.title }</strong></h5>
								</div>
	                    	</div>
                    	</div>
                    </c:forEach> 
                   </div>                  
                </div>
            </div>
        </div>
    </section>
    
    <script type="text/javascript">
    	function allSearchBook() {
    		
    		if($("#bssyear").val() != '' && $("#bseyear").val() == ''){
    			alert('시작연도를 다시 확인해주세요.');
    			return;	  
    		}else if($("#bssyear").val() == '' && $("#bseyear").val() != ''){
    			alert('종료연도를 다시 확인해주세요.');
    			return;
    		}else if($("#bssyear").val() != '' && $("#bseyear").val() != ''){
    			if($("#bssyear").val().length != 4 || $("#bseyear").val().length != 4){
    				alert('연도형식이 맞지 않습니다.');
    				return;
    			}
    			if($("#bssyear").val() > $("#bseyear").val()){
    				alert('앞의 날짜가 더 클 수 없습니다.')
					return;    				
    			}
    		}
    		var allSearch = $("form[name=allSearchForm]").serialize();
    		console.log(allSearch);
			$.ajax({
				url: "allSearchBook.do",
				data : allSearch,
				type : "post",
				dataType : "json",
				success : function(result) {
					$('#searchResult').empty();
					if (result.length >= 1) {
						//alert("총 " + result.length +"권이 검색되었습니다.");	
						$(".filter__found").find("span").text(result.length) ;
						result.forEach(function(searchBook) {
							console.log(searchBook.title)
							$div1 = $("<div>").attr("class","col-lg-4 col-md-6 col-sm-6");
							$div2 = $("<div>").attr("class","product__item");
							if(searchBook.ppicture == null){
								$div3 = $("<div>").attr("class", "product__item__pic set-bg").attr("data-setbg", "/filePath/1234.PNG").attr("onclick","location.href=detailbook.do?isbn="+searchBook.isbn)
								.css("background-image","url(/filePath/1234.PNG)");
							}else{
								$div3 = $("<div>").attr("class", "product__item__pic set-bg").attr("data-setbg", "/filePath/"+searchBook.ppicture).attr("onclick","location.href='detailbook.do?isbn="+searchBook.isbn+"'")
								.css("background-image","url(/filePath/"+ searchBook.ppicture+ ")");
							}
							$div3.append($("<ul>").attr("class","product__item__pic__hover").append($("<li>").append($("<a>").attr("href","#").append($("<i>").attr("class","fa fa-heart")))));
							$div1.append($div2.append($div3));
							
							$div4 = $("<div>").attr("class","product__discount__item__text");
							$span = $("<span>").html(searchBook.writer);
							$h5 = $("<h5>").append($("<strong>").html(searchBook.title));
							$div4.append($span).append($h5);
							
							$div2.append($div4);
							
							$('#searchResult').append($div1);
						})
						
					} else {
						$(".filter__found").find("span").text("0") ;
						$('#searchResult').empty();
						/* $table = $('<table>');
						$tr = $("<tr>")
						$td = $("<td>").text("조회 결과 없음");
						$tr.append($td)
						$table.append($tr)
						$('#searchResult').append($table); */
						alert('조회결과가 없습니다.');
					}
					$('#searchResult').show();		
				}
			});
		}
    </script>
</body>
    