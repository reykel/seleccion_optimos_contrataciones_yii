<?php
/* @var $this AspirantesController */
/* @var $model Aspirantes */

$this->breadcrumbs=array(
	'Aspirantes'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar aspirantes'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>