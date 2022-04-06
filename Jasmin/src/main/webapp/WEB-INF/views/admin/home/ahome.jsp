<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
	<div class="content-wrapper">
            <div class="row d-none"  id="proBanner">
              <div class="col-12">
                <span class="d-flex align-items-center purchase-popup">
                  <p>Like what you see? Check out our premium version for more.</p>
                  <a href="https://github.com/BootstrapDash/ConnectPlusAdmin-Free-Bootstrap-Admin-Template" target="_blank" class="btn ml-auto download-button">Download Free Version</a>
                  <a href="http://www.bootstrapdash.com/demo/connect-plus/jquery/template/" target="_blank" class="btn purchase-button">Upgrade To Pro</a>
                  <i class="mdi mdi-close" id="bannerClose"></i>
                </span>
              </div>
            </div>
            <div class="d-xl-flex justify-content-between align-items-start">
              <h2 class="text-dark font-weight-bold mb-2"> 도서/회원 차트 </h2>
              
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
                  
                </div>
                <div class="tab-content tab-transparent-content">
                  <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                    <div class="row">
                      <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body text-center">
                            <h5 class="mb-2 text-dark font-weight-normal">　　　</h5>
                            <h2 class="mb-4 text-dark font-weight-bold">오늘의 대출 수</h2>
                            <div class="dashboard-progress dashboard-progress-1 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-lightbulb icon-md absolute-center text-dark"></i></div>
                            <p class="mt-4 mb-0">Brrow</p>
                            <h3 class="mb-0 font-weight-bold mt-2 text-dark" id="hval">5443</h3>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body text-center">
                            <h5 class="mb-2 text-dark font-weight-normal">　　　</h5>
                            <h2 class="mb-4 text-dark font-weight-bold">오늘의 QNA 수</h2>
                            <div class="dashboard-progress dashboard-progress-2 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-account-circle icon-md absolute-center text-dark"></i></div>
                            <p class="mt-4 mb-0">QNA</p>
                            <h3 class="mb-0 font-weight-bold mt-2 text-dark" id="hval2">50%</h3>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3  col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body text-center">
                            <h5 class="mb-2 text-dark font-weight-normal">　　　</h5>
                            <h2 class="mb-4 text-dark font-weight-bold">총 도서 수</h2>
                            <div class="dashboard-progress dashboard-progress-3 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-eye icon-md absolute-center text-dark"></i></div>
                            <p class="mt-4 mb-0">Book</p>
                            <h3 class="mb-0 font-weight-bold mt-2 text-dark" id="hval3">35%</h3>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body text-center">
                            <h5 class="mb-2 text-dark font-weight-normal">　　　</h5>
                            <h2 class="mb-4 text-dark font-weight-bold">총 회원 수</h2>
                            <div class="dashboard-progress dashboard-progress-4 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-cube icon-md absolute-center text-dark"></i></div>
                            <p class="mt-4 mb-0">Member</p>
                            <h3 class="mb-0 font-weight-bold mt-2 text-dark" id="hval4">25%</h3>
                          </div>
                        </div>
                      </div>
                    </div>                    
                  </div>
                </div>
              </div>
            </div>
          </div>
         

	<div class="content-wrapper">
		<div class="page-header">
			<h1 class="text-dark font-weight-bold mb-2">차 트</h1>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Charts</a></li>
					<li class="breadcrumb-item active" aria-current="page">
					<select	id="chartYear" onchange="changeChart()">
							<option value="2021">2021</option>
							<option value="2020">2020</option>
							<option value="2019">2019</option>
					</select></li>
				</ol>
			</nav>
		</div>
		  
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
	            <div class="card">
	               <div class="card-body" id="myRentChartContainer">
	                  <h4 class="card-title">대출 통계</h4>
	                  <canvas id="myRentChart" style="height: 230px"></canvas>
	               </div>
	            </div>
	         </div>
	      </div>
			
		</div>
		
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body" id="myChartContainer">
					<h4 class="card-title">연체 통계</h4>
					<canvas id="myChart" style="height: 230px"></canvas>
				</div>
			</div>
		</div>

 <script src="resources/assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="resources/assets/vendors/chart.js/Chart.min.js"></script> 
	<script src="resources/assets/js/off-canvas.js"></script>
	<script src="resources/assets/js/hoverable-collapse.js"></script>
	<script src="resources/assets/js/misc.js"></script> 
	<script src="resources/assets/js/chart.js"></script>  
          
          
 <script type="text/javascript">
	createChart();
	function createChart() {
		
	$("#myChart").remove();
	$("#myChartContainer").append('<canvas id="myChart"></canvas>');
	var ctx = $("#myChart");
	var context = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
        type: 'bar', 
        data: { 
           labels: [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
           datasets: [{ 
                 label: '연체 데이터',
                 fill: false,
                 data : getData(),                     
                 backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)', 
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                 ],
                 borderColor: [
                    'rgba(255, 99, 132, 1)', 
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)', 
                    'rgba(255, 99, 132, 1)', 
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                 ],
                 borderWidth: 1
              }]
        },
        options: {
           scales: {
              yAxes: [{
                 ticks: {
                    beginAtZero: true
                 }
              }]
           }
        }
     });
	}

     function getData() {
      
        var list = [];
    	$.ajax({
    			url: "chartSearch.do",
    			data : {year:$("#chartYear").val()},
    			type : "post",
    			async : false,
    			dataType : "json",
    			success: function (bookdatas) {
    				for(var bookdata of bookdatas){
    					list.push(bookdata["rr"]);
    				}
    			}
    		});	
    		console.log("list = " + list);
    		return list;
        } 
     
     createRentChart();

     function createRentChart() {
        $("#myRentChart").remove();
        $("#myRentChartContainer").append('<canvas id="myRentChart"></canvas>');
        var ctx = $("#myRentChart");
        var context = document.getElementById('myRentChart').getContext('2d');
        var myRentChart = new Chart(ctx, {
           type: 'bar',
           data: {
              labels: ['100', '200', '300', '400', '500', '600', '700', '800', '900'],
              datasets: [{
                 label: '주제별 대출 데이터',
                 fill: false,
                 data: getRentData(),
                 backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)'
                 ],
                 borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)'
                 ],
                 borderWidth: 1
              }]
           },
           options: {
              scales: {
                 yAxes: [{
                    ticks: {
                       beginAtZero: true
                    }
                 }]
              }
           }
        });
     }

     function getRentData() {

        var list2 = [];
        $.ajax({
           url: "rentChartSearch.do",
           data: {
              year: $("#chartYear").val()
           },
           type: "post",
           async: false,
           dataType: "json",
           success: function (rentdatas) {
              for (var rentdata of rentdatas) {
                 list2.push(rentdata["cnt"]);
              }
           }
        });
        console.log("list2 = " + list2);
        return list2;
     }
</script>