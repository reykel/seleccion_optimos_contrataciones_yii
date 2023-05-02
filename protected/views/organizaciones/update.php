<?php
/* @var $this OrganizacionesController */
/* @var $model Organizaciones */

$this->breadcrumbs=array(
	'Organizaciones'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Organizaciones'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>