<?php
require_once './include/common.inc.php';
$response=array(
    "code"=>0,
    "msg"=>"success"
);
switch($act){
    case "api":
        if ( empty($rid)  ) {
            output_json(array(
                'code'=>-1,
                'msg'=>'请从主站进入'
            ));
        } // End If
        $u=$username;
        $p=empty($password)?'default_passwd_irs':$password;
        // 2019/09/12 - 纯后端验证, 所以只要用户名匹配, 密码就不管了
        if ( !$debug_mode && $token != md5($u.$api_key)  ) {
            output_json(array(
                'code'=>-2,
                'msg'=>'参数不正确'
            ));
        } // End If
        $u=$api_user_prefix[$rid].$u;
        $query = $db->query("select uid, gid from {$tablepre}members where username='{$u}' limit 1");
        if ($db->num_rows($query)){
            $uid=$db->fetch_row($query)['uid'];
            $old_gid=$db->fetch_row($query)['gid'];
            if ( !empty($gid) && $old_gid!=$gid ) {
                $db->query("update {$tablepre}members set gid='$gid' where uid='{$uid}'");
            } // End If
        }else{
            $p=md5($p);
            $db->query("insert into {$tablepre}members(username,password,sex,email,regdate,regip,lastvisit,lastactivity,gold,realname,gid,phone,tuser,state,roomid)	values('$u','$p','2','$email','$regtime','$onlineip','$regtime','$regtime','0','$qq','$gid','$phone','$tuser','$state','$rid')");
            $uid=$db->insert_id();
            $db->query("replace into {$tablepre}memberfields (uid,nickname)	values('$uid','土豪$uid')");
            $db->query("insert into  {$tablepre}msgs(rid,ugid,uid,uname,tuid,tname,mtime,ip,msg,type,roomid)
	values('{$rid}','1','{$uid}','{$u}','{$cfg[config][defvideo]}','{$cfg[config][defvideonick]}','".gdate()."','{$onlineip}','用户注册','2','{$rid}') ");
        }
        $response['uid']=$uid;
        $start_time=time();
        $token=md5($uid.rand(1, 99999).$start_time);
        $db->query("replace into  {$tablepre}membertoken(uid,token, start_time, roomid) values ($uid, '$token', $start_time, '$rid' )");
        $response['url']='http://'.$_SERVER['SERVER_NAME'].'/logging.php?act=auth&uid='.$uid.'&rid='.$rid.'&token='.$token;
        output_json($response);
    case "cashin":
        return;
    case "cashout":
        if ( empty($uid) || empty($amount) || intval($amount)<=0 ) {
            output_json(array(
                'code'=>-1,
                'msg'=>'参数不正确'
            ));
        } // End If
        if ( !$debug_mode && $token != md5($uid.$amount.$api_key)  ) {
            output_json(array(
                'code'=>-2,
                'msg'=>'参数不正确'
            ));
        } // End If
        $query = $db->query("select moneyred from {$tablepre}memberfields limit 1");
        $response['balance_before']=-1;
        if ($db->num_rows($query)){
            $username=$db->fetch_row($query)['username'];
            $response['balance_before']=$db->fetch_row($query)['moneyred'];
        }
        $amount=abs($amount);
        if ( $amount>=$response['balance_before'] ) {
            output_json(array(
                'code'=>-3,
                'msg'=>'余额不足'
            ));
        } // End If
        // $db->query("insert into {$tablepre}moneyrun_info(username,uid,moneyrun,beizhu,addtime,addip,caozuoren,type)values('$username','$uid','$amount','余额转出到主站','$time','$onlineip','system',-1)");
        // $db->query("update {$tablepre}memberfields set moneyred=moneyred-$amount where uid='$uid'");
        // $response['balance_after']=$response['balance_before']-$amount;
        output_json($response);
        return;
    case "balance":
        if ( empty($uid) ) {
            output_json(array(
                'code'=>-1,
                'msg'=>'参数不正确'
            ));
        } // End If
        if ( !$debug_mode && $token != md5($uid.$amount.$api_key)  ) {
            output_json(array(
                'code'=>-2,
                'msg'=>'参数不正确'
            ));
        } // End If
        $query = $db->query("select moneyred from {$tablepre}memberfields where uid='{$uid}' limit 1");
        if ($db->num_rows($query)){
            $response['balance']=$db->fetch_row($query)['moneyred'];
        }else{
            $response['balance']=0;
        }
        output_json($response);
}
die("请通过主站进入");
?>
