<?php

//------------------------------------------------------------------------------
// Cricket Club Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

$adminpage = "clubadmin";

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>Club Administration</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Manage your clubs within your cricketing organisation. Clubs are the parent organisation, of which will comprise one or many teams.</p>
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
			if($_GET['cancel'] == $adminpage) $cancelr = 'updating the club table';
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
	$tableName = "clubs";																							// source table
	$targetpage = "main.php?SID=$SID&action=$action";									// target page and query params
	$pagemode = 0;																										// target page mode
	$query = "SELECT COUNT(ClubID) AS num FROM $tableName";						// count records query
	
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

	if (!$db->Exists("SELECT ClubID FROM clubs")) {

		echo "<tr><td colspan=\"4\">There are currently no clubs in the database. You can add one using the <strong>create</strong> button above.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT ClubID, ClubName, ClubAbbrev, ClubActive, ClubColour, picture1
		FROM clubs 
		ORDER BY ClubID DESC
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['ClubID'];
		$ti = $db->data['ClubName'];
		$ab = $db->data['ClubAbbrev'];
		$ac = $db->data['ClubActive'];
		$p1 = $db->data['picture1'];
		$co = $db->data['ClubColour'];
		
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
			$displaypi1 = "<img src='$siteurl/uploadphotos/clubs/" . $p1 . "' style=\"height: 25px;\">";
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
	$tableName = "clubs";																							// source table
	$targetpage = "main.php?SID=$SID&action=$action&do=search&search=$search";	// target page and query params
	$pagemode = "search";																							// target page mode
	$query = "
		SELECT COUNT(ClubID) AS num FROM $tableName 
		WHERE ClubName LIKE '%$search%''
	";																																// count records query
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";
	
	$thecount = $db->QueryItem("SELECT COUNT(ClubID) AS num FROM $tableName WHERE ClubName LIKE '%$search%'");
	
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
		SELECT ClubID
		FROM clubs
		WHERE ClubName LIKE '%$search%'
	")) {

		echo "<tr><td colspan=\"4\">There are currently no clubs in the database matching that search. Please try again.</td></tr>\n";

	} else {		

	// query the database

	$db->Query("
		SELECT ClubID, ClubName, ClubAbbrev, ClubActive, ClubColour, picture1
		FROM clubs
		WHERE ClubName LIKE '%$search%'
		ORDER BY ClubID DESC
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['ClubID'];
		$ti = $db->data['ClubName'];
		$ab = $db->data['ClubAbbrev'];
		$ac = $db->data['ClubActive'];
		$p1 = $db->data['picture1'];
		$co = $db->data['ClubColour'];
		
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
			$displaypi1 = "<img src='$siteurl/uploadphotos/clubs/" . $p1 . "' style=\"height: 25px;\">";
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

	<h3>Add a club</h3>

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
	<label>website</label> 
		<input type="text" name="cluburl" maxlength="250" placeholder="http://www.clubwebsite.com">
	</div>

	<div class="block">
	<label>colour [<span class="hint--top" data-hint="Select a colour that best represents the clubs' primary colour."><u>?</u></span>]</label> 
		<input type="text" name="colour" maxlength="250">
	</div>
	
	<div class="block">
	<label>ground [<span class="hint--top" data-hint="Select the clubs' home ground. Obviously the ground record should be created first."><u>?</u></span>]</label>
		<select name="ground">
		<option value="">select ground</option>
		<option value="">---------------------</option>
		<?php
			// Get the clist of clubs
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
	<label>upload logo [<span class="hint--top" data-hint="JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic">
	</div>
	
	<div class="block">
	<label>mini logo [<span class="hint--top" data-hint="Upload a mini logo for use in the ladder. No higher than 90px.&#10;JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic1">
	</div>
	
	<div class="block">
	<label>active [<span class="hint--top" data-hint="Uncheck if this club is no longer active or you wish to hide from the website."><u>?</u></span>]</label> 
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
	$url = addslashes(trim($_POST['cluburl']));
	$act = addslashes(trim($_POST['active']));
	$gro = addslashes(trim($_POST['ground']));
	$col = addslashes(trim($_POST['colour']));
	
	// make sure info is present and correct

	if ($tit == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete a club title. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT ClubName FROM clubs WHERE ClubName='$tit'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A club with that title already exists. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
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
	
	$target = "$sitepath/uploadphotos/clubs/"; 
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
	
	$target1 = "$sitepath/uploadphotos/clubs/"; 
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
	
	$db->Insert("INSERT INTO clubs (ClubName, ClubAbbrev, ClubURL, ClubActive, GroundID, ClubColour, picture, picture1) VALUES ('$tit','$abb','$url','$act','$gro','$col','$userpic','$userpic1')");
		if ($db->a_rows != -1) {

		// event logging
		
		$db->Insert("
			INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
			VALUES ($sessuseri, NOW(), '1', '15', LAST_INSERT_ID(), NULL, '$sessfname $sesslname added club ''$tit''.')
		");

			echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully added a new club. <a href=\"main.php?SID=$SID&action=$action&do=sadd\">Add another</a> | <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";	
			
		} else {
		
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The club could not be added to the database at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
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

	$db->QueryRow("SELECT ClubID, ClubName FROM clubs WHERE ClubID='$id'");

	// setup variables

	$id = $db->data['ClubID'];
	$ti = $db->data['ClubName'];

	// output

	echo "<div class=\"msg-alerting\"><div class=\"msg-atten\">Are you sure you wish to delete the club:\n";
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

	$db->QueryRow("SELECT ClubID, ClubName FROM clubs WHERE ClubID='$id'");

	// setup variables

	$id = $db->data['ClubID'];
	$ti = $db->data['ClubName'];
	
	// decided not to delete

	if (!$_GET['doit']) { 
	
		echo "<div class=\"msg-alerting\"><div class=\"msg-info\">You have chosen NOT to delete: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
	
	} else {
	
	// check to see if club is being referenced elsewhere
	
	if ($db->Exists("
		SELECT type, club FROM (
			SELECT 'players' AS type, PlayerClub AS club FROM players WHERE PlayerClub='$id'
			UNION ALL
			SELECT 'players' AS type, PlayerClub1 AS club FROM players WHERE PlayerClub1='$id'
			UNION ALL
			SELECT 'teams' AS type, ClubID AS club FROM teams WHERE ClubID='$id'
			UNION ALL
			SELECT 'websiteadmin' AS type, myClub AS club FROM websiteadmin WHERE myClub='$id'
		) a 
	")) {
		$db->Query("
			SELECT GROUP_CONCAT(DISTINCT type SEPARATOR ', ') as type FROM (
			SELECT 'players' AS type, PlayerClub AS club FROM players WHERE PlayerClub='$id'
			UNION ALL
			SELECT 'players' AS type, PlayerClub1 AS club FROM players WHERE PlayerClub1='$id'
			UNION ALL
			SELECT 'teams' AS type, ClubID AS club FROM teams WHERE ClubID='$id'
			UNION ALL
			SELECT 'websiteadmin' AS type, myClub AS club FROM websiteadmin WHERE myClub='$id'
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

		$db->Delete("DELETE FROM clubs WHERE ClubID='$id'");
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully deleted: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		
	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'3','15','$id', NULL, '$sessfname $sesslname deleted club ''$ti''.')
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
		SELECT ClubID, ClubName, ClubAbbrev, ClubURL, ClubColour, ClubActive, GroundID, picture, picture1
		FROM clubs
		WHERE ClubID='$id'");

	// setup variables

	$tit = $db->data['ClubName'];
	$abb = $db->data['ClubAbbrev'];
	$url = $db->data['ClubURL'];
	$col = $db->data['ClubColour'];
	$act = $db->data['ClubActive'];
	$gro = $db->data['GroundID'];
	$pic = $db->data['picture'];
	$pi1 = $db->data['picture1'];
	
	// is there a logo?

	if($pic=="") { 
		$displaypic = "";
	} else {
		$displaypic = "<img src='$siteurl/uploadphotos/clubs/" . $pic . "'>";
	}	

	// is there a mini logo?

	if($pi1=="") { 
		$displaypi1 = "";
	} else {
		$displaypi1 = "<img src='$siteurl/uploadphotos/clubs/" . $pi1 . "'>";
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
	<label>website</label> 
		<input type="text" name="cluburl" maxlength="250" value="<?=$url?>" placeholder="http://www.clubwebsite.com">
	</div>

	<div class="block">
	<label>colour [<span class="hint--top" data-hint="Select a colour that best represents the clubs' primary colour."><u>?</u></span>]</label> 
		<input type="text" name="colour" maxlength="250" value="<?=$col?>">
	</div>
	
	<div class="block">
	<label>ground [<span class="hint--top" data-hint="Select the clubs' home ground. Obviously the ground record should be created first."><u>?</u></span>]</label>
		<select name="ground">
		<option value="">select ground</option>
		<option value="">---------------------</option>
		<?php
			// Get the clist of clubs
			if ($db->Exists("SELECT GroundID FROM grounds")) {
				$db->Query("SELECT GroundID, GroundName FROM grounds ORDER BY GroundName");
				for ($m=0; $m<$db->rows; $m++) {
					$db->GetRow($m);
					$gid = $db->data['GroundID'];
					$gna = $db->data['GroundName'];
					
					echo "<option value=\"$gid\" ";
						if($gro == $gid) echo "selected";
					echo ">$gna</option>\n";
					
				}
			}
		?>
	</select>
	</div>	
	
	<?php if($pic=="") { echo ""; } else { ?>
	<div class="block">
	<label>current logo</label>
		<?php echo $displaypic; ?>
	</div>
	<?php } ?>	
	
	<div class="block">
	<label>club logo [<span class="hint--top" data-hint="JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic">
	</div>

	<?php if($pi1=="") { echo ""; } else { ?>
	<div class="block">
	<label>current mini logo</label>
		<?php echo $displaypi1; ?>
	</div>
	<?php } ?>	
	
	<div class="block">
	<label>mini logo [<span class="hint--top" data-hint="Upload a mini logo for use in the ladder. No higher than 90px.&#10;JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic1">
	</div>

	<div class="block">
	<label>active [<span class="hint--top" data-hint="Uncheck if this club is no longer active or you wish to hide from the website."><u>?</u></span>]</label> 
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
	$url = addslashes(trim($_POST['cluburl']));
	$col = addslashes(trim($_POST['colour']));
	$gro = addslashes(trim($_POST['ground']));
	$act = addslashes(trim($_POST['active']));
	
	// make sure info is present and correct

	if ($tit == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete a club title. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT ClubName FROM clubs WHERE ClubName='$tit' AND ClubID!='$id'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A club with that title already exists. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
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
	
	$target = "$sitepath/uploadphotos/clubs/"; 
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
	
	$userpic = $db->QueryItem("SELECT picture FROM clubs WHERE ClubID = '$id'");
	
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
	
	$target1 = "$sitepath/uploadphotos/clubs/"; 
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
	
	$userpic1 = $db->QueryItem("SELECT picture1 FROM clubs WHERE ClubID = '$id'");
	
	}
	
	// query database

	$db->Update("
		UPDATE clubs SET 
			ClubName='$tit', 
			ClubAbbrev='$abb',
			ClubURL='$url',
			ClubColour='$col',
			ClubActive='$act',
			GroundID='$gro',
			picture='$userpic',
			picture1='$userpic1'
		WHERE ClubID='$id'
	");
	if ($db->a_rows != -1) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully modified club: <b>$tit</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a> | <a href=\"main.php?SID=$SID&action=$action&do=sedit&id=$id\">Update more</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','15','$useri', NULL, '$sessfname $sesslname updated club ''$tit''.')");
		
	} else {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The club <b>$tit</b> could not be modified at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
	}
}


// main program

//if (!$USER[flags][$f_club_admin]) {
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
