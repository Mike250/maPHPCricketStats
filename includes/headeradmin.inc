<!DOCTYPE html>
<html lang="en">
<?php 

// open up db connection now so you don't have to in every other file
$db = new mysql_class($dbcfg['login'],$dbcfg['pword'],$dbcfg['server']);
$db->SelectDB($dbcfg[db]);
	
// Get current month

$ctime = time ()+61200; // +17 hours from server time 17*60*60
$cmont = date("F",$ctime); 

// Get the current season

$db->QueryRow("
	SELECT 
		myYear, 
		mySeason, 
		mySeasonName, 
		mySiteTitle, 
		myURL, 
		myWebmaster, 
		myKeywords, 
		myDescription, 
		myLogo, 
		myFavicon, 
		primary_colour_1
	FROM websiteadmin");

$myyear = $db->data['myYear'];
$myseid = $db->data['mySeason'];
$mysena = $db->data['mySeasonName'];	
$mysitt = $db->data['mySiteTitle'];
$myurl  = $db->data['myURL'];
$mywebm = $db->data['myWebmaster'];
$mykeyw = $db->data['myKeywords'];
$mydesc = $db->data['myDescription'];
$mycol1 = $db->data['primary_colour_1'];
$mylogo = $db->data['myLogo'];
$myfavi = $db->data['myFavicon'];

?>
<head>
<title><?=$mysitt?> - Administration</title>
<meta charset="utf-8">
<link rel="icon" href="<?=$siteurl?>/uploadphotos/website/<?=$myfavi?>" type="image/x-icon">
<link rel="shortcut icon" href="<?=$siteurl?>/uploadphotos/website/<?=$myfavi?>" type="image/x-icon" />
<meta name="description" content="<?=$mydesc?>">
<meta name="keywords" content="<?=$mykeyw?>">
<meta name="author" content="Michael Doig">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<!--CSS-->
<link rel="stylesheet" href="<?=$siteurl?>/includes/stylesheets/maphpcricket.css">
<link rel="stylesheet" href="<?=$siteurl?>/includes/stylesheets/bootstrap.css">
<link rel="stylesheet" href="<?=$siteurl?>/includes/stylesheets/responsive.css">
<link rel="stylesheet" href="<?=$siteurl?>/includes/stylesheets/style.css">
<link rel="stylesheet" href="<?=$siteurl?>/includes/stylesheets/camera.css">
<link rel="stylesheet" href="<?=$siteurl?>/includes/stylesheets/jquery.fancybox.css">
<link rel="stylesheet" href="<?=$siteurl?>/includes/font/font-awesome.css">
<link rel="stylesheet" href="<?=$siteurl?>/includes/stylesheets/hint.css">
<!--JS-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js "></script>
<script src="<?=$siteurl?>/includes/javascripts/jquery-migrate-1.1.1.js"></script>
<script src="<?=$siteurl?>/includes/javascripts/superfish.js"></script>
<script src="<?=$siteurl?>/includes/javascripts/jquery.mobilemenu.js"></script>
<script src="<?=$siteurl?>/includes/javascripts/jquery.cookie.js"></script>
<script src="<?=$siteurl?>/includes/javascripts/jquery.easing.1.3.js"></script>
<script src="<?=$siteurl?>/includes/javascripts/jquery.equalheights.js"></script>
<script src="<?=$siteurl?>/includes/javascripts/camera.js"></script>
<script src="<?=$siteurl?>/includes/javascripts/jquery.fancybox.pack.js"></script>
<script>
    $(document).ready(function(){
        jQuery('.camera_wrap').camera();
    });
</script>
<script>
    $(window).load(function() {
        $(function() {$("a.various").fancybox();});
    });
</script>
<script>
$(window).load(function() {
        $('#tab_preview a').click(function (e) {
    		e.preventDefault();
    		$(this).tab('show');
        })	 				
    });
</script>
<script src="<?=$siteurl?>/includes/javascripts/tinymce/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector:"textarea#myTextarea",
		statusbar: true,
		menubar: false,
		plugins: ["link image code autoresize"],
		toolbar: "undo redo | bold italic | bullist numlist | link image | code removeformat",
		width: "100%",
		height: 270
	});
</script>

