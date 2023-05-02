<?php
/* @var $this ClasificadorController */
/* @var $model Clasificador */

$this->breadcrumbs=array(
	'Clasificadors'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Clasificador'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>