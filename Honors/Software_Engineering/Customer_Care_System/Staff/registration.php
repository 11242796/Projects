<?php
include('configuration/config.php');
error_reporting(0);
if(isset($_POST['submit']))
{
	$employee=$_POST['employee'];
	$firstname=$_POST['firstname'];
	$lastname=($_POST['lastname']);
	$password=md5($_POST['password']);
	$phone=$_POST['phone'];
	$email=$_POST['email'];
	$indicator=0;
	$status=1;

	$query=mysqli_query($con,"insert into staff(employee,firstname,lastname,password,phone,email,indicator,status) values('$employee','$firstname','$lastname','$password','$phone',
	'$email','$indicator','$status')");
	$msg="Registration successfull. Now You can login !";
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Customer Care System | Staff Registration</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    	<script>
function userAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'employee='+$("#employee").val(),
type: "POST",
success:function(data){
$("#user-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>
  </head>

  <body>
	  <div id="login-page">
	  	<div class="container">
	<h3 align="center" style="color:#fff"><a href="../web/portal.html" style="color:#fff">Customer Care System</a></h3>
	<hr />
		      <form class="form-login" method="post">
		        <h2 class="form-login-heading">Staff Registration</h2>
		        <p style="padding-left: 1%; color: green">
		        	<?php if($msg){
echo htmlentities($msg);
		        		}?>


		        </p>
		        <div class="login-wrap">
				<input type="text" class="form-control" placeholder="Employee Number" id="employee" onBlur="userAvailability()" name="employee" required="required">
		             <span id="user-availability-status1" style="font-size:12px;"></span>
		            <br>
		         <input type="text" class="form-control" placeholder="First Name" name="firstname" required="required" autofocus>
		            <br>
					<input type="text" class="form-control" placeholder="Last Name" name="lastname" required="required" autofocus>
					<br>
		            <input type="email" class="form-control" placeholder="Work Email" id="email" onBlur="userAvailability()" name="email" required="required">
		             <span id="user-availability-status1" style="font-size:12px;"></span>
		            <br>
		            <input type="password" class="form-control" placeholder="Password" required="required" name="password"><br >
		             <input type="text" class="form-control" maxlength="11" name="phone" placeholder="Phone No" required="required" autofocus>
		            <br>
		            
		            <button class="btn btn-theme btn-block"  type="submit" name="submit" id="submit"><i class="fa fa-user"></i> Register</button>
		            <hr>
		            
		            <div class="registration">
		                User Already Registered<br/>
		                <a class="" href="index.php">
		                   Sign in
		                </a>
		            </div>
		
		        </div>
		
		      
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/staff2.jpg", {speed: 500});
    </script>
<div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; u11242796@tuks.co.za </b> All rights reserved.
		</div>
	</div>
	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
