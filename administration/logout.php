<?php

//------------------------------------------------------------------------------
// Cricket Logout Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

require "../includes/class.mysql.inc";
require "../includes/general.config.inc";

// startup session

session_start();
$SID = session_id();

$sessuseri = $_SESSION['useri'];
$sessfname = $_SESSION['fname'];	
$sesslname = $_SESSION['lname'];
$sessplyid = $_SESSION['plyid'];
$sessemail = $_SESSION['email'];
$sessflags = $_SESSION['flags'];

// open a connection

$db = new mysql_class($dbcfg['login'],$dbcfg['pword'],$dbcfg['server']);
$db->SelectDB($dbcfg[db]);
$db->Update("UPDATE $tbcfg[admin] SET ison=0 WHERE email='" . $USER[email] . "'");

// event logging
	
$db->Insert("
	INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
	VALUES ($sessuseri,NOW(),'4', '1', $sessuseri, NULL, '$sessfname $sesslname logged out.')
");	

// destroy the session and log them out

unset($_SESSION[$USER]); // PHP 5.4 and above
//session_unregister($USER);
session_destroy();
header("Location: http://$pathcfg[urlroot]/$pathcfg[adir]/index.php?again=2");

?>
