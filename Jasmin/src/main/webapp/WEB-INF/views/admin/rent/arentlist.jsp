<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.form-control { width: 100px; }
.card .card-body { background-color: #f0f1f6; }
table { background-color: #ffffff; }
</style>

<div class="content-wrapper">
   <div class="d-xl-flex justify-content-between align-items-start">
      <h1 class="text-dark font-weight-bold mb-2">전체 대출 목록</h1>
   </div>
   <div class="col-lg-12 grid-margin stretch-card">
      <div class="card">
         <div class="card-body">
            <div>
               <select id="Rkey" name="Rkey">
                  <option value="mid" selected>ID</option>
                  <option value="name">이름</option>                  
                  <option value="title">도서명</option>
               </select>
               <input type="text" id="Rkeyword" name="Rkeyword">
               <button type="button" class="btn btn-primary btn-sm" id="Rbtn" onclick="ajaxGetSearchRentList()">검색</button>
            </div><br>
            <div>상세 대출 정보를 보려면 리스트를 클릭하세요.</div>
            <table id="Rlist" class="table table-bordered">
               <thead>
                  <tr>
                     <th>ID</th>
                     <th>이름</th>
                     <th>도서명</th>
                     <th>대출일</th>
                     <th>반납예정일</th>
                     <th>반납일</th>                     
                     <th>배송여부</th>
                  </tr>
               </thead>
               <tbody id="Rlistbody">
                  <c:forEach items="${infolist }" var="info" varStatus="status">
                     <tr class="Rtrid">
                        <td>${info.mid }</td>
                        <td>${info.name }</td>
                        <td>${info.title }</td>
                        <td>${info.bstart }</td>
                        <td>${info.bend }</td>
                        <td>${info.rdate }</td>
                        <td>${info.deliveryn }</td>                        
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
   function ajaxGetSearchRentList() {
      $.ajax({
         type : "post",
         url : "ajaxGetSearchRentList.do",
         data : { "Rkey" : $("#Rkey").val(), "Rkeyword" : $("#Rkeyword").val() },
         dataType : "json",
         success : function(result) {
            $('#Rlistbody').empty();
            if (result.length >= 1) {
               console.log(result);
               result.forEach(function(info) {
                  $tr = $("<tr>").attr("class", "Rtrid")
                  $("<td>").text(info.mid).appendTo($tr)
                  $("<td>").text(info.name).appendTo($tr)
                  $("<td>").text(info.title).appendTo($tr)
                  $("<td>").text(info.bstart).appendTo($tr)
                  $("<td>").text(info.bend).appendTo($tr)
                  $("<td>").text(info.rdate).appendTo($tr)
                  $("<td>").text(info.deliveryn).appendTo($tr)   
                  $('#Rlistbody').append($tr)
               })
            } else {
               $tr = $("<tr>")
               $td = $("<td>").text("조회 결과 없음").attr("colspan", "7")
               $tr.append($td)
               $('#Rlistbody').append($tr)
            }
            $('#Rlist').show();
            $(".Rtrid").bind("click", function() {
               infoid = $(event.currentTarget).find("td:eq(0)").html();
               console.log(infoid);
               location.href = "aRent.do?infoid=" + infoid;
             });
         }
      });
   }
   // 검색 엔터 처리
   $("#Rkeyword").keypress(function() {
      if (event.keyCode == 13) {
         Rbtn.click();
      }
   });
   
   $(".Rtrid").bind("click", function() {
      infoid = $(event.currentTarget).find("td:eq(0)").html();
      console.log(infoid);
      location.href = "aRent.do?infoid=" + infoid;
    });
</script>