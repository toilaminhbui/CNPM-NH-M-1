<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Tinhtiendien.Models.ChiTietHoaDon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý chung</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%-- <canvas id="myChart" width="700px" height="200px" style="background-color: white;"></canvas> --%>
<%
	ArrayList<Integer> list_2YearNearest = (ArrayList) request.getAttribute("list_2YearNearest");


	

	if (list_2YearNearest.size() == 1) {
		ArrayList<Integer> list_chiso_currentyear = (ArrayList) request.getAttribute("list_chiso_currentyear");
		ArrayList<Integer> list_tien_currentyear = (ArrayList) request.getAttribute("list_tien_currentyear");
		
		ArrayList<Integer> list_2thang = (ArrayList) request.getAttribute("list_2thang");
		ArrayList<Integer> list_2year = (ArrayList) request.getAttribute("list_2year");
		ArrayList<Integer> list_tien_2thang = (ArrayList) request.getAttribute("list_tien_2thang");
%>
<div class="content">

	<div style="display: flex;">
		<div class="container" style="width: 650px;">
			<canvas id="myChart_tien" style="background-color: white; max-width: 1200px; max-height: 400px; box-shadow: rgba(0, 0, 0, 0.5) 0px 5px 15px;"></canvas>
		</div>	
			<br>
			<br>
		<div class="container" style="width: 650px;">
			<canvas id="myChart_tien_2thang" style="background-color: white; max-width: 1200px; max-height: 400px; box-shadow: rgba(0, 0, 0, 0.5) 0px 5px 15px;"></canvas>
		</div>	
	</div>
	
	
	<div style="display: flex; margin-top: 40px;">
		<div class="container" style="width: 650px;">		
			<canvas id="myChart_dien" style="background-color: white; max-width: 1200px; max-height: 700px; box-shadow: rgba(0, 0, 0, 0.5) 0px 5px 15px;"></canvas>
		</div>
		<div class="container" style="width: 650px;">
			<canvas id="myChart_tiendientrongnam" style="background-color: white; max-width: 1200px; max-height: 400px; box-shadow: rgba(0, 0, 0, 0.5) 0px 5px 15px;"></canvas>
		</div>	
	</div>
		
</div>

	<script>
		$(document).ready(function() {
			var list_chiso_currentyear = <%= list_chiso_currentyear %>; 
			var list_tien_currentyear = <%= list_tien_currentyear %>;
			var list_2YearNearest = <%= list_2YearNearest %>;
			var monthArray = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
			
			var sum = list_tien_currentyear.reduce((accumulator, currentValue) => {
			    return accumulator + currentValue;
			}, 0)
			
			
			console.log(list_chiso_currentyear)
			console.log(list_tien_currentyear)
		
	        let delayed;
			
			//Lấy thẻ canvas
	        var ctx_dien = document.getElementById('myChart_dien').getContext('2d');
			
			var chartData_dien = {
		            labels: monthArray,
		            datasets: [{
		                label: list_2YearNearest,
		                backgroundColor: "rgba(73, 159, 250, 0.7)",
		                borderColor: "rgba(0, 67, 139, 1)",
		                borderWidth: 1,
		                data: list_chiso_currentyear, // Dữ liệu từ cơ sở dữ liệu
		            }]
		        };
	
		        // Tạo biểu đồ dạng cột
		        var myChart_dien = new Chart(ctx_dien, {
		            type: 'bar',
		            data: chartData_dien,
		            options: {
	            		animation: {
	            	      onComplete: () => {
	            	        delayed = true;
	            	      },
	            	      delay: (context) => {
	            	        let delay = 0;
	            	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
	            	          delay = context.dataIndex * 200 + context.datasetIndex * 50;
	            	        }
	            	        return delay;
	            	      },
	            	    },
		                scales: {
		                    y: {
		                        beginAtZero: true,
		                        title: {
		                            display: true,
		                            text: 'Điện tiêu thụ (Kwh)' // Tên trục dọc
		                        }
		                    },
		                    x: {
		                        title: {
		                            display: true,
		                            text: 'Tháng' // Tên trục ngang
		                        }
		                    }
		                },
		                plugins: {
		                    title: {
		                      display: true,
		                      text: 'Điện tiêu thụ',
		                    }
		                }
		            }
		        });
		        
		        
		        
		        var ctx_tien = document.getElementById('myChart_tien').getContext('2d');
		        
		        var chartData_tien = {
		            labels: monthArray,
		            datasets: [{
		                label: list_2YearNearest,
		                backgroundColor: "rgba(254, 109, 109, 0.7)",
		                borderColor: "rgba(159, 10, 10, 1)",
		                borderWidth: 1,
		                data: list_tien_currentyear, // Dữ liệu từ cơ sở dữ liệu
		            }]
		        };
		
			        // Tạo biểu đồ dạng cột
		        var myChart_tien = new Chart(ctx_tien, {
		            type: 'bar',
		            data: chartData_tien,
		            options: {
	            		animation: {
	            	      onComplete: () => {
	            	        delayed = true;
	            	      },
	            	      delay: (context) => {
	            	        let delay = 0;
	            	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
	            	          delay = context.dataIndex * 200 + context.datasetIndex * 50;
	            	        }
	            	        return delay;
	            	      },
	            	    },
		                scales: {
		                    y: {
		                        beginAtZero: true,
		                        title: {
		                            display: true,
		                            text: 'Tiền điện (VMD)' // Tên trục dọc
		                        }
		                    },
		                    x: {
		                        title: {
		                            display: true,
		                            text: 'Tháng' // Tên trục ngang
		                        }
		                    }
		                },
		                plugins: {
		                    title: {
		                      display: true,
		                      text: 'Tiền điện',
		                    }
		                }
		            }
		        });
			        
			        
		        var list_2thang = <%= list_2thang %>;
		       	var list_2year = <%= list_2year %>;
		       	var list_tien_2thang = <%= list_tien_2thang %>
		       	
		       	list_2thang = list_2thang.reverse();
		       	list_2year = list_2year.reverse();
		       	list_tien_2thang = list_tien_2thang.reverse();
		       	
		       	console.log(list_tien_2thang)
		       	
		       	var monthsArray = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
		       	var resultArray = list_2thang.map(function(monthNumber) {
		       	    return monthsArray[monthNumber - 1];
		       	});
		       	
		       	var ctx_tien_2thang = document.getElementById('myChart_tien_2thang').getContext('2d');
		        
		       	if (list_2year[0] == list_2year[1]) {
		       		
			        var chartData_tien_2thang = {
			            labels: resultArray,
			            datasets: [{
			            	label: list_2year[0],
			                backgroundColor: "rgba(255, 231, 115, 0.7)",
			                borderColor: "rgba(153, 107, 0, 1)",
			                borderWidth: 1,
			                data: list_tien_2thang, // Dữ liệu từ cơ sở dữ liệu
			                barPercentage: 0.5, // Tỷ lệ phần trăm của thanh trong mỗi thể loại
			                categoryPercentage: 0.5,
			            }]
			        };
			        
			        var myChart_tien_2thang = new Chart(ctx_tien_2thang, {
			            type: 'bar',
			            data: chartData_tien_2thang,
			            options: {
			            	animation: {
		            	      onComplete: () => {
		            	        delayed = true;
		            	      },
		            	      delay: (context) => {
		            	        let delay = 0;
		            	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
		            	          delay = context.dataIndex * 200 + context.datasetIndex * 50;
		            	        }
		            	        return delay;
		            	      },
		            	    },
			                scales: {
			                    y: {
			                        beginAtZero: true,
			                        title: {
			                            display: true,
			                            text: 'VND' // Tên trục dọc
			                        }
			                    },
			                    x: {
			                        title: {
			                            display: true,
			                            text: 'Tháng' // Tên trục ngang
			                        }
			                    }
			                },
			                plugins: {
			                    title: {
			                      display: true,
			                      text: 'Tiền điện 2 tháng gần nhất',
			                    }
			                }
			            }
			        });
		       	} else {
		       		var chartData_tien_2thang = {
				            labels: resultArray,
				            datasets: [{
				            	label: list_2year[0],
				            	backgroundColor: "rgba(254, 109, 109, 0.7)",
				                borderColor: "rgba(159, 10, 10, 1)",
				                borderWidth: 1,
				                data: [list_tien_2thang[0], 0], // Dữ liệu từ cơ sở dữ liệu
				                barPercentage: 0.57, // Tỷ lệ phần trăm của thanh trong mỗi thể loại
				                categoryPercentage: 0.7,
				            },
				            {
				            	label: list_2year[1],
				                backgroundColor: "rgba(255, 231, 115, 0.7)",
				                borderColor: "rgba(153, 107, 0, 1)",
				                borderWidth: 1,
				                data: [0, list_tien_2thang[1]], // Dữ liệu từ cơ sở dữ liệu
				                barPercentage: 0.7, // Tỷ lệ phần trăm của thanh trong mỗi thể loại
				                categoryPercentage: 0.7,
				            }]
				        };
		       		
		       		var myChart_tien_2thang = new Chart(ctx_tien_2thang, {
			            type: 'bar',
			            data: chartData_tien_2thang,
			            options: {
			            	animation: {
		            	      onComplete: () => {
		            	        delayed = true;
		            	      },
		            	      delay: (context) => {
		            	        let delay = 0;
		            	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
		            	          delay = context.dataIndex * 200 + context.datasetIndex * 50;
		            	        }
		            	        return delay;
		            	      },
		            	    },
			                scales: {
			                    y: {
			                        beginAtZero: true,
			                        title: {
			                            display: true,
			                            text: 'VND' // Tên trục dọc
			                        }
			                    },
			                    x: {
			                        title: {
			                            display: true,
			                            text: 'Tháng' // Tên trục ngang
			                        }
			                    }
			                },
			                plugins: {
			                    title: {
			                      display: true,
			                      text: 'Tiền điện 2 tháng gần nhất',
			                    }
			                }
			            }
			        });
		       		
		       }
		       	
		       	
		       	
		       	var ctx_tiendientrongnam = document.getElementById('myChart_tiendientrongnam').getContext('2d');
		        
		       	
				var chartData_tiendientrongnam = {
					    labels: list_2YearNearest,
					    datasets: [
					        {
					            label: list_2YearNearest,
					            backgroundColor: "rgba(254, 109, 109, 0.7)",
					            borderColor: "rgba(159, 10, 10, 1)",
					            borderWidth: 1,
					            data: [sum], // Dữ liệu cho năm đầu tiên
					            barPercentage: 0.5, // Tỷ lệ phần trăm của thanh trong mỗi thể loại
					            categoryPercentage: 0.5,
					        }]
					};
				
				
				var myChart_dien = new Chart(ctx_tiendientrongnam, {
		            type: 'bar',
		            data: chartData_tiendientrongnam,
		            options: {
	            		animation: {
	            	      onComplete: () => {
	            	        delayed = true;
	            	      },
	            	      delay: (context) => {
	            	        let delay = 0;
	            	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
	            	          delay = context.dataIndex * 200 + context.datasetIndex * 50;
	            	        }
	            	        return delay;
	            	      },
	            	    },
		                scales: {
		                    y: {
		                        beginAtZero: true,
		                        title: {
		                            display: true,
		                            text: 'Điện tiêu thụ (Kwh)' // Tên trục dọc
		                        }
		                    },
		                    x: {
		                        title: {
		                            display: true,
// 		                            text: 'Tháng' // Tên trục ngang
		                        }
		                    }
		                },
		                plugins: {
		                    title: {
		                      display: true,
		                      text: 'Tiền điện đã đóng trong 2 năm gần nhất',
		                    }
		                }
		            }
		        });
				
				
				

					
			        
		})
	</script>
