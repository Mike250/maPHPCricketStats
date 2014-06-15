<?php

//------------------------------------------------------------------------------
// Cricket Forgot Password Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

require ("../includes/general.config.inc");
require ("../includes/class.mysql.inc");
require ("../includes/class.fasttemplate.inc");
require ("../includes/general.functions.inc");
$title = "Forgot Password";
include ("../includes/header.inc");

?>

<!-- Main Body Section -->
<table width="990" cellspacing="4" cellpadding="0" border="0" align="center">
	<tr>
		<td valign="top" width="696" class="mainsectionbg">
		<!-- Left Column Section -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" style="background-image: url(<?=$myurl?>/images/mainfooter/rotator.php); background-repeat: no-repeat; background-position: bottom;">
			<tr>
				<td valign="top">
				<!-- More Headlines -->
				<div id="AdminSection">
				<table width="696" border="0" cellspacing="0" cellpadding="6">
					<tr>
						<td valign="top">
						<div style="min-height:550px; height:auto !important; height:550px;">

<?

function show_email_form($db)
 {
 	global $PHP_SELF, $greenbdr, $mysitt, $myurl;

	echo "<h1>Password Reminder</h1>\n";

	echo "<p>Please enter your email address to retrieve your password.</p>\n";

	echo "<form action=\"fpasswd.php\" method=\"post\">\n";
	echo "<input type=\"hidden\" name=\"mode\" value=\"sendpass\" />\n";
	echo "<table width=\"350\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\">\n";
	echo "	<tr>\n";
	echo "		<td class=\"blueshade\" height=\"23\">&nbsp;<b>FORM</b></td>\n";
	echo "	</tr>\n";
	echo "	<tr>\n";
	echo "		<td class=\"admintrrow1\" valign=\"top\" colspan=\"2\">\n";
	echo "		<table border=\"0\" cellspacing=\"1\" cellpadding=\"3\" width=\"100%\">\n";
	echo "		<tr class=\"admintrrow1\">\n";
	echo "			<td>Your Email:</td><td><input type=\"text\" name=\"emailaddress\" class=\"admininput\"></td>\n";
	echo "		</tr>\n";
	echo "		<tr class=\"admintrrow1\">\n";
	echo "			<td>&nbsp;</td>\n";
	echo "			<td><input class=\"button\" type=\"submit\" value=\"retrieve password\"></td>\n";
	echo "		</tr>\n";
	echo "		</table>\n";
	echo "		</form>\n";
	echo "		</td>\n";
	echo "	</tr>\n";
	echo "</table>\n";

}


function send_email($db)
 {
 	global $PHP_SELF, $greenbdr, $mysitt, $myurl, $mywebm;

 	$emailaddy = $_POST['emailaddress'];

	echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n";
	echo "<tr>\n";
	echo "<td align=\"left\" valign=\"top\">\n";

 	// Let's validate that they entered an email address
 	
 	if (filter_var($emailaddy, FILTER_VALIDATE_EMAIL)) { 
 	
	if ($db->Exists("SELECT * FROM admin WHERE emailaddress = '$emailaddy'")) {
	$db->QueryRow("SELECT * FROM admin WHERE emailaddress = '$emailaddy'");
	//$db->BagAndTag();

	$pword = $db->data['pword'];
	//$encpass = crypt($emailaddress,$emailaddress[0].$emailaddress[1]);
	$encpass = decrypt($pword, "butchercricket");

	echo "<h1>Password Sent!</h1>\n";
	echo "<div class=\"msg-ok\">Please check your email to retrieve your password. <a href=\"main.php\">Login again</a>? </div>\n";


	mail(
		"$emailaddy" , 
		"Password Request" , 
		"Password Request\n\nSomebody requested the password to the $mysitt Administration Panel for the following account: $emailaddy\n\n
		The password is: $encpass\n\nIf you did not request this password do not fear, we only email the account holder the password and never share with anybody else.\n\n
		Kind Regards,\n$mysitt","From: $mywebm\n"
	);

	} else {

	echo "<h1>Password Error!</h1>\n";
	echo "<div class=\"msg-error\">I'm sorry. That email address doesn't exist in our database. <a href=\"javascript:history.go(-1)\">Try again</a>?</div>\n";

	}

	} else { 
	
	// Invalid email address
	
	echo "<h1>Invalid Email Address!</h1>\n";
	echo "<div class=\"msg-error\">I'm sorry. That is an invalid email address. <a href=\"javascript:history.go(-1)\">Try again</a>?</div>\n";
	
	}
	
	echo "		</td>\n";
	echo "	</tr>\n";
	echo "</table>\n";

}


// open up db connection now so you don't have to in every other file
$db = new mysql_class($dbcfg['login'],$dbcfg['pword'],$dbcfg['server']);
$db->SelectDB($dbcfg[db]);

switch($_POST['mode']) {
case "sendpass":
    send_email($db);
    break;
case "forgotpass":
default:
    show_email_form($db);
    break;
}

?>
						</div>
						</td>
					</tr>
				</table>
				</div>
				</td>
			</tr>
		</table>
		<!-- Right Column Section -->
		<td valign="top">
		<table width="288" cellspacing="0" cellpadding="0" border="0" align="center">
			<tr>
				<td valign="top">
				<!-- Weekend Match Center Section -->
				<table width="100%" border="0" style="border: solid 1px <?=$bluebdr?>;" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<?php
							// Check to see if today is Sat or Sun and display live scores if so

  							$b = time ()+61200; // +17 hours from server time 17*60*60
  							if(date("l",$b)=="Saturday" || date("l",$b)=="Sunday") {
  								$matchcenter = "LIVE SCOREBOARD";
  							} else {
  								$matchcenter = "WEEKEND MATCH CENTER";
  							}
						?>
						<td class="blueshade" height="23">&nbsp;<b><?=$matchcenter?></b></td>
					</tr>
					<tr>
						<td valign="top" style="background:url(<?=$myurl?>/images/livescoresbg.jpg); background-color: #032437;"><?php include("$sitepath/boxscoreboard.php"); ?></td>
					</tr>
				</table>
				<?=$linebreak?>
				<!-- Mini Standings Section -->
				<table width="100%" style="border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td class="greyshade" height="23">&nbsp;<b>STANDINGS</b></td>
					</tr>
					<tr>
						<td valign="top" style="background: #FFFFFF;"><?php include("$sitepath/boxstandings.php"); ?></td>
					</tr>
				</table>
				<?=$linebreak?>
				</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<?php include ("../includes/footer.inc"); ?>