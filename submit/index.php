<?php
	ob_start();
	require ("../includes/general.config.inc");
	require ("../includes/class.mysql.inc");
	require ("../includes/class.fasttemplate.inc");
	require ("../includes/general.functions.inc");

	$page = submitscorecard;
	$redirect = true;

?>

<html>
<head>
<title>Butcher Cricket - Submit Scorecard</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../includes/css/cricketold.css" type="text/css">
<script language="javascript" src="../includes/javascript/simplecalendar.js" type="text/javascript"></script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="80%" align="center" cellpadding="2" cellspacing="0" border="0">
 <tr>
  <td>
    <?php include("../includes/showsubmitscorecard.php"); ?>
  </td>
 </tr>
</table>

</body>
</html>
