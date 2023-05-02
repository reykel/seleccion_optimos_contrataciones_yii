<?php
/* @var $this AspirantePrioridadesController */
/* @var $model AspirantePrioridades */

$this->breadcrumbs=array(
	'Aspirante prioridades'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Aspirante prioridades'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>