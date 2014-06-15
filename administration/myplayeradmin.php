<?php

//------------------------------------------------------------------------------
// My Player Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>Your Player Profile</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Offensive material/photos will be removed and your login will be suspended. Please do not abuse this service.</p>
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
   
    
function edit_category_form($db,$id)
{
	global $content,$action,$SID,$pagecontainerstart,$pagecontainerend;

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
			<a href="main.php?SID=<?=$SID?>&cancel=myplayeradmin" class="btn btn-secondary">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary">Submit</a>
		</div>

	</div>
	</form>
	

<?php 

	echo "$pagecontainerend";

}


function do_update_category($db,$id)
{
	global $content,$sessuseri, $sessemail, $sessfname, $sesslname, $sessplyid, $pagecontainerstart, $pagecontainerend;
	
	$plid = $_GET['id'];
	
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

	// query database

	$db->Update("
		UPDATE players SET 
			PlayerLName='$pln',
			PlayerFName='$pfn',
			NickName='$nin',
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
			edited=now() 
		 WHERE PlayerID=$plid
		");
			
	if ($db->a_rows != -1) {

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','3','$plid', NULL, '$sessfname $sesslname updated their player profile ''$pfn $pln''.')");

		echo "</div></div></div></div></article><div class=\"msg-alerting\"><div class=\"msg-ok\">Your profile was successfully updated $pfn.\n";
		echo "&nbsp;<a href=\"main.php?SID=" . $_GET['SID'] . "&action=" . $_GET['action'] . "&do=sedit&id=$plid\">Edit again</a> or return <a href=\"main.php?SID=" . $_GET['SID'] . "\">home</a>?</div></div>\n";
		echo "</div></div></section>\n";
	} else {
	echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry. Something went wrong with updating your profile.\n";
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

if($_GET['id'] <> $sessplyid ) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry. You are attemtping to edit a profile that is not your own. <a href=\"main.php?SID=$SID&action=" . $_GET['action'] . "&do=sedit&id=$sessplyid\">Try here</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";  
		return;
} else { 
                                        
switch($_GET['do']) {
case "sedit":
	if (!isset($_POST['doit'])) {
		edit_category_form($db,$id);
	} else { 
		do_update_category($db,$id);
	}
	break;
default:
	show_main_menu($db);
	break;
}

}

?>

                                    