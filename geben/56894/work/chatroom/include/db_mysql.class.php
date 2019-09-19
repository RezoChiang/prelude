<?php
if(!defined('IS_NUOYUN')) {
	exit('Access Denied');
}
class dbstuff{
 private $link;
function connect($host,$user,$passwd,$dbname='')
{
    $this->link = new mysqli($host,$user,$passwd,$dbname);
                    if($this->link->connect_errno){
                        die( "Mysqli unable to connect:" . $this->link->connect_errno . " - " .$this->link->connect_error);
                    }
                    //设置数据库编码
                  $this->link->set_charset("utf8");
}
function close(){

   $this->link->close();
}
function halt($str)
{
echo '<p style="font-family: Verdana, Tahoma; font-size: 11px; background: #FFFFFF;">'.$str.'</p>';
exit;
}
function query($sql)
{
	if(!($re=$this->link->query($sql)))
	$this->halt('MySQL Query Error:'.$this->link->error.'<br><br>');
	return $re;
}
function fetch_row($query)
{
	return $query->fetch_assoc();
}
function result_array($query)
{
    $result=array();
        while($row=$this->fetch_row($query)){
            $result[]=$row;
        }
        return $result;
}
function num_rows($query)
{
	return mysqli_num_rows($query);
}
function insert_id() {
	return ($id = mysqli_insert_id($this->link)) >= 0 ? $id : $this->result($this->query("SELECT last_insert_id()"), 0);
}
function result($query, $row = 0) {
	$query = @mysqli_result($query, $row);
	return $query;
}
function totxt($str)
{
	$str=strip_tags($str);
          $str=str_replace("\r","",$str);
        $str=str_replace("\r\n","",$str);
	$str=str_replace("\"","“",$str);
	$str=str_replace("'","‘",$str);
	$str=str_replace('\\',"/",$str);
	return $str;
}
function fhtml($str)
{
	//$str=trim($str);
	$str=str_replace("<","&lt;",$str);
	$str=str_replace(">","&gt;",$str);
	$str=str_replace("\n","<br>",$str);
	return $str;
}
function version() {
	return mysqli_get_client_info($this->link);
}
function caihong(){
echo "
<![CDATA[
]]>
";
}
}
?>
