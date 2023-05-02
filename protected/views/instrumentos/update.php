<?php
/* @var $this InstrumentosController */
/* @var $model Instrumentos */

$this->breadcrumbs=array(
	'Instrumentoses'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Instrumentos'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>