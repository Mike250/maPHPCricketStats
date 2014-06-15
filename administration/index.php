<?php

//------------------------------------------------------------------------------
// Cricket Main Menu Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

require "../includes/class.mysql.inc";
require "../includes/general.config.inc";
require "../includes/general.functions.inc";
require "../includes/class.fasttemplate.inc";
$title = "$mysitt Administration";

// do the expiration here

$sql = "CALL admin_user_expire()";
mysql_query($sql);

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
			
			if ($_GET['again']==1) {
				$cancelr = '<div class=msg-error>Username/password not found. Please login again.</div>';
			} elseif ($_GET['again']==2) {
				$cancelr = '<div class=msg-ok>You have successfully logged out.</div>';
			} elseif ($_GET['again']==3) {
				$cancelr = '<div class=msg-error>Your session has expired. Please login again. Remember to logout after each session!</div>';
			}

			if ($_GET['again']) $alert = "<div class=\"msg-alerting\">$cancelr</div>\n";
						
		?>

        <section class="span8 margTop">
            <div class="row">
                <div class="span8">
                        <?php echo "$alert"; ?>
                    <article class="holder indent1">
                        <div>
                            <h2>Player Login</h2>
                            <div class="thumb-pad0">
                                <div class="thumbnail">
                                    <div class="caption">
                                        <p>If you still need assistance, can't retrieve your details or any other problem please email the webmaster: <a href=\"mailto: <?=$mywebm?>\"><?=$mywebm?></a>.</p>
                                        
                                        
																				<form id="cricket-form" method="post" action="login.php">
																				
																				<div class="fields">

																				<div class="block">
																				<label>Username</label>
																					<input type="text" id="form_email" name="form_email" maxlength="40">
																				</div>

																				<div class="block">
																				<label>Password</label>
																					<input type="password" id="form_pword" name="form_pword" maxlength="40">
																				</div>

																				<div class="block">
																				<label>&nbsp;</label>
																					<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary">Login</a>
																				</div>

																				</div>

																				</form>                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </section>

         <section class="span4 margTop">
            <div class="row">
                <div class="span4">
                    <article>
                        <div>
                            <ul class="nav nav-tabs" id="tab_preview">
                                <li class="active"><a href="#section_1">Tab 1</a></li>
                                <li><a href="#section_2">Tab 2</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane  active" id="section_1">
                                    <ul class="list1">
                                        <li>
                                            <div class="extra-wrap">
                                                Nothing to see here, yet.
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane" id="section_2">
                                    <ul class="list1">
                                        <li>
                                            <div class="extra-wrap">
                                                Nothing to see here, either.
                                            </div>
                                        </li>
                                    </ul>														                               
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