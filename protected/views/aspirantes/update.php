<?php
/* @var $this AspirantesController */
/* @var $model Aspirantes */

$this->breadcrumbs=array(
	'Aspirantes'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Modificar aspirantes'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>