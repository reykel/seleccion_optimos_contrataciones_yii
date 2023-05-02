<?php
/* @var $this CertificacionesController */
/* @var $model Certificaciones */

$this->breadcrumbs=array(
	'Certificaciones'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Certificaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>