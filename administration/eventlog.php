<?php

//------------------------------------------------------------------------------
// Cricket Event Log Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

$adminpage = "eventlog";

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>Event Logs</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Review the operations performed on the website. This is where you should look if you have security concerns or are researching 
																						who is responsible for modifying data in the website.</p>
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

function show_main_menu($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	

	//-------------------------------------------------
	// Pagination
	//-------------------------------------------------

	$limit = 25;																											// how many rows to show per page
	$pageNum = 1;																											// by default we show first page	
	if(isset($_GET['page'])) { $pageNum = $_GET['page']; } 						// if $_GET['page'] defined, use it as page number
	$offset = ($pageNum - 1) * $limit;																// counting the offset
	$tableName = "events";																						// source table
	$targetpage = "main.php?SID=$SID&action=$action";									// target page and query params
	$pagemode = 0;																										// target page mode
	$query = "SELECT COUNT(event_id) AS num FROM $tableName";					// count records query
	
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";
	
?>

	<form id="filter-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=search" method="get" enctype="multipart/form-data">
	
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="search">
	<input type="hidden" name="doit" value="1">
	
	<div class="fields">
		<div class="block">
			<input type="text" onfocus="this.value=''" value="filter list" name="search" maxlength="50">
			<a href="javascript:" onclick="document.getElementById('filter-form').submit();" class="btn btn-primary">Go</a>
		</div>
	</div>
	
	</form>

	<div class="magrid">
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th style="min-width: 90px;">date</th>
				<th>user</th>
				<th>log</th>
				<th class="lastcolumn">type</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="5">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php

	// check for empty database

	if (!$db->Exists("SELECT event_id FROM events")) {

		echo "<tr><td colspan=\"4\">There are currently no events in the database, which actually isn't possible.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT ev.event_id, DATE_FORMAT(ev.event_date,'%b %e, %Y') AS added, ev.event_userid, ad.email AS event_user, ev.event_text, ty.event_type_name,
			DATE_FORMAT(ev.event_date,'%b %e, %Y %l:%i %p') AS fulldatetime
		FROM events ev
		JOIN admin ad ON ad.id = ev.event_userid
		JOIN event_types ty ON ty.event_type_id = ev.event_type
		ORDER BY ev.event_id DESC 
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['event_id'];
		$ad = $db->data['added'];
		$fd = $db->data['fulldatetime'];
		$ti = $db->data['event_text'];
		$us = $db->data['event_user'];
		$ty = $db->data['event_type_name'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>
			
				<td><?=$id?></td>
				<td title="<?=$fd?>"><?=$ad?></td>
				<td><?=$us?></td>
				<td><?=$ti?></td>
				<td class="lastcolumn"><?=$ty?></td>
			</tr>
			
<?php 
	
		} 
	}	
	
?>

		</tbody>
	</table>
	</div>

<?php

	echo "$pagecontainerend";
	
}

