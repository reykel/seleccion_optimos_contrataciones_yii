<?php
/* @var $this DesgloseAplicacionController */
/* @var $model DesgloseAplicacion */

$this->breadcrumbs=array(
	'Desglose aplicacions'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Desglose aplicacion'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>