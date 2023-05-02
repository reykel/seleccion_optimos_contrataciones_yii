<?php
/* @var $this ServiciosController */
/* @var $model Servicios */

$this->breadcrumbs=array(
	'Servicioses'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Servicios'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>