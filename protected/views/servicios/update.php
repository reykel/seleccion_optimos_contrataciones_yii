<?php
/* @var $this ServiciosController */
/* @var $model Servicios */

$this->breadcrumbs=array(
	'Servicioses'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Servicios'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>