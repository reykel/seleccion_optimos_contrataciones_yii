<?php
/* @var $this CentrosController */
/* @var $model Centros */

$this->breadcrumbs=array(
	'Centroses'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Centros'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>