<% 
	} else {
		ArrayList<Integer> list_chiso_lastyear = (ArrayList) request.getAttribute("list_chiso_lastyear");
		ArrayList<Integer> list_tien_lastyear = (ArrayList) request.getAttribute("list_tien_lastyear");
		
		
		ArrayList<Integer> list_chiso_currentyear = (ArrayList) request.getAttribute("list_chiso_currentyear");
		ArrayList<Integer> list_tien_currentyear = (ArrayList) request.getAttribute("list_tien_currentyear");
		
		ArrayList<Integer> list_2thang = (ArrayList) request.getAttribute("list_2thang");
		ArrayList<Integer> list_2year = (ArrayList) request.getAttribute("list_2year");
		ArrayList<Integer> list_tien_2thang = (ArrayList) request.getAttribute("list_tien_2thang");
		
%>
<div class="container-fluid">
    <!-- Hàng 1 - 2 biểu đồ -->
    <div class="row g-3">
        <div class="col-lg-6 col-12">
            <div class="card">
                <div class="card-body p-2">
                    <canvas id="myChart_tien" style="width:100%; height:300px;"></canvas>
                </div>
            </div>
        </div>
        
        <div class="col-lg-6 col-12">
            <div class="card">
                <div class="card-body p-2">
                    <canvas id="myChart_tien_2thang" style="width:100%; height:300px;"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Hàng 2 - 2 biểu đồ -->
    <div class="row g-3 mt-3">
        <div class="col-lg-6 col-12">
            <div class="card">
                <div class="card-body p-2">
                    <canvas id="myChart_dien" style="width:100%; height:300px;"></canvas>
                </div>
            </div>
        </div>
        
        <div class="col-lg-6 col-12">
            <div class="card">
                <div class="card-body p-2">
                    <canvas id="myChart_tiendientrongnam" style="width:100%; height:300px;"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

	<script>
		$(document).ready(function() {
			var list_chiso_lastyear = <%= list_chiso_lastyear %>; 
			var list_tien_lastyear = <%= list_tien_lastyear %>;
			
			var list_chiso_currentyear = <%= list_chiso_currentyear %>; 
			var list_tien_currentyear = <%= list_tien_currentyear %>;
			
			var list_2YearNearest = <%= list_2YearNearest %>;
			var monthArray = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
			
			var sum1 = list_tien_lastyear.reduce((accumulator, currentValue) => {
			    return accumulator + currentValue;
			}, 0)
			
			var sum2 = list_tien_currentyear.reduce((accumulator, currentValue) => {
			    return accumulator + currentValue;
			}, 0)
			
		
			console.log("sum1: " + sum1)
			console.log(sum2)
			
		
	        let delayed;
			
			//Lấy thẻ canvas
	        var ctx_dien = document.getElementById('myChart_dien').getContext('2d');
			
			var chartData_dien = {
		            labels: monthArray,
		            datasets: [{
		                label: list_2YearNearest[0],
		                backgroundColor: "rgba(73, 159, 250, 0.7)",
		                borderColor: "rgba(0, 67, 139, 1)",
		                borderWidth: 1,
		                data: list_chiso_lastyear, // Dữ liệu từ cơ sở dữ liệu
		            },
		            {
		            	label: list_2YearNearest[1],
		                backgroundColor: "rgba(90, 255, 126, 0.7)",
		                borderColor: "rgba(16, 97, 34, 1)",
		                borderWidth: 1,
		                data: list_chiso_currentyear, // Dữ liệu từ cơ sở dữ liệu
		            }]
		        };
	
		        // Tạo biểu đồ dạng cột
		        var myChart_dien = new Chart(ctx_dien, {
		            type: 'bar',
		            data: chartData_dien,
		            options: {
		            	animation: {
	            	      onComplete: () => {
	            	        delayed = true;
	            	      },
	            	      delay: (context) => {
	            	        let delay = 0;
	            	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
	            	          delay = context.dataIndex * 200 + context.datasetIndex * 50;
	            	        }
	            	        return delay;
	            	      },
	            	    },
		                scales: {
		                    y: {
		                        beginAtZero: true,
		                        title: {
		                            display: true,
		                            text: 'KWH' // Tên trục dọc
		                        }
		                    },
		                    x: {
		                        title: {
		                            display: true,
		                            text: 'Tháng' // Tên trục ngang
		                        }
		                    }
		                },
		                plugins: {
		                    title: {
		                      display: true,
		                      text: 'Điện tiêu thụ',
		                    }
		                }
		            }
		        });

		        
				var ctx_tien = document.getElementById('myChart_tien').getContext('2d');
		        
		        var chartData_tien = {
			            labels: monthArray,
			            datasets: [{
			                label: list_2YearNearest[0],
			                backgroundColor: "rgba(254, 109, 109, 0.7)",
			                borderColor: "rgba(159, 10, 10, 1)",
			                borderWidth: 1,
			                data: list_tien_lastyear, // Dữ liệu từ cơ sở dữ liệu
			            },
			            {
			            	label: list_2YearNearest[1],
			                backgroundColor: "rgba(255, 231, 115, 0.7)",
			                borderColor: "rgba(153, 107, 0, 1)",
			                borderWidth: 1,
			                data: list_tien_currentyear, // Dữ liệu từ cơ sở dữ liệu
			            }]
			        };
		
			        // Tạo biểu đồ dạng cột
			        var myChart_tien = new Chart(ctx_tien, {
			            type: 'bar',
			            data: chartData_tien,
			            options: {
			            	animation: {
		            	      onComplete: () => {
		            	        delayed = true;
		            	      },
		            	      delay: (context) => {
		            	        let delay = 0;
		            	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
		            	          delay = context.dataIndex * 200 + context.datasetIndex * 50;
		            	        }
		            	        return delay;
		            	      },
		            	    },
			                scales: {
			                    y: {
			                        beginAtZero: true,
			                        title: {
			                            display: true,
			                            text: 'VND' // Tên trục dọc
			                        }
			                    },
			                    x: {
			                        title: {
			                            display: true,
			                            text: 'Tháng' // Tên trục ngang
			                        }
			                    }
			                },
			                plugins: {
			                    title: {
			                      display: true,
			                      text: 'Tiền điện',
			                    }
			                }
			            }
			        });
			        
			        
			        
			       	var list_2thang = <%= list_2thang %>;
			       	var list_2year = <%= list_2year %>;
			       	var list_tien_2thang = <%= list_tien_2thang %>
			       	
			       	list_2thang = list_2thang.reverse();
			       	list_2year = list_2year.reverse();
			       	list_tien_2thang = list_tien_2thang.reverse();
			       	
			       	console.log(list_tien_2thang)
			       	
			       	var monthsArray = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
			       	var resultArray = list_2thang.map(function(monthNumber) {
			       	    return monthsArray[monthNumber - 1];
			       	});
			       	
			       	var ctx_tien_2thang = document.getElementById('myChart_tien_2thang').getContext('2d');
			        
			       	if (list_2year[0] == list_2year[1]) {
			       		
				        var chartData_tien_2thang = {
				            labels: resultArray,
				            datasets: [{
				            	label: list_2year[0],
				                backgroundColor: "rgba(255, 231, 115, 0.7)",
				                borderColor: "rgba(153, 107, 0, 1)",
				                borderWidth: 1,
				                data: list_tien_2thang, // Dữ liệu từ cơ sở dữ liệu
				                barPercentage: 0.5, // Tỷ lệ phần trăm của thanh trong mỗi thể loại
				                categoryPercentage: 0.5,
				            }]
				        };
				        
				        var myChart_tien_2thang = new Chart(ctx_tien_2thang, {
				            type: 'bar',
				            data: chartData_tien_2thang,
				            options: {
				            	animation: {
			            	      onComplete: () => {
			            	        delayed = true;
			            	      },
			            	      delay: (context) => {
			            	        let delay = 0;
			            	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
			            	          delay = context.dataIndex * 200 + context.datasetIndex * 50;
			            	        }
			            	        return delay;
			            	      },
			            	    },
				                scales: {
				                    y: {
				                        beginAtZero: true,
				                        title: {
				                            display: true,
				                            text: 'VND' // Tên trục dọc
				                        }
				                    },
				                    x: {
				                        title: {
				                            display: true,
				                            text: 'Tháng' // Tên trục ngang
				                        }
				                    }
				                },
				                plugins: {
				                    title: {
				                      display: true,
				                      text: 'Tiền điện 2 tháng gần nhất',
				                    }
				                }
				            }
				        });
			       	} else {
			       		var chartData_tien_2thang = {
					            labels: resultArray,
					            datasets: [{
					            	label: list_2year[0],
					            	backgroundColor: "rgba(254, 109, 109, 0.7)",
					                borderColor: "rgba(159, 10, 10, 1)",
					                borderWidth: 1,
					                data: [list_tien_2thang[0], 0], // Dữ liệu từ cơ sở dữ liệu
					                barPercentage: 0.57, // Tỷ lệ phần trăm của thanh trong mỗi thể loại
					                categoryPercentage: 0.7,
					            },
					            {
					            	label: list_2year[1],
					                backgroundColor: "rgba(255, 231, 115, 0.7)",
					                borderColor: "rgba(153, 107, 0, 1)",
					                borderWidth: 1,
					                data: [0, list_tien_2thang[1]], // Dữ liệu từ cơ sở dữ liệu
					                barPercentage: 0.7, // Tỷ lệ phần trăm của thanh trong mỗi thể loại
					                categoryPercentage: 0.7,
					            }]
					        };
			       		
			       		var myChart_tien_2thang = new Chart(ctx_tien_2thang, {
				            type: 'bar',
				            data: chartData_tien_2thang,
				            options: {
				            	animation: {
			            	      onComplete: () => {
			            	        delayed = true;
			            	      },
			            	      delay: (context) => {
			            	        let delay = 0;
			            	        if (context.type === 'data' && context.mode === 'default' && !delayed) {
			            	          delay = context.dataIndex * 200 + context.datasetIndex * 50;
			            	        }
			            	        return delay;
			            	      },
			            	    },
				                scales: {
				                    y: {
				                        beginAtZero: true,
				                        title: {
				                            display: true,
				                            text: 'VND' // Tên trục dọc
				                        }
				                    },
				                    x: {
				                        title: {
				                            display: true,
				                            text: 'Tháng' // Tên trục ngang
				                        }
				                    }
				                },
				                plugins: {
				                    title: {
				                      display: true,
				                      text: 'Tiền điện 2 tháng gần nhất',
				                    }
				                }
				            }
				        });
			       		
			       		}
			       	
						var ctx_tien_2thang = document.getElementById('myChart_tiendientrongnam').getContext('2d');
			        
			       	
						var chartData_tiendientrongnam = {
							    labels: list_2YearNearest,
							    datasets: [
							        {
							            label: list_2YearNearest[0],
							            backgroundColor: "rgba(254, 109, 109, 0.7)",
							            borderColor: "rgba(159, 10, 10, 1)",
							            borderWidth: 1,
							            data: [sum1], // Dữ liệu cho năm đầu tiên
							            barPercentage: 0.5, // Tỷ lệ phần trăm của thanh trong mỗi thể loại
							            categoryPercentage: 0.5,
							        },
							        {
							            label: list_2YearNearest[1],
							            backgroundColor: "rgba(255, 231, 115, 0.7)",
							            borderColor: "rgba(153, 107, 0, 1)",
							            borderWidth: 1,
							            data: [sum2], // Dữ liệu cho năm thứ hai
							            barPercentage: 0.5, // Tỷ lệ phần trăm của thanh trong mỗi thể loại
							            categoryPercentage: 0.5,
							        }
							    ]
							};

							var myChart_tiendientrongnam = new Chart(ctx_tien_2thang, {
							    type: 'bar',
							    data: {
							        labels: ['Tiền điện'], // Nhãn chung cho cả hai cột
							        datasets: [
							            {
							                label: list_2YearNearest[0],
							                backgroundColor: "rgba(254, 109, 109, 0.7)",
							                borderColor: "rgba(159, 10, 10, 1)",
							                borderWidth: 1,
							                data: [sum1], // Dữ liệu cho năm đầu tiên
							                barPercentage: 0.5,
							                categoryPercentage: 0.5,
							            },
							            {
							                label: list_2YearNearest[1],
							                backgroundColor: "rgba(255, 231, 115, 0.7)",
							                borderColor: "rgba(153, 107, 0, 1)",
							                borderWidth: 1,
							                data: [sum2], // Dữ liệu cho năm thứ hai
							                barPercentage: 0.5,
							                categoryPercentage: 0.5,
							            }
							        ]
							    },
							    options: {
							        animation: {
							            onComplete: () => {
							                delayed = true;
							            },
							            delay: (context) => {
							                let delay = 0;
							                if (context.type === 'data' && context.mode === 'default' && !delayed) {
							                    delay = context.dataIndex * 200 + context.datasetIndex * 50;
							                }
							                return delay;
							            },
							        },
							        scales: {
							            y: {
							                beginAtZero: true,
							                title: {
							                    display: true,
							                    text: 'VND' // Tên trục dọc
							                }
							            },
							            x: {
							                title: {
							                    display: true,
// 							                    text: 'Năm' // Tên trục ngang
							                }
							            }
							        },
							        plugins: {
							            title: {
							                display: true,
							                text: 'Tiền điện đã đóng trong 2 năm gần nhất',
							            }
							        }
							    }
							});  
			        
		})
	</script>
<%
	}
%>

</body>
</body>
</html>