function search_main_menu($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$search = $_GET['search'];

	//-------------------------------------------------
	// Pagination
	//-------------------------------------------------

	$limit = 25;																											// how many rows to show per page
	$pageNum = 1;																											// by default we show first page	
	if(isset($_GET['page'])) { $pageNum = $_GET['page']; } 						// if $_GET['page'] defined, use it as page number
	$offset = ($pageNum - 1) * $limit;																// counting the offset
	$tableName = "events";																						// source table
	$targetpage = "main.php?SID=$SID&action=$action&do=search&search=$search";	// target page and query params
	$pagemode = "search";																							// target page mode
	$query = "SELECT COUNT(event_id) AS num FROM (
								SELECT 
									ev.event_id, DATE_FORMAT(ev.event_date,'%b %e, %Y') AS added, ev.event_userid, ad.email AS event_user, ev.event_text, ty.event_type_name,
									MATCH(ev.event_text) AGAINST ('$search' IN BOOLEAN MODE) AS score
								FROM events ev
								JOIN admin ad ON ad.id = ev.event_userid
								JOIN event_types ty ON ty.event_type_id = ev.event_type
								WHERE MATCH(ev.event_text) AGAINST ('$search' IN BOOLEAN MODE)
								HAVING score > 0.25) a";														// count records query
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";

	$thecount = $db->QueryItem("
			SELECT COUNT(event_id) AS num FROM (
			SELECT 
				ev.event_id, DATE_FORMAT(ev.event_date,'%b %e, %Y') AS added, ev.event_userid, ad.email AS event_user, ev.event_text, ty.event_type_name,
				MATCH(ev.event_text) AGAINST ('$search' IN BOOLEAN MODE) AS score
			FROM events ev
			JOIN admin ad ON ad.id = ev.event_userid
			JOIN event_types ty ON ty.event_type_id = ev.event_type
			WHERE MATCH(ev.event_text) AGAINST ('$search' IN BOOLEAN MODE)
			HAVING score > 0.25) a	
	");
?>

	<h3><?=$thecount?> <?php if($thecount==1) { echo "record"; } else { echo "records"; } ?> found for your search: <?=$search?></h3>

	<form id="filter-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=search" method="get" enctype="multipart/form-data">
	
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="search">
	<input type="hidden" name="doit" value="1">
	
	<div class="fields">
		<div class="block">
			<input type="text" onfocus="this.value=''" value="filter list" name="search" maxlength="50">
			<a href="javascript:" onclick="document.getElementById('filter-form').submit();" class="btn btn-primary">Go</a>
		</div>
	</div>
	
	</form>
	
	<div class="magrid">
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th style="min-width: 90px;">date</th>
				<th>user</th>
				<th>log</th>
				<th class="lastcolumn">type</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="5">
					<?=$paginate?>
				</td>
			</tr>
		</tfoot>
		<tbody>

<?php 

	// check for empty database

	if (!$db->Exists("
		SELECT 
			ev.event_id, DATE_FORMAT(ev.event_date,'%b %e, %Y') AS added, ev.event_userid, ad.email AS event_user, ev.event_text, ty.event_type_name,
			MATCH(ev.event_text) AGAINST ('$search' IN BOOLEAN MODE) AS score
		FROM events ev
		JOIN admin ad ON ad.id = ev.event_userid
		JOIN event_types ty ON ty.event_type_id = ev.event_type
		WHERE MATCH(ev.event_text) AGAINST ('$search' IN BOOLEAN MODE)
		HAVING score > 0.25
	")) {

		echo "<tr><td colspan=\"4\">There are currently no event logs in the database matching that search. Please try again.</td></tr>\n";

	} else {		

	// query the database

	$db->Query("
		SELECT 
			ev.event_id, DATE_FORMAT(ev.event_date,'%b %e, %Y') AS added, ev.event_userid, ad.email AS event_user, ev.event_text, ty.event_type_name,
			MATCH(ev.event_text) AGAINST ('$search' IN BOOLEAN MODE) AS score
		FROM events ev
		JOIN admin ad ON ad.id = ev.event_userid
		JOIN event_types ty ON ty.event_type_id = ev.event_type
		WHERE MATCH(ev.event_text) AGAINST ('$search' IN BOOLEAN MODE)
		HAVING score > 0.25
		ORDER BY score DESC, ev.event_id DESC 
		LIMIT $offset, $limit
		
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['event_id'];
		$ad = $db->data['added'];
		$ti = $db->data['event_text'];
		$us = $db->data['event_user'];
		$ty = $db->data['event_type_name'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>

				<td><?=$id?></td>
				<td><?=$ad?></td>
				<td><?=$us?></td>
				<td><?=$ti?></td>
				<td class="lastcolumn"><?=$ty?></td>
			</tr>
			
<?php 
		}
	}
?>

		</tbody>
	</table>
	</div>

<?php

	echo "$pagecontainerend";
	
}
// main program

//if (!$USER[flags][$f_news_admin]) {
//	header("Location: main.php?SID=$SID");
//	exit;
//}

?>


        <section class="span8 margTop">
            <div class="row">
                <div class="span8">
                	<?php echo "$alert"; ?>


<?php

// do the main switch

switch($_GET['do']) {
case "search":
	search_main_menu($db);
	break;
default:
	show_main_menu($db);
	break;
}

?>
