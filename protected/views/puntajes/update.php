<?php
/* @var $this PuntajesController */
/* @var $model Puntajes */

$this->breadcrumbs=array(
	'Puntajes'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Puntajes'; ?>
<?php $this->renderPartial('_form', array('model'=>$model,)); ?>