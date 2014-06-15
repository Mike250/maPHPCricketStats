<?php

//------------------------------------------------------------------------------
// Cricket Main Menu Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

	$sessuseri = $_SESSION['useri'];
	$sessfname = $_SESSION['fname'];
	$sesslname = $_SESSION['lname'];
	$sessplyid = $_SESSION['plyid'];
	$sessemail = $_SESSION['email'];
	$sessflags = $_SESSION['flags'];

require "../includes/class.mysql.inc";
require "../includes/general.config.inc";
require "../includes/general.functions.inc";
require "../includes/class.fasttemplate.inc";
$title = "$mysitt Administration";
//include "../includes/mysql_connect.php";

// if the person hasn't logged on yet

if ($SID=="" || $_SESSION['USER'] == "") {
	header("Location: http://$pathcfg[urlroot]/$pathcfg[adir]/index.php?again=3");
	exit;
}

$content = "";
$menu = "";
$jscript = "";

?>

<?php include("$sitepath/includes/headeradmin.inc"); ?>

<div class="main gradient">
<div class="container" style="margin-top: -30px;">
    <div class="row">

		<?php
			// open up db connection now so you don't have to in every other file

			$db = new mysql_class($dbcfg['login'],$dbcfg['pword'],$dbcfg['server']);
			$db->SelectDB($dbcfg[db]);

			// Process the action

			if (!isset($_GET[action]) || $_GET[action] == "") {

			// if they cancelled doing something, display a friendly message

			if(isset($_GET['cancel'])) {

				if($_GET['cancel'] == "changepassword") $cancelr = 'changing your password';
				if($_GET['cancel'] == "myplayeradmin") $cancelr = 'updating your player profile';
				if($_GET['cancel'] == "websiteadmin") $cancelr = 'updating the website settings';
				if($_GET['cancel'] == "useradmin") $cancelr = 'updating the users table';
				if($_GET['cancel'] == "newsadmin") $cancelr = 'updating the news table';

				$alert = "<div class=\"msg-alerting\"><div class=\"msg-atten\">You have cancelled $cancelr.</div></div>\n";

			} else { }

		?>

        <section class="span8 margTop">
            <div class="row">
                <div class="span8">
                        <?php echo "$alert"; ?>
                    <article class="holder indent1">
                        <div>
                            <h2>Hello <?php echo "$sessfname $sesslname"; ?>,</h2>
                            <div class="thumb-pad0">
                                <div class="thumbnail">
                                    <div class="caption">
                                        <h3>Welcome back to <?=$mysitt?> and to Season <?=$siteseason?>.</h3>
                                        <p>From this Administration Panel you can manage your profile, your selection availabilities, review internal club documents and access the club contacts database.</p>
                                        <p>If you have any problems or questions, please post a message in the forums or email <a href=\"mailto: <?=$mywebm?>\"><?=$mywebm?></a>.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article class="holder indent2">
                        <div>
                            <h2>Administration Panel Basics</h2>
                            <div class="thumb-pad0">
                                <div class="thumbnail">
                                    <div class="caption">
                                        <p>The Administration Menu is laid out similar to that of the public <?=$mysitt?> website. You'll find modules that you have access to by hovering your mouse over the main menu links across the top and selecting a module in the drop down list. The image below gives an example of locating the module to edit your own player profile page:</p>
                                        <p><img src="<?=$siteurl?>/administration/images/adminmenuexample.png"></p>
                                        <p>Once you have located the module you wish to work with, click it in the drop down menu. You can always return to this page by clicking <b>ADMIN HOME</b> in the main menu.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </section>

				<?php	} else @include $_GET[action] . ".php";?>

         <section class="span4 margTop">
            <div class="row">
                <div class="span4">
                    <article>
                        <div>
                            <ul class="nav nav-tabs" id="tab_preview">
                                <li class="active"><a href="#section_1">Info</a></li>
                                <li><a href="#section_2">Last Logins</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane  active" id="section_1">

																<?php
																	// get the user's photo

																	$db->Query("SELECT a.*, p.picture FROM admin a INNER JOIN players p ON p.PlayerID = a.playerid WHERE a.email = '$sessemail'");
																	for ($x=0; $x<$db->rows; $x++) {
																		$db->GetRow($x);

																		// setup the variables

																		$pli = $db->data['playerid'];
																		$pic = $db->data['picture'];
																		$las = sqldate_to_string($db->data['laston']);
																		$add = sqldate_to_string($db->data['added']);

																	}

																?>

                                    <ul class="list1">
                                        <li>
                                            <div class="extra-wrap">
                                                Welcome <b><?=$sessfname?></b>. <a href="logout.php">Logout?</a>
                                            <?php if($pic != "") { ?>
                                            	<img src="<?=$siteurl?>/uploadphotos/players/<?=$pic?>" width="60" height="75" style=\"border: 1px solid rgb(233, 231, 231); padding: 1px;\" align="right">
                                            <?php } else { ?>
                                            	<img src="<?=$siteurl?>/uploadphotos/players/HeadNoMan.jpg" width="60" height="75" style=\"border: 1px solid rgb(233, 231, 231); padding: 1px;\" align="right">
                                            <?php } ?>
                                            <p>Last login: <?=$las?></p>
                                            <p>Created: <?=$add?></p>
                                            </div>
                                        </li>
                                        <li>
                                        		<div class="extra-wrap">
                                            <p><a href="main.php?SID=<?=$SID?>&action=cpasswd">Change password</a> | <a href="main.php?SID=<?=$SID?>&action=myplayeradmin&do=sedit&id=<?=$pli?>">Modify profile</a></p>
                                        		</div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane" id="section_2">
																<div class="magrid">
																	<table>
																		<thead>
																			<tr>
																				<th>user</th>
																				<th>date</th>
																				<th class="lastcolumn">time</th>
																			</tr>
																		</thead>
																		<tbody>                                
																			<?php
																				// get the last logins

																				$db->Query("
																					SELECT u.email, DATE_FORMAT(e.event_date,'%b %e, %Y') AS event_date, DATE_FORMAT(e.event_date,'%l:%i %p') AS event_time 
																					FROM events e 
																					JOIN admin u ON u.id = e.event_userid 
																					WHERE e.event_type = 4 AND e.event_text LIKE '%logged in%'
																					ORDER BY e.event_date DESC
																					LIMIT 10;
																				");

																				for ($x=0; $x<$db->rows; $x++) {
																					$db->GetRow($x);

																					// setup the variables

																					$luse = $db->data['email'];
																					$ldat = $db->data['event_date'];
																					$ltim = $db->data['event_time'];
																					
																					echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

																			?>																
																				<td><?=$luse?></td>
																				<td><?=$ldat?></td>
																				<td class="lastcolumn"><?=$ltim?></td>
																			</tr>
																			<?php } ?> 																			
																		</tbody>
																	</table>
																	</div>														                               
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
         </section>
     </div>
</div>
</div>
</div>
</div>

<?php include ("$sitepath/includes/footeradmin.inc"); ?>