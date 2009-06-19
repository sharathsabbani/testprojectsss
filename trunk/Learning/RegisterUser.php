<?php
header('Content-Type: text/xml');
?>
<Users>
<?php
/*
 * Created on Jun 19, 2009
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
 	$con=mysql_connect('localhost',root,'');
if (!$con)
  {
 		 die('Could not connect: ' . mysql_error());
  }
   mysql_select_db("demo_db", $con);

$demo="Select * from persons";
$result=mysql_query($demo,$con); 
 
 
 while($row = mysql_fetch_array($result))
  {
  	?>
  	<subscriber>
  <first><?php echo( $row[0] ); ?></first>
<last><?php echo( $row[1] ); ?></last>
<email><?php echo( $row[2] ); ?></email>
</subscriber>
<?php
}
?>
</Users>
