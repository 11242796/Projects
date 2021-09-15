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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Staff | Inprogress</title>

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
          	<h3><i class="fa fa-angle-right"></i>Inprogess</h3>
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
											<th>Action</th>
											
										
										</tr>
									</thead>
								
<tbody>
<?php 
$st='in process';
$_SESSION["id"] = "employee";
$query=mysqli_query($con,"select tblcomplaints.* ,CONCAT(staff.firstname,' ',staff.lastname) as Staff_Name,date(tblcomplaints.regDate) as DateLogged
from tblcomplaints 
left join staff on  tblcomplaints.Employee_Id = staff.id
where tblcomplaints.status='$st' and tblcomplaints.Employee_Id ='".$_SESSION['id']."'");
while($row=mysqli_fetch_array($query))
{
?>										
										<tr>
											<td><?php echo htmlentities($row['complaintNumber']);?></td>
											<td><?php echo htmlentities($row['complaintType']);?></td>
											<td><?php echo htmlentities($row['subcategory']);?></td>
											<td><?php echo htmlentities($row['DateLogged']);?></td>
											<td><?php echo htmlentities($row['Staff_Name']);?></td>
										
											<td><button type="button" class="btn btn-warning">In Progress</button></td>
											
											<td><a href="complaint-details.php?cid=<?php echo htmlentities($row['complaintNumber']);?>"> View Details</a> 
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

		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
<?php include("configuration/footer.php");?>
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    

  </body>
</html>
<?php } ?>
