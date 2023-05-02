<?php
/* @var $this SubitemsController */
/* @var $model Subitems */

$this->breadcrumbs=array(
	'Subitems'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Subitems'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>