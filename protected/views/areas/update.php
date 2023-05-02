<?php
/* @var $this AreasController */
/* @var $model Areas */

$this->breadcrumbs=array(
	'Areases'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Areas'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>