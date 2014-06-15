<?php

//------------------------------------------------------------------------------
// Cricket News Administration v4.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------

session_start();
$SID = session_id();

$adminpage = "newsadmin";

		$pagecontainerstart = "
													<article class=\"holder indent1\">
															<div>
																	<h2>News Administration</h2>
																	<div class=\"thumb-pad0\">
																			<div class=\"thumbnail\">
																					<div class=\"caption\">
																						<p>Manage the news articles that appear on the website. Assign articles to related <strong>columns</strong>, assign tags and more.</p>
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
    
		// Set the alerting if they cancel adds or edits

		if(isset($_GET['cancel'])) {
			if($_GET['cancel'] == $adminpage) $cancelr = 'updating the news table';
			$alert = "<div class=\"msg-alerting\"><div class=\"msg-atten\">You have cancelled $cancelr.</div></div>\n";
		} else { }
    

?>

	<script type="text/javascript">
		$(function(){
		$(".search").keyup(function() 
		{ 
		var searchid = $(this).val();
		var dataString = 'search='+ searchid;
		if(searchid!='')
		{
				$.ajax({
				type: "POST",
				url: "ajax_news.php",
				data: dataString,
				cache: false,
				success: function(html)
				{
				$("#result").html(html).show();
				}
				});
		}return false;    
		});

		jQuery(".show").live("click",function(e){
 			$name = $('span.name', this).html();
			var decoded = $("<div/>").html($name).text();
		 	$('#searchid').val(decoded);
 		});
 
		jQuery(document).live("click", function(e) { 
				var $clicked = $(e.target);
				if (! $clicked.hasClass("search")){
				jQuery("#result").fadeOut(); 
				}
		});
		$('#searchid').click(function(){
				jQuery("#result").fadeIn();
		});
		});

		$(function(){
		$(".searchhidden").keyup(function() 
		{ 
		var searchid = $(this).val();
		var dataString = 'searchhidden='+ searchhiddenid;
		if(searchhiddenid!='')
		{
				$.ajax({
				type: "POST",
				url: "ajax_news.php",
				data: dataString,
				cache: false,
				success: function(html)
				{
				$("#result").html(html).show();
				}
				});
		}return false;    
		});

		jQuery(".show").live("click",function(e){
 			$name = $('span.nameid', this).html();
			var decoded = $("<div/>").html($name).text();
		 	$('#searchhiddenid').val(decoded);
 		});
 		
		jQuery(document).live("click", function(e) { 
				var $clicked = $(e.target);
				if (! $clicked.hasClass("searchhidden")){
				jQuery("#result").fadeOut(); 
				}
		});
		$('#searchhiddenid').click(function(){
				jQuery("#result").fadeIn();
		});
		});
	</script>	

