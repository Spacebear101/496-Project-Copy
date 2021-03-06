<?php
// Begin Session
session_start();
// Include Database Objects
include './backendapi/backendapi.php';

// Retrieve user input from front end caller
$uName = $_POST['username'];
$pWord = $_POST['password'];

$api = new BackendAPI(0);

$bool = $api->login($uName, $pWord);

if (!$bool->isError()){
  if ($bool->getResult()==true){
    //successfull login
    $_SESSION['loggedin'] = true;
    $_SESSION['username'] = $bool->uName;
    // redirect to correct page
    echo '<script type="text/javascript">';
    echo "alert(\"Successful Login\");";
    echo 'window.location.href = "../frontend/login.html";';
    echo '</script>';
  }
  else{
    // redirect to correct page
    echo '<script type="text/javascript">';
    echo "alert(\"Invalid Credentials\");";
    echo 'window.location.href = "../frontend/login.html";';
    echo '</script>';
  }
}
else {
  echo '<script type="text/javascript">';
  echo "alert(\"An error occured! " . $bool->getError() ."\");";
  echo 'window.location.href = "../frontend/login.html";';
  echo '</script>';
}
?>
