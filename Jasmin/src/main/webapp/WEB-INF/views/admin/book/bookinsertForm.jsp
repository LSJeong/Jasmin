<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function isbnCheck() {
	var isbn = document.getElementById("iisbn").value; 
	if(isbn == ''){ 
		alert("ISBN을 입력하세요.");
		return;
	}
	
	$.ajax({
		url : "isbnCheck.do",
		type: "post",
		data: { isbn : isbn },
		dataType: "text",  
		success: function (data) {
			if(data == 'F'){
				alert("사용할 수 있는 ISBN입니다.");
				document.getElementById("chkbtn2").value = "Y";
				document.getElementById("chkbtn2").setAttribute("disabled",true); 
			}else{
				alert("이미 존재하는 ISBN입니다.");
				document.getElementById("iisbn").value = "";
				document.getElementById("iisbn").focus();
			}
		}
	});
}

function bookinsert() {
	if(document.getElementById("chkbtn2").value == "N"){
		alert("ISBN을 체크하세요.");
		return;
	}
	
	var title = document.getElementById("ititle").value;
	var pyear = document.getElementById("ipyear").value;
	var publisher = document.getElementById("ipublisher").value;
	var total = document.getElementById("itotal").value;
	var bclass = document.getElementById("ibclass").value;
	
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
	$("#insertform").submit();
}

</script>
</head>
<div class="content-wrapper">
	<div class="d-xl-flex justify-content-between align-items-start">
		<h1 class="text-dark font-weight-bold mb-2">도서 등록</h1>
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
         
             <form class="forms-sample" id="insertform" method="post" enctype="multipart/form-data" action="bookupload.do">
               <div class="form-group">
                 <label for="iisbn">ISBN</label>
                 <div class="input-group col-xs-12">
	                 <input type="text" class="form-control" id="iisbn" name="isbn" >
	                    <span class="input-group-append">
	                      <button class="btn btn-primary" type="button" onclick="isbnCheck()" value="N" id="chkbtn2">ISBN 체크</button>
	                    </span>
                  </div>
               </div>
               <div class="form-group">
                 <label for="ititle">제목</label>
                 <input type="text" class="form-control" id="ititle" name="title">
               </div>
               <div class="form-group">
                 <label for="iwriter">저자</label>
                 <input type="text" class="form-control" id="iwriter" name="writer">
               </div>
               <div class="form-group">
                 <label for="ipublisher">출판사</label>
                 <input type="text" class="form-control" id="ipublisher" name="publisher">
               </div>
               <div class="form-group">
                 <label for="ipyear">출판연도</label>
                 <input type="number" class="form-control" id="ipyear" name="pyear">
               </div>
               <div class="form-group">
                 <label for="ibclass">주제</label>
                 <select class="form-control" id="ibclass" name="bclass">
                   	<option value="">선택하세요.</option>
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
               </div>
               <div class="form-group">
                 <label for="itotal">총 권수</label>
                 <input type="number" class="form-control" id="itotal" name="total">
               </div>
               <div class="form-group">
                 <label>File upload</label>
                 <div class="input-group col-xs-12">
                   <input type="file" class="form-control file-upload-info" id="ifile" name="file">
                 </div>
               </div>
               
               <div class="form-group">
                 <label for="ichapter">목 차</label>
                 <textarea class="form-control" id="ichapter" name="chapter" rows="7"></textarea>
               </div>
               <div class="form-group">
                 <label for="iwsubject">저자 소개</label>
                 <textarea class="form-control" id="iwsubject" name="wsubject" rows="7"></textarea>
               </div>
               <div class="form-group">
                 <label for="isubject">도서 소개</label>
                 <textarea class="form-control" id="isubject" name="subject" rows="7"></textarea>
               </div>
               <button type="button" class="btn btn-primary btn-fw" onclick="bookinsert()">등록</button>
               <button type="button" onclick="history.back()" class="btn btn-light">취소</button>
             </form>
           </div>
         </div>
       </div>
     </div>
	
</div>