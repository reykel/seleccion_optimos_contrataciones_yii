<?php
/* @var $this OcupacionesController */
/* @var $model Ocupaciones */

$this->breadcrumbs=array(
	'Ocupaciones'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Ocupaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>