<?php
/* @var $this TiposController */
/* @var $model Tipos */

$this->breadcrumbs=array(
	'Tiposes'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Tipos'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>