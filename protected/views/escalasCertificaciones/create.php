<?php
/* @var $this EscalasCertificacionesController */
/* @var $model EscalasCertificaciones */

$this->breadcrumbs=array(
	'Escalas certificaciones'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Escalas certificaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>