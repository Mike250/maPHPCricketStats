<?php

//------------------------------------------------------------------------------
// General.Config.Inc v3.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------


// Site variables
	$siteurl    	= "http://www.maphpcricket.com";
	$sitepath   	= "/home/thesqlbloke/maphpcricket.com";
	$sitename   	= "My Cricket Club";
	$limit 	    	= 10;

// database global values array
$dbcfg = array (
		server	=> "mysql.thesqlbloke.com",
		login	=> "thesqlblokecom",
		pword	=> "8EVG^Bvu",
		db	=> "maphpcricket"
	);


// database variable values
$dbhost	= "mysql.thesqlbloke.com";
$dbuser	= "thesqlblokecom";
$dbpass	= "8EVG^Bvu";
$dbname	= "maphpcricket";

// Get Site Specific Settings

$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die ("Error connecting to database");
//mysql_select_db($dbname);

$dbc = mysql_connect($dbhost, $dbuser, $dbpass) or die ("Error connecting to database");
mysql_select_db($dbname);


$sql="SELECT myYear, mySeason, mySeasonName FROM websiteadmin";
$result = mysql_query($sql) or die('Query failed: ' . mysql_error());	
if($result)
{
	while($row = mysql_fetch_assoc($result))
	{	
			$siteyear=$row["myYear"];
			$siteseason=$row["mySeasonName"];
			$siteseasonid=$row["mySeason"];
	}
}
			
// Site formatting variables
	$linebreak		= "<div style=\"height: 4px;\"></div>";

// database table values
$tbcfg = array (
		admin	=> "admin",
		events	=> "events",
		stories	=> "stories",
		mlarchive => "mailinglist_archive",
		mllists	  => "mailinglist_lists",
		mlemails  => "mailinglist_emails"
	);

// path config values
$pathcfg = array (
		urlroot	=> "www.maphpcricket.com",
		froot	=> "/home/thesqlbloke/maphpcricket.com/",
		aroot	=> "/home/thesqlbloke/maphpcricket.com/administration",
		iroot	=> "/home/thesqlbloke/maphpcricket.com/includes",
		adir	=> "administration"
	);

// default template settings
$tpl_defaults = array (
		"ACTION" 	=> "",
		"CONTENT" 	=> "",
		"TITLE" 	=> "Administration",
		"MENU" 		=> "<b>main menu</b>",
		"SID" 		=> "",
		"DATE"		=> date("l, F jS, Y" ,time())
	);


// general config options
$gencfg = array (
		webmaster	=> "admin@admin.com",
		passlen		=> 6
	);

$full_month_name = array(
		"January","Februrary","March","April","May","June","July","August","September","October","November","December"
	);

$full_day_name = array(
		"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"
	);

$short_month_name = array(
		"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
	);

$short_day_name = array(
		"Sun","Mon","Tue","Wed","Thu","Fri","Sat"
	);

// flags (add here when you add modules)
$f_user_admin = 0;
$f_news_admin = 1;
$f_ticker_admin = 2;
$f_edit_news = 3;
$f_delete_news = 4;
$f_documents_admin = 5;
$f_ml_lists = 6;
$f_ml_emails = 7;
$f_ml_archive = 8;
$f_ml_send = 9;
$f_faq_admin = 10;
$f_image_gallery = 11;
$f_image_photos = 12;
$f_poll_admin = 13;
$f_schedule_admin = 14;
$f_history_admin = 15;
$f_clubs_admin = 16;
$f_teams_admin = 17;
$f_grounds_admin = 18;
$f_featuredmember_admin = 19;
$f_player_admin = 20;
$f_ladder_admin = 21;
$f_officers_admin = 22;
$f_sponsors_admin = 23;
$f_awards_admin = 24;
$f_subnews_admin = 25;
$f_champions_admin = 26;
$f_seasons_admin = 27;
$f_cal_cat_admin = 28;
$f_cal_event_admin = 29;
$f_leagues_admin = 30;
$f_conference_admin = 31;
$f_awardtypes_admin = 32;
$f_scorecard_admin = 33;
$f_sponsortypes_admin = 34;
$f_photocompetition_admin = 35;
$f_quotes_admin = 36;
$f_mysite_admin = 37;
$f_directory = 38;
$f_availability_admin = 39;
$f_clubdocuments = 40;
$f_pool_admin = 41;
$f_year_admin = 42;

// page colours (for a future release perhaps)

$bluebdr   = "#00417E";
$bluebg    = "#BBCCDD";
$greenbdr  = "#025A43";
$greenbg   = "#99BBAA";
$yellowbdr = "#DE9C06";
$yellowbg  = "#FFDD99";
$redbdr    = "#9E3228"; 
$blackbdr  = "#000000";
$greybdr   = "#4B4B4B";
$butcherbdr = "#117CBD";
$tennisbdr = "#83C815";
$cougarbdr = "#030979";


$page_colours = array (
	"#A2E8A0" => "green",
	"#F3D38D" => "orange",
	"#F38F8D" => "red",
	"#F38DF0" => "purple",
	"#BCBAB7" => "grey"
);

// states (just in case you want states in a form sometime)
$states = array (
	"AL" => "Alabama",
	"AK" => "Alaska",
	"AZ" => "Arizona",
	"AR" => "Arkansas",
	"CA" => "California",
	"CO" => "Colorado",
	"CT" => "Connecticut", 
	"DE" => "Delaware",
	"DC" => "Dist. of Columbia", 
	"FL" => "Florida",
	"GA" => "Georgia",
	"GU" => "Guam",
	"HI" => "Hawaii",
	"ID" => "Idaho",
	"IL" => "Illinois",
	"IN" => "Indiana",
	"IA" => "Iowa",
	"KS" => "Kansas",
	"KY" => "Kentucky",
	"LA" => "Louisiana",
	"ME" => "Maine",
	"MD" => "Maryland",
	"MA" => "Massachusetts",
	"MI" => "Michigan",
	"MN" => "Minnesota",
	"MS" => "Mississippi",
	"MO" => "Missouri",
	"MT" => "Montana",
	"NE" => "Nebraska",
	"NV" => "Nevada",
	"NH" => "New Hampshire",
	"NJ" => "New Jersey",
	"NM" => "New Mexico",
	"NY" => "New York",
	"NC" => "North Carolina",
	"ND" => "North Dakota",
	"OH" => "Ohio",
	"OK" => "Oklahoma",
	"OR" => "Oregon",
	"PA" => "Pennsylvania",
	"PR" => "Puerto Rico",
	"RI" => "Rhode Island",
	"SC" => "South Carolina",
	"SD" => "South Dakota",
	"TN" => "Tennessee",
	"TX" => "Texas",
	"UT" => "Utah",
	"VT" => "Vermont",
	"VA" => "Virginia",
	"VI" => "Virgin Islands",
	"WA" => "Washington",
	"WV" => "West Virginia",
	"WI" => "Wisconsin",
	"WY" => "Wyoming"
);


srand((double)microtime()*1000000);

?>
