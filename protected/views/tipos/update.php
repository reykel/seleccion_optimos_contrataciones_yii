<?php
/* @var $this TiposController */
/* @var $model Tipos */

$this->breadcrumbs=array(
	'Tiposes'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Tipos'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>