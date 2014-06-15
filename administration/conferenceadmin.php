<?php

//------------------------------------------------------------------------------
// Cricket Conference Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

$adminpage = "conferenceadmin";

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>Conference Administration</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Manage your league conference/s, if applicable. This is also known as Grade or Division. ie. 1st Grade, 2nd Grade.</p>
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
			if($_GET['cancel'] == $adminpage) $cancelr = 'updating the conference table';
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
	$tableName = "conference";																				// source table
	$targetpage = "main.php?SID=$SID&action=$action";									// target page and query params
	$pagemode = 0;																										// target page mode
	$query = "SELECT COUNT(ConferenceID) AS num FROM $tableName";			// count records query
	
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
				<th>abbrev</th>
				<th>type</th>
				<th class="lastcolumn">modify</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="5">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php

	// check for empty database

	if (!$db->Exists("SELECT ConferenceID FROM conference")) {

		echo "<tr><td colspan=\"4\">There are currently no conferences in the database. You can add one using the <strong>create</strong> button above.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT ConferenceID, ConferenceName, ConferenceAbbrev, ConferenceType
		FROM conference 
		ORDER BY ConferenceType, ConferenceName 
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['ConferenceID'];
		$ti = $db->data['ConferenceName'];
		$ab = $db->data['ConferenceAbbrev'];
		$ty = $db->data['ConferenceType'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>
			
				<td><?=$id?></td>
				<td><?=$ti?></td>
				<td><?=$ab?></td>
				<td><?=$ty?></td>
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
	$tableName = "conference";																				// source table
	$targetpage = "main.php?SID=$SID&action=$action&do=search&search=$search";	// target page and query params
	$pagemode = "search";																							// target page mode
	$query = "
		SELECT COUNT(ConferenceID) AS num FROM $tableName 
		WHERE ConferenceName LIKE '%$search%' OR ConferenceType LIKE '%$search%'
	";																																// count records query
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";
	
	$thecount = $db->QueryItem("SELECT COUNT(ConferenceID) AS num FROM $tableName WHERE ConferenceName LIKE '%$search%' OR ConferenceType LIKE '%$search%'");
	
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
				<th>abbrev</th>
				<th>type</th>
				<th class="lastcolumn">modify</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="5">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php 

	// check for empty database

	if (!$db->Exists("
		SELECT ConferenceID
		FROM conference
		WHERE ConferenceName LIKE '%$search%' OR ConferenceType LIKE '%$search%'
	")) {

		echo "<tr><td colspan=\"4\">There are currently no conferences in the database matching that search. Please try again.</td></tr>\n";

	} else {		

	// query the database

	$db->Query("
		SELECT ConferenceID, ConferenceName, ConferenceAbbrev, ConferenceType
		FROM conference
		WHERE ConferenceName LIKE '%$search%' OR ConferenceType LIKE '%$search%'
		ORDER BY ConferenceType, ConferenceName
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['ConferenceID'];
		$ti = $db->data['ConferenceName'];
		$ab = $db->data['ConferenceAbbrev'];
		$ty = $db->data['ConferenceType'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>

				<td><?=$id?></td>
				<td><?=$ti?></td>
				<td><?=$ab?></td>
				<td><?=$ty?></td>
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

	<h3>Add a conference</h3>

	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sadd" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="sadd">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>title</label> 
		<input type="text" name="title" maxlength="50">
	</div>
	
	<div class="block">
	<label>abbreviation [<span class="hint--top" data-hint="An abbreviation for use on sidebar ladders/schedules/results, etc."><u>?</u></span>]</label> 
		<input type="text" name="abbrev" maxlength="50">
	</div>
	
	<div class="block">
	<label>type [<span class="hint--top" data-hint="Additional grouping, if required. An example might be: Juniors / Seniors."><u>?</u></span>]</label> 
		<input type="text" name="type" maxlength="50">
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
	$abb = addslashes(trim($_POST['abbrev']));
	$typ = addslashes(trim($_POST['type']));
	
	// make sure info is present and correct

	if ($tit == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete a conference title. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT ConferenceName FROM conference WHERE ConferenceName='$tit'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A conference with that title already exists. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}

	$db->Insert("INSERT INTO conference (ConferenceName, ConferenceAbbrev, ConferenceType) VALUES ('$tit','$abb','$typ')");
		if ($db->a_rows != -1) {

		// event logging
		
		$db->Insert("
			INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
			VALUES ($sessuseri, NOW(), '1', '11', LAST_INSERT_ID(), NULL, '$sessfname $sesslname added conference ''$tit''.')
		");

			echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully added a new conference. <a href=\"main.php?SID=$SID&action=$action&do=sadd\">Add another</a> | <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";	
			
		} else {
		
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The conference could not be added to the database at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
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

	$db->QueryRow("SELECT ConferenceID, ConferenceName FROM conference WHERE ConferenceID='$id'");

	// setup variables

	$id = $db->data['ConferenceID'];
	$ti = $db->data['ConferenceName'];

	// output

	echo "<div class=\"msg-alerting\"><div class=\"msg-atten\">Are you sure you wish to delete the conference:\n";
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

	$db->QueryRow("SELECT ConferenceID, ConferenceName FROM conference WHERE ConferenceID='$id'");

	// setup variables

	$id = $db->data['ConferenceID'];
	$ti = $db->data['ConferenceName'];
	
	// decided not to delete

	if (!$_GET['doit']) { 
	
		echo "<div class=\"msg-alerting\"><div class=\"msg-info\">You have chosen NOT to delete: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
	
	} else {
	
	// check to see if conference is being referenced elsewhere
	
	if ($db->Exists("
		SELECT type, conference FROM (
			SELECT 'ladder' AS type, conference FROM ladder WHERE conference='$id'
			UNION ALL
			SELECT 'scorecard_game_details' AS type, conf_id AS conference FROM scorecard_game_details WHERE conf_id='$id'
			UNION ALL
			SELECT 'player_batting' AS type, conf_id AS conference FROM player_batting WHERE conf_id='$id'		
			UNION ALL
			SELECT 'teamform' AS type, conf_id AS conference FROM teamform WHERE conf_id='$id'
		) a 
	")) {
		$db->Query("
			SELECT GROUP_CONCAT(DISTINCT type SEPARATOR ', ') as type FROM (
			SELECT 'ladder' AS type, conference FROM ladder WHERE conference='$id'
			UNION ALL
			SELECT 'scorecard_game_details' AS type, conf_id AS conference FROM scorecard_game_details WHERE conf_id='$id'
			UNION ALL
			SELECT 'player_batting' AS type, conf_id AS conference FROM player_batting WHERE conf_id='$id'		
			UNION ALL
			SELECT 'teamform' AS type, conf_id AS conference FROM teamform WHERE conf_id='$id'
			) a		
		");	
		
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Conference $ti is being referenced in the following tables: ";
		
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

		$db->Delete("DELETE FROM conference WHERE ConferenceID='$id'");
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully deleted: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		
	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'3','11','$id', NULL, '$sessfname $sesslname deleted conference ''$ti''.')
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
		SELECT ConferenceID, ConferenceName, ConferenceAbbrev, ConferenceType
		FROM conference
		WHERE ConferenceID='$id'");

	// setup variables

	$tit = $db->data['ConferenceName'];
	$abb = $db->data['ConferenceAbbrev'];
	$typ = $db->data['ConferenceType'];
	
	echo "$pagecontainerstart";
	
?>

	<h3>Edit Conference - <?=$tit?></h3>

	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sedit" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="sedit">
	<input type="hidden" name="id" value="<?=$id?>">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>title</label> 
		<input type="text" name="title" maxlength="50" value="<?=$tit?>">
	</div>

	<div class="block">
	<label>abbreviation [<span class="hint--top" data-hint="An abbreviation for use on sidebar ladders/schedules/results, etc."><u>?</u></span>]</label> 
		<input type="text" name="abbrev" maxlength="50" value="<?=$abb?>">
	</div>
	
	<div class="block">
	<label>type [<span class="hint--top" data-hint="Additional grouping, if required. An example might be: Juniors / Seniors."><u>?</u></span>]</label> 
		<input type="text" name="type" maxlength="50" value="<?=$typ?>">
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
	$abb = addslashes(trim($_POST['abbrev']));
	$typ = addslashes(trim($_POST['type']));	
	
	// make sure info is present and correct

	if ($tit == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete a conference title. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT ConferenceName FROM conference WHERE ConferenceName='$tit' AND ConferenceID!='$id'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A conference with that title already exists. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// query database

	$db->Update("
		UPDATE conference SET 
			ConferenceName='$tit', 
			ConferenceAbbrev='$abb',
			ConferenceType='$typ' 
		WHERE ConferenceID='$id'
	");
	if ($db->a_rows != -1) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully modified conference: <b>$tit</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a> | <a href=\"main.php?SID=$SID&action=$action&do=sedit&id=$id\">Update more</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','11','$useri', NULL, '$sessfname $sesslname updated conference ''$tit''.')");
		
	} else {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The conference <b>$tit</b> could not be modified at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
	}
}


// main program

//if (!$USER[flags][$f_conference_admin]) {
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
