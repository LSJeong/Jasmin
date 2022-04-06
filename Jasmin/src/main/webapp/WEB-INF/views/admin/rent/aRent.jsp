<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.card .card-body { background-color: #f0f1f6; }
table { background-color: #ffffff; }
</style>

<div class="content-wrapper">

            <div class="d-xl-flex justify-content-between align-items-start">
            <h1 class="text-dark font-weight-bold mb-2"> 대출 관리 </h1>
            
          </div>
          <div class="row">
          </div>
            <table class="table table-bordered">
               <thead>
                  <tr>
                     <th>ID</th>
                     <th>이름</th>
                     <th>도서명</th>
                     <th>ISBN</th>
                     <th>대출일</th>
                     <th>반납예정일</th>
                     <th>반납일</th>
                     <th>연장횟수</th>
                     <th>연체일</th>
                     <th>배송여부</th>
                     <th>배송상태</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach items="${infolist }" var="info" varStatus="status">
                     <tr>
                        <td>${info.mid }</td>
                        <td>${info.name }</td>
                        <td>${info.title }</td>
                        <td>${info.isbn }</td>
                        <td>${info.bstart }</td>
                        <td>${info.bend }</td>
                        <td>${info.rdate }</td>
                        <td>${info.renewcnt }</td>
                        <td>${info.delaydate }</td>
                        <td>${info.deliveryn }</td>
                        <td>
                           <c:if test="${info.deliveryn == 'Y'}">
                           <select class="deliverstate" id="deliverstate-${status.count }" name="deliverstate-${status.count }">
                              <option <c:if test="${info.deliverstate == '해당없음'}">selected</c:if>>해당없음</option>                        
                                <option <c:if test="${info.deliverstate == '배송요청'}">selected</c:if>>배송요청</option>   
                                <option <c:if test="${info.deliverstate == '배송중'}">selected</c:if>>배송중</option>   
                                <option <c:if test="${info.deliverstate == '배송완료'}">selected</c:if>>배송완료</option>   
                                <option <c:if test="${info.deliverstate == '수거요청'}">selected</c:if>>수거요청</option>   
                                <option <c:if test="${info.deliverstate == '수거중'}">selected</c:if>>수거중</option>   
                                <option <c:if test="${info.deliverstate == '수거완료'}">selected</c:if>>수거완료</option>   
                           </select>
                           </c:if>
                           <c:if test="${info.deliveryn == 'N'}">
                           해당없음
                           </c:if>
                        </td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
<div>
<button type="button" class="btn btn-primary btn-sm" id="Rbtn" onclick="history.back()">목록으로 돌아가기</button>
</div>
</div>
   <script src="resources/js/jquery-3.3.1.min.js"></script>
   <script>
      $('.deliverstate').on('change', function(){
         let mid = $(event.currentTarget).parent().parent().find("td:eq(0)").html();
         let title = $(event.currentTarget).parent().parent().find("td:eq(2)").html();
         let bisbn = $(event.currentTarget).parent().parent().find("td:eq(3)").html();
         let bstart = $(event.currentTarget).parent().parent().find("td:eq(4)").html();
         let deliverstate = this.value;
         console.log(mid);
         console.log(title);
         console.log(bisbn);
         console.log(typeof bstart);
         console.log(deliverstate);
         $.ajax({
            url : "deliverstateUpdate.do",
            data : { mid : mid, bisbn : bisbn, bstart : bstart, deliverstate : deliverstate },
            type : "get",
            success : function(){
               alert('변경 완료');
               location.href = "aRent.do?infoid=" + mid;
            }
         });
      })      
   </script>