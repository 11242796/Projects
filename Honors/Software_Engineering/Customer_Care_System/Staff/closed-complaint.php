<?php 
session_start();
error_reporting(0);
include('configuration/config.php');
if(strlen($_SESSION['login'])==0)
  { 
header('location:index.php');
}
else{
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Staff |Closed Complaints</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <link href="assets/css/table-responsive.css" rel="stylesheet">
	<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+500+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>
</head>
<body>
<section id="container" >
<?php include("configuration/header.php");?>
<?php include("configuration/sidebar.php");?>

<section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>Closed Complaints</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                          <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr style="text-align: center">
										    <th>Complaint No</th>
											<th>Complaint Type</th>
											<th>Category</th>
											<th>Reg Date</th>
											<th>Assigned To</th>
											<th>Status</th>
											<th>Send Email</th>
											
										
										</tr>
									</thead>
								
<tbody>
<?php 
$st='closed';
$query=mysqli_query($con,"select tblcomplaints.* ,CONCAT(firstname,' ',lastname) as Staff_Name,date(tblcomplaints.regDate) as DateLogged
from tblcomplaints 
left join staff on  tblcomplaints.Employee_Id = staff.id
where tblcomplaints.status='$st' and Employee_Id ='".$_SESSION['id']."' ");
while($row=mysqli_fetch_array($query))
{
?>										
										<tr>
										<td><?php echo htmlentities($row['complaintNumber']);?></td>
											<td><?php echo htmlentities($row['complaintType']);?></td>
											<td><?php echo htmlentities($row['subcategory']);?></td>
											<td><?php echo htmlentities($row['DateLogged']);?></td>
											<td><?php echo htmlentities($row['Staff_Name']);?></td>
										
											<td><button type="button" class="btn btn-success">Closed</button></td>
											<td colspan="4"> 
											<a href="javascript:void(0);" onClick="popUpWindow('http://localhost:8080/Customer_Care_System/Staff/mail_handler.php?uid=<?php echo htmlentities($row['userId']);?>');" title="Update order">
											 <button type="button" class="btn btn-primary">Send Email</button></a></td>
											</td>
											</tr>

										<?php  } ?>
										</tbody>
								</table>
							</div>
						</div>						

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

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
<?php } ?>