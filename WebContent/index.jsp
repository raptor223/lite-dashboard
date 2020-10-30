<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>eMentalist Lite Dashboard</title>
	<link rel="icon" href="favicon.ico">	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tabulator/3.0.0/css/tabulator.min.css">
	<style type="text/css">
	.bundeslands-list button{
		margin-right: .5em;
		margin-bottom: .5em;
	}
	.form-check {
	    margin-top: 1em;
	}
	.form-check label{
	    font-weight: normal;
	}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/d3js/6.2.0/d3.min.js" type="text/javascript"></script> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script> 
	<script src="https://ajax.googleapis.com/ajax/libs/hammerjs/2.0.8/hammer.min.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/dojo/1.13.0/dojo/dojo.js" type="text/javascript"></script>      
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tabulator/3.0.0/js/tabulator.min.js" type="text/javascript"></script>
</head>
<body>
	
	<div class="jumbotron text-center">
	  <h1>
	  	<img src="covid19_logo.png" style="width: 10%;" />
	  	eMentalist Lite Dashboard
	  </h1>
	  <p>Covid19 data analysis demo dashboard!</p>
	</div>

	<div class="container">
		<h3>Countries:</h3>
		<div class="bundeslands-list">
			<h5 class="loading">Loading bundeslands list...</h5> 
		</div>
		<div class="form-check">
		  <input type="checkbox" class="form-check-input" id="show_windows_beside">
		  <label class="form-check-label" for="show_windows_beside">Show windows beside each other</label>
		</div>
		
		<hr>

		<h3>Barchart view:</h3>
		<div class="barchart-view">
			<img src="barchart-sample.png" style="width: 100%; opacity: 0.3;" />
		</div>
		
		<hr>
		
		<h3>Table view:</h3>
		<div class="table-view">
			<img src="tabulator-sample.png" style="width: 100%; opacity: 0.3;" />
		</div>

	</div>
	
	<footer class="footer" style="background: #eee;min-height: 50px; margin-top: 1em;">
		<div class="container">
			<h6 class="text-muted text-center">
				Copyright &copy; 2016-2020 <a href="www.ementalist.ai">eMentalist</a>
			</h6>
			<h6 class="text-muted text-center">
				Sample project for skills test
			</h6>
		</div>
	</footer>
	
	<script type="text/javascript">
		const JSONrequest = function(url_action,data,callback){
			function reload(){
				var url = "/" + window.location.pathname.split('/')[1] + '/api?action=' + url_action;
				return $.ajax({
					url: url,
					data: data,	
					type: 'POST',
					timeout: 5000,
					dataType: 'json',
					success: function(resp){
						try {
						    var obj = JSON.stringify(resp);							    
						}catch (e) {				
							err(e);					
						}
						callback(200,resp);
						return;
					},
					error: err,
					fail: err,
					statusCode: {
						500: err
			      	}
				});	
			}
			
			function err(error){
				callback(-200, "Network Error!");
				return;
			}
			
			reload();
		}
		
		function get_bundeslands_list(){
			new JSONrequest("get_bundeslands_list",{param1:null},function(status,resp){
				if(status == 200 && resp.result == "OK"){
					$(".bundeslands-list .loading").remove();
					resp.data.forEach(function(item){
						$(".bundeslands-list").append("<button type=\"button\" class=\"btn btn-info\">" + item.replaceAll("_"," ") + "</button>");
					});
				}else{
					msg_popup("Error in loading property managers list: " + resp.data, 5);
				}	
			});				
		}		
		
		$(document).ready(function() {	
			get_bundeslands_list();
		})
	</script>
</body>
</html>