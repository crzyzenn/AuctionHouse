

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Admin Portal</title>
	<link rel = 'stylesheet' media="screen" href = '../bs/css/bootstrap.css'>
	<script src="../bs/js/jquery.js"></script>
	<script type="text/javascript" src = '../bs/js/bootstrap.js'></script>	
	<script type="text/javascript" src = '../bs/js/notify.js'></script>		
	<script defer src="../bs/js/fontawesome-all.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip();
		    var a = 1; 
		    var b = 1; 
		    $("#add").on("click", function(){
				var uploadBar = "<tr><td></td><td><input type='file' id = 'uploadField' name='myImage" + (++a) + "' class='form-control'></td><td><button class = 'btn-sm btn-danger' onclick = 'return false;' id = 'remove'><span class = 'glyphicon glyphicon-remove'></span></button></td></div></tr>"; 
				$("#uploadDiv").append(uploadBar); 
			});
		});
	</script>
</head>
<!--<header>-->
	<!--<div id = 'bar'>-->
        <!--<img src="../Images/logo.jpg" alt="Logo">-->
	<!--</div>		-->
<!--</header>-->

<div class="jumbotron">
	<div class="container" style="
    width: 30%;
    background-color:  #2a2725;
    color: white;
    padding: 5em;
">
	<%
		if(session.getAttribute("user") == null || session.getAttribute("user") == ""){
            // out.println(session.getAttribute("user"));

			
	%>
		<h1 class="text-center"><i class="fa fa-user-circle" aria-hidden="true"></i></h1>
		<br>
		<div class = 'errorDiv'></div>
		
			<div class="form-group">
				<div class="input-group">

					<input type="text" class="form-control" placeholder="Username" id = 'username' name = 'username'>
					<div class="input-group-addon">					
						<span class = 'glyphicon glyphicon-user' style = 'cursor: pointer;'></span>
					</div>										
				</div>									
			</div>
			<div class = 'form-group'>
				<div class="input-group">
					
					<input type="password" class="form-control" placeholder="Password" id = 'password' name = 'password'>
					<div class="input-group-addon">					
						<i class="fas fa-key"></i>
					</div>										
				</div>				
			</div>

			<div class = 'form-group'>
				<button id="login" class="btn btn-primary">Login</button>
			</div>
			
		</div>
	</div>

<%
}

else{
    response.sendRedirect("dashboard.jsp");
}
%>