<?php 

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
	$tableName = "news";																							// source table
	$targetpage = "main.php?SID=$SID&action=$action";									// target page and query params
	$pagemode = 0;																										// target page mode
	$query = "SELECT COUNT(id) AS num FROM $tableName";								// count records query
	
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
			<a href="javascript:" onclick="document.location = 'main.php?SID=<?=$SID?>&action=<?=$action?>&do=sadd';" class="btn btn-primary">Create</a>
		</div>
	</div>
	
	</form>

	<div class="magrid">
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>date</th>
				<th>title</th>
				<th>user</th>
				<th class="lastcolumn">modify</th>
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

	if (!$db->Exists("SELECT id FROM news")) {

		echo "<tr><td colspan=\"4\">There are currently no articles in the database. You can add one using the <strong>create</strong> button above.</td></tr>\n";

	} else {	
	
	// query the database

	$db->Query("
		SELECT id, DATE_FORMAT(added,'%b %e, %Y') AS added, title, user
		FROM news 
		ORDER BY id DESC 
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['id'];
		$ad = $db->data['added'];
		$ti = $db->data['title'];
		$us = $db->data['user'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>
			
				<td><?=$id?></td>
				<td><?=$ad?></td>
				<td><?=$ti?></td>
				<td><?=$us?></td>
				<td class="lastcolumn">
					<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sedit&id=<?=$id?>"><img src="../images/icons/icon_edit.png" border="0"></a>
					<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sdel&id=<?=$id?>"><img src="../images/icons/icon_delete.png" border="0"></a>				
				</td>
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
	$tableName = "news";																							// source table
	$targetpage = "main.php?SID=$SID&action=$action&do=search&search=$search";	// target page and query params
	$pagemode = "search";																							// target page mode
	$query = "SELECT COUNT(id) AS num FROM (
						SELECT id, MATCH(article, title) AGAINST ('$search' IN BOOLEAN MODE) AS score
						FROM $tableName
						WHERE MATCH(article, title) AGAINST ('$search' IN BOOLEAN MODE)
						HAVING score > 0.25) a";																// count records query
	include("$sitepath/includes/general.pagination.inc");
	
	echo "$pagecontainerstart";
	
	$thecount = $db->QueryItem("
		SELECT COUNT(id) AS num FROM (
		SELECT id, MATCH(article, title) AGAINST ('$search' IN BOOLEAN MODE) AS score
		FROM $tableName
		WHERE MATCH(article, title) AGAINST ('$search' IN BOOLEAN MODE)
		HAVING score > 0.25) a	
	");
	
?>

	<h3><?=$thecount?> <?php if($thecount==1) { echo "record"; } else { echo "records"; } ?> found for your search: <?=$search?> (<a href="main.php?SID=<?=$SID?>&action=<?=$action?>" class="forceunderline">clear filter</a>)</h3>

	<form id="filter-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=search" method="get" enctype="multipart/form-data">
	
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="search">
	<input type="hidden" name="doit" value="1">
	
	<div class="fields">
		<div class="block">
			<input type="text" onfocus="this.value=''" value="filter list" name="search" maxlength="50">
			<a href="javascript:" onclick="document.getElementById('filter-form').submit();" class="btn btn-primary">Go</a>
			<a href="javascript:" onclick="document.location = 'main.php?SID=<?=$SID?>&action=<?=$action?>&do=sadd';" class="btn btn-primary">Create</a>
		</div>
	</div>
	
	</form>
	
	<div class="magrid">
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>date</th>
				<th>title</th>
				<th>user</th>
				<th class="lastcolumn">modify</th>
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
		SELECT n.id, DATE_FORMAT(n.added,'%b %e, %Y') AS added, n.title, n.user, MATCH(n.article, n.title) AGAINST ('$search' IN BOOLEAN MODE) AS score
		FROM news n
		WHERE MATCH(article, title) AGAINST ('$search' IN BOOLEAN MODE)
		HAVING score > 0.25
	")) {

		echo "<tr><td colspan=\"4\">There are currently no articles in the database matching that search. Please try again.</td></tr>\n";

	} else {		

	// query the database

	$db->Query("
		SELECT n.id, DATE_FORMAT(n.added,'%b %e, %Y') AS added, n.title, n.user, MATCH(n.article, n.title) AGAINST ('$search' IN BOOLEAN MODE) AS score
		FROM news n
		WHERE MATCH(article, title) AGAINST ('$search' IN BOOLEAN MODE)
		HAVING score > 0.25
		ORDER BY score DESC, added DESC, id DESC
		LIMIT $offset, $limit
	");
	for ($x=0; $x<$db->rows; $x++) {
		$db->GetRow($x);

		// setup the variables

		$id = $db->data['id'];
		$ad = $db->data['added'];
		$ti = $db->data['title'];
		$us = $db->data['user'];
		
		echo '<tr class="adminrow', ($x % 2 ? '2' : '1'), '">';

?>

				<td><?=$id?></td>
				<td><?=$ad?></td>
				<td><?=$ti?></td>
				<td><?=$us?></td>
				<td class="lastcolumn">
					<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sedit&id=<?=$id?>"><img src="../images/icons/icon_edit.png" border="0"></a>
					<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sdel&id=<?=$id?>"><img src="../images/icons/icon_delete.png" border="0"></a>				
				</td>
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

function add_article_form($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath,$adminpage;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	
	echo "$pagecontainerstart";
	
	// check all checkboxes javascript

?>

	<h3>Add an article</h3>

	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sadd" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="sadd">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>title</label> 
		<input type="text" name="title" maxlength="50">
	</div>

	<div class="block">
	<label>author</label> 
		<input type="text" name="author" maxlength="50">
	</div>	
	
	<div class="block">
	<label>column</label> 
	 <select name="newstype">
		<option value="">select column</option>
		<option value="">--------------------------</option>
			<?php
					$db->Query("SELECT id, title, permalink FROM newstype");
					for ($i=0; $i<$db->rows; $i++) {
						$db->GetRow($i);
						echo "<option value=\"" . $db->data['id'] . "\">" . $db->data['title'] . "</option>\n";
					}
			?>
	 </select>			
	</div>	

	<div class="block">
	<label>social event</label> 
	 <select name="IsFeature">
		<option value="0">is this a social event?</option>
		<option value="0">--------------------------</option>
		<option value="1">Yes</option>
		<option value="0" selected>No</option>
	 </select>			
	</div>
	
	<div class="block">
	<label>master article [<span class="hint--top" data-hint="You may associate this article with a master article that has already been written.&#10;Type in a few letters or words of the master article to see a selectable list appear."><u>?</u></span>]</label> 
		<input type="text" name="MasterText" maxlength="16" id="searchid" class="search" placeholder="Search for a master article">
	</div>

	<div id="result"></div>	
	
	<div class="block" style="display: none;">
	<label>id</label> 
		<input type="text" name="MasterID" maxlength="16" id="searchhiddenid" class="searchhidden" placeholder="id">
	</div>	
	
	<div class="block">
	<label>short sub-name [<span class="hint--top" data-hint="Assuming you have selected a master article, give this article a short name to reference it on the master article.&#10;For example, if this was an umpires report associated with another report, just enter 'Umpires Report'."><u>?</u></span>]</label> 
		<input type="text" name="SubTitle" maxlength="16" placeholder="Enter short reference title">
	</div>	

	<div class="block">
	<label>upload photo [<span class="hint--top" data-hint="JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic">
	</div>

	<div class="block">
	<label>photo text [<span class="hint--top" data-hint="This is the description that will appear under the photo on the news article."><u>?</u></span>]</label> 
		<input type="text" name="picdesc" maxlength="100">
	</div>	
		
	<div class="block">
		<textarea name="article" id="myTextarea"></textarea>
	</div>
	
	<div class="block">
	<label>&nbsp;</label>
	<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&cancel=<?=$adminpage?>" class="btn btn-secondary" style="margin-top: 15px;">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary" style="margin-top: 15px;">Submit</a>
	</div>
	
	</div>
	</form>
	
<?php 

	echo "$pagecontainerend";

}

function do_add_article($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	
	// Get post variables 
	
	$tit = addslashes(trim($_POST['title']));
	$aut = addslashes(trim($_POST['author']));
	$nty = addslashes(trim($_POST['newstype']));
	$eve = addslashes(trim($_POST['IsFeature']));
	$art = addslashes(trim($_POST['article']));
	$sub = addslashes(trim($_POST['SubTitle']));
	$pde = addslashes(trim($_POST['picdesc']));
	$mid = $_POST['MasterID'];
	$dat = date('-Ymd');
	
	// permalink work
	
	$per = preg_replace('/[^a-zA-Z0-9s ]/', '', $tit);
	$per = preg_replace('/  /', ' ', $per);
	$per = preg_replace('/ /', '-', $per);	
	$per = strtolower($per);
	$per = $per.$dat;

	// make sure info is present and correct

	if ($tit == "" || $art == "" || $aut == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete an article title, author and compose an article. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT title FROM news WHERE title='$tit' AND added >= (DATE_SUB(NOW(), INTERVAL 2 DAY))")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">An article with that title was already added today. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// do the photo upload work here
	
	$userpic = preg_replace("/[^A-Z0-9._-]/i", "_",strtolower(basename($_FILES['userpic']['name'])));
	
	// Was a new photo uploaded? If so, process, if not, ignore
	
	if($userpic != "") {

	// lets datestamp the file to help prevent overwrites

	$picdate = date('Ymd_');
	$userpic = $picdate.$userpic; 
	
	// additional file information

	$uploadsize = $_FILES['userpic']['size'];
	$uploadtype = $_FILES['userpic']['type'];
	
	// allowed files
	
	$filetype = exif_imagetype($_FILES["userpic"]["tmp_name"]);
	$allowed = array(IMAGETYPE_GIF, IMAGETYPE_JPEG, IMAGETYPE_PNG);
	
	// destination directory 
	
	$target = "$sitepath/uploadphotos/news/"; 
	$target = $target . $userpic;  
 	
 	// file is too big
 	
	if ($uploadsize > 3500000) { 
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">That photo was too large. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
	
	// if not allowed file 
	
	if (!in_array($filetype, $allowed)) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry! Only jpg, gif, png allowed. You uploaded a $uploadtype. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
 
 	// lets move the file
 
	if(move_uploaded_file($_FILES['userpic']['tmp_name'], $target)) { 
		$ok = 1;
	} else { 
		$ok = 0;
	} 
	
	} else {
	
	$userpic = "";
	$ok = 1;
	
	}
	
	if($ok==1) { 
	// query database

	$db->Insert("INSERT INTO news (title,author,newstype,IsFeature,article,user,added,permalink,MasterID,SubTitle,picdesc,picture) VALUES ('$tit','$aut','$nty','$eve','$art','$sessemail',NOW(),'$per','$mid','$sub','$pde','$userpic')");
		if ($db->a_rows != -1) {

		// event logging
		
		$db->Insert("
			INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
			VALUES ($sessuseri, NOW(), '1', '6', LAST_INSERT_ID(), NULL, '$sessfname $sesslname added article ''$tit''.')
		");

			echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully added a new article. <a href=\"main.php?SID=$SID&action=$action&do=sadd\">Add another</a> | <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";	
			
		} else {
		
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The article could not be added to the database at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";			
		}	
		
	} else {
	
			echo "<div class=\"msg-alerting\"><div class=\"msg-error\">There was an error uploading the image. Try again later. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a></div></div>\n";
			echo "$pagecontainerstart";
			echo "$pagecontainerend";		
	}

}

function delete_article_check($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_GET['id'];

	// query the database

	$db->QueryRow("SELECT id, title, added, user FROM news WHERE id='$id'");

	// setup variables

	$id = $db->data['id'];
	$ad = $db->data['added'];
	$ti = $db->data['title'];
	$us = $db->data['user'];

	// output

	echo "<div class=\"msg-alerting\"><div class=\"msg-atten\">Are you sure you wish to delete the article:\n";
	echo "&nbsp;<b>$ti</b>\n";
	echo "&nbsp;<a href=\"main.php?SID=$SID&action=$action&do=sdel&id=$id&doit=1\">YES</a> | <a href=\"main.php?SID=$SID&action=$action&do=sdel&id=$id&doit=0\">NO</a></div></div>\n";
	
	echo "$pagecontainerstart";
	echo "$pagecontainerend";
}

function do_delete_article($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;
	
	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_GET['id'];

	// query the database

	$db->QueryRow("SELECT id, title, added, user FROM news WHERE id='$id'");

	// setup variables

	$id = $db->data['id'];
	$ad = $db->data['added'];
	$ti = $db->data['title'];
	$us = $db->data['user'];
	
	// decided not to delete

	if (!$_GET['doit']) { 
	
		echo "<div class=\"msg-alerting\"><div class=\"msg-info\">You have chosen NOT to delete: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
	
	} else {

	// do delete

		$db->Delete("DELETE FROM news WHERE id='$id'");
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully deleted: <b>$ti</b>. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		
	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'3','6','$id', NULL, '$sessfname $sesslname deleted article ''$ti''.')
	");
		
	}
}

function edit_article_form($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath,$adminpage,$siteurl;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];
	$id = $_GET['id'];
	
	// query database

	$db->QueryRow("
		SELECT 
			n.id, n.added, n.title, n.user, n.author, n.MasterID, n.SubTitle, n.IsFeature, n.article, n.picdesc, n.picture, n.newstype, 
			t.title AS newstypetitle, m.title AS mastertitle
		FROM news n
		LEFT JOIN newstype t ON t.id = n.newstype
		LEFT JOIN news m ON m.id = n.MasterID
		WHERE n.id='$id'");

	// setup variables

	$add = $db->data['added'];
	$tit = $db->data['title'];
	$use = $db->data['user'];
	$aut = $db->data['author'];
	$sub = $db->data['SubTitle'];
	$art = $db->data['article'];
	$pde = $db->data['picdesc'];
	$pic = $db->data['picture'];
	$nty = $db->data['newstype'];
	$mas = $db->data['MasterID'];
	$mat = $db->data['mastertitle'];
	$nti = $db->data['newstypetitle'];
	$eve = $db->data['IsFeature'];
	
	echo "$pagecontainerstart";
	
	// is there a picture?

	if($pic=="") { 
		$displaypic = "";
	} else {
		$displaypic = "<img src='$siteurl/uploadphotos/news/" . $pic . "'>";
	}

?>

	<h3>Edit Article - <?=$tit?></h3>

	<form id="cricket-form" action="main.php?SID=<?=$SID?>&action=<?=$action?>&do=sedit" method="post" enctype="multipart/form-data">
	<input type="hidden" name="SID" value="<?=$SID?>">
	<input type="hidden" name="action" value="<?=$action?>">
	<input type="hidden" name="do" value="sedit">
	<input type="hidden" name="id" value="<?=$id?>">
	<input type="hidden" name="doit" value="1">

	<div class="fields">

	<div class="block">
	<label>title</label> 
		<input type="text" name="title" maxlength="50" value="<?=$tit?>">
	</div>

	<div class="block">
	<label>author</label> 
		<input type="text" name="author" maxlength="50" value="<?=$aut?>">
	</div>	

	<div class="block">
	<label>column</label> 
	 <select name="newstype">
		<option value="<?=$nty?>"><?=$nti?></option>
		<option value="">--------------------------</option>
			<?php
					$db->Query("SELECT id, title, permalink FROM newstype");
					for ($i=0; $i<$db->rows; $i++) {
						$db->GetRow($i);
						echo "<option value=\"" . $db->data['id'] . "\">" . $db->data['title'] . "</option>\n";
					}
			?>
	 </select>			
	</div>	

	<div class="block">
	<label>social event</label> 
	 <select name="IsFeature">
		<option value="<?=$eve?>"><?php if($eve==1) { echo "Yes"; } else { echo "No"; }?></option>
		<option value="0">--------------------------</option>
		<option value="1">Yes</option>
		<option value="0">No</option>
	 </select>			
	</div>

	<div class="block">
	<label>master article [<span class="hint--top" data-hint="You may associate this article with a master article that has already been written.&#10;Type in a few letters or words of the master article to see a selectable list appear."><u>?</u></span>]</label> 
		<input type="text" name="MasterText" maxlength="16" value="<?=$mat?>" id="searchid" class="search" placeholder="Search for a master article">
	</div>

	<div id="result"></div>	
	
	<div class="block" style="display: none;">
	<label>id</label> 
		<input type="text" name="MasterID" maxlength="16" value="<?=$mas?>" id="searchhiddenid" class="searchhidden" placeholder="id">
	</div>		
	
	<div class="block">
	<label>short sub-name [<span class="hint--top" data-hint="Assuming you have selected a master article, give this article a short name to reference it on the master article.&#10;For example, if this was an umpires report associated with another report, just enter 'Umpires Report'."><u>?</u></span>]</label> 
		<input type="text" name="SubTitle" maxlength="16" value="<?=$sub?>" placeholder="Enter short reference title">
	</div>	

	<?php if($pic=="") { echo ""; } else { ?>
	<div class="block">
	<label>current photo</label>
		<?php echo $displaypic; ?>
	</div>
	<?php } ?>
	
	<div class="block">
	<label>upload photo [<span class="hint--top" data-hint="JPG, GIF or PNG only. No other formats will be accepted."><u>?</u></span>]</label> 
		<input type="file" name="userpic">
	</div>

	<div class="block">
	<label>photo text [<span class="hint--top" data-hint="This is the description that will appear under the photo on the news article."><u>?</u></span>]</label> 
		<input type="text" name="picdesc" maxlength="100" value="<?=$pde?>">
	</div>	
		
	<div class="block">
		<textarea name="article" id="myTextarea"><?=$art?></textarea>
	</div>
	
	<div class="block">
	<label>&nbsp;</label>
	<a href="main.php?SID=<?=$SID?>&action=<?=$action?>&cancel=<?=$adminpage?>" class="btn btn-secondary" style="margin-top: 15px;">Cancel</a>&nbsp;<a href="javascript:" onclick="document.getElementById('cricket-form').submit();" class="btn btn-primary" style="margin-top: 15px;">Submit</a>
	</div>
	
	</div>
	</form>
	
<?php 

	echo "$pagecontainerend";

}

function do_update_article($db)
{
	global $content,$sessuseri,$sessemail,$sessfname,$sesslname,$sessplyid,$pagecontainerstart,$pagecontainerend,$sitepath;

	// Get session get variables
	
	$SID = $_GET['SID'];
	$action = $_GET['action'];	
	$id = $_POST['id'];
	
	// Get post variables 

	$tit = addslashes(trim($_POST['title']));
	$aut = addslashes(trim($_POST['author']));
	$sub = addslashes(trim($_POST['SubTitle']));
	$art = addslashes(trim($_POST['article']));
	$pde = addslashes(trim($_POST['picdesc']));
	$nty = addslashes(trim($_POST['newstype']));
	$eve = addslashes(trim($_POST['IsFeature']));
	$mas = addslashes(trim($_POST['MasterID']));
	$dat = date('-Ymd');
	
	// permalink work
	
	$per = preg_replace('/[^a-zA-Z0-9s ]/', '', $tit);
	$per = preg_replace('/  /', ' ', $per);
	$per = preg_replace('/ /', '-', $per);	
	$per = strtolower($per);
	$per = $per.$dat;

	// make sure info is present and correct

	if ($tit == "" || $art == "" || $aut == "") {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">You must complete an article title, author and compose an article. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
	
	// check for duplicates

	if ($db->Exists("SELECT title FROM news WHERE title='$tit' AND added >= (DATE_SUB(NOW(), INTERVAL 2 DAY)) AND id!='$id'")) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">An article with that title was already added today. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return;
	}
		
	
	// do the photo upload work here
	
	$userpic = preg_replace("/[^A-Z0-9._-]/i", "_",strtolower(basename($_FILES['userpic']['name'])));
	
	// Was a new photo uploaded? If so, process, if not, ignore
	
	if($userpic != "") {

	// lets datestamp the file to help prevent overwrites

	$picdate = date('Ymd_');
	$userpic = $picdate.$userpic; 
	
	// additional file information

	$uploadsize = $_FILES['userpic']['size'];
	$uploadtype = $_FILES['userpic']['type'];
	
	// allowed files
	
	$filetype = exif_imagetype($_FILES["userpic"]["tmp_name"]);
	$allowed = array(IMAGETYPE_GIF, IMAGETYPE_JPEG, IMAGETYPE_PNG);
	
	// destination directory 
	
	$target = "$sitepath/uploadphotos/news/"; 
	$target = $target . $userpic;  
 	
 	// file is too big
 	
	if ($uploadsize > 3500000) { 
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">That photo was too large. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
	
	// if not allowed file 
	
	if (!in_array($filetype, $allowed)) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">Sorry! Only jpg, gif, png allowed. You uploaded a $uploadtype. <a href=\"javascript:history.go(-1)\">Try again</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";
		return; 
	}
 
 	// lets move the file
 
	if(move_uploaded_file($_FILES['userpic']['tmp_name'], $target)) { 
		$ok = 1;
	} else { 
		$ok = 0;
	} 
	
	
	} else { 
	
	$userpic = $db->QueryItem("SELECT picture FROM news WHERE id='$id'");
	
	}
	
	// query database

	$db->Update("UPDATE news SET title='$tit',author='$aut',SubTitle='$sub',article='$art',picdesc='$pde',newstype='$nty',IsFeature='$eve',modified=NOW(),picture='$userpic',permalink='$per',MasterID='$mas' WHERE id='$id'");
	if ($db->a_rows != -1) {
		echo "<div class=\"msg-alerting\"><div class=\"msg-ok\">You have successfully modified article: <b>$tit</b>. <a href=\"main.php?SID=$SID&action=$action\">Article list</a> | <a href=\"main.php?SID=$SID&action=$action&do=sedit&id=$id\">Update more</a></div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			

	// event logging
	
	$db->Insert("
		INSERT INTO events (event_userid, event_date, event_type, event_module, event_objectid, event_associatedid, event_text) 
		VALUES ($sessuseri,NOW(),'2','6','$useri', NULL, '$sessfname $sesslname updated article ''$tit''.')");
		
	} else {
		echo "<div class=\"msg-alerting\"><div class=\"msg-error\">The article <b>$tit</b> could not be modified at this time. <a href=\"main.php?SID=$SID&action=$action\">Back to list</a>.</div></div>\n";
		echo "$pagecontainerstart";
		echo "$pagecontainerend";			
	}
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
case "sadd":
	if (!isset($_POST['doit'])) add_article_form($db);
	else do_add_article($db);
	break;
case "sdel":
	if (!isset($_GET['doit'])) delete_article_check($db);
	else do_delete_article($db);
	break;
case "sedit":
	if (!isset($_POST['doit'])) edit_article_form($db);
	else do_update_article($db);
	break;
case "search":
	search_main_menu($db);
	break;
default:
	show_main_menu($db);
	break;
}

?>
