<?php

//------------------------------------------------------------------------------
// General.Pagination.Inc v3.0
//
// (c) Andrew Collington - amnuts@talker.com
// (c) Michael Doig      - michael@mike250.com
//------------------------------------------------------------------------------
		
	$total_pages = mysql_fetch_array(mysql_query($query));
	$total_pages = $total_pages[num];
	
	$stages = 2;
	$page = mysql_escape_string($_GET['page']);
	if($page){
		$start = ($page - 1) * $limit; 
	}else{
		$start = 0;	
		}	
		
	// Initial page num setup
	
	if ($page == 0){$page = 1;}
	$prev = $page - 1;	
	$Next = $page + 1;							
	$lastpage = ceil($total_pages/$limit);		
	$LastPagem1 = $lastpage - 1;					
	
	$paginate = '';
	if($lastpage > 1)
	{	
	
	$paginate .= "<div id=\"paging\">";
	$paginate .= "<ul>";
		
	// Previous

	if ($page > 1){
		$paginate.= "<li><a href='$targetpage&page=$prev'><span>Previous</span></a></li>";
	}else{
		$paginate.= "<li><a href='#' style='background: #e9e9e9; color: #333333;'><span>Prev</span></a></li>";	}
		
	// Pages	
	
	if ($lastpage < 7 + ($stages * 2))	// Not enough pages to breaking it up
	{	
		for ($counter = 1; $counter <= $lastpage; $counter++)
		{
			if ($counter == $page){
				$paginate.= "<li><a href='#' style='background: #014828;'><span>$counter</span></a></li>";
			}else{
				$paginate.= "<li><a href='$targetpage&page=$counter'><span>$counter</span></a></li>";}					
		}
	}
	
	elseif($lastpage > 5 + ($stages * 2))	// Enough pages to hide a few?
	{
	
		// Beginning only hide later pages
		
		if($page < 1 + ($stages * 2))		
		{
			for ($counter = 1; $counter < 4 + ($stages * 2); $counter++)
			{
				if ($counter == $page){
					$paginate.= "<li><a href='#' style='background: #014828;'><span>$counter</span></a></li>";
				}else{
					$paginate.= "<li><a href='$targetpage&page=$counter'><span>$counter</span></a></li>";}					
			}
			$paginate.= "<i>...</i>";
			$paginate.= "<li><a href='$targetpage&page=$LastPagem1'><span>$LastPagem1</span></a></li>";
			$paginate.= "<li><a href='$targetpage&page=$lastpage'><span>$lastpage</span></a></li>";		
		}
		
		// Middle hide some front and some back
		
		elseif($lastpage - ($stages * 2) > $page && $page > ($stages * 2))
		{
			$paginate.= "<li><a href='$targetpage&page=1'><span>1</span></a></li>";
			$paginate.= "<li><a href='$targetpage&page=2'><span>2</span></a></li>";
			$paginate.= "<i>...</i>";
			for ($counter = $page - $stages; $counter <= $page + $stages; $counter++)
			{
				if ($counter == $page){
					$paginate.= "<li><a href='#' style='background: #014828;'><span>$counter</span></a></li>";
				}else{
					$paginate.= "<li><a href='$targetpage&page=$counter'><span>$counter</span></a></li>";}					
			}
			$paginate.= "<i>...</i>";
			$paginate.= "<li><a href='$targetpage&page=$LastPagem1'><span>$LastPagem1</span></a></li>";
			$paginate.= "<li><a href='$targetpage&page=$lastpage'><span>$lastpage</span></a></li>";		
		}
		
		// End only hide early pages
		
		else
		{
			$paginate.= "<li><a href='$targetpage&page=1'><span>1</span></a></li>";
			$paginate.= "<li><a href='$targetpage&page=2'><span>2</span></a></li>";
			$paginate.= "<i>...</i>";
			for ($counter = $lastpage - (2 + ($stages * 2)); $counter <= $lastpage; $counter++)
			{
				if ($counter == $page){
					$paginate.= "<li><a href='#' style='background: #014828;'><span>$counter</span></a></li>";
				}else{
					$paginate.= "<li><a href='$targetpage&page=$counter'><span>$counter</span></a></li>";}					
			}
		}
	}

	// Next
	
	if ($page < $counter - 1){ 
		$paginate.= "<li><a href='$targetpage&page=$Next'><span>Next</span></a></li>";
	}else{
		$paginate.= "<li><a href='#' style='background: #e9e9e9; color: #333333;'><span>Next</span></a></li>";
		}

	$paginate.= "</ul>";
	$paginate.= "</div>";		
	
}
	
	// figure out what records we're showing

	if($page == 1) { 
		$startrecord = "1";
		$endrecord = $startrecord * $limit;
		if($endrecord > $total_pages) { 
			$endrecord = $total_pages;
		} else {
			$endrecord = $startrecord * $limit;
		}
	} else {
		$startrecord = ($page * $limit)-($limit-1);
		$endrecord = $page * $limit;
		if($endrecord > $total_pages) { 
			$endrecord = $total_pages;
		} else {
			$endrecord = $page * $limit;
		}
	}

?>