</head>
<body>
<div class="global">
<div class="main bg indent">
    <!--header-->
    <header>
        <div class="container">
            <div class="row">
                <article class="span12">
                    <h1 class="brand"><a href="main.php"><?php if($mylogo == "") { ?><img src="<?=$siteurl?>/images/design/logo.png" alt="<?=$mysitt?>"><?php } else { ?><img src="<?=$siteurl?>/uploadphotos/website/<?=$mylogo?>" alt=""><?php } ?></a></h1>
                    <div class="follow-box">
                        <ul class="follow_icons">
                            <li><a href="#" class="icon-twitter">&nbsp;</a></li>
                            <li><a href="#" class="icon-facebook">&nbsp;</a></li>
                            <li><a href="#" class="icon-rss">&nbsp;</a></li>
                        </ul>
                        <br>
                        <form id="search" class="search" action="<?=$siteurl?>/search.php" method="GET" accept-charset="utf-8">
                        	 <input type="text" onFocus="if(this.value =='' ) this.value=''" onBlur="if(this.value=='') this.value=''" value="" name="s">
                             <a href="#" onClick="document.getElementById('search').submit()" class="btn btn-primary">Search</a>
                        </form>
                    </div>
                </article>
                <article class="span12">
                    <div class="navbar navbar_ clearfix">
                        <div class="navbar-inner">      
                            <div class="clearfix">
                                <div class="nav-collapse nav-collapse_">
                                    <ul class="nav sf-menu clearfix">
                                    		<?php 
                                    			if(
                                    				$_GET['action'] == ""
                                    			) 
                                    			{ $activeclass = " active"; 
                                    			} else { $activeclass = ""; } 
                                    		?>
                                        <li class="<?=$activeclass?>"><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>">Home<em></em></a></li> 
                                        <?php 
                                        	if(
                                        		$_GET['action'] == "cpasswd" || 
                                        		$_GET['action'] == "myplayeradmin"
                                        	) 
                                        	{ $activeclass = " active"; 
                                        	} else { $activeclass = ""; } 
                                        ?>
                                        <li class="sub-menu<?=$activeclass?>"><a href="index-1.html">Account<span></span><em></em></a> 
                                            <ul class="submenu">
                                                <li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=cpasswd">Change Password</a></li>
                                                <li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=myplayeradmin&do=sedit&id=<?=$sessplyid?>">My Player Profile</a></li> 
                                                <li><a href="<?=$siteurl?>/administration/logout.php?SID=<?=$SID?>">Logout</a></li> 
                                            </ul>  
                                        </li> 
                                        <?php 
                                        	if(
                                        		$_GET['action'] == "mysiteadmin" || 
                                        		$_GET['action'] == "useradmin" ||  
                                        		$_GET['action'] == "eventlog"
                                        	) 
                                        	{ $activeclass = " active"; 
                                        	} else { $activeclass = ""; } 
                                        ?>
                                        <li class="sub-menu<?=$activeclass?>"><a href="#">Admin<span></span><em></em></a>
                                            <ul class="submenu">
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=useradmin">User Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=mysiteadmin&do=sedit">Website Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=eventlog">Event Logs</a></li>
                                            </ul>
                                        </li>
                                        <?php 
                                        	if(
                                        		$_GET['action'] == "newsadmin" || 
                                        		$_GET['action'] == "documentadmin" || 
                                        		$_GET['action'] == "historyadmin"
                                        	) 
                                        	{ $activeclass = " active"; 
                                        	} else { $activeclass = ""; } 
                                        ?>
                                        <li class="sub-menu<?=$activeclass?>"><a href="#">Website<span></span><em></em></a>
                                            <ul class="submenu">
                                            	<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=historyadmin">History Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=newsadmin">News Administration</a></li>			
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=documentadmin">Document Administration</a></li>			
                                            </ul>
                                        </li>
                                        <?php 
                                        	if(
                                        		$_GET['action'] == "clubadmin" || 
                                        		$_GET['action'] == "teamadmin" ||
                                        		$_GET['action'] == "groundadmin"  || 
                                        		$_GET['action'] == "scheduleadmin"  || 
                                        		$_GET['action'] == "playeradmin" 
                                        	) 
                                        	{ $activeclass = " active"; 
                                        	} else { $activeclass = ""; } 
                                        ?>
                                        <li class="sub-menu<?=$activeclass?>"><a href="#">League<span></span><em></em></a>
                                            <ul class="submenu">
                                            	<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=clubadmin">Clubs Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=teamadmin">Teams Administration</a></li>																							
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=groundadmin">Grounds Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=playeradmin">Players Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=scheduleadmin">Schedule Administration</a></li>
                                            </ul>
                                        </li>                                        
                                        <?php 
                                        	if(
																						$_GET['action'] == "newstypeadmin" || 
																						$_GET['action'] == "seasonsadmin" || 
																						$_GET['action'] == "yearadmin" || 
																						$_GET['action'] == "conferenceadmin" || 
																						$_GET['action'] == "leagueadmin" ||
																						$_GET['action'] == "pooladmin" || 
																						$_GET['action'] == "awardtypeadmin"
																					) 
																					{ $activeclass = " active"; 
																					} else { $activeclass = ""; } 
                                        ?>
                                        <li class="sub-menu<?=$activeclass?>"><a href="#">Misc<span></span><em></em></a>
                                            <ul class="submenu">
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=awardtypeadmin">Award Types Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=conferenceadmin">Conference Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=leagueadmin">League Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=newstypeadmin">News Column Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=pooladmin">Pool Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=seasonsadmin">Season Administration</a></li>
																							<li><a href="<?=$siteurl?>/administration/main.php?SID=<?=$SID?>&action=yearadmin">Year Administration</a></li>
                                            </ul>
                                        </li>                                        
                                    </ul>
                                </div>                                                                                                                
                            </div>
                        </div>  
                    </div>
                </article>
            </div>
        </div>
    </header>
</div>
