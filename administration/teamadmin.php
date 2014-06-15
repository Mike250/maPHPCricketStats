<?php

//------------------------------------------------------------------------------
// Cricket Team Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

$adminpage = "teamadmin";

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>Team Administration</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Manage the teams within the respective teams of your cricketing organisation. Clubs are the parent organisation, of which will comprise one or many teams.</p>
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
			if($_GET['cancel'] == $adminpage) $cancelr = 'updating the team table';
			$alert = "<div class=\"msg-alerting\"><div class=\"msg-atten\">You have cancelled $cancelr.</div></div>\n";
		} else { }

function show_main_menu($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath,$siteurl;
	
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
	$tableName = "teams";																							// source table
	$targetpage = "main.php?SID=$SID&action=$action";									// target page and query params
	$pagemode = 0;																										// target page mode
	$query = "SELECT COUNT(TeamID) AS num FROM $tableName";						// count records query
	
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
				<th class="nopadding" width="1"></th>
				<th>id</th>
				<th>logo</th>
				<th>title</th>
				<th>abbrev</th>
				<th>status</th>
				<th class="lastcolumn">modify</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="7">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php

	// check for empty database

	if (!$db->Exists("SELECT TeamID FROM teams")) {

		echo "<tr><td colspan=\"4\">There are currently no teams in the database. You can add one using the <strong>create</strong> button above.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT TeamID, TeamName, TeamAbbrev, TeamActive, TeamColour, picture1
		FROM teams 
		ORDER BY TeamID DESC
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['TeamID'];
		$ti = $db->data['TeamName'];
		$ab = $db->data['TeamAbbrev'];
		$ac = $db->data['TeamActive'];
		$p1 = $db->data['picture1'];
		$co = $db->data['TeamColour'];
		
		// set the active or inactive class
		
		if($ac==1) {
			$accl = "isactive";
			$acte = "active";
		} else {
			$accl = "isinactive";
			$acte = "not active";
		}

		// is there a mini logo?

		if($p1=="") { 
			$displaypi1 = "";
		} else {
			$displaypi1 = "<img src='$siteurl/uploadphotos/teams/" . $p1 . "' style=\"height: 25px;\">";
		}		
	
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>
			
				<td style="background-color: #<?=$co?>;" class="nopadding"></td>
				<td><?=$id?></td>
				<td><?=$displaypi1?></td>
				<td><?=$ti?></td>
				<td><?=$ab?></td>
				<td><span class="<?=$accl?>"><?=$acte?></span></td>
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
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath,$siteurl;
	
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
	$tableName = "teams";																							// source table
	$targetpage = "main.php?SID=$SID&action=$action&do=search&search=$search";	// target page and query params
	$pagemode = "search";																							// target page mode
	$query = "
		SELECT COUNT(TeamID) AS num FROM $tableName 
		WHERE TeamName LIKE '%$search%''
	";																																// count records query
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";
	
	$thecount = $db->QueryItem("SELECT COUNT(TeamID) AS num FROM $tableName WHERE TeamName LIKE '%$search%'");
	
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
				<th class="nopadding" width="1"></th>
				<th>id</th>
				<th>logo</th>
				<th>title</th>
				<th>abbrev</th>
				<th>status</th>
				<th class="lastcolumn">modify</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="7">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php 

	// check for empty database

	if (!$db->Exists("
		SELECT TeamID
		FROM teams
		WHERE TeamName LIKE '%$search%'
	")) {

		echo "<tr><td colspan=\"4\">There are currently no teams in the database matching that search. Please try again.</td></tr>\n";

	} else {		

	// query the database

	$db->Query("
		SELECT TeamID, TeamName, TeamAbbrev, TeamActive, TeamColour, picture1
		FROM teams
		WHERE TeamName LIKE '%$search%'
		ORDER BY TeamID DESC
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['TeamID'];
		$ti = $db->data['TeamName'];
		$ab = $db->data['TeamAbbrev'];
		$ac = $db->data['TeamActive'];
		$p1 = $db->data['picture1'];
		$co = $db->data['TeamColour'];
		
		// set the active or inactive class
		
		if($ac==1) {
			$accl = "isactive";
			$acte = "active";
		} else {
			$accl = "isinactive";
			$acte = "not active";
		}		

		// is there a mini logo?

		if($p1=="") { 
			$displaypi1 = "";
		} else {
			$displaypi1 = "<img src='$siteurl/uploadphotos/teams/" . $p1 . "' style=\"height: 25px;\">";
		}		
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>

				<td style="background-color: #<?=$co?>;" class="nopadding"></td>
				<td><?=$id?></td>
				<td><?=$displaypi1?></td>
				<td><?=$ti?></td>
				<td><?=$ab?></td>
				<td><span class="<?=$accl?>"><?=$acte?></span></td>
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

	<h3>Add a team</h3>

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
	<label>club [<span class="hint--top" data-hint="Select the club this team belongs to. Obviously the club record should be created first."><u>?</u></span>]</label>
		<select name="club">
		<option value="">select club</option>
		<option value="">---------------------</option>
		<?php
			// Get the clist of clubs
			if ($db->Exists("SELECT ClubID FROM clubs")) {
				$db->Query("SELECT ClubID, ClubName FROM clubs ORDER BY ClubName");
				for ($m=0; $m<$db->rows; $m++) {
					$db->GetRow($m);
					$cid = $db->data['ClubID'];
					$cna = $db->data['ClubName'];

					echo "<option value=\"$cid\">$cna</option>\n";
				}
			}
		?>
	</select>
	</div>	

	<div class="block">
	<label>website</label> 
		<input type="text" name="teamurl" maxlength="250" placeholder="http://www.teamwebsite.com">
	</div>

	<div class="block">
	<label>colour [<span class="hint--top" data-hint="Select a colour that best represents the teams' primary colour."><u>?</u></span>]</label> 
		<input type="text" name="colour" maxlength="250">
	</div>

	<div class="block">
	<label>upload logo [<span class="hint--top" data-hint="Overrides club logo, if used. JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic">
	</div>
	
	<div class="block">
	<label>mini logo [<span class="hint--top" data-hint="Overrides club logo, if used. Upload a mini logo for use in the ladder. No higher than 90px.&#10;JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic1">
	</div>
	
	<div class="block">
	<label>active [<span class="hint--top" data-hint="Uncheck if this team is no longer active or you wish to hide from the website."><u>?</u></span>]</label> 
		<input type="checkbox" name="active" value="1" checked style="margin-top: 19px;">
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
	$url = addslashes(trim($_POST['teamurl']));
	$act = addslashes(trim($_POST['active']));
	$col = addslashes(trim($_POST['colour']));
	$clu = addslashes(trim($_POST['club'])); 
	
	// make sure info is present and correct

	if ($tit == "" || $clu == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete a team title and select a club. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT TeamName FROM teams WHERE TeamName='$tit'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A team with that title already exists. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}

	// do the photo upload work here
	
	$userpic = preg_replace("/[^A-Z0-9._-]/i", "_",strtolower(basename($_FILES['userpic']['name'])));
	
	// additional file information

	$uploadsize = $_FILES['userpic']['size'];
	$uploadtype = $_FILES['userpic']['type'];
	
	// allowed files
	
	$filetype = exif_imagetype($_FILES["userpic"]["tmp_name"]);
	$allowed = array(IMAGETYPE_GIF, IMAGETYPE_JPEG, IMAGETYPE_PNG);
	
	// destination directory 
	
	$target = "$sitepath/uploadphotos/teams/"; 
	$target = $target . $userpic;  
 	
 	// file is too big
 	
	if ($uploadsize > 3500000) { 
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">That photo was too large. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
	
	// if not allowed file 
	
	if (!in_array($filetype, $allowed)) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry! Only jpg, gif, png allowed. You uploaded a $uploadtype. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
 
 	// lets move the file
 
	if(move_uploaded_file($_FILES['userpic']['tmp_name'], $target)) { 
		$ok = 1;
	} else { 
		$ok = 0;
	} 
	
	// do the mini logo upload work here
	
	$userpic1 = preg_replace("/[^A-Z0-9._-]/i", "_",strtolower(basename($_FILES['userpic1']['name'])));
	
	// additional file information

	$uploadsize1 = $_FILES['userpic1']['size'];
	$uploadtype1 = $_FILES['userpic1']['type'];
	
	// allowed files
	
	$filetype1 = exif_imagetype($_FILES["userpic1"]["tmp_name"]);
	$allowed1 = array(IMAGETYPE_GIF, IMAGETYPE_JPEG, IMAGETYPE_PNG);
	
	// destination directory 
	
	$target1 = "$sitepath/uploadphotos/teams/"; 
	$target1 = $target1 . $userpic1;  
 	
 	// file is too big
 	
	if ($uploadsize1 > 3500000) { 
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">That logo was too large. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
	
	// if not allowed file 
	
	if (!in_array($filetype1, $allowed1)) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry! Only jpg, gif, png allowed. You uploaded a $uploadtype. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
 
 	// lets move the file
 
	if(move_uploaded_file($_FILES['userpic1']['tmp_name'], $target1)) { 
		$ok = 1;
	} else { 
		$ok = 0;
	} 
	
	$db->Insert("INSERT INTO teams (TeamName, TeamAbbrev, ClubID, TeamURL, TeamActive, TeamColour, picture, picture1) VALUES ('$tit','$abb','$clu','$url','$act','$col','$userpic','$userpic1')");
		if ($db->a_rows != -1) {

		// event logging
		
		$db->Insert("
			INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
			VALUES ($sessuseri, NOW(), '1', '16', LAST_INSERT_ID(), NULL, '$sessfname $sesslname added team ''$tit''.')
		");

			echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully added a new team. <a href=\"main.php?SID=$SID&action=$action&do=sadd\">Add another</a> | <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";	
			
		} else {
		
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The team could not be added to the database at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
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

	$db->QueryRow("SELECT TeamID, TeamName FROM teams WHERE TeamID='$id'");

	// setup variables

	$id = $db->data['TeamID'];
	$ti = $db->data['TeamName'];

	// output

	echo "<div class=\"msg-alerting\"><div class=\"msg-atten\">Are you sure you wish to delete the team:\n";
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

	$db->QueryRow("SELECT TeamID, TeamName FROM teams WHERE TeamID='$id'");

	// setup variables

	$id = $db->data['TeamID'];
	$ti = $db->data['TeamName'];
	
	// decided not to delete

	if (!$_GET['doit']) { 
	
		echo "<div class=\"msg-alerting\"><div class=\"msg-info\">You have chosen NOT to delete: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
	
	} else {
	
	// check to see if team is being referenced elsewhere
	
	if ($db->Exists("
		SELECT type, team FROM (
			SELECT 'players' AS type, PlayerTeam AS team FROM players WHERE PlayerTeam='$id'
			UNION ALL
			SELECT 'players' AS type, PlayerTeam1 AS team FROM players WHERE PlayerTeam1='$id'
			UNION ALL
			SELECT 'champions' AS type, ChampTeam AS team FROM champions WHERE ChampTeam='$id'
			UNION ALL
			SELECT 'ladder' AS type, team FROM ladder WHERE team='$id'
			UNION ALL
			SELECT 'schedule' AS type, hometeam AS team FROM schedule WHERE hometeam='$id'
			UNION ALL
			SELECT 'schedule' AS type, awayteam AS team FROM schedule WHERE awayteam='$id'
			UNION ALL
			SELECT 'scorecard_batting_details' AS type, team FROM scorecard_batting_details WHERE team='$id'
			UNION ALL
			SELECT 'scorecard_bowling_details' AS type, team FROM scorecard_bowling_details WHERE team='$id'
			UNION ALL
			SELECT 'scorecard_fow_details' AS type, team_id AS team FROM scorecard_fow_details WHERE team_id='$id'
			UNION ALL
			SELECT 'scorecard_game_details' AS type, hometeam AS team FROM scorecard_game_details WHERE hometeam='$id'
			UNION ALL
			SELECT 'scorecard_game_details' AS type, awayteam AS team FROM scorecard_game_details WHERE awayteam='$id'
			UNION ALL
			SELECT 'scorecard_total_details' AS type, team FROM scorecard_total_details WHERE team='$id'
		) a 
	")) {
		$db->Query("
			SELECT GROUP_CONCAT(DISTINCT type SEPARATOR ', ') as type FROM (
				SELECT 'players' AS type, PlayerTeam AS team FROM players WHERE PlayerTeam='$id'
				UNION ALL
				SELECT 'players' AS type, PlayerTeam1 AS team FROM players WHERE PlayerTeam1='$id'
				UNION ALL
				SELECT 'champions' AS type, ChampTeam AS team FROM champions WHERE ChampTeam='$id'
				UNION ALL
				SELECT 'ladder' AS type, team FROM ladder WHERE team='$id'
				UNION ALL
				SELECT 'schedule' AS type, hometeam AS team FROM schedule WHERE hometeam='$id'
				UNION ALL
				SELECT 'schedule' AS type, awayteam AS team FROM schedule WHERE awayteam='$id'
				UNION ALL
				SELECT 'scorecard_batting_details' AS type, team FROM scorecard_batting_details WHERE team='$id'
				UNION ALL
				SELECT 'scorecard_bowling_details' AS type, team FROM scorecard_bowling_details WHERE team='$id'
				UNION ALL
				SELECT 'scorecard_fow_details' AS type, team_id AS team FROM scorecard_fow_details WHERE team_id='$id'
				UNION ALL
				SELECT 'scorecard_game_details' AS type, hometeam AS team FROM scorecard_game_details WHERE hometeam='$id'
				UNION ALL
				SELECT 'scorecard_game_details' AS type, awayteam AS team FROM scorecard_game_details WHERE awayteam='$id'
				UNION ALL
				SELECT 'scorecard_total_details' AS type, team FROM scorecard_total_details WHERE team='$id'
			) a		
		");	
		
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Club $ti is being referenced in the following tables: ";
		
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

		$db->Delete("DELETE FROM teams WHERE TeamID='$id'");
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully deleted: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		
	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'3','16','$id', NULL, '$sessfname $sesslname deleted team ''$ti''.')
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
		SELECT TeamID, TeamName, ClubID, TeamAbbrev, TeamURL, TeamColour, TeamActive, picture, picture1
		FROM teams
		WHERE TeamID='$id'");

	// setup variables

	$tit = $db->data['TeamName'];
	$abb = $db->data['TeamAbbrev'];
	$url = $db->data['TeamURL'];
	$col = $db->data['TeamColour'];
	$act = $db->data['TeamActive'];
	$pic = $db->data['picture'];
	$pi1 = $db->data['picture1'];
	$clu = $db->data['ClubID'];
	
	// is there a logo?

	if($pic=="") { 
		$displaypic = "";
	} else {
		$displaypic = "<img src='$siteurl/uploadphotos/teams/" . $pic . "'>";
	}	

	// is there a mini logo?

	if($pi1=="") { 
		$displaypi1 = "";
	} else {
		$displaypi1 = "<img src='$siteurl/uploadphotos/teams/" . $pi1 . "'>";
	}		
	
	echo "$pagecontainerstart";
	
?>

	<h3>Edit Club - <?=$tit?></h3>

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
	<label>club [<span class="hint--top" data-hint="Select the club this team belongs to. Obviously the club record should be created first."><u>?</u></span>]</label>
		<select name="club">
		<option value="">select club</option>
		<option value="">---------------------</option>
		<?php
			// Get the clist of clubs
			if ($db->Exists("SELECT ClubID FROM clubs")) {
				$db->Query("SELECT ClubID, ClubName FROM clubs ORDER BY ClubName");
				for ($m=0; $m<$db->rows; $m++) {
					$db->GetRow($m);
					$cid = $db->data['ClubID'];
					$cna = $db->data['ClubName'];
					
					echo "<option value=\"$cid\" ";
						if($clu == $cid) echo "selected";
					echo ">$cna</option>\n";
					
				}
			}
		?>
	</select>
	</div>	
	
	<div class="block">
	<label>website</label> 
		<input type="text" name="teamurl" maxlength="250" value="<?=$url?>" placeholder="http://www.teamwebsite.com">
	</div>

	<div class="block">
	<label>colour [<span class="hint--top" data-hint="Select a colour that best represents the teams' primary colour."><u>?</u></span>]</label> 
		<input type="text" name="colour" maxlength="250" value="<?=$col?>">
	</div>
	
	<?php if($pic=="") { echo ""; } else { ?>
	<div class="block">
	<label>current logo</label>
		<?php echo $displaypic; ?>
	</div>
	<?php } ?>	
	
	<div class="block">
	<label>team logo [<span class="hint--top" data-hint="Overrides club logo, if used. JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic">
	</div>

	<?php if($pi1=="") { echo ""; } else { ?>
	<div class="block">
	<label>current mini logo</label>
		<?php echo $displaypi1; ?>
	</div>
	<?php } ?>	
	
	<div class="block">
	<label>mini logo [<span class="hint--top" data-hint="Overrides club logo, if used. Upload a mini logo for use in the ladder. No higher than 90px.&#10;JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic1">
	</div>

	<div class="block">
	<label>active [<span class="hint--top" data-hint="Uncheck if this team is no longer active or you wish to hide from the website."><u>?</u></span>]</label> 
		<?php echo "<input type=\"checkbox\" name=\"active\" value=\"1\" style=\"margin-top: 19px;\"" . ($act==1?" checked":"") . ">\n"; ?>
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
	$url = addslashes(trim($_POST['teamurl']));
	$col = addslashes(trim($_POST['colour']));
	$act = addslashes(trim($_POST['active']));
	$clu = addslashes(trim($_POST['club']));
	
	// make sure info is present and correct

	if ($tit == "" || $clu == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete a team title and select a club. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT TeamName FROM teams WHERE TeamName='$tit' AND TeamID!='$id'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A team with that title already exists. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}

	// do the photo upload work here
	
	$userpic = preg_replace("/[^A-Z0-9._-]/i", "_",strtolower(basename($_FILES['userpic']['name'])));

	// Was a new photo uploaded? If so, process, if not, ignore
	
	if($userpic != "") {
	
	// additional file information

	$uploadsize = $_FILES['userpic']['size'];
	$uploadtype = $_FILES['userpic']['type'];
	
	// allowed files
	
	$filetype = exif_imagetype($_FILES["userpic"]["tmp_name"]);
	$allowed = array(IMAGETYPE_GIF, IMAGETYPE_JPEG, IMAGETYPE_PNG);
	
	// destination directory 
	
	$target = "$sitepath/uploadphotos/teams/"; 
	$target = $target . $userpic;  
 	
 	// file is too big
 	
	if ($uploadsize > 3500000) { 
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">That photo was too large. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
	
	// if not allowed file 
	
	if (!in_array($filetype, $allowed)) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry! Only jpg, gif, png allowed. You uploaded a $uploadtype. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
 
 	// lets move the file
 
	if(move_uploaded_file($_FILES['userpic']['tmp_name'], $target)) { 
		$ok = 1;
	} else { 
		$ok = 0;
	} 
	
	} else { 
	
	$userpic = $db->QueryItem("SELECT picture FROM teams WHERE TeamID = '$id'");
	
	}	

	// do the mini logo upload work here
	
	$userpic1 = preg_replace("/[^A-Z0-9._-]/i", "_",strtolower(basename($_FILES['userpic1']['name'])));

	// Was a new photo uploaded? If so, process, if not, ignore
	
	if($userpic1 != "") {
	
	// additional file information

	$uploadsize1 = $_FILES['userpic1']['size'];
	$uploadtype1 = $_FILES['userpic1']['type'];
	
	// allowed files
	
	$filetype1 = exif_imagetype($_FILES["userpic1"]["tmp_name"]);
	$allowed1 = array(IMAGETYPE_GIF, IMAGETYPE_JPEG, IMAGETYPE_PNG);
	
	// destination directory 
	
	$target1 = "$sitepath/uploadphotos/teams/"; 
	$target1 = $target1 . $userpic1;  
 	
 	// file is too big
 	
	if ($uploadsize1 > 3500000) { 
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">That logo was too large. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
	
	// if not allowed file 
	
	if (!in_array($filetype1, $allowed1)) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry! Only jpg, gif, png allowed. You uploaded a $uploadtype. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
 
 	// lets move the file
 
	if(move_uploaded_file($_FILES['userpic1']['tmp_name'], $target1)) { 
		$ok = 1;
	} else { 
		$ok = 0;
	} 
	
	} else { 
	
	$userpic1 = $db->QueryItem("SELECT picture1 FROM teams WHERE TeamID = '$id'");
	
	}
	
	// query database

	$db->Update("
		UPDATE teams SET 
			TeamName='$tit', 
			TeamAbbrev='$abb',
			ClubID='$clu',
			TeamURL='$url',
			TeamColour='$col',
			TeamActive='$act',
			picture='$userpic',
			picture1='$userpic1'
		WHERE TeamID='$id'
	");
	if ($db->a_rows != -1) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully modified team: <b>$tit</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a> | <a href=\"main.php?SID=$SID&action=$action&do=sedit&id=$id\">Update more</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','16','$useri', NULL, '$sessfname $sesslname updated team ''$tit''.')");
		
	} else {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The team <b>$tit</b> could not be modified at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
	}
}


// main program

//if (!$USER[flags][$f_team_admin]) {
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
