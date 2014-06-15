<?
  //$link = mysql_connect('p41mysql177.secureserver.net', 'ndcccricketclub', 'Cr1cket')
  //or die('Could not connect: ' . mysql_error());

  //mysql_select_db('ndcccricketclub') or die('Could not select database');

//DEFINE ('DB_USER', 'ndcccricketclub');
//DEFINE ('DB_PASSWORD', 'Cr1cket');
//DEFINE ('DB_HOST', 'p41mysql177.secureserver.net');
//DEFINE ('DB_NAME', 'ndcccricketclub');

DEFINE ('DB_USER', 'thesqlblokecom');
DEFINE ('DB_PASSWORD', '8EVG^Bvu');
DEFINE ('DB_HOST', 'mysql.thesqlbloke.com');
DEFINE ('DB_NAME', 'maphpcricket');

// Make the connnection and then select the database.
$dbc = @mysql_connect (DB_HOST, DB_USER, DB_PASSWORD) OR die ('Could not connect to MySQL: ' . mysql_error() );
mysql_select_db (DB_NAME) OR die ('Could not select the database: ' . mysql_error() );

?>
