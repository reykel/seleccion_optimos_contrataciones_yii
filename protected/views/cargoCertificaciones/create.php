<?php
/* @var $this CargoCertificacionesController */
/* @var $model CargoCertificaciones */

$this->breadcrumbs=array(
	'Cargo certificaciones'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Cargo certificaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>