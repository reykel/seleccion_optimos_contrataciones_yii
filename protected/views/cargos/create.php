<?php
/* @var $this CargosController */
/* @var $model Cargos */

$this->breadcrumbs=array(
	'Cargoses'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Cargos'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>