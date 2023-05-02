<?php
/* @var $this EscalasOcupacionesController */
/* @var $model EscalasOcupaciones */

$this->breadcrumbs=array(
	'Escalas ocupaciones'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Escalas ocupaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>