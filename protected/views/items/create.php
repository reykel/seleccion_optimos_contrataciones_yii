<?php
/* @var $this ItemsController */
/* @var $model Items */

$this->breadcrumbs=array(
	'Items'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Items'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>