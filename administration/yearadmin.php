<?php

//------------------------------------------------------------------------------
// Cricket Year Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

$adminpage = "yearadmin";

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>Year Administration</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>For associations which have seasons that span two calendar years (ie. 2014/15), there may be times when calendar year is still needed for some funtions. The year table is for those cases.</p>
		";                                 
		
		$pagecontainerend = "
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </article>
		                </div>
		            </div>
        </section>  
    ";
    
		// Set the alerting if they cancel adds or edits

		if(isset($_GET['cancel'])) {
			if($_GET['cancel'] == $adminpage) $cancelr = 'updating the year table';
			$alert = "<div class=\"msg-alerting\"><div class=\"msg-atten\">You have cancelled $cancelr.</div></div>\n";
		} else { }

function show_main_menu($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	

	//-------------------------------------------------
	// Pagination
	//-------------------------------------------------

	$limit = 25;																											// how many rows to show per page
	$pageNum = 1;																											// by default we show first page	
	if(isset($_GET['page'])) { $pageNum = $_GET['page']; } 						// if $_GET['page'] defined, use it as page number
	$offset = ($pageNum - 1) * $limit;																// counting the offset
	$tableName = "year";																							// source table
	$targetpage = "main.php?SID=$SID&action=$action";									// target page and query params
	$pagemode = 0;																										// target page mode
	$query = "SELECT COUNT(YearID) AS num FROM $tableName";						// count records query
	
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";
	
?>

	<form id="filter-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=search" method="get" enctype="multipart/form-data">
	
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="search">
	<input type="hidden" name="doit" value="1">
	
	<div class="fields">
		<div class="block">
			<input type="text" onfocus="this.value=''" value="filter list" name="search" maxlength="50">
			<a href="javascript:" onclick="document.getElementById('filter-form').submit();" class="btn btn-primary">Go</a>
			<a href="javascript:" onclick="document.location = 'main.php?SID=<?=$SID?>&action=<?=$action?>&do=sadd';" class="btn btn-primary">Create</a>
		</div>
	</div>
	
	</form>

	<div class="magrid">
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th class="lastcolumn">modify</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="3">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php

	// check for empty database

	if (!$db->Exists("SELECT YearID FROM year")) {

		echo "<tr><td colspan=\"4\">There are currently no years in the database. You can add one using the <strong>create</strong> button above.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT YearID, YearName
		FROM year 
		ORDER BY YearID DESC 
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['YearID'];
		$ti = $db->data['YearName'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>
			
				<td><?=$id?></td>
				<td><?=$ti?></td>
				<td class="lastcolumn">
					<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sedit&id=<?=$id?>"><img src="../images/icons/icon_edit.png" border="0"></a>
					<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sdel&id=<?=$id?>"><img src="../images/icons/icon_delete.png" border="0"></a>				
				</td>
			</tr>
			
<?php 
	
		} 
	}	
	
?>

		</tbody>
	</table>
	</div>

<?php

	echo "$pagecontainerend";
	
}

