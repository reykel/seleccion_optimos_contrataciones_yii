<?php
/* @var $this AplicacionesController */
/* @var $model Aplicaciones */

$this->breadcrumbs=array(
	'Aplicaciones'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Aplicaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>