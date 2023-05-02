<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;

$this->breadcrumbs=array(
	'',
);
?>

<?php
	$this->headers = ' Bienvenido...';
?>

<?php
	Yii::app()->user->returnUrl = Yii::app()->request->requestUri;
?>
