<?php
/* @var $this EscalasCapacitacionesController */
/* @var $model EscalasCapacitaciones */

$this->breadcrumbs=array(
	'Escalas capacitaciones'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Escalas capacitaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>