<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/admin_page/admin_sales.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>


<script>
var monthlySales = [];
var quarterSales = [];
var month = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
var quarter = ['1분기', '2분기', '3분기', '4분기'];
$(function(){
	
	$("#selectYear").val(${selectYear}).prop("selected", true);
	monthlySales = ${list}
	var totalSales = 0;
	for (var i = 0; i < 4; i++) {
		var sumSales = 0;
		for (var j = 3 * i; j < 3 * i + 3; j++) {
			var sumSales = sumSales + monthlySales[j];
			totalSales = totalSales + monthlySales[j];
		}
		quarterSales.push(sumSales);
	}
	console.log("list : " + ${list});
	createGraph("salesChart1", quarterSales, quarter, totalSales);
	createGraph("salesChart2", monthlySales, month, totalSales);
	changeGraph();
	$("#totalSales").append("<span style='font-size: 20px;'>총 매출 : " + totalSales + "원</span>");
});

function changeGraph() {
	var selectGraph = document.getElementById("selectGraph").selectedIndex;
	
	
	console.log(selectGraph);
	if (selectGraph == 1) {
		$("#salesChart1").show();
		$("#salesChart2").hide();
	} else {
		$("#salesChart2").show();
		$("#salesChart1").hide();
	}
}

function getSalesData() {
	var selectYear = document.getElementById("selectYear").options[document.getElementById("selectYear").selectedIndex].value;
	location.replace("admin_sales?selectYear=" + selectYear);
	
}

function createGraph(targetId, selectData, selectLabel, totalSales) {
	
	const ctx = document.getElementById(targetId).getContext('2d');
	var config = {
	    type: 'bar',
	    data: {
	        labels: selectLabel,
	        datasets: [{
	            label: '판매액',
	            data: selectData,
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
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	    	responsive: false,
	    	legend: {
	        	display: false
	        },
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	};
	const myChart = new Chart(ctx, config);
}

</script>



<title>관리자 페이지</title>


</head>
<body>
	<h1>매출 통계</h1>
	
	<div class="contents_area">
		<div class="content_area">
			<div class="content_title">
				<strong>매출 통계</strong>
				<h3></h3>
				<select name="select" id="selectGraph" class="selectbox" onchange="changeGraph()">
					<option value="1">월별 매출</option>
					<option value="2">분기별매출</option>
				</select>
				<select name="select" id="selectYear" class="selectbox" onchange="getSalesData()">
					<option value="2022">2022년</option>
					<option value="2021">2021년</option>
				</select>
			</div>
			<div class="content_detail">
				<div id="totalSales" style="margin-top: 20px;">
					
				</div>
			   <div id="chart">
			      <canvas id="salesChart1" width="900px"></canvas>
			      <canvas id="salesChart2" width="900px"></canvas>
			   </div>

			</div>
			
		</div>
		
	</div>
</body>
</html>