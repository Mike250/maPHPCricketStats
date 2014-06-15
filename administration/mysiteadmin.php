<?php

//------------------------------------------------------------------------------
// My Site Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>Website Administration</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Manage your site specific settings here.</p>
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
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$siteurl;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];
	
	// query database

	$db->QueryRow("SELECT * FROM websiteadmin WHERE id=1");

	// setup variables

	$wid = $db->data['id'];
	$wcl = $db->data['myClub'];
	$wyr = $db->data['myYear'];
	$wse = $db->data['mySeason'];
	$wst = $db->data['mySiteTitle'];
	$wwe = $db->data['myWebmaster'];
	$med = $db->data['myDescription'];
	$mek = $db->data['myKeywords'];
	$co1 = $db->data['primary_colour_1'];
	$co2 = $db->data['primary_colour_2'];
	$co3 = $db->data['primary_colour_3'];
	$co4 = $db->data['primary_colour_4'];
	$co5 = $db->data['primary_colour_5'];
	$co6 = $db->data['primary_colour_6'];
	$pic = $db->data['myLogo'];
	$fav = $db->data['myFavicon'];
	
	echo "$pagecontainerstart";
	
	// is there a picture?

	if($pic=="") { 
		$displaypic = "";
	} else {
		$displaypic = "<img src='$siteurl/uploadphotos/website/" . $pic . "'>";
	}	

	// is there a favicon?

	if($fav=="") { 
		$displayfav = "";
	} else {
		$displayfav = "<img src='$siteurl/uploadphotos/website/" . $fav . "' style='padding-top: 12px;'>";
	}	
	
?>
	
	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sedit" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="sedit">
	<input type="hidden" name="doit" value="1">

	<div class="fields">
	
	<h3>Site Settings</h3>

	<div class="block">
	<label>your club</label>
		<select name="myClub">
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

					// New way to get selected value, compare it
					echo "<option value=\"$cid\" ";
					  if($cid == $wcl) echo "selected";
					echo ">$cna</option>\n";
				}
			}
		?>

	</select>
	</div>

	<div class="block">
	<label>current year [<span class="hint--top" data-hint="This is the calendar year which the season ends in. If your season runs from October 2014 to April 2015, select 2015."><u>?</u></span>]</label>
		<select name="myYear">
		<option value="">select year</option>
		<option value="">---------------------</option>

		<?php

			// Get the list of years
			if ($db->Exists("SELECT YearID FROM year")) {
				$db->Query("SELECT YearID, YearName FROM year ORDER BY YearName");
				for ($y=0; $y<$db->rows; $y++) {
					$db->GetRow($y);
					$yid = $db->data['YearID'];
					$yna = $db->data['YearName'];

					// New way to get selected value, compare it
					echo "<option value=\"$yid\" ";
					  if($yid == $wyr) echo "selected";
					echo ">$yna</option>\n";
				}
			}

		?>

	</select>
	</div>

	<div class="block">
	<label>current season [<span class="hint--top" data-hint="The actual cricket season. If your season runs from October 2014 to April 2015, select 2014/15."><u>?</u></span>]</label>
		<select name="mySeason">
		<option value="">select season</option>
		<option value="">---------------------</option>

		<?php

			// Get the clist of seasons
			if ($db->Exists("SELECT SeasonID FROM seasons")) {
				$db->Query("SELECT SeasonID, SeasonName FROM seasons ORDER BY SeasonName");
				for ($s=0; $s<$db->rows; $s++) {
					$db->GetRow($s);
					$sid = $db->data['SeasonID'];
					$sna = $db->data['SeasonName'];

					// New way to get selected value, compare it
					echo "<option value=\"$sid\" ";
					  if($sid == $wse) echo "selected";
					echo ">$sna</option>\n";
				}
			}

		?>

	</select>
	</div>

	<div class="block">
		<label>website title</label>
		<input type="text" name="mySiteTitle" maxlength="50" value="<?=$wst?>">
	</div>

	<div class="block">
		<label>webmaster email</label>
		<input type="text" name="myWebmaster" maxlength="50" value="<?=$wwe?>">
	</div>

	<?php if($pic=="") { echo ""; } else { ?>
	<div class="block">
	<label>current logo</label>
		<?php echo $displaypic; ?>
	</div>
	<?php } ?>	
	
	<div class="block">
	<label>club logo [<span class="hint--top" data-hint="JPG, GIF or PNG only. No other formats will be accepted.&#10;This is the logo that will appear at the top of your site. Make sure it is sized appropriately."><u>?</u></span>]</label> 
		<input type="file" name="userpic">
	</div>

	<?php if($fav=="") { echo ""; } else { ?>
	<div class="block">
	<label>current favicon</label>
		<?php echo $displayfav; ?>
	</div>
	<?php } ?>	
	
	<div class="block">
	<label>favicon [<span class="hint--top" data-hint="ICO only. No other formats will be accepted.&#10;This is the tiny logo that will appear in the browser address bar or tabs. Make sure it is sized 16x16."><u>?</u></span>]</label> 
		<input type="file" name="userpic1">
	</div>
	
	<h3>Meta Settings</h3>	

	<div class="block">
		<label>meta description</label>
		<input type="text" name="myDescription" maxlength="50" value="<?=$med?>">
	</div>
	
	<div class="block">
		<label>meta keywords</label>
		<input type="text" name="myKeywords" maxlength="50" value="<?=$mek?>">
	</div>
	
	<h3>Style Settings</h3>	

	<div class="block">
		<label>primary colour 1</label>
		<input type="text" name="primary_colour_1" maxlength="50" value="<?=$co1?>">
	</div>
	
	<div class="block">
		<label>primary colour 2</label>
		<input type="text" name="primary_colour_2" maxlength="50" value="<?=$co2?>">
	</div>
	
	<div class="block">
		<label>primary colour 3</label>
		<input type="text" name="primary_colour_3" maxlength="50" value="<?=$co3?>">
	</div>
	
	<div class="block">
		<label>primary colour 4</label>
		<input type="text" name="primary_colour_4" maxlength="50" value="<?=$co4?>">
	</div>
	
	<div class="block">
		<label>primary colour 5</label>
		<input type="text" name="primary_colour_5" maxlength="50" value="<?=$co5?>">
	</div>
	
	<div class="block">
		<label>primary colour 6</label>
		<input type="text" name="primary_colour_6" maxlength="50" value="<?=$co6?>">
	</div>

	<div class="block">
	<label>&nbsp;</label>
		<a href="main.php?SID=<?=$SID?>&cancel=websiteadmin" class="btn btn-secondary">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary">Submit</a>
	</div>
	
	</div>
	</form>

