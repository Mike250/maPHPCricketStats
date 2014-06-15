<?php

//------------------------------------------------------------------------------
// Cricket User Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

$adminpage = useradmin;

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>User Administration</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Add and update users who have access to this Administration panel. Additionally, you have granular control over what each user has access to.</p>
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
			if($_GET['cancel'] == $adminpage) $cancelr = 'updating the users table';
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
	$tableName = "admin";																							// source table
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
			<a href="javascript:" onclick="document.location = 'main.php?SID=<?=$SID?>&action=<?=$action?>&do=uadd';" class="btn btn-primary">Create</a>
		</div>
	</div>
	
	</form>

	<div class="magrid">
	<table>
		<thead>
			<tr>
				<th>username</th>
				<th>full name</th>
				<th>email</th>
				<th class="lastcolumn">modify</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="4">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php

	// check for empty database

	if (!$db->Exists("SELECT email FROM admin")) {

		echo "<tr><td colspan=\"4\">There are currently no users in the database. You can add one using the <strong>create</strong> button above.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT fname, lname, email, emailaddress 
		FROM admin 
		ORDER BY lname,fname 
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$fn = $db->data['fname'];
		$ln = $db->data['lname'];
		$em = $db->data['email'];
		$ea = $db->data['emailaddress'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>

				<td><?=$em?></td>
				<td><?=$ln?>, <?=$fn?></td>
				<td><a href="mailto:<?=$ea?>"><?=$ea?></a></td>
				<td class="lastcolumn">

<?php 

				// setup a GOD user who can't be edited, should be your username

				if($db->data[email] == 'mdoig') echo "";
				else echo "<a href=\"main.php?SID=$SID&action=$action&do=uedit&id=" . $db->data[email] . "\"><img src=\"../images/icons/icon_edit.png\" border=\"0\"></a>\n";

				// setup a GOD user who can't be deleted, should be your username

				if($db->data[email] == 'mdoig') echo "";
				else echo "<a href=\"main.php?SID=$SID&action=$action&do=udel&id=" . $db->data[email] . "\"><img src=\"../images/icons/icon_delete.png\" border=\"0\"></a>\n";

?>				
				
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
	$tableName = "admin";																							// source table
	$targetpage = "main.php?SID=$SID&action=$action&do=search&search=$search";	// target page and query params
	$pagemode = "search";																							// target page mode
	$query = "SELECT COUNT(id) as num FROM $tableName
						WHERE lname LIKE '%$search%' 
						OR fname LIKE '%$search%'
						OR email LIKE '%$search%'
						OR emailaddress LIKE '%$search%'";											// count records query	
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";

	$thecount = $db->QueryItem("
		SELECT COUNT(id) as num FROM $tableName
		WHERE lname LIKE '%$search%' 
		OR fname LIKE '%$search%'
		OR email LIKE '%$search%'
		OR emailaddress LIKE '%$search%'	
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
			<a href="javascript:" onclick="document.location = 'main.php?SID=<?=$SID?>&action=<?=$action?>&do=uadd';" class="btn btn-primary">Create</a>
		</div>
	</div>
	
	</form>
	
	<div class="magrid">
	<table>
		<thead>
			<tr>
				<th>username</th>
				<th>full name</th>
				<th>email</th>
				<th class="lastcolumn">modify</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="4">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php 

	// check for empty database

	if (!$db->Exists("SELECT * FROM admin WHERE lname LIKE '%$search%' OR fname LIKE '%$search%' OR email LIKE '%$search%' OR emailaddress LIKE '%$search%'")) {

		echo "<tr><td colspan=\"4\">There are currently no users in the database matching that search. Please try again.</td></tr>\n";

	} else {		

	// query the database

	$db->Query("
		SELECT fname, lname, email, emailaddress 
		FROM admin 
		WHERE lname LIKE '%$search%' OR fname LIKE '%$search%' OR email LIKE '%$search%' OR emailaddress LIKE '%$search%'
		ORDER BY lname,fname 
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$fn = $db->data['fname'];
		$ln = $db->data['lname'];
		$em = $db->data['email'];
		$ea = $db->data['emailaddress'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>

				<td><?=$em?></td>
				<td><?=$ln?>, <?=$fn?></td>
				<td><a href="mailto:<?=$ea?>"><?=$ea?></a></td>
				<td class="lastcolumn">

<?php 

				// setup a GOD user who can't be edited, should be your username

				if($db->data[email] == 'mdoig') echo "";
				else echo "<a href=\"main.php?SID=$SID&action=$action&do=uedit&id=" . $db->data[email] . "\"><img src=\"../images/icons/icon_edit.png\" border=\"0\"></a>\n";

				// setup a GOD user who can't be deleted, should be your username

				if($db->data[email] == 'mdoig') echo "";
				else echo "<a href=\"main.php?SID=$SID&action=$action&do=udel&id=" . $db->data[email] . "\"><img src=\"../images/icons/icon_delete.png\" border=\"0\"></a>\n";

?>				
				
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

	<script language="javascript">
	<!-- 	
	function masterCheck( btn, ca, ua )
	{
	 var elems = btn.form.elements, state = (btn.value == ca);
	 for( var i = 0, len = elems.length; i < len; i++ )
		if( elems[ i ].type && elems[ i ].type=='checkbox' )
		 elems[ i ].checked = state;
	 btn.value = state ? ua : ca;  
	}
	// -->
	</script>

	<h3>User Information</h3>

	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=uadd" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="uadd">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>username</label> 
		<input type="text" name="email" maxlength="50">
	</div>

	<div class="block">
	<label>email address</label> 
		<input type="text" name="emailaddress" maxlength="50">
	</div>	

	<div class="block">
	<label>first name</label> 
		<input type="text" name="fname" maxlength="50">
	</div>	

	<div class="block">
	<label>last name</label> 
		<input type="text" name="lname" maxlength="50">
	</div>	

	<div class="block">
	<label>set password</label> 
		<input type="password" name="password1" maxlength="50">
	</div>	

	<div class="block">
	<label>verify password</label> 
		<input type="password" name="password2" maxlength="50">
	</div>	
	
	<div class="block">
	<label>link player [<span class="hint--top" data-hint="This is required. If the player record hasn't been setup, do this first.&#10;Every 'user' of the website must have an assoiated 'player' record."><u>?</u></span>]</label> 
	 <select name="playerid">
		<option value="">select player</option>
		<option value="">--------------------------</option>'
			<?php
				if ($db->Exists("SELECT PlayerID FROM players WHERE PlayerClub = 1")) {
					$db->Query("SELECT PlayerID, PlayerLName, PlayerFName FROM players WHERE PlayerClub = 1 ORDER BY PlayerLName, PlayerFName");
					for ($i=0; $i<$db->rows; $i++) {
						$db->GetRow($i);
						echo "<option value=\"" . $db->data[PlayerID] . "\">" . $db->data[PlayerLName] . ", " . $db->data[PlayerFName] . "</option>\n";
					}
				}
			?>
	 </select>			
	</div>
	
	</div>
	
	<h3>User Access Levels</h3>
	
	<div class="one-half first">
	
	<p><b>global settings</b></p>
	<input type="checkbox" name="f0" value="1"> has access to user admin<br />
	<input type="checkbox" name="f37" value="1"> has access to website admin<br />
	<input type="checkbox" name="f14" value="1"> has access to schedule admin<br />
	<input type="checkbox" name="f33" value="1"> has access to scorecard admin<br />
	<input type="checkbox" name="f21" value="1"> has access to points table admin<br />
	<input type="checkbox" name="f23" value="1"> has access to sponsors admin<br />

	<p><b>league settings</b></p>
	<input type="checkbox" name="f16" value="1"> has access to clubs admin<br />
	<input type="checkbox" name="f17" value="1"> has access to teams admin<br />
	<input type="checkbox" name="f18" value="1"> has access to grounds admin<br />

	<p><b>player settings</b></p>
	<input type="checkbox" name="f20" value="1"> has access to player admin<br />
	<input type="checkbox" name="f38" value="1"> has access to club directory<br />
	<input type="checkbox" name="f40" value="1"> has access to internal documents<br />
	<input type="checkbox" name="f19" value="1"> has access to featured member admin<br />
	<input type="checkbox" name="f22" value="1"> has access to officers admin<br />
	<input type="checkbox" name="f24" value="1"> has access to awards admin<br />
	<input type="checkbox" name="f39" value="1"> has access to availability admin<br />	
	
	</div>
	
	<div class="one-half">
	
	<p><b>news settings</b></p>
	<input type="checkbox" name="f1" value="1"> has access to news admin<br />
	<input type="checkbox" name="f15" value="1"> has access to history admin<br />
	<input type="checkbox" name="f5" value="1"> has access to documents admin<br />
	<input type="checkbox" name="f2" value="1"> has access to html admin<br />	

	<p><b>mailing lists</b></p>
	<input type="checkbox" name="f6" value="1"> has access to mailing lists<br />
	<input type="checkbox" name="f7" value="1"> has access to mailing list emails<br />
	<input type="checkbox" name="f8" value="1"> has access to mailing list archives<br />
	<input type="checkbox" name="f9" value="1"> has access to send emails to mailing list<br />	

	<p><b>miscellaneous table settings</b></p>
	<input type="checkbox" name="f38" value="1"> has access to seasons admin<br />
	<input type="checkbox" name="f45" value="1"> has access to conference admin<br />
	<input type="checkbox" name="f41" value="1"> has access to leagues admin<br />
	<input type="checkbox" name="f56" value="1"> has access to pool admin<br />
	<input type="checkbox" name="f46" value="1"> has access to award types admin<br />
	<input type="checkbox" name="f48" value="1"> has access to sponsor cat admin<br />
	<input type="checkbox" name="f50" value="1"> has access to quotes admin<br />
	
	</div>
	
	<div class="block">
	<label style="margin-left: -120px;">&nbsp;</label>
	<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&cancel=<?=$adminpage?>" class="btn btn-secondary" style="margin-top: 15px;">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary" style="margin-top: 15px;">Submit</a>
	</div>
	
	</form>
	
<?php 

	echo "$pagecontainerend";

}

function do_add_user($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	
	// Get post variables 
	
	$fname = $_POST['fname'];
	$lname = $_POST['lname'];
	$email = $_POST['email'];
	$emailaddress = $_POST['emailaddress'];
	$playerid = $_POST['playerid'];
	$pass1 = $_POST['password1'];
	$pass2 = $_POST['password2'];

	// make sure info is present and correct

	if ($fname == "" || $lname == "" || $email == "" || $emailaddress == "" || $playerid == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete username, first name, last name, email and link a player. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}

	// passwords didn't match

	if ($pass1 != "") {
		if ($pass1 != $pass2) {
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The passwords you entered do not match. Please <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";			
			return;
		}
		$encpass = ",pword='" . encrypt($pass1, "butchercricket") . "'"; // new encrypt using Base64
	} else {
		$encpass = "";
	}

	// check for duplicates

	if ($id != $email) {
		if ($db->Exists("SELECT email FROM admin WHERE email='$email'")) {
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A user with that username already exists in the database. Please <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";			
			return;
		}
	}
	
	if ($id != $email) {
		if ($db->Exists("SELECT emailaddress FROM admin WHERE emailaddress='$emailaddress'")) {
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">A user with that email address already exists in the database. Please <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";			
			return;
		}
	}	

	// setup the variables

	$fname = addslashes(trim($_POST['fname']));
	$lname = addslashes(trim($_POST['lname']));
	$plyid = addslashes(trim($_POST['playerid']));
	$email = trim($_POST['email']);
	$emadd = trim($_POST['emailaddress']);
	$encpass = encrypt($pass1, "butchercricket"); // new encrypt using Base64

	// query database

	$db->Insert("INSERT INTO admin (email,emailaddress,fname,lname,playerid,pword,flags,added) VALUES ('$email','$emadd','$fname','$lname','$plyid','$encpass','$flags',NOW())");
	if ($db->a_rows != -1) {
	
	$db->QueryRow("SELECT id,fname,lname,email FROM admin WHERE email='$email'");
	$useri = $db->data['id'];

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'1','5','$useri', NULL, '$sessfname $sesslname added user ''$email ($emadd)''.')");
		
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully added a new user. <a href=\"main.php?SID=$SID&action=$action&do=uadd\">Add another</a> | <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";	
	} else {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The user could not be added to the database at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
	}
}

function delete_user_check($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_GET['id'];

	// query the database

	$db->QueryRow("SELECT fname,lname,email FROM admin WHERE email='$id'");

	// setup variables

	$fname = $db->data['fname'];
	$lname = $db->data['lname'];
	$email = $db->data['email'];

	// output

	echo "<div class=\"msg-alerting\"><div class=\"msg-atten\">Are you sure you wish to delete the user:\n";
	echo "&nbsp;<b>$email</b>\n";
	echo "&nbsp;<a href=\"main.php?SID=$SID&action=$action&do=udel&id=$id&doit=1\">YES</a> | <a href=\"main.php?SID=$SID&action=$action&do=udel&id=$id&doit=0\">NO</a></div></div>\n";
	
	echo "$pagecontainerstart";
	echo "$pagecontainerend";
}


function do_delete_user($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_GET['id'];

	// query the database

	$db->QueryRow("SELECT id,fname,lname,email,emailaddress FROM admin WHERE email='$id'");

	// setup variables

	$useri = $db->data['id']; 
	$fname = $db->data['fname'];
	$lname = $db->data['lname'];
	$email = $db->data['email'];
	$emadd = $db->data['emailaddress'];
	
	// decided not to delete

	if (!$_GET['doit']) { 
	
		echo "<div class=\"msg-alerting\"><div class=\"msg-info\">You have chosen NOT to delete: <b>$email</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
	
	} else {

	// check to see if user is being referenced elsewhere
	
	if ($db->Exists("
		SELECT type, user FROM (
			SELECT 'events' AS type, event_userid AS user FROM events WHERE event_userid='$email'
			UNION ALL
			SELECT 'documents' AS type, user FROM documents WHERE user='$email'
			UNION ALL
			SELECT 'history' AS type, user FROM history WHERE user='$email'
			UNION ALL
			SELECT 'news' AS type, user FROM news WHERE user='$email'
			UNION ALL
			SELECT 'ticker' AS type, user FROM ticker WHERE user='$email'
		) a 
	")) {
		$db->Query("
			SELECT GROUP_CONCAT(DISTINCT type SEPARATOR ', ') as type FROM (
				SELECT 'events' AS type, event_userid AS user FROM events WHERE event_userid='$email'
				UNION ALL
				SELECT 'documents' AS type, user FROM documents WHERE user='$email'
				UNION ALL
				SELECT 'history' AS type, user FROM history WHERE user='$email'
				UNION ALL
				SELECT 'news' AS type, user FROM news WHERE user='$email'
				UNION ALL
				SELECT 'ticker' AS type, user FROM ticker WHERE user='$email'
			) a		
		");	
		
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">User $fname $lname is being referenced in the following tables: ";
		
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

		$db->Delete("DELETE FROM admin WHERE email='$id'");
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully deleted: <b>$email</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		
	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'3','5','$useri', NULL, '$sessfname $sesslname deleted user ''$email ($emadd)''.')");
		
	}
}

function edit_user_form($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath,$adminpage,$siteurl;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];
	$id = $_GET['id'];
	
	// query database

	$db->QueryRow("
		SELECT a.*, p.PlayerLName, p.PlayerFName, p.picture 
		FROM admin a 
		LEFT JOIN players p ON p.PlayerID = a.playerid
		WHERE email='$id'
	");

	// setup variables

	$useri = $db->data['id']; 
	$fname = $db->data['fname'];
	$lname = $db->data['lname'];
	$email = $db->data['email'];
	$emadd = $db->data['emailaddress'];
	$plyid = $db->data['playerid'];
	$plfna = $db->data['PlayerFName'];
	$pllna = $db->data['PlayerLName'];
	$plpic = $db->data['picture'];

	if($sessemail != 'mdoig' && $id == 'mdoig') { 
	
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">I'm sorry, you cannot edit the creator. <a href=\"main.php?SID=$SID&action=$action\">Back to user list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
		return;
		
	} else {
	
	echo "$pagecontainerstart";
	
	// check all checkboxes javascript

?>

	<script language="javascript">
	<!-- 	
	function masterCheck( btn, ca, ua )
	{
	 var elems = btn.form.elements, state = (btn.value == ca);
	 for( var i = 0, len = elems.length; i < len; i++ )
		if( elems[ i ].type && elems[ i ].type=='checkbox' )
		 elems[ i ].checked = state;
	 btn.value = state ? ua : ca;  
	}
	// -->
	</script>

	<h3>User Information</h3>
	<img src="<?=$siteurl?>/uploadphotos/players/<?=$plpic?>" class="portraitbg" align="right" style="margin-top: 37px;">

	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=uedit&id=<?=$email?>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="uedit">
	<input type="hidden" name="email" value="<?=$email?>">
	<input type="hidden" name="useri" value="<?=$useri?>">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>username</label> 
		<input type="text" name="email" maxlength="50" value="<?=$email?>" disabled="disabled" class="disabled">
	</div>

	<div class="block">
	<label>email address</label> 
		<input type="text" name="emailaddress" maxlength="50" value="<?=$emadd?>">
	</div>	

	<div class="block">
	<label>first name</label> 
		<input type="text" name="fname" maxlength="50" value="<?=$fname?>">
	</div>	

	<div class="block">
	<label>last name</label> 
		<input type="text" name="lname" maxlength="50" value="<?=$lname?>">
	</div>	

	<div class="block">
	<label>set password</label> 
		<input type="password" name="password1" maxlength="50">
	</div>	

	<div class="block">
	<label>verify password</label> 
		<input type="password" name="password2" maxlength="50">
	</div>	
	
	<div class="block">
	<label>link player [<span class="hint--top" data-hint="This is required. If the player record hasn't been setup, do this first.&#10;Every 'user' of the website must have an assoiated 'player' record."><u>?</u></span>]</label> 
	 <select name="playerid">
		<option value="<?=$plyid?>"><?php echo "$pllna, $plfna"; ?></option>
		<option value="">--------------------------</option>'
			<?php
				if ($db->Exists("SELECT PlayerID FROM players WHERE PlayerClub = 1")) {
					$db->Query("SELECT PlayerID, PlayerLName, PlayerFName FROM players WHERE PlayerClub = 1 ORDER BY PlayerLName, PlayerFName");
					for ($i=0; $i<$db->rows; $i++) {
						$db->GetRow($i);
						echo "<option value=\"" . $db->data[PlayerID] . "\">" . $db->data[PlayerLName] . ", " . $db->data[PlayerFName] . "</option>\n";
					}
				}
			?>
	 </select>			
	</div>
	
	</div>
	
	<h3>User Access Levels</h3>
	
	<div class="one-half first">
	
	<p><b>global settings</b></p>
	<input type="checkbox" name="flags[]" id="f0" value="1"> has access to user admin<br />
	<input type="checkbox" name="flags[]" id="f37" value="1"> has access to website admin<br />
	<input type="checkbox" name="flags[]" id="f14" value="1"> has access to schedule admin<br />
	<input type="checkbox" name="flags[]" id="f33" value="1"> has access to scorecard admin<br />
	<input type="checkbox" name="flags[]" id="f21" value="1"> has access to points table admin<br />
	<input type="checkbox" name="flags[]" id="f23" value="1"> has access to sponsors admin<br />

	<p><b>league settings</b></p>
	<input type="checkbox" name="flags[]" id="f16" value="1"> has access to clubs admin<br />
	<input type="checkbox" name="flags[]" id="f17" value="1"> has access to teams admin<br />
	<input type="checkbox" name="flags[]" id="f18" value="1"> has access to grounds admin<br />

	<p><b>player settings</b></p>
	<input type="checkbox" name="flags[]" id="f20" value="1"> has access to player admin<br />
	<input type="checkbox" name="flags[]" id="f38" value="1"> has access to club directory<br />
	<input type="checkbox" name="flags[]" id="f40" value="1"> has access to internal documents<br />
	<input type="checkbox" name="flags[]" id="f19" value="1"> has access to featured member admin<br />
	<input type="checkbox" name="flags[]" id="f22" value="1"> has access to officers admin<br />
	<input type="checkbox" name="flags[]" id="f24" value="1"> has access to awards admin<br />
	<input type="checkbox" name="flags[]" id="f39" value="1"> has access to availability admin<br />	
	
	</div>
	
	<div class="one-half">
	
	<p><b>news settings</b></p>
	<input type="checkbox" name="flags[]" id="f1" value="1"> has access to news admin<br />
	<input type="checkbox" name="flags[]" id="f15" value="1"> has access to history admin<br />
	<input type="checkbox" name="flags[]" id="f5" value="1"> has access to documents admin<br />
	<input type="checkbox" name="flags[]" id="f2" value="1"> has access to html admin<br />	

	<p><b>mailing lists</b></p>
	<input type="checkbox" name="flags[]" id="f6" value="1"> has access to mailing lists<br />
	<input type="checkbox" name="flags[]" id="f7" value="1"> has access to mailing list emails<br />
	<input type="checkbox" name="flags[]" id="f8" value="1"> has access to mailing list archives<br />
	<input type="checkbox" name="flags[]" id="f9" value="1"> has access to send emails to mailing list<br />	

	<p><b>miscellaneous table settings</b></p>
	<input type="checkbox" name="flags[]" id="f38" value="1"> has access to seasons admin<br />
	<input type="checkbox" name="flags[]" id="f45" value="1"> has access to conference admin<br />
	<input type="checkbox" name="flags[]" id="f41" value="1"> has access to leagues admin<br />
	<input type="checkbox" name="flags[]" id="f56" value="1"> has access to pool admin<br />
	<input type="checkbox" name="flags[]" id="f46" value="1"> has access to award types admin<br />
	<input type="checkbox" name="flags[]" id="f48" value="1"> has access to sponsor cat admin<br />
	<input type="checkbox" name="flags[]" id="f50" value="1"> has access to quotes admin<br />
	
	</div>
	
	<div class="block">
	<label style="margin-left: -120px;">&nbsp;</label>
	<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&cancel=<?=$adminpage?>" class="btn btn-secondary" style="margin-top: 15px;">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary" style="margin-top: 15px;">Submit</a>
	</div>
	
	</form>
	
<?php 

	echo "$pagecontainerend";
	
}	

}

function do_update_user($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_GET['id'];
		
	// Get post variables 
	
	$useri = $_POST['useri'];
	$fname = addslashes(trim($_POST['fname']));
	$lname = addslashes(trim($_POST['lname']));
	$plyid = addslashes(trim($_POST['playerid']));
	$email = trim($_POST['email']);
	$emadd = trim($_POST['emailaddress']);
	$pass1 = $_POST['password1'];
	$pass2 = $_POST['password2'];	
	
	// make sure info is present and correct

	if ($fname == "" || $lname == "" || $emadd == "" || $plyid == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete first name, last name, email address and link a player. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
		return;
	}

	// passwords didn't match

	if ($pass1 != "") {
		if ($pass1 != $pass2) {
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The passwords you entered do not match. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";				
			return;
		}
		$encpass = ",pword='" . encrypt($pass1, "butchercricket") . "'"; // new encrypt using Base64
	} else {
		$encpass = "";
	}

	// check for duplicates

	if ($id != $email) {
		if ($db->Exists("SELECT emailaddress FROM admin WHERE emailaddress='$emadd'")) {
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">$id $email $emadd A user with that email address already exists in the database. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";				
			return;
		}
	}	

	// query database

	$db->Update("UPDATE admin SET emailaddress='$emadd',fname='$fname',lname='$lname',playerid='$plyid',flags='$flags'$encpass WHERE email='$id'");
	if ($db->a_rows != -1) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully modified user: <b>$id</b>. <a href=\"main.php?SID=$SID&action=$action\">User list</a> | <a href=\"main.php?SID=$SID&action=$action&do=uedit&id=$id\">Update more</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','5','$useri', NULL, '$sessfname $sesslname updated user ''$email ($emadd)''.')");
		
	} else {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The user <b>$email</b> could not be modified at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
	}
}


// main program

//if (!$USER[flags][$f_user_admin]) {
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
case "uadd":
	if (!isset($_POST['doit'])) add_article_form($db);
	else do_add_user($db);
	break;
case "udel":
	if (!isset($_GET['doit'])) delete_user_check($db);
	else do_delete_user($db);
	break;
case "uedit":
	if (!isset($_POST['doit'])) edit_user_form($db);
	else do_update_user($db);
	break;
case "search":
	search_main_menu($db);
	break;
default:
	show_main_menu($db);
	break;
}

?>
