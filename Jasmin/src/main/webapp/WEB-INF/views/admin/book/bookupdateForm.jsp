<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script src="resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

	function bookUpdate() {
		
		var title = document.getElementById("utitle").value;
		var pyear = document.getElementById("upyear").value;
		var publisher = document.getElementById("upublisher").value;
		var total = document.getElementById("utotal").value;
		var bclass = document.getElementById("ubclass").value;
		
		if (title == '') {
			alert("제목을 입력해주세요.")
			return false;
		} else if (pyear == '') {
			alert("출판연도를 입력해주세요.")
			return false;
		} else if (publisher == '') {
			alert("출판사를 입력해주세요.")
			return false;
		} else if (total == '') {
			alert("총 권수를 입력해주세요.")
			return false;
		}else if (bclass == '') {
			alert("주제를 입력해주세요.")
			return false;
		}
	
		
		if (confirm("수정하시겠습니까?")) {
			$("#updatefrm").submit();
			
        } 
	}
	
	function bookDelete() {
		if(${books.brow ne '0'}){
			alert('대출된 도서는 삭제 상태로 변경할 수 없습니다.');
			return;
		}
		if (confirm("삭제하시겠습니까?")) {
			var isbn = document.getElementById("uisbn").value;
			
			location.href = "bookDelete.do?isbn="+ isbn;
        } 
	}
</script>
</head>
<div class="content-wrapper">
	<div class="d-xl-flex justify-content-between align-items-start">
		<h1 class="text-dark font-weight-bold mb-2">도서 수정/삭제</h1>
	</div>
	<div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
      <br>
    </div>
	<br>
	<div class="row">
       <div class="col-md-6 grid-margin stretch-card">
        
       </div>
       
       <div class="col-12 grid-margin stretch-card">
         <div class="card">
           <div class="card-body">
         
             <form class="forms-sample" id="updatefrm" method="post" enctype="multipart/form-data" action="bookUpdate.do">
               <div class="form-group">
                 <label for="uisbn" style="color: black; font-weight: bold;">ISBN</label>
	                 <input type="text" class="form-control" id="uisbn" name="isbn" readonly value="${books.isbn }">
               </div>
               <div class="form-group">
                 <label for="utitle" style="color: black; font-weight: bold;">제목</label>
                 <input type="text" class="form-control" id="utitle" name="title" value="${books.title }">
               </div>
               <div class="form-group">
                 <label for="uwriter" style="color: black; font-weight: bold;">저자</label>
                 <input type="text" class="form-control" id="uwriter" name="writer"	value="${books.writer }">
               </div>
               <div class="form-group">
                 <label for="upublisher" style="color: black; font-weight: bold;">출판사</label>
                 <input type="text" class="form-control" id="upublisher" name="publisher" value="${books.publisher }">
               </div>
               <div class="form-group">
                 <label for="upyear" style="color: black; font-weight: bold;">출판연도</label>
                 <input type="number" class="form-control" id="upyear" name="pyear" value="${books.pyear }">
               </div>
               <div class="form-group">
                 <label for="ubclass" style="color: black; font-weight: bold;">주제</label>
                 <select class="form-control" id="ubclass" name="bclass">
                   	<option value="">선택하세요.</option>
					<option value="100" <c:if test="${books.bclass eq '100' }">selected</c:if>>100 철학</option>
					<option value="200" <c:if test="${books.bclass eq '200' }">selected</c:if>>200 종교</option>
					<option value="300" <c:if test="${books.bclass eq '300' }">selected</c:if>>300 사회과학</option>
					<option value="400" <c:if test="${books.bclass eq '400' }">selected</c:if>>400 자연과학</option>
					<option value="500" <c:if test="${books.bclass eq '500' }">selected</c:if>>500 기술과학</option>
					<option value="600" <c:if test="${books.bclass eq '600' }">selected</c:if>>600 예술</option>
					<option value="700" <c:if test="${books.bclass eq '700' }">selected</c:if>>700 언어</option>
					<option value="800" <c:if test="${books.bclass eq '800' }">selected</c:if>>800 문학</option>
					<option value="900" <c:if test="${books.bclass eq '900' }">selected</c:if>>900 역사</option>
                 </select>
               </div>
               <div class="form-group">
                 <label for="utotal" style="color: black; font-weight: bold;">총 권수</label>
                 <input type="number" class="form-control" id="utotal" name="total" value="${books.total }">
               </div>
               <div class="form-group">
                 <label style="color: black; font-weight: bold;">File upload</label>
                 <div class="input-group col-xs-12">
                   <input type="file" class="form-control file-upload-info" id="ufile" name="file">
                   
                 </div>
                 <div>
					<c:if test="${not empty books.bpicture }">
						<span>기존 파일 : ${books.bpicture }</span>
					</c:if>
					</div>
               </div>
               
               <div class="form-group">
                 <label for="uchapter" style="color: black; font-weight: bold;">목 차</label>
                 <textarea class="form-control" rows="7" id="uchapter" name="chapter">${books.chapter }</textarea>
               </div>
               <div class="form-group">
                 <label for="uwsubject" style="color: black; font-weight: bold;">저자 소개</label>
                 <textarea class="form-control" rows="7" id="uwsubject" name="wsubject">${books.wsubject }</textarea>
               </div>
               <div class="form-group">
                 <label for="usubject" style="color: black; font-weight: bold;">도서 소개</label>
                 <textarea class="form-control" rows="7" id="usubject" name="subject">${books.subject }</textarea>
               </div>
               <button type="button" id="OK" class="btn btn-danger btn-rounded btn-fw" onclick="bookUpdate()">수정</button>
               <button type="button" class="btn btn-danger btn-rounded btn-fw" onclick="bookDelete()">삭제</button>
               <button type="button" onclick="history.back()" class="btn btn-secondary">취소</button>
             </form>
           </div>
         </div>
       </div>
     </div>
	
	
</div>