<?php

	echo "$pagecontainerend";

}

function do_update_category($db,$id)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;

	// make sure info is present and correct

	if ($_POST['myClub'] == "" || $_POST['myYear'] == "" || $_POST['mySeason'] == "" || $_POST['mySiteTitle'] == "" || $_POST['myWebmaster'] == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must fill in / select all the fields for website settings.\n";
		echo " <a href=\"javascript:history.go(-1)\">Try again?</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";		
		return;
	}
	
	echo "$pagecontainerstart";	

	// Get the season name

	$db->QueryRow("SELECT SeasonName FROM seasons WHERE SeasonID = " . $_POST['mySeason'] . "");
	$wsn = $db->data['SeasonName'];

	// setup the variables

	$wcl = addslashes(trim($_POST['myClub']));
	$wye = addslashes(trim($_POST['myYear']));
	$wse = addslashes(trim($_POST['mySeason']));
	$wst = addslashes(trim($_POST['mySiteTitle']));
	$wwe = addslashes(trim($_POST['myWebmaster']));
	$med = addslashes(trim($_POST['myDescription']));
	$mek = addslashes(trim($_POST['myKeywords']));
	$co1 = $_POST['primary_colour_1'];
	$co2 = $_POST['primary_colour_2'];
	$co3 = $_POST['primary_colour_3'];
	$co4 = $_POST['primary_colour_4'];
	$co5 = $_POST['primary_colour_5'];
	$co6 = $_POST['primary_colour_6'];

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
	
	$target = "$sitepath/uploadphotos/website/"; 
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
	
	$userpic = $db->QueryItem("SELECT myLogo FROM websiteadmin WHERE id = 1");
	
	}	

	// do the favicon upload work here
	
	$userpic1 = preg_replace("/[^A-Z0-9._-]/i", "_",strtolower(basename($_FILES['userpic1']['name'])));

	// Was a new photo uploaded? If so, process, if not, ignore
	
	if($userpic1 != "") {
	
	// additional file information

	$uploadsize1 = $_FILES['userpic1']['size'];
	$uploadtype1 = $_FILES['userpic1']['type'];
	
	// allowed files
	
	$filetype1 = exif_imagetype($_FILES["userpic1"]["tmp_name"]);
	$allowed1 = array(IMAGETYPE_ICO);
	
	// destination directory 
	
	$target1 = "$sitepath/uploadphotos/website/"; 
	$target1 = $target1 . $userpic1;  
 	
 	// file is too big
 	
	if ($uploadsize1 > 3500000) { 
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">That icon was too large. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
	
	// if not allowed file 
	
	if (!in_array($filetype1, $allowed1)) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry! Only .ico allowed. You uploaded a $uploadtype. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
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
	
	$userpic1 = $db->QueryItem("SELECT myFavicon FROM websiteadmin WHERE id = 1");
	
	}	
	
	$db->Update("
		UPDATE websiteadmin SET 
			myClub = $wcl, 
			myYear = $wye, 
			mySeason = $wse, 
			mySeasonName = '$wsn', 
			mySiteTitle = '$wst',
			myWebmaster = '$wwe',
			myDescription = '$med',
			myKeywords = '$mek',
			primary_colour_1 = '$co1',
			primary_colour_2 = '$co2',
			primary_colour_3 = '$co3',
			primary_colour_4 = '$co4',
			primary_colour_5 = '$co5',
			primary_colour_6 = '$co6',
			myLogo = '$userpic',
			myFavicon = '$userpic1'
		WHERE id = 1
	");
	
		echo "</div></div></div></div></article><div class=\"msg-alerting\"><div class=\"msg-ok\">You have now updated the website settings.\n";
		echo " <a href=\"main.php?SID=" . $_GET['SID'] . "&action=" . $_GET['action'] . "&do=sedit\">Edit again</a> or return <a href=\"main.php?SID=" . $_GET['SID'] . "\">home</a>?</div></div>\n";
		echo "</div></div></section>\n";

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','4','1', NULL, '$sessfname $sesslname updated the website settings.')
	");
	
}


// main program

//if (!$USER[flags][$f_mysite_admin]) {
//	header("Location: main.php?SID=$SID");
//	exit;
//}

?>

        <section class="span8 margTop">
            <div class="row">
                <div class="span8">

<?php

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

?>
