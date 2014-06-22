<?php

//------------------------------------------------------------------------------
// Player Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>Player Administration</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Manage the players that belong to your organization.</p>
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
	$tableName = "players";																						// source table
	$targetpage = "main.php?SID=$SID&action=$action";									// target page and query params
	$pagemode = 0;																										// target page mode
	$query = "SELECT COUNT(PlayerID) AS num FROM $tableName";					// count records query
	
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
				<th>name</th>
				<th>club</th>
				<th>status</th>
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

	if (!$db->Exists("SELECT PlayerID FROM players")) {

		echo "<tr><td colspan=\"4\">There are currently no players in the database. You can add one using the <strong>create</strong> button above.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT 
			pl.PlayerID, 
			DATE_FORMAT(pl.added,'%b %e, %Y') AS added, 
			pl.isactive, 
			pl.PlayerFName, 
			pl.PlayerLName, 
			cl.ClubName
		FROM players pl
		LEFT JOIN clubs cl ON cl.ClubID = pl.PlayerClub
		ORDER BY pl.PlayerLName, pl.PlayerFName 
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['PlayerID'];
		$ad = $db->data['added'];
		$ac = $db->data['isactive'];
		$fn = $db->data['PlayerFName'];
		$ln = $db->data['PlayerLName'];
		$cl = $db->data['ClubName'];
		
		// set the active or inactive class
		
		if($ac==1) {
			$accl = "isactive";
			$acte = "active";
		} else {
			$accl = "isinactive";
			$acte = "not active";
		}		
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>
			
				<td><?=$id?></td>
				<td><?=$ln?>, <?=$fn?></td>
				<td><?=$cl?></td>
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
	$tableName = "players";																						// source table
	$targetpage = "main.php?SID=$SID&action=$action&do=search&search=$search";	// target page and query params
	$pagemode = 0;																										// target page mode
	$query = "
		SELECT COUNT(pl.PlayerID) AS num 
		FROM $tableName pl
		LEFT JOIN clubs cl ON cl.ClubID = pl.PlayerClub
		WHERE pl.PlayerFName LIKE '%$search%' 
		OR pl.PlayerFName LIKE '%$search%' 
		OR cl.ClubName LIKE '%$search%'";																// count records query
	
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";
	
	$thecount = $db->QueryItem("
		SELECT COUNT(pl.PlayerID) AS num 
		FROM $tableName pl
		LEFT JOIN clubs cl ON cl.ClubID = pl.PlayerClub
		WHERE pl.PlayerFName LIKE '%$search%' 
		OR pl.PlayerFName LIKE '%$search%' 
		OR cl.ClubName LIKE '%$search%'	
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
				<th>id</th>
				<th>name</th>
				<th>club</th>
				<th>status</th>
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

	if (!$db->Exists("SELECT PlayerID FROM players")) {

		echo "<tr><td colspan=\"4\">There are currently no players in the database. You can add one using the <strong>create</strong> button above.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT 
			pl.PlayerID, 
			DATE_FORMAT(pl.added,'%b %e, %Y') AS added, 
			pl.isactive, 
			pl.PlayerFName, 
			pl.PlayerLName, 
			cl.ClubName
		FROM players pl
		LEFT JOIN clubs cl ON cl.ClubID = pl.PlayerClub
		WHERE pl.PlayerFName LIKE '%$search%' OR pl.PlayerFName LIKE '%$search%' OR cl.ClubName LIKE '%$search%'
		ORDER BY pl.PlayerLName, pl.PlayerFName 
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['PlayerID'];
		$ad = $db->data['added'];
		$ac = $db->data['isactive'];
		$fn = $db->data['PlayerFName'];
		$ln = $db->data['PlayerLName'];
		$cl = $db->data['ClubName'];
		
		// set the active or inactive class
		
		if($ac==1) {
			$accl = "isactive";
			$acte = "active";
		} else {
			$accl = "isinactive";
			$acte = "not active";
		}		
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>
			
				<td><?=$id?></td>
				<td><?=$ln?>, <?=$fn?></td>
				<td><?=$cl?></td>
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

function add_article_form($db,$id)
{
	global $content,$action,$SID,$pagecontainerstart,$pagecontainerend;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	

		echo "$pagecontainerstart";
	
?>
	    
	  <h3>Main Details (appears on website)</h3>

		<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sadd" method="post" enctype="multipart/form-data">
		<input type="hidden" name="SID" value="<?=$SID?>">
		<input type="hidden" name="action" value="<?=$action?>">
		<input type="hidden" name="do" value="sadd">
		<input type="hidden" name="doit" value="1">
		
		<div class="fields">

		<div class="block">
		<label>first name</label> 
			<input type="text" name="PlayerFName" maxlength="50">
		</div>

		<div class="block">
		<label>last name</label> 
			<input type="text" name="PlayerLName" maxlength="50">
		</div>

		<div class="block">
		<label>nickname</label> 
			<input type="text" name="NickName" maxlength="50">
		</div>

		<div class="block">
		<label>active?</label> 
			<input type="checkbox" name="isactive" value="1"> check if this is an active player<br />
		</div>
		
		<div class="block">
		<label>club [<span class="hint--top" data-hint="Select the club that this player belongs to. A player can belong to one club only."><u>?</u></span>]</label>
			<select name="PlayerClub">
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
		<label>birth city</label> 
			<input type="text" name="Born" maxlength="50">
		</div>
		
		<div class="block">
		<label>DOB <i>(YYYY-MM-DD)</i></label> 
			<input type="text" name="DOB" maxlength="50">
		</div>
		
		<div class="block">
		<label>batting style</label> 
		 <select name="BattingStyle">
			<option value="">select style</option>
			<option value="">--------------------------</option>
			<option value="Right Hand Bat">Right Hand Bat</option>
			<option value="Left Hand Bat">Left Hand Bat</option>
		 </select>			
		</div>

		<div class="block">
		<label>bowling style</label> 
		<select name="BowlingStyle">
			<option value="">select style</option>
			<option value="">--------------------------</option>
			<option value="Right Arm Fast">Right Arm Fast</option>
			<option value="Right Arm Fast Medium">Right Arm Fast Medium</option>
			<option value="Right Arm Medium">Right Arm Medium</option>
			<option value="Right Arm Slow">Right Arm Slow</option>
			<option value="Right Arm Off Spin">Right Arm Off Spin</option>
			<option value="Right Arm Leg Spin">Right Arm Leg Spin</option>
			<option value="Left Arm Fast">Left Arm Fast</option>
			<option value="Left Arm Fast Medium">Left Arm Fast Medium</option>
			<option value="Left Arm Medium">Left Arm Medium</option>
			<option value="Left Arm Slow">Left Arm Slow</option>
			<option value="Left Arm Off Spin">Left Arm Off Spin</option>
			<option value="Left Arm Leg Spin">Left Arm Leg Spin</option>
		</select>			
		</div>
		
		<div class="block">
		<label>profile photo [<span class="hint--top" data-hint="Portrait style photo. JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
			<input type="file" name="userpic">
		</div>	

		<div class="block">
		<textarea name="shortprofile" id="myTextarea"></textarea>
		</div>

	  <h3>Contact Details (internal only)</h3>

		<div class="block">
		<label>phone #</label> 
			<input type="text" name="phone" maxlength="50">
		</div>
		
		<div class="block">
		<label>mobile #</label> 
			<input type="text" name="mobile" maxlength="50">
		</div>
		
		<div class="block">
		<label>address 1</label> 
			<input type="text" name="address1" maxlength="50">
		</div>
		
		<div class="block">
		<label>address 2</label> 
			<input type="text" name="address2" maxlength="50">
		</div>
		
		<div class="block">
		<label>city</label> 
			<input type="text" name="city" maxlength="50">
		</div>
		
		<div class="block">
		<label>state</label> 
			<input type="text" name="state" maxlength="50">
		</div>	
		
		<div class="block">
		<label>post code</label> 
			<input type="text" name="postcode" maxlength="50">
		</div>			

		<div class="block">
		<label>email [?]</label> 
			<input type="text" name="PlayerEmail" maxlength="50">
		</div>

		<div class="block">
		<label>facebook [?]</label> 
			<input type="text" name="AIM" maxlength="50">
		</div>
		
		<div class="block">
		<label>google [?]</label> 
			<input type="text" name="google" maxlength="50">
		</div>
		
		<div class="block">
		<label>yahoo [?]</label> 
			<input type="text" name="YAHOO" maxlength="50">
		</div>		

		<div class="block">
		<label>msn [?]</label> 
			<input type="text" name="MSN" maxlength="50">
		</div>
		
		<div class="block">
		<label>icq [?]</label> 
			<input type="text" name="ICQ" maxlength="50">
		</div>
		
		<div class="block">
		<label>&nbsp;</label>
			<a href="main.php?SID=<?=$SID?>&cancel=playeradmin" class="btn btn-secondary">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary">Submit</a>
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
	
	// setup the variables

	$pln = addslashes(trim($_POST['PlayerLName']));
	$pfn = addslashes(trim($_POST['PlayerFName']));
	$nin = addslashes(trim($_POST['NickName']));
	$pcl = addslashes(trim($_POST['PlayerClub']));
	$pte = addslashes(trim($_POST['PlayerTeam']));
	$pem = addslashes(trim($_POST['PlayerEmail']));
	$spr = addslashes(trim($_POST['shortprofile']));
	$pho = addslashes(trim($_POST['phone']));
	$mob = addslashes(trim($_POST['mobile']));	
	$ad1 = addslashes(trim($_POST['address1']));
	$ad2 = addslashes(trim($_POST['address2']));
	$cit = addslashes(trim($_POST['city']));
	$sta = addslashes(trim($_POST['state']));
	$pos = addslashes(trim($_POST['postcode']));
	$aim = addslashes(trim($_POST['AIM']));
	$yah = addslashes(trim($_POST['YAHOO']));	
	$msn = addslashes(trim($_POST['MSN']));
	$icq = addslashes(trim($_POST['ICQ']));
	$goo = addslashes(trim($_POST['google']));
	$bor = addslashes(trim($_POST['Born']));
	$dob = addslashes(trim($_POST['DOB']));	
	$bat = addslashes(trim($_POST['BattingStyle']));
	$bow = addslashes(trim($_POST['BowlingStyle']));
	$act = addslashes(trim($_POST['isactive']));
	
	// build the permalink
	
	$pel = preg_replace('/[^a-zA-Z0-9s ]/', '', $pln);
	$pef = preg_replace('/[^a-zA-Z0-9s ]/', '', $pfn);
	$per = $pef."-".$pel;
	$per = preg_replace('/  /', ' ', $per);
	$per = preg_replace('/ /', '-', $per);
	$per = strtolower($per);	
	
	// check to see if the permalink exists, if so, add 1
	
	if ($db->Exists("SELECT permalink FROM players WHERE permalink = '$per'")) {
	if ($db->Exists("SELECT permalink FROM players WHERE permalink = CONCAT('$per','-1')")) {
	
			$last = $db->QueryItem("SELECT MAX(permalink) AS lastpermalink FROM players WHERE permalink LIKE '$per%'");
			
			$numb = preg_replace("/[^0-9]/", '', $last);
			$stri = preg_replace('/[^a-z-]/i', '', $last);
			
			$numb++;
			$next = $stri.$numb;
			
		} else {
	
			$next = $per."-1";
		}
	
	} else {		

	$next = $per;
	
	}	

	// make sure info is present and correct

	if ($pln == "" || $pfn == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete a first name and last name. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
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
	
	$target = "$sitepath/uploadphotos/players/"; 
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
	
	$userpic = "";
	$ok = 1;
	
	}
	
	if($ok==1) { 
	// query database

	$db->Insert("
	INSERT INTO players (
		PlayerLName,
		PlayerFName,
		NickName,
		isactive,
		PlayerClub,
		PlayerEmail,
		shortprofile,
		Born,
		DOB,
		BattingStyle,
		BowlingStyle,
		AIM,
		YAHOO,
		MSN,
		ICQ,
		google,
		phone,
		mobile,
		address1,
		address2,
		city,
		state,
		postcode,
		permalink,
		picture,		
		added
	) VALUES (
		'$pln',
		'$pfn',
		'$nin',
		'$act',
		'$pcl',
		'$pem',
		'$spr',
		'$bor',
		'$dob',
		'$bat',
		'$bow',
		'$aim',
		'$yah',
		'$msn',
		'$icq',
		'$goo',
		'$pho',
		'$mob',
		'$ad1',
		'$ad2',
		'$cit',
		'$sta',
		'$pos',
		'$next',
		'$userpic',
		now()
	)");
		if ($db->a_rows != -1) {

		// event logging
		
		$db->Insert("
			INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
			VALUES ($sessuseri, NOW(), '1', '18', LAST_INSERT_ID(), NULL, '$sessfname $sesslname added player ''$pfn $pln''.')
		");

			echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully added a new player. <a href=\"main.php?SID=$SID&action=$action&do=sadd\">Add another</a> | <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";	
			
		} else {
		
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The player could not be added to the database at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";			
		}	
		
	} else {
	
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">There was an error uploading the image. Try again later. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
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

	$db->QueryRow("SELECT PlayerID, PlayerFName, PlayerLName FROM players WHERE PlayerID='$id'");

	// setup variables

	$id = $db->data['PlayerID'];
	$fn = $db->data['PlayerFName'];
	$ln = $db->data['PlayerLName'];

	// output

	echo "<div class=\"msg-alerting\"><div class=\"msg-atten\">Are you sure you wish to delete the player:\n";
	echo "&nbsp;<b>$fn $ln</b>\n";
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

	$db->QueryRow("SELECT PlayerID, PlayerFName, PlayerLName FROM players WHERE PlayerID='$id'");

	// setup variables

	$id = $db->data['PlayerID'];
	$fn = $db->data['PlayerFName'];
	$ln = $db->data['PlayerLName'];
	
	// decided not to delete

	if (!$_GET['doit']) { 
	
		echo "<div class=\"msg-alerting\"><div class=\"msg-info\">You have chosen NOT to delete: <b>$fn $ln</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
	
	} else {

	// do delete

		$db->Delete("DELETE FROM players WHERE PlayerID='$id'");
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully deleted: <b>$fn $ln</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		
	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'3','18','$id', NULL, '$sessfname $sesslname deleted player ''$fn $ln''.')
	");
		
	}
}

function edit_article_form($db,$id)
{
	global $content,$action,$SID,$pagecontainerstart,$pagecontainerend,$siteurl;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$plid = $_GET['id'];

	// query database

	$db->QueryRow("SELECT * FROM players WHERE PlayerID=$plid");

	// setup variables

	$pln = $db->data['PlayerLName'];
	$pfn = $db->data['PlayerFName'];
	$nin = $db->data['NickName'];
	$act = $db->data['isactive'];
	$pcl = $db->data['PlayerClub'];
	$pem = $db->data['PlayerEmail'];
	$spr = $db->data['shortprofile'];
	$aim = $db->data['AIM'];
	$yah = $db->data['YAHOO'];
	$msn = $db->data['MSN'];
	$icq = $db->data['ICQ'];
	$goo = $db->data['google'];
	$pho = $db->data['phone'];
	$mob = $db->data['mobile'];
	$ad1 = $db->data['address1'];
	$ad2 = $db->data['address2'];
	$cit = $db->data['city'];
	$sta = $db->data['state'];
	$pos = $db->data['postcode'];
	$ump = $db->data['IsUmpire'];
	$pre = $db->data['IsPresident'];
	$vpr = $db->data['IsVicePresident'];
	$sec = $db->data['IsSecretary'];
	$tre = $db->data['IsTreasurer'];
	$cap = $db->data['IsCaptain'];
	$vca = $db->data['IsViceCaptain'];
	$bor = $db->data['Born'];
	$dob = $db->data['DOB'];	
	$bat = $db->data['BattingStyle'];
	$bow = $db->data['BowlingStyle'];
	$pic = $db->data['picture'];

	$ip = stripslashes($db->data['isactive']);
	$ipyes = 'yes';
	$ipno = 'no';
	if ($db->data['isactive'] ==0) $ip1 = $ipyes;
	if ($db->data['isactive'] ==1) $ip1 = $ipno;

	$il = stripslashes($db->data['islifemember']);
	$ilyes = 'yes';
	$ilno = 'no';
	if ($db->data['islifemember'] ==1) $il1 = $ilyes;
	if ($db->data['islifemember'] ==0) $il1 = $ilno;

	$ic = stripslashes($db->data['iscelebrity']);
	
	// is there a photo?

	if($pic=="") { 
		$displaypic = "<img src='$siteurl/uploadphotos/players/HeadNoMan.jpg'>";
	} else {
		$displaypic = "<img src='$siteurl/uploadphotos/players/" . $pic . "'>";
	}	
	

		echo "$pagecontainerstart";
	
?>
	    
	  <h3>Main Details (appears on website)</h3>

		<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sedit&id=<?=$plid?>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="SID" value="<?=$SID?>">
		<input type="hidden" name="action" value="<?=$action?>">
		<input type="hidden" name="do" value="sedit">
		<input type="hidden" name="doit" value="1">
		<input type="hidden" name="id" value="<?=$plid?>">
		
		<div class="fields">

		<div class="block">
		<label>first name</label> 
			<input type="text" name="PlayerFName" maxlength="50" value="<?=$pfn?>">
		</div>

		<div class="block">
		<label>last name</label> 
			<input type="text" name="PlayerLName" maxlength="50" value="<?=$pln?>">
		</div>

		<div class="block">
		<label>nickname</label> 
			<input type="text" name="NickName" maxlength="50" value="<?=$nin?>">
		</div>

		<div class="block">
		<label>active?</label> 
			<input type="checkbox" name="isactive" value="<?=$act?>"> check if this is an active player<br />
		</div>

		<div class="block">
		<label>club [<span class="hint--top" data-hint="Select the club that this player belongs to. A player can only belong to one club."><u>?</u></span>]</label>
			<select name="PlayerClub">
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
							if($pcl == $cid) echo "selected";
						echo ">$cna</option>\n";

					}
				}
			?>
		</select>
		</div>	

		<div class="block">
		<label>birth city</label> 
			<input type="text" name="Born" maxlength="50" value="<?=$bor?>">
		</div>
		
		<div class="block">
		<label>DOB <i>(YYYY-MM-DD)</i></label> 
			<input type="text" name="DOB" maxlength="50" value="<?=$dob?>">
		</div>
		
		<div class="block">
		<label>batting style</label> 
		 <select name="BattingStyle">
			<option value="<?=$bat?>"><?=$bat?></option>
			<option value="">--------------------------</option>
			<option value="Right Hand Bat">Right Hand Bat</option>
			<option value="Left Hand Bat">Left Hand Bat</option>
		 </select>			
		</div>

		<div class="block">
		<label>bowling style</label> 
		<select name="BowlingStyle">
			<option value="<?=$bow?>"><?=$bow?></option>
			<option value="">--------------------------</option>
			<option value="Right Arm Fast">Right Arm Fast</option>
			<option value="Right Arm Fast Medium">Right Arm Fast Medium</option>
			<option value="Right Arm Medium">Right Arm Medium</option>
			<option value="Right Arm Slow">Right Arm Slow</option>
			<option value="Right Arm Off Spin">Right Arm Off Spin</option>
			<option value="Right Arm Leg Spin">Right Arm Leg Spin</option>
			<option value="Left Arm Fast">Left Arm Fast</option>
			<option value="Left Arm Fast Medium">Left Arm Fast Medium</option>
			<option value="Left Arm Medium">Left Arm Medium</option>
			<option value="Left Arm Slow">Left Arm Slow</option>
			<option value="Left Arm Off Spin">Left Arm Off Spin</option>
			<option value="Left Arm Leg Spin">Left Arm Leg Spin</option>
		</select>			
		</div>

		<?php if($pic=="") { echo ""; } else { ?>
		<div class="block">
		<label>current photo</label>
			<?php echo $displaypic; ?>
		</div>
		<?php } ?>	

		<div class="block">
		<label>profile photo [<span class="hint--top" data-hint="Portrait style only. JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
			<input type="file" name="userpic">
		</div>

		<div class="block">
		<textarea name="shortprofile" id="myTextarea"><?=$spr?></textarea>
		</div>

	  <h3>Contact Details (internal only)</h3>

		<div class="block">
		<label>phone #</label> 
			<input type="text" name="phone" maxlength="50" value="<?=$pho?>">
		</div>
		
		<div class="block">
		<label>mobile #</label> 
			<input type="text" name="mobile" maxlength="50" value="<?=$mob?>">
		</div>
		
		<div class="block">
		<label>address 1</label> 
			<input type="text" name="address1" maxlength="50" value="<?=$ad1?>">
		</div>
		
		<div class="block">
		<label>address 2</label> 
			<input type="text" name="address2" maxlength="50" value="<?=$ad2?>">
		</div>
		
		<div class="block">
		<label>city</label> 
			<input type="text" name="city" maxlength="50" value="<?=$cit?>">
		</div>
		
		<div class="block">
		<label>state</label> 
			<input type="text" name="state" maxlength="50" value="<?=$sta?>">
		</div>	
		
		<div class="block">
		<label>post code</label> 
			<input type="text" name="postcode" maxlength="50" value="<?=$pos?>">
		</div>			

		<div class="block">
		<label>email [?]</label> 
			<input type="text" name="PlayerEmail" maxlength="50" value="<?=$pem?>">
		</div>

		<div class="block">
		<label>facebook [?]</label> 
			<input type="text" name="AIM" maxlength="50" value="<?=$aim?>">
		</div>
		
		<div class="block">
		<label>google [?]</label> 
			<input type="text" name="google" maxlength="50" value="<?=$goo?>">
		</div>
		
		<div class="block">
		<label>yahoo [?]</label> 
			<input type="text" name="YAHOO" maxlength="50" value="<?=$yah?>">
		</div>		

		<div class="block">
		<label>msn [?]</label> 
			<input type="text" name="MSN" maxlength="50" value="<?=$msn?>">
		</div>
		
		<div class="block">
		<label>icq [?]</label> 
			<input type="text" name="ICQ" maxlength="50" value="<?=$icq?>">
		</div>
		
		<div class="block">
		<label>&nbsp;</label>
			<a href="main.php?SID=<?=$SID?>&cancel=playeradmin" class="btn btn-secondary">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary">Submit</a>
		</div>

	</div>
	</form>
	

<?php 

	echo "$pagecontainerend";

}

function do_update_article($db,$id)
{
	global $content,$sessuseri, $sessemail, $sessfname, $sesslname, $sessplyid, $pagecontainerstart, $pagecontainerend;
	
	$plid = $_GET['id'];
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_POST['id'];	
	
	// make sure info is present and correct

	if ($_POST['PlayerLName'] == "" || $_POST['PlayerFName'] == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete First Name and Last Name. Please <a href=\"main.php?SID=" . $_GET['SID'] . "&action=" . $_GET['action'] . "&do=sedit&id=$plid\">try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}

	echo "$pagecontainerstart";	

	// setup the variables

	$pln = addslashes(trim($_POST['PlayerLName']));
	$pfn = addslashes(trim($_POST['PlayerFName']));
	$nin = addslashes(trim($_POST['NickName']));
	$act = addslashes(trim($_POST['isactive']));
	$pcl = addslashes(trim($_POST['PlayerClub']));
	$pte = addslashes(trim($_POST['PlayerTeam']));
	$pem = addslashes(trim($_POST['PlayerEmail']));
	$spr = addslashes(trim($_POST['shortprofile']));
	$pho = addslashes(trim($_POST['phone']));
	$mob = addslashes(trim($_POST['mobile']));	
	$ad1 = addslashes(trim($_POST['address1']));
	$ad2 = addslashes(trim($_POST['address2']));
	$cit = addslashes(trim($_POST['city']));
	$sta = addslashes(trim($_POST['state']));
	$pos = addslashes(trim($_POST['postcode']));
	$aim = addslashes(trim($_POST['AIM']));
	$yah = addslashes(trim($_POST['YAHOO']));	
	$msn = addslashes(trim($_POST['MSN']));
	$icq = addslashes(trim($_POST['ICQ']));
	$goo = addslashes(trim($_POST['google']));
	$bor = addslashes(trim($_POST['Born']));
	$dob = addslashes(trim($_POST['DOB']));	
	$bat = addslashes(trim($_POST['BattingStyle']));
	$bow = addslashes(trim($_POST['BowlingStyle']));
	
	// build the permalink
	
	$pel = preg_replace('/[^a-zA-Z0-9s ]/', '', $pln);
	$pef = preg_replace('/[^a-zA-Z0-9s ]/', '', $pfn);
	$per = $pef."-".$pel;
	$per = preg_replace('/  /', ' ', $per);
	$per = preg_replace('/ /', '-', $per);
	$per = strtolower($per);	
	
	// check to see if the permalink exists, if so, add 1
	
	if ($db->Exists("SELECT permalink FROM players WHERE permalink = '$per'")) {
	if ($db->Exists("SELECT permalink FROM players WHERE permalink = CONCAT('$per','-1')")) {
	
			$last = $db->QueryItem("SELECT MAX(permalink) AS lastpermalink FROM players WHERE permalink LIKE '$per%'");
			
			$numb = preg_replace("/[^0-9]/", '', $last);
			$stri = preg_replace('/[^a-z-]/i', '', $last);
			
			$numb++;
			$next = $stri.$numb;
			
		} else {
	
			$next = $per."-1";
		}
	
	} else {		

	$next = $per;
	
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
	
	$target = "$sitepath/uploadphotos/players/"; 
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
	
	$userpic = $db->QueryItem("SELECT picture FROM players WHERE PlayerID = '$id'");
	
	}	

	// query database

	$db->Update("
		UPDATE players SET 
			PlayerLName='$pln',
			PlayerFName='$pfn',
			NickName='$nin',
			isactive='$act',
			PlayerClub='$pcl',
			PlayerEmail='$pem',
			shortprofile='$spr',
			Born='$bor',
			DOB='$dob',
			BattingStyle='$bat',
			BowlingStyle='$bow',
			AIM='$aim',
			YAHOO='$yah',
			MSN='$msn',
			ICQ='$icq',
			google='$goo',
			phone='$pho',
			mobile='$mob',
			address1='$ad1',
			address2='$ad2',
			city='$cit',
			state='$sta',
			postcode='$pos',
			permalink='$next',
			picture='$userpic',			
			edited=now() 
		 WHERE PlayerID=$plid
		");
			
	if ($db->a_rows != -1) {

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','18','$plid', NULL, '$sessfname $sesslname updated player profile ''$pfn $pln''.')");

		echo "</div></div></div></div></article><div class=\"msg-alerting\"><div class=\"msg-ok\"><b>$pfn $pln</b> was successfully updated.\n";
		echo "&nbsp;<a href=\"main.php?SID=$SID&action=$action\">Player list</a> | <a href=\"main.php?SID=$SID&action=$action&do=sedit&id=$id\">Update more</a></div></div>\n";
		echo "</div></div></section>\n";
	} else {
	echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry. Something went wrong with updating that profile.\n";
	echo "&nbsp;<a href=\"main.php?SID=$SID&action=" . $_GET['action'] . "&do=sedit&id=$sessplyid\">Try again</a>?</div></div>\n";
	}		
	
}

// main program

header("Location: main.php?SID=" . $_GET['SID'] . "");

?>	
	
        <section class="span8 margTop">
            <div class="row">
                <div class="span8">

<?php
                                        
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
	if (!isset($_POST['doit'])) {
		edit_article_form($db,$id);
	} else { 
		do_update_article($db,$id);
	}
	break;
case "search":
	search_main_menu($db);
	break;	
default:
	show_main_menu($db);
	break;
}

?>

                                    