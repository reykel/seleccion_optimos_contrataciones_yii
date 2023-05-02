<?php
/* @var $this CentrosController */
/* @var $model Centros */

$this->breadcrumbs=array(
	'Centroses'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Centros'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>