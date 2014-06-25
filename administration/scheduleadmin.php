<?php

//------------------------------------------------------------------------------
// Cricket Schedule Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

$adminpage = "scheduleadmin";

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>Schedule Administration</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Manage the schedules/fixtures the teams in your organisation participate in.</p>
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
			if($_GET['cancel'] == $adminpage) $cancelr = 'updating the schedule table';
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
	$tableName = "schedule";																					// source table
	$targetpage = "main.php?SID=$SID&action=$action";									// target page and query params
	$pagemode = 0;																										// target page mode
	$query = "SELECT COUNT(id) AS num FROM $tableName";								// count records query
	
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
				<th>date</th>
				<th>type</th>
				<th>visitor @ home</th>
				<th>venue</th>
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

	if (!$db->Exists("SELECT id FROM schedule")) {

		echo "<tr><td colspan=\"5\">There are currently no scheduled matches in the database. You can add one using the <strong>create</strong> button above.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT 
			s.id,
			DATE_FORMAT(s.date,'%b %e, %Y') AS date, 
			DATE_FORMAT(s.date2,'%b %e, %Y') AS date2, 
			t1.TeamAbbrev AS hometeam,
			t2.TeamAbbrev AS awayteam,
			l.LeagueAbbrev AS type,
			g.GroundAbbrev AS venue
		FROM schedule s
		JOIN grounds g ON s.venue = g.GroundID
		JOIN league l ON s.league_id = l.LeagueID
		JOIN teams t1 ON s.hometeam = t1.TeamID
		JOIN teams t2 ON s.awayteam = t2.TeamID
		ORDER BY s.id DESC 
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['id'];
		$d1 = $db->data['date'];
		$d2 = $db->data['date2'];
		$ht = $db->data['hometeam'];
		$at = $db->data['awayteam'];
		$ty = $db->data['type'];
		$ve = $db->data['venue'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>
			
				<td><?=$d1?></td>
				<td><?=$ty?></td>
				<td><?=$at?> @ <?=$ht?></td>
				<td><?=$ve?></td>
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
	$tableName = "schedule";																						// source table
	$targetpage = "main.php?SID=$SID&action=$action&do=search&search=$search";	// target page and query params
	$pagemode = "search";																							// target page mode
	$query = "
		SELECT COUNT(id) AS num FROM (
			SELECT 
				s.id,
				DATE_FORMAT(s.date,'%b %e, %Y') AS date, 
				DATE_FORMAT(s.date2,'%b %e, %Y') AS date2, 
				t1.TeamAbbrev AS hometeam,
				t2.TeamAbbrev AS awayteam,
				l.LeagueAbbrev AS type,
				g.GroundAbbrev AS venue
			FROM schedule s
			JOIN grounds g ON s.venue = g.GroundID
			JOIN league l ON s.league_id = l.LeagueID
			JOIN teams t1 ON s.hometeam = t1.TeamID
			JOIN teams t2 ON s.awayteam = t2.TeamID
			WHERE t1.TeamAbbrev LIKE '$search' OR t2.TeamAbbrev LIKE '$search' OR g.GroundAbbrev LIKE '$search'	
		) a";																														// count records query

	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";
	
	$thecount = $db->QueryItem("
		SELECT COUNT(id) AS num FROM (
			SELECT 
				s.id,
				DATE_FORMAT(s.date,'%b %e, %Y') AS date, 
				DATE_FORMAT(s.date2,'%b %e, %Y') AS date2, 
				t1.TeamAbbrev AS hometeam,
				t2.TeamAbbrev AS awayteam,
				l.LeagueAbbrev AS type,
				g.GroundAbbrev AS venue
			FROM schedule s
			JOIN grounds g ON s.venue = g.GroundID
			JOIN league l ON s.league_id = l.LeagueID
			JOIN teams t1 ON s.hometeam = t1.TeamID
			JOIN teams t2 ON s.awayteam = t2.TeamID
			WHERE t1.TeamAbbrev LIKE '$search' OR t2.TeamAbbrev LIKE '$search' OR g.GroundAbbrev LIKE '$search'
		) a	
	");
	
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
				<th>date</th>
				<th>type</th>
				<th>visitor @ home</th>
				<th>venue</th>
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
		SELECT 
			s.id,
			DATE_FORMAT(s.date,'%b %e, %Y') AS date, 
			DATE_FORMAT(s.date2,'%b %e, %Y') AS date2, 
			t1.TeamAbbrev AS hometeam,
			t2.TeamAbbrev AS awayteam,
			l.LeagueAbbrev AS type,
			g.GroundAbbrev AS venue
		FROM schedule s
		JOIN grounds g ON s.venue = g.GroundID
		JOIN league l ON s.league_id = l.LeagueID
		JOIN teams t1 ON s.hometeam = t1.TeamID
		JOIN teams t2 ON s.awayteam = t2.TeamID
		WHERE t1.TeamAbbrev LIKE '$search' OR t2.TeamAbbrev LIKE '$search' OR g.GroundAbbrev LIKE '$search'
	")) {

		echo "<tr><td colspan=\"4\">There are currently no articles in the database matching that search. Please try again.</td></tr>\n";

	} else {		

	// query the database

	$db->Query("
		SELECT 
			s.id,
			DATE_FORMAT(s.date,'%b %e, %Y') AS date, 
			DATE_FORMAT(s.date2,'%b %e, %Y') AS date2, 
			t1.TeamAbbrev AS hometeam,
			t2.TeamAbbrev AS awayteam,
			l.LeagueAbbrev AS type,
			g.GroundAbbrev AS venue
		FROM schedule s
		JOIN grounds g ON s.venue = g.GroundID
		JOIN league l ON s.league_id = l.LeagueID
		JOIN teams t1 ON s.hometeam = t1.TeamID
		JOIN teams t2 ON s.awayteam = t2.TeamID
		WHERE t1.TeamAbbrev LIKE '$search' OR t2.TeamAbbrev LIKE '$search' OR g.GroundAbbrev LIKE '$search'
		ORDER BY s.date DESC
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['id'];
		$d1 = $db->data['date'];
		$d2 = $db->data['date2'];
		$ht = $db->data['hometeam'];
		$at = $db->data['awayteam'];
		$ty = $db->data['type'];
		$ve = $db->data['venue'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>

				<td><?=$d1?></td>
				<td><?=$ty?></td>
				<td><?=$at?> @ <?=$ht?></td>
				<td><?=$ve?></td>
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
	
	// check all checkboxes javascript

?>

	<h3>Add a fixture</h3>

	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sadd" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="sadd">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>week</label> 
		<input type="text" name="week" maxlength="50">
	</div>

	<div class="block">
	<label>season [<span class="hint--top" data-hint="Select the season that this fixture belongs to. Every fixture must be associated with a season."><u>?</u></span>]</label>
		<select name="season">
		<option value="">select season</option>
		<option value="">---------------------</option>
		<?php
			// Get the clist of seasons
			if ($db->Exists("SELECT SeasonID FROM seasons")) {
				$db->Query("SELECT SeasonID, SeasonName FROM seasons ORDER BY SeasonName DESC");
				for ($m=0; $m<$db->rows; $m++) {
					$db->GetRow($m);
					$sid = $db->data['SeasonID'];
					$sna = $db->data['SeasonName'];

					echo "<option value=\"$sid\">$sna</option>\n";
				}
			}
		?>
	</select>
	</div>	

	<div class="block">
	<label>date 1 [<span class="hint--top" data-hint="Select the date that this fixture will be played on."><u>?</u></span>]</label> 
		<input type="text" name="date1" maxlength="50">
	</div>

	<div class="block">
	<label>date 2 [<span class="hint--top" data-hint="If required. Enter the last date that this multiple day fixture ends on."><u>?</u></span>]</label> 
		<input type="text" name="date2" maxlength="50">
	</div>

	<div class="block">
	<label>league [<span class="hint--top" data-hint="Select the league that this fixture belongs to. Every fixture must be associated with a league."><u>?</u></span>]</label>
		<select name="league_id">
		<option value="">select league</option>
		<option value="">---------------------</option>
		<?php
			// Get the clist of leagues
			if ($db->Exists("SELECT LeagueID FROM league")) {
				$db->Query("SELECT LeagueID, LeagueName FROM league ORDER BY LeagueName");
				for ($m=0; $m<$db->rows; $m++) {
					$db->GetRow($m);
					$lid = $db->data['LeagueID'];
					$lna = $db->data['LeagueName'];

					echo "<option value=\"$lid\">$lna</option>\n";
				}
			}
		?>
	</select>
	</div>	

	<div class="block">
	<label>awayteam [<span class="hint--top" data-hint="Select the visiting team."><u>?</u></span>]</label>
		<select name="awayteam">
		<option value="">select team</option>
		<option value="">---------------------</option>
		<?php
			// Get the clist of teams
			if ($db->Exists("SELECT TeamID FROM teams")) {
				$db->Query("SELECT TeamID, TeamName FROM teams ORDER BY TeamName");
				for ($m=0; $m<$db->rows; $m++) {
					$db->GetRow($m);
					$aid = $db->data['TeamID'];
					$ana = $db->data['TeamName'];

					echo "<option value=\"$aid\">$ana</option>\n";
				}
			}
		?>
	</select>
	</div>	

	<div class="block">
	<label>hometeam [<span class="hint--top" data-hint="Select the home team."><u>?</u></span>]</label>
		<select name="hometeam">
		<option value="">select team</option>
		<option value="">---------------------</option>
		<?php
			// Get the clist of teams
			if ($db->Exists("SELECT TeamID FROM teams")) {
				$db->Query("SELECT TeamID, TeamName FROM teams ORDER BY TeamName");
				for ($m=0; $m<$db->rows; $m++) {
					$db->GetRow($m);
					$hid = $db->data['TeamID'];
					$hna = $db->data['TeamName'];

					echo "<option value=\"$hid\">$hna</option>\n";
				}
			}
		?>
	</select>
	</div>	

	<div class="block">
	<label>venue [<span class="hint--top" data-hint="Select the ground this fixture is to be played upon."><u>?</u></span>]</label>
		<select name="venue">
		<option value="">select ground</option>
		<option value="">---------------------</option>
		<?php
			// Get the clist of grounds
			if ($db->Exists("SELECT GroundID FROM grounds")) {
				$db->Query("SELECT GroundID, GroundName FROM grounds ORDER BY GroundName");
				for ($m=0; $m<$db->rows; $m++) {
					$db->GetRow($m);
					$gid = $db->data['GroundID'];
					$gna = $db->data['GroundName'];

					echo "<option value=\"$gid\">$gna</option>\n";
				}
			}
		?>
	</select>
	</div>	
		
	<div class="block">
		<textarea name="article" id="myTextarea"></textarea>
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
	
	$wee = addslashes(trim($_POST['week']));
	$sea = addslashes(trim($_POST['season']));
	$da1 = addslashes(trim($_POST['date1']));
	$da2 = addslashes(trim($_POST['date2']));
	$lid = addslashes(trim($_POST['league_id']));
	$ven = addslashes(trim($_POST['venue']));
	$awa = addslashes(trim($_POST['awayteam']));
	$hom = addslashes(trim($_POST['hometeam']));
	
	// make sure info is present and correct

	if ($da1 == "" || $sea == "" || $lid == "" || $ven == "" || $hom == "" || $awa == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete the date, select a season, league, venue and teams. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}

	// lets get the team names for the event logging

	$awayteam = $db->QueryItem("SELECT TeamAbbrev FROM teams WHERE TeamID = '$awa'");
	$hometeam = $db->QueryItem("SELECT TeamAbbrev FROM teams WHERE TeamID = '$hom'");

	// insert into schedule
	
	$db->Insert("
		INSERT INTO schedule (
			week, season, date, date2, venue, league_id, awayteam, hometeam
		) VALUES (
			'$wee','$sea','$da1','$da2','$ven','$lid','$awa','$hom'
		)
	");

		if ($db->a_rows != -1) {

		// event logging
		
		$db->Insert("
			INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
			VALUES ($sessuseri, NOW(), '1', '20', LAST_INSERT_ID(), NULL, '$sessfname $sesslname added schedule ''$awayteam'' v ''$hometeam''.')
		");

			echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully added a new schedule. <a href=\"main.php?SID=$SID&action=$action&do=sadd\">Add another</a> | <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";	
			
		} else {
		
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The schedule could not be added to the database at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
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

	$db->QueryRow("SELECT id, title, added, user FROM history WHERE id='$id'");

	// setup variables

	$id = $db->data['id'];
	$ad = $db->data['added'];
	$ti = $db->data['title'];
	$us = $db->data['user'];

	// output

	echo "<div class=\"msg-alerting\"><div class=\"msg-atten\">Are you sure you wish to delete the article:\n";
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

	$db->QueryRow("SELECT id, title, added, user FROM history WHERE id='$id'");

	// setup variables

	$id = $db->data['id'];
	$ad = $db->data['added'];
	$ti = $db->data['title'];
	$us = $db->data['user'];
	
	// decided not to delete

	if (!$_GET['doit']) { 
	
		echo "<div class=\"msg-alerting\"><div class=\"msg-info\">You have chosen NOT to delete: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
	
	} else {

	// do delete

		$db->Delete("DELETE FROM history WHERE id='$id'");
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully deleted: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		
	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'3','7','$id', NULL, '$sessfname $sesslname deleted history article ''$ti''.')
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
		SELECT id, added, title, user, article, picture
		FROM history 
		WHERE id='$id'");

	// setup variables

	$add = $db->data['added'];
	$tit = $db->data['title'];
	$use = $db->data['user'];
	$art = $db->data['article'];
	$pic = $db->data['picture'];
	
	echo "$pagecontainerstart";
	
	// is there a picture?

	if($pic=="") { 
		$displaypic = "";
	} else {
		$displaypic = "<img src='$siteurl/uploadphotos/history/" . $pic . "'>";
	}

?>

	<h3>Edit Article - <?=$tit?></h3>

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

	<?php if($pic=="") { echo ""; } else { ?>
	<div class="block">
	<label>current photo</label>
		<?php echo $displaypic; ?>
	</div>
	<?php } ?>
	
	<div class="block">
	<label>upload photo [<span class="hint--top" data-hint="JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic">
	</div>
		
	<div class="block">
		<textarea name="article" id="myTextarea"><?=$art?></textarea>
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
	$art = addslashes(trim($_POST['article']));
	$dat = date('-Ymd');
	
	// permalink work
	
	$per = preg_replace('/[^a-zA-Z0-9s ]/', '', $tit);
	$per = preg_replace('/  /', ' ', $per);
	$per = preg_replace('/ /', '-', $per);	
	$per = strtolower($per);

	// make sure info is present and correct

	if ($tit == "" || $art == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete an article title and compose an article. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT title FROM history WHERE title='$tit' AND id!='$id'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">An article with that title was already added. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
		
	
	// do the photo upload work here
	
	$userpic = preg_replace("/[^A-Z0-9._-]/i", "_",strtolower(basename($_FILES['userpic']['name'])));
	
	// Was a new photo uploaded? If so, process, if not, ignore
	
	if($userpic != "") {

	// lets datestamp the file to help prevent overwrites

	$picdate = date('Ymd_');
	$userpic = $picdate.$userpic; 
	
	// additional file information

	$uploadsize = $_FILES['userpic']['size'];
	$uploadtype = $_FILES['userpic']['type'];
	
	// allowed files
	
	$filetype = exif_imagetype($_FILES["userpic"]["tmp_name"]);
	$allowed = array(IMAGETYPE_GIF, IMAGETYPE_JPEG, IMAGETYPE_PNG);
	
	// destination directory 
	
	$target = "$sitepath/uploadphotos/history/"; 
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
	
	$userpic = $db->QueryItem("SELECT picture FROM history WHERE id='$id'");
	
	}
	
	// query database

	$db->Update("UPDATE history SET title='$tit',article='$art',modified=NOW(),picture='$userpic',permalink='$per' WHERE id='$id'");
	if ($db->a_rows != -1) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully modified article: <b>$tit</b>. <a href=\"main.php?SID=$SID&action=$action\">Article list</a> | <a href=\"main.php?SID=$SID&action=$action&do=sedit&id=$id\">Update more</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','7','$useri', NULL, '$sessfname $sesslname updated history article ''$tit''.')");
		
	} else {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The article <b>$tit</b> could not be modified at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
	}
}


// main program

//if (!$USER[flags][$f_history_admin]) {
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
