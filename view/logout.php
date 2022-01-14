<?php
session_start();
$output = '';
if (isset($_SESSION["mail_address"])) {
  //セッション変数のクリア
$_SESSION = array();
//セッションクッキーも削除
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}
//セッションクリア
@session_destroy();
header("Location: /IT42-117/index.php"); //ログアウト後セッションを解除したままtoppage
exit();
} else {
  // $output = 'SessionがTimeoutしました。';
  // echo "<p><a href='login.php'>ログインページはこちら</a></p>";
   //セッション変数のクリア
  $_SESSION = array();
  //セッションクッキーも削除
  if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}
//セッションクリア
@session_destroy();
header("Location: /IT42-117/index.php"); //ログアウト後セッションを解除したままtoppage
exit();

}
?>
