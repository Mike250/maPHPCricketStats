<?php if (substr_count($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip')) ob_start("ob_gzhandler"); else ob_start(); ?>
<?php

require ("includes/general.config.inc");
require ("includes/class.mysql.inc");
require ("includes/class.fasttemplate.inc");
require ("includes/general.functions.inc");

// Setting the page title for social networking sharing
  
$title = "Northern Districts Cricket Club - Illawarra Cricket Association Wollongong";  
$descr = "Northern Districts Cricket Club, Illawarra Cricket Association, NSW, Australia. Home of the Butchers.";
$metaname = "index, follow, noodp";
$thumb = "$siteurl/images/butchers.jpg";

include ("includes/header.inc"); 

?>

<div style="display:none;">
	<?php

	// Pre-load the homepage news images

		$db->Query("
			SELECT n.picture 
			FROM news n 
			LEFT JOIN news s ON n.id = s.MasterID 
			WHERE n.IsPending = 0 AND n.IsFeature = 0 AND n.MasterID = '' 
			ORDER BY n.added DESC, n.id DESC 
			LIMIT 8");	

		for ($p=0; $p<$db->rows; $p++) {
			$db->GetRow($p);

		$pic = $db->data['picture'];

		echo "<img src=\"http://www.butchercricket.com/imgsize.php?w=418&amp;h=307&amp;img=http://www.butchercricket.com/uploadphotos/news/$pic\" alt=\"$pic\" width=\"418\" height=\"307\" />\n";

		}											

	?>	
</div>
<?=$linebreak?>
<div id="menutable">
 <div id="menurow">
  <div id="menuleft">
		<div class="container" align="left">              	
		 <div class="l-rotator">
			<div class="screen">
			 <noscript>
			 <!-- placeholder image when javascript is off -->
			 <img src="images/random/randombutcher7.jpg" alt=""/>
			 </noscript>
			</div>
			<div class="thumbnails">
			 <ul><?php include("includes/shownews8.php"); ?></ul>
			</div>           
		 </div>
		</div>
  </div>
 </div>
</div>
<!-- Main Body Section -->
<table style="width:990px;" cellspacing="0" cellpadding="0" border="0" align="center">
	<tr>
		<td valign="top">

		<!-- Left Column Section -->
		<table style="width:698px;" cellspacing="0" cellpadding="0" border="0" align="center">
			<tr>
				<td valign="top">
				<div id="HomeNewsSection">

				<table style="width:698px;" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td valign="top" style="width:360px;">
						<table style="width:360px;" border="0" cellspacing="0" cellpadding="0" align="left">
							<!-- Start Butcher Features Section -->
							<tr>
								<td valign="top">
								<?=$linebreak?>
								<div id="ButcherFeaturesSection">
								
										<table border="0" style="width:360px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0" align="center">
											<tr>
												<td class="greyshade" height="23">&nbsp;<b>MUST SEE BUTCHER FEATURES</b></td>
											</tr>
											<tr>
												<td style="background: #FFFFFF;" valign="top">
												<?php include ("$sitepath/includes/showminifeatures.php"); ?>
												</td>
											</tr>
										</table>								
								</div>
								</td>
							</tr>
							<!-- End Butcher Features Section -->
							<!-- Start Fantasy Ladder Section -->	
							<!--
							<tr>
								<td valign="top">
								<?=$linebreak?>
								<table style="width:360px; background: #FFFFFF;" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td valign="top">								
										<table border="0" style="width:360px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0" align="center">
											<tr>
												<td class="greyshade" height="23">&nbsp;<b>FANTASY COMP</b></td>
											</tr>
											<tr>
												<td style="background: #FFFFFF;" valign="top">
												<div id="FantasyStandingsSection">
												<?php include("$sitepath/includes/showminifantasyladder.php"); ?>
												</div>
												</td>
											</tr>
										</table>
										</td>
									</tr>
								</table>								
								</td>
							</tr>
							-->
							<!-- End Fantasy Ladder Section -->								
							<!-- Start Quick Numbers Section -->				
							<tr>
								<td valign="top">
								<?=$linebreak?>
								<table style="width:360px; background: #FFFFFF;" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td valign="top">								
										<table border="0" style="width:360px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0" align="center">
											<tr>
												<td class="greyshade" height="23">&nbsp;<b>QUICK NUMBERS</b></td>
											</tr>
											<tr>
												<td style="background: #FFFFFF;" valign="top">
												<div id="QuickNumbersSection">
												<?php include("$sitepath/includes/showquicknumbers.php"); ?>
												</div>
												</td>
											</tr>
										</table>
										</td>
									</tr>
								</table>								
								</td>
							</tr>
							<!-- End Quick Numbers Section -->							
						</table>
						</td>
						<td align="left" style="width: 4px;">&nbsp;</td>
						<td align="right" valign="top">
						<?=$linebreak?>
						<!-- Start Weekly Leaders Section -->
						<!--
							<div id="TopPerformersSection">
						<table style="width:334px;" style="background: #FFFFFF;" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top">
								<table style="width:334px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0">
									<tr>
										<td class="greyshade" height="23" align="left">&nbsp;<b>TOP PERFORMANCES</b></td>
									</tr>
									<tr>
										<td valign="top">
											<?php include ("$sitepath/includes/showminiweeklyleaders.php"); ?>
										</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
						</div>					
						-->
						<!-- End Weekly Leaders Section -->
						<!-- Start Charts Section -->
						<div id="ChartsSection">
						<a href="<?=$siteurl?>/search.php"><img src="<?=$siteurl?>/images/playercharts.jpg" border="0"></a>
						</div>
						<!-- End Charts Section -->
						<?=$linebreak?>
						<!-- Start Fun Facts Section -->
						<div id="FunFactSection">
						<table style="width:334px;" style="background: #FFFFFF;" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top">
								<table border="0" style="width:334px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0">
									<tr>
										<td class="greyshade" height="23" align="left">&nbsp;<b>FUN FACT</b></td>
									</tr>
									<tr>
										<td valign="top">
											<?php
												srand((double)microtime()*1000000);
												$num = rand(1,2);
												include ('includes/bits/showbit'.$num.'.php');
											?>
										</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
						</div>
						<!-- End Fun Facts Section -->
						<?=$linebreak?>
						<!-- Start They Said It Section -->
						<div id="TheySaidItSection">
						<table style="width:334px;" style="background: #FFFFFF;" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top">
								<table border="0" style="width:334px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0">
									<tr>
										<td class="greyshade" height="23" align="left">&nbsp;<b>THEY SAID IT</b></td>
									</tr>
									<tr>
										<td valign="top"><?php include ("$sitepath/includes/showquotes.php"); ?></td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
						</div>
						<!-- End They Said It Section -->
						<?=$linebreak?>	
						<!-- Mini Weather Section -->
						<div id="WeatherSection">
						<table border="0" style="width:334px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0">
							<tr>
								<td class="greyshade" height="23" align="left">&nbsp;<b>WEATHER</b></td>
							</tr>
							<tr>
								<td valign="top" style="background: #FFFFFF;"><?php include("$sitepath/boxweather.php"); ?></td>
							</tr>
						</table>	
						</div>
						<!-- End Mini Weather Section -->
						</td>
					</tr>
				</table>
				</div>
				</td>
			</tr>
		</table>
		</td>
		<td align="left" style="width: 4px;">&nbsp;</td>
		<!-- Right Column Section -->
		<td valign="top">
		<table style="width:286px;" cellspacing="0" cellpadding="0" border="0" align="center">
			<tr>
				<td valign="top">	
				<?=$linebreak?>		
				<!-- Weekend Match Center Section -->
				<table border="0" style="width:286px; border: solid 1px <?=$bluebdr?>;" cellspacing="0" cellpadding="0">
					<tr>
						<?php
							// Check to see if today is Sat or Sun and display live scores if so

  							$b = time ()+61200; // +17 hours from server time 17*60*60
  							if(date("l",$b)=="Saturday" || date("l",$b)=="Sunday" || date("l",$b)=="Friday") {
  								$matchcenter = "LIVE SCOREBOARD";
  							} else {
  								$matchcenter = "WEEKEND MATCH CENTER";
  							}
						?>	 
						<td class="blueshade" height="23">&nbsp;<b><?=$matchcenter?></b></td>
					</tr>
					<tr>
						<td valign="top" style="background:url(http://www.butchercricket.com/images/livescoresbg.jpg); background-color: #032437;">
							<?php include("$sitepath/boxscoreboard.php"); ?>
						</td>
					</tr>
				</table>
				<?=$linebreak?> 				
				<!-- Begin YouTube Video Section -->
				<!--
				<table style="width:286px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="greyshade" height="23" align="left">&nbsp;<b>BUTCHER TV</b></td>
					</tr>
					<tr>
					  <td valign="top" style="background: #000000;"><iframe src="http://player.vimeo.com/video/23129079?title=0&amp;byline=0&amp;portrait=0&amp;autoplay=0" width="281" frameborder="0"></iframe></td>
					</tr>
				</table>
				<?=$linebreak?> -->
				<!-- Mini Standings Section -->
				<table style="width:286px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="greyshade" height="23" align="left">&nbsp;<b>STANDINGS</b></td>
					</tr>
					<tr>
						<td valign="top" style="background: #FFFFFF;"><?php include("$sitepath/boxstandings.php"); ?></td>
					</tr>
				</table>
				<?=$linebreak?>
				<!-- Mini Schedule Section -->
				<table style="width:286px; border: solid 1px <?=$greybdr?>;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="greyshade" height="23" align="left">&nbsp;<b>NEXT GAMES</b></td>
					</tr>
					<tr>
						<td valign="top" style="background: #FFFFFF;"><?php include("$sitepath/boxschedule.php"); ?></td>
					</tr>
				</table>
				<!-- End Mini Schedule Section -->
				<?=$linebreak?>
				</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<?php include ("$sitepath/includes/footer.inc"); ?>




