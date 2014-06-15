<?php

//------------------------------------------------------------------------------
// Cricket Login Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

	require "../includes/general.config.inc";
	require "../includes/class.mysql.inc";
	require "../includes/general.functions.inc";
	
	// nothing given in the form

	if ($_POST['form_email']=="" || $_POST['form_pword']=="") {
		header("Location: http://$pathcfg[urlroot]/$pathcfg[adir]/index.php?again=1");
		exit();
	}

	// get the email
	
	$emailaddy = $_POST['form_email'];
	$passy = $_POST['form_pword'];

	// encrypt given password

	//$encpass = crypt($form_pword,$form_pword[0].$form_pword[1]);
	$encpass = encrypt($passy, "butchercricket"); // new encrypt using Base64

	// open a connection

	$db = new mysql_class($dbcfg['login'],$dbcfg['pword'],$dbcfg['server']);
	$db->SelectDB($dbcfg[db]);

	// do the user/password authentication

	if (!$db->Exists("SELECT * FROM $tbcfg[admin] WHERE email='$emailaddy'")) {
		header("Location: http://$pathcfg[urlroot]/$pathcfg[adir]/index.php?again=1");
		exit();
	}
	$db->QueryRow("SELECT * FROM $tbcfg[admin] WHERE email='$emailaddy'");
	if (!$db->rows || ($encpass != $db->data["pword"])) {
		header("Location: http://$pathcfg[urlroot]/$pathcfg[adir]/index.php?again=1");
		exit();
	}

	// start session

	//$laston = date_create(strtotime($db->data[laston]));
	//$added  = date_create(strtotime($db->data[added]));

	$_SESSION['useri'] = stripslashes($db->data['id']);
	$_SESSION['fname'] = stripslashes($db->data['fname']); 
	$_SESSION['lname'] = stripslashes($db->data['lname']); 
  $_SESSION['plyid'] = $db->data['playerid'];
  $_SESSION['email'] = $db->data['email'];
  $_SESSION['lasto'] = date_create(strtotime($db->data['laston']));
  $_SESSION['added'] = date_create(strtotime($db->data['added']));
  $_SESSION['flags'] = preg_split('/^/',$db->data[flags]);
	 
	//$USER = array();
	$USER = array(
			"useri"		=> stripslashes($db->data[id]),
			"fname"		=> stripslashes($db->data[fname]),			
			"lname"		=> stripslashes($db->data[lname]),
			"plyid"		=> $db->data[playerid],
			"email"		=> $db->data[email],
			"flags"		=> preg_split('/^/',$db->data[flags]),

	// In PHP5 date_format throws Warning: date_format() expects parameter 1 to be DateTime, string given

			"laston"	=> date($db->data[laston],$db->data[lang]),
			"added"		=> date($db->data[added],$db->data[lang])
		);
	//session_register("USER");
	$_SESSION['USER'] = $USER;
	
	$SID = session_id();

	// everything OK

	$db->Update("UPDATE $tbcfg[admin] SET ison=1,laston=NOW() WHERE email='" . $db->data[email] . "'");

	// event logging

	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES (" . $_SESSION['useri'] . ",NOW(),'4','1'," . $_SESSION['useri'] . ", NULL, '" . $_SESSION['fname'] . " " . $_SESSION['lname'] . " logged in.')
	");	

	//header("Location: http://$pathcfg[urlroot]/$pathcfg[adir]/main.php?SID=$PHPSESSID");
	header("Location: http://$pathcfg[urlroot]/$pathcfg[adir]/main.php?SID=$SID");
	

?>