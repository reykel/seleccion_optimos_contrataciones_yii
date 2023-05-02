<?php
/* @var $this CapacitacionesController */
/* @var $model Capacitaciones */

$this->breadcrumbs=array(
	'Capacitaciones'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Capacitaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>