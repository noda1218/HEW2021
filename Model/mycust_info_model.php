<?php
// お客様情報更新用
// Usersテーブル情報
session_start();
$user = $_SESSION['User_id'];
$name = isset($_POST['name'])? htmlspecialchars($_POST['name'],ENT_QUOTES,'utf-8'):'';
$tel = isset($_POST['tel'])? htmlspecialchars($_POST['tel'],ENT_QUOTES,'utf-8'):'';
$postcode = isset($_POST['postcode'])? htmlspecialchars($_POST['postcode'],ENT_QUOTES,'utf-8'):'';
$address = isset($_POST['address'])? htmlspecialchars($_POST['address'],ENT_QUOTES,'utf-8'):'';


$err = "名前は１２文字以内で入力してください";	//エラーメッセージ格納変数
$url="/IT42-117/view/mycust_info.php?err={$err}";



$wk_name = trim($_POST["name"]);
$wk_name = preg_replace('/^[　]*/u', "", $wk_name);	
$wk_name = preg_replace('/[　]*$/u', "", $wk_name);
$limit =36;
$moji_limit = strlen($wk_name);
if (empty($wk_name)) {
  header("Location:" .$url);
  exit();
}elseif($limit >= $moji_limit){
  $name = $wk_name;
}elseif($limit < $wk_name){
  header("Location:" .$url);
  exit();
}


// DB接続
  // require_once('../app/config.php');
  // なんか今更この形変えるタイミングないから、config.phpに鞍替えしません。
  $dsn = 'mysql:host=localhost;dbname=hew2020_91467;charset=utf8mb4';
  $db_user = 'hew2020_91467';
  // ここパスワード変えてください。
  $db_password = '';

    try{
        //DB接続オブジェクト
        //PDO…PHP Data Object
        $pdo = new PDO($dsn, $db_user, $db_password);
        //let logo = getElementById('id');

        //PDOの設定変更
        $pdo->setAttribute(
            PDO::ATTR_ERRMODE,
            PDO::ERRMODE_EXCEPTION
        );

        // お客様情報更新
        // Usersテーブルへの住所、郵便番号等の登録アップデート
        $sql = "UPDATE users SET name=:name, tel=:tel, address_num=:address_num, address=:address WHERE User_id=:id";
        $ps = $pdo->prepare($sql);
        $ps->bindValue(':id',$user);
        $ps->bindValue(':name',$name);
        $ps->bindValue(':tel',$tel);
        $ps->bindValue(':address_num',$postcode);
        $ps->bindValue(':address',$address);
        $ps->execute();


    }catch(PDOException $error){
        //エラー時の処理を書く
        //本来は、上記ログ出力し、下記のようになる。
        header('Location: /IT42-117/erro_pages/error1.php');
        exit;
    }




    header('Location: /IT42-117/view/mycust_info2.php');
    exit;
