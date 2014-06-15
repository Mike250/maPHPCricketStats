<!--footer-->
<footer>
    <div class="main">
        <div class="container">
            <div class="row">
                <article class="span12">
                    <p><em>Michael Doig &copy; <? echo date("Y");?>.</em> 
                    <a href="<?=$siteurl?>">Home</a> | 
										<a href="<?=$siteurl?>/officers">Contact</a> | 
										<a href="<?=$siteurl?>/privacy">Privacy</a> | 
										<a href="<?=$siteurl?>/sitemap">Site Map</a> &nbsp;&nbsp;&nbsp;&nbsp;
										Licensed to <?=$mysitt?> | <a href="<?=$siteurl?>/changelog">Version Info</a></p>
                </article>
                <!-- {%FOOTER_LINK} -->
            </div>
        </div>
    </div>
</footer>
<script type="text/javascript" src="<?=$siteurl?>/includes/javascripts/bootstrap.js"></script>
<script>
    $('.list1 li figure a').hover(function(){
        $(this).find('em').stop().animate({opacity:0},250, "easeOutSine");		 
            }, function(){
        $(this).find('em').stop().animate({opacity:1},250, "easeOutSine");						 
    })
</script>
<script type="text/javascript">
 var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-7078796-5']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();</script>

</body>
</html>