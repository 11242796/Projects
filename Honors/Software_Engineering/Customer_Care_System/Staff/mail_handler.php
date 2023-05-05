<?php 

use PHPMailer\PHPMailer\PHPMailer;
//use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';
session_start();
error_reporting(0);
include('configuration/config.php');
require("vendor/autoload.php");
if(strlen($_SESSION['login'])==0)
  { 
header('location:index.php');
}
else{
	

	if (isset($_POST['submit'])) {

		$email = $_POST['email'];
		$subject = $_POST['subject'];
		$query = $_POST['query'];
        $message = $_POST['message'];

		$mail = new PHPMailer();
		$mail->IsSMTP();
		$mail->Host = "smtp.gmail.com"; // Enter your host here
		$mail->SMTPAuth = true;
		$mail->Username = "miehleketo93@gmail.com"; // Enter your email here
		$mail->Password = ""; //Enter your passwrod here
		$mail->Port = 587;
		$mail->IsHTML(true);
		$mail->From = "miehleketo93@gmail.com";
		$mail->FromName = "Customer Care System";

		$mail->Subject = $subject;

		$mail->Message = $message;
		//$message = str_replace('%subject%', $subject, $message);
		//$message = str_replace('%message%', $query, $message);
		$mail->msgHTML($message);
		$mail->AddAddress($email);
		$mail->AddAddress('u11242796@tuks.co.za'); //admin email
		if (!$mail->Send()) {
			echo "Mailer Error: " . $mail->ErrorInfo;
		} else {
			header("closed-complaint.php");
		}
	}
	
	}
?>

<!DOCTYPE html>
    <html lang="en">
    <head>
  

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Staff| Send mail</title>
        <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="css/theme.css" rel="stylesheet">
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
        <script language="javascript" type="text/javascript">

</script>
</head>
<body>

<?php include('connection/header.php');?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
			
			<div class="span9">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>Send Email</h3>
							</div>
							<div class="module-body">

									<?php if(isset($_POST['submit']))
{?>
									<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Mail Sent to Customer!</strong>	<?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?>
									</div>
<?php } ?>

									<br /> 

<form class="form-horizontal row-fluid" name="mail_handler" method="post" >

<?php $st='closed';
$query=mysqli_query($con,"SELECT a.*,Employee_id,userEmail,CONCAT(subcategory,' ',complaintType) as Subject FROM complaintremark a  
join tblcomplaints b on (a.complaintNumber = b.complaintNumber)
join users c on (b.userId = c.id)
where  a.status='$st' and Employee_Id ='".$_SESSION['id']."' ");
while($row=mysqli_fetch_array($query))
{
	
?>

<div class="control-group">
<label class="control-label" for="basicinput">To</label>
<div class="controls">
<input type="text" placeholder="email"  name="to" class="span8 tip" required  value="u11242796@tuks.co.za" >
</div>


<div class="control-group">
<label class="control-label" for="basicinput">From</label>
<div class="controls">
<input type="text" placeholder="email"  name="from"  value = "miehleketo93@gmail.com" class="span8 tip" required>
</div>



<div class="control-group">
<label class="control-label" for="basicinput">Subject</label>
<div class="controls">
<input type="text" placeholder="subject"  name="subject" class="span8 tip" required value="<?php echo htmlentities($row['Subject']);?>" >
</div>


<div class="control-group">
<label class="control-label" for="basicinput">Message</label>
<div class="controls">
<textarea class="span8" name="message" rows="5"> <?php echo htmlentities($row['remark']);?> </textarea>
</div>



<div class="control-group">
<div class="controls">
    
<input id="submit" name="submit" type="submit" value="Send" class="btn btn-primary">
</div>
</div>
</form>
</div>
</div>

<?php } ?>
		</div>
	</div>   
<?php include('configuration/footer.php');?>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
