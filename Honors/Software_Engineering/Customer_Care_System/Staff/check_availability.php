<?php 
require_once("configuration/config.php");
if(!empty($_POST["empoylee"])) {
	$email= $_POST["empoylee"];
	
		$result =mysqli_query($con,"SELECT empoylee FROM staff WHERE employee='$empoylee'");
		$count=mysqli_num_rows($result);
if($count>0)
{
echo "<span style='color:red'> Email already exists .</span>";
 echo "<script>$('#submit').prop('disabled',true);</script>";
} else{
	
	echo "<span style='color:green'> Email available for Registration .</span>";
 echo "<script>$('#submit').prop('disabled',false);</script>";
}
}


?>
