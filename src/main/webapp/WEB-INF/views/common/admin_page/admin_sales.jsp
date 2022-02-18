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
var monthlySales = ${list};
var quarterSales = [];
var month = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
var quarter = ['1분기', '2분기', '3분기', '4분기'];
$(function(){
	for (var i = 0; i < 4; i++) {
		var sumSales = 0;
		for (var j = 3 * i; j < 3 * i + 3; j++) {
			var sumSales = sumSales + monthlySales[j];
		}
		quarterSales.push(sumSales);
	}
	var selectGraph = document.getElementById("selected").selectedIndex;
	console.log(selectGraph);
	graph(monthlySales, month);

});

function changeGraph(selectData, selectLabel) {
	var selectGraph = document.getElementById("selected").selectedIndex;
	console.log(selectGraph);
	if (selectGraph == 1) {
		graph(quarterSales, quarter);
	} else {
		graph(monthlySales, month);
	}
}

function graph(selectData, selectLabel) {
	const ctx = document.getElementById('salesChart').getContext('2d');
	const myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: selectLabel,
	        datasets: [{
	            label: '# of Votes',
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
	});
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
				<select name="select" id="selected" onchange="changeGraph()">
					<option value="1" selected>월별 매출</option>
					<option value="2">분기별매출</option>
				</select>
			</div>
			<div class="content_detail">

			   <div>
			      <canvas id="salesChart" width="800px"></canvas>
			   </div>

			</div>
			
		</div>
		
	</div>
</body>
</html>