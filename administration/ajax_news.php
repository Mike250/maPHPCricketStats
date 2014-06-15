<?php

	session_start();
	$SID = session_id();
	
	require "../includes/class.mysql.inc";
	require "../includes/general.config.inc";
	require "../includes/general.functions.inc";
	require "../includes/class.fasttemplate.inc";

	if($_POST)
	{
		$q = $_POST['search'];
		$sql_res = mysql_query("SELECT id,title,author,DATE_FORMAT(added,'%b %e, %Y') AS added FROM news WHERE title LIKE '%$q%' ORDER BY id LIMIT 5");

		while($row=mysql_fetch_array($sql_res))
		{
			$title = $row['title'];
			$author = $row['author'];
			$added = $row['added'];
			$artid = $row['id'];
?>

	<div class="show" align="left">
		<span class="nameid" style="display: none;"><?php echo $artid; ?></span><span class="name"><?php echo $title; ?></span>&nbsp;<br/><span class="showdate">Addded: <?php echo $added; ?></span>
	</div>
<?php
		}
	}
?>