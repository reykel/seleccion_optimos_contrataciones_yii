<?php
/* @var $this DependenciasController */
/* @var $model Dependencias */

$this->breadcrumbs=array(
	'Dependenciases'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Dependencias'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>