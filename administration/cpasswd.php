<?php

//------------------------------------------------------------------------------
// Cricket Password Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

$getaction = $_GET['action'];

if (!isset($_POST["doit"])) {

?>

<section class="span8 margTop">
	<div class="row">
		<div class="span8">
			<article class="holder indent1">
				<div>
					<h2>Change Password</h2>
					<div class="thumb-pad0">
						<div class="thumbnail">
							<div class="caption">
								<p>Please ensure you enter a strong password, making use of at least one capital letter, one number and one symbol, if possible. The strength indicator will guide you.</p>

	<form id="cricket-form" method="post" action="main.php?SID=<?=$SID?>&action=<?=$getaction?>">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$getaction?>">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>Enter password</label>
		<input type="password" id="myPassword" name="password1" maxlength="40">
	</div>

	<div class="block">
	<label>Reenter password</label>
		<input type="password" id="password2" name="password2" maxlength="40">
	</div>

	<div class="block">
	<label>&nbsp;</label>
		<a href="main.php?SID=<?=$SID?>&cancel=changepassword" class="btn btn-secondary">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary">Submit</a>
	</div>

	</div>

	</form>

<?php

} else {

	$_GET['ok_form']=1;

	$passone = $_POST['password1'];
	$passtwo = $_POST['password2'];

	if ($passone=="" || $passtwo=="") {
		$alert = "<div class=\"msg-error\">You must enter both passwords. Please <a href=\"main.php?SID=$SID&action=cpasswd\">try again</a>.</div>\n";
	//	echo "</div></div></div></div></article></div></div></section>\n";
	//	return;
	}
	else if (strlen($passone) < $gencfg[passlen]) {
		$alert = "<div class=\"msg-error\">Your password needs to be at least 6 characters. Please <a href=\"main.php?SID=$SID&action=cpasswd\">try again</a>.</div>\n";
	//	echo "</div></div></div></div></article></div></div></section>\n";
	//	return;
	}
	else if ($passone != $passtwo) {
		$alert = "<div class=\"msg-error\">Your passwords do not match. Please <a href=\"main.php?SID=$SID&action=cpasswd\">try again</a>.</div>\n";
	//	echo "</div></div></div></div></article></div></div></section>\n";
	//	return;
	}
	else {
	if ($_GET['ok_form']) {
		$encpass = encrypt($passone, "butchercricket"); // new encrypt using Base64
		$db->Update("UPDATE $tbcfg[admin] SET pword='$encpass' WHERE email='$sessemail'");
		if ($db->a_rows != -1) $alert = "<div class=\"msg-ok\">Your password has now been changed. Return <a href=\"main.php?SID=$SID\">home</a>.</div>\n";
		else $alert = "<div class=\"msg-error\">Your password could not be changed at this time.</div>\n";

	// event logging

	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text)
		VALUES ($sessuseri,NOW(),'2','2',$sessuseri, NULL, '$sessfname $sesslname updated their password.')
	");
	}
	}
?>

<section class="span8 margTop">
	<div class="row">
		<div class="span8">
		<div class="msg-alerting"><?php echo "$alert"; ?></div>
			<article class="holder indent1">
				<div>
					<h2>Change Password</h2>
					<div class="thumb-pad0">
						<div class="thumbnail">
							<div class="caption">
								<p>Please ensure you enter a strong password, making use of at least one capital letter, one number and one symbol, if possible. The strength indicator will guide you.</p>


<?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </section>