function search_main_menu($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$search = $_GET['search'];

	//-------------------------------------------------
	// Pagination
	//-------------------------------------------------

	$limit = 25;																											// how many rows to show per page
	$pageNum = 1;																											// by default we show first page	
	if(isset($_GET['page'])) { $pageNum = $_GET['page']; } 						// if $_GET['page'] defined, use it as page number
	$offset = ($pageNum - 1) * $limit;																// counting the offset
	$tableName = "year";																							// source table
	$targetpage = "main.php?SID=$SID&action=$action&do=search&search=$search";	// target page and query params
	$pagemode = "search";																							// target page mode
	$query = "
		SELECT COUNT(YearID) AS num 
		FROM $tableName WHERE YearName LIKE '%$search%'
	";																																// count records query
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";
	
	$thecount = $db->QueryItem("SELECT COUNT(YearID) AS num FROM $tableName WHERE YearName LIKE '%$search%'");
	
?>

	<h3><?=$thecount?> <?php if($thecount==1) { echo "record"; } else { echo "records"; } ?> found for your search: <?=$search?> (<a href="main.php?SID=<?=$SID?>&action=<?=$action?>" class="forceunderline">clear filter</a>)</h3>

	<form id="filter-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=search" method="get" enctype="multipart/form-data">
	
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="search">
	<input type="hidden" name="doit" value="1">
	
	<div class="fields">
		<div class="block">
			<input type="text" onfocus="this.value=''" value="filter list" name="search" maxlength="50">
			<a href="javascript:" onclick="document.getElementById('filter-form').submit();" class="btn btn-primary">Go</a>
			<a href="javascript:" onclick="document.location = 'main.php?SID=<?=$SID?>&action=<?=$action?>&do=sadd';" class="btn btn-primary">Create</a>
		</div>
	</div>
	
	</form>
	
	<div class="magrid">
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th class="lastcolumn">modify</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="3">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php 

	// check for empty database

	if (!$db->Exists("
		SELECT YearID
		FROM year
		WHERE YearName LIKE '%$search%'
	")) {

		echo "<tr><td colspan=\"4\">There are currently no year in the database matching that search. Please try again.</td></tr>\n";

	} else {		

	// query the database

	$db->Query("
		SELECT YearID, YearName
		FROM year
		WHERE YearName LIKE '%$search%' 
		ORDER BY YearID DESC
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['YearID'];
		$ti = $db->data['YearName'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>

				<td><?=$id?></td>
				<td><?=$ti?></td>
				<td class="lastcolumn">
					<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sedit&id=<?=$id?>"><img src="../images/icons/icon_edit.png" border="0"></a>
					<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sdel&id=<?=$id?>"><img src="../images/icons/icon_delete.png" border="0"></a>				
				</td>
			</tr>
			
<?php 
		}
	}
?>

		</tbody>
	</table>
	</div>

<?php

	echo "$pagecontainerend";
	
}

function add_article_form($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath,$adminpage;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	
	echo "$pagecontainerstart";
	
?>

	<h3>Add a year</h3>

	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sadd" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="sadd">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>year [<span class="hint--top" data-hint="Numeric, enter the actual year. ie. 2014"><u>?</u></span>]</label> 
		<input type="text" name="yearid" maxlength="50">
	</div>
	
	<div class="block">
	<label>year name [<span class="hint--top" data-hint="Text, can be something other if you wish, but the same value as above is recommended."><u>?</u></span>]</label> 
		<input type="text" name="title" maxlength="50">
	</div>	
	
	<div class="block">
	<label>&nbsp;</label>
	<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&cancel=<?=$adminpage?>" class="btn btn-secondary" style="margin-top: 15px;">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary" style="margin-top: 15px;">Submit</a>
	</div>
	
	</div>
	</form>
	
<?php 

	echo "$pagecontainerend";

}

function do_add_article($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	
	// Get post variables 
	
	$tit = addslashes(trim($_POST['title']));
	$yid = addslashes(trim($_POST['yearid']));
	
	// make sure info is present and correct

	if ($tit == "" || $yid == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete a year and title. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT YearID, YearName FROM year WHERE YearName='$tit' OR YearID='$yid'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A year with that title already exists. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}

	$db->Insert("INSERT INTO year (YearID,YearName) VALUES ('$yid','$tit')");
		if ($db->a_rows != -1) {

		// event logging
		
		$db->Insert("
			INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
			VALUES ($sessuseri, NOW(), '1', '10', LAST_INSERT_ID(), NULL, '$sessfname $sesslname added year ''$tit''.')
		");

			echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully added a new year. <a href=\"main.php?SID=$SID&action=$action&do=sadd\">Add another</a> | <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";	
			
		} else {
		
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The year could not be added to the database at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";			
		}	

}

function delete_article_check($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_GET['id'];

	// query the database

	$db->QueryRow("SELECT YearID, YearName FROM year WHERE YearID='$id'");

	// setup variables

	$id = $db->data['YearID'];
	$ti = $db->data['YearName'];

	// output

	echo "<div class=\"msg-alerting\"><div class=\"msg-atten\">Are you sure you wish to delete the year:\n";
	echo "&nbsp;<b>$ti</b>\n";
	echo "&nbsp;<a href=\"main.php?SID=$SID&action=$action&do=sdel&id=$id&doit=1\">YES</a> | <a href=\"main.php?SID=$SID&action=$action&do=sdel&id=$id&doit=0\">NO</a></div></div>\n";
	
	echo "$pagecontainerstart";
	echo "$pagecontainerend";
}

function do_delete_article($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_GET['id'];

	// query the database

	$db->QueryRow("SELECT YearID, YearName FROM year WHERE YearID='$id'");

	// setup variables

	$id = $db->data['YearID'];
	$ti = $db->data['YearName'];
	
	// decided not to delete

	if (!$_GET['doit']) { 
	
		echo "<div class=\"msg-alerting\"><div class=\"msg-info\">You have chosen NOT to delete: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
	
	} else {

	// check to see if season is being referenced elsewhere
	
	if ($db->Exists("
		SELECT type, year FROM (
			SELECT 'websiteadmin' AS type, MyYear AS year FROM websiteadmin WHERE MyYear='$id'
		) a 
	")) {
		$db->Query("
			SELECT GROUP_CONCAT(DISTINCT type SEPARATOR ', ') as type FROM (
				SELECT 'websiteadmin' AS type, MyYear AS year FROM websiteadmin WHERE MyYear='$id'
			) a		
		");	
		
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Year $ti is being referenced in the following tables: ";
		
			for ($x=0; $x<$db->rows; $x++) {
				$db->GetRow($x);

				// setup the variables

				$ty = $db->data['type'];	
				
				echo "$ty. ";
			}
		
		echo "<br />It cannot be deleted until those references are updated/removed. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// do delete

		$db->Delete("DELETE FROM year WHERE YearID='$id'");
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully deleted: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		
	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'3','10','$id', NULL, '$sessfname $sesslname deleted year ''$ti''.')
	");
		
	}
}

function edit_article_form($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath,$adminpage,$siteurl;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];
	$id = $_GET['id'];
	
	// query database

	$db->QueryRow("
		SELECT YearID, YearName
		FROM year
		WHERE YearID='$id'");

	// setup variables

	$yid = $db->data['YearID'];
	$tit = $db->data['YearName'];
	
	echo "$pagecontainerstart";
	
?>

	<h3>Edit Year - <?=$tit?></h3>

	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sedit" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="sedit">
	<input type="hidden" name="id" value="<?=$id?>">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>year [<span class="hint--top" data-hint="Numeric, enter the actual year. ie. 2014"><u>?</u></span>]</label> 
		<input type="text" name="yearid" maxlength="50" value="<?=$yid?>">
	</div>

	<div class="block">
	<label>year name [<span class="hint--top" data-hint="Text, can be something other if you wish, but the same value as above is recommended."><u>?</u></span>]</label> 
		<input type="text" name="title" maxlength="50" value="<?=$tit?>">
	</div>	
		
	<div class="block">
	<label>&nbsp;</label>
	<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&cancel=<?=$adminpage?>" class="btn btn-secondary" style="margin-top: 15px;">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary" style="margin-top: 15px;">Submit</a>
	</div>
	
	</div>
	</form>
	
<?php 

	echo "$pagecontainerend";

}

function do_update_article($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_POST['id'];
	
	// Get post variables 

	$tit = addslashes(trim($_POST['title']));
	$yid = addslashes(trim($_POST['yearid']));
	
	// make sure info is present and correct

	if ($tit == "" || $yid == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete a year and title. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT YearID, YearName FROM year WHERE (YearName='$tit' OR YearID='$yid') AND YearID!='$id'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A year with that title already exists. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// query database

	$db->Update("UPDATE year SET YearName='$tit', YearID='$yid' WHERE YearID='$id'");
	if ($db->a_rows != -1) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully modified year: <b>$tit</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a> | <a href=\"main.php?SID=$SID&action=$action&do=sedit&id=$id\">Update more</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','10','$useri', NULL, '$sessfname $sesslname updated year ''$tit''.')");
		
	} else {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The year <b>$tit</b> could not be modified at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
	}
}


// main program

//if (!$USER[flags][$f_year_admin]) {
//	header("Location: main.php?SID=$SID");
//	exit;
//}

?>


        <section class="span8 margTop">
            <div class="row">
                <div class="span8">
                	<?php echo "$alert"; ?>


<?php

// do the main switch

switch($_GET['do']) {
case "sadd":
	if (!isset($_POST['doit'])) add_article_form($db);
	else do_add_article($db);
	break;
case "sdel":
	if (!isset($_GET['doit'])) delete_article_check($db);
	else do_delete_article($db);
	break;
case "sedit":
	if (!isset($_POST['doit'])) edit_article_form($db);
	else do_update_article($db);
	break;
case "search":
	search_main_menu($db);
	break;
default:
	show_main_menu($db);
	break;
}

?>
