<?php 
    $yii= dirname(__FILE__).'/yii/framework/yii.php'; 
    $config=dirname(__FILE__).'/protected/config/console.php'; 
    require_once($yii); 
    Yii::createConsoleApplication($config)->run(); 
?>