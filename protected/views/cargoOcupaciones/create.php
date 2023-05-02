<?php
/* @var $this CargoOcupacionesController */
/* @var $model CargoOcupaciones */

$this->breadcrumbs=array(
	'Cargo ocupaciones'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Cargo ocupaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>