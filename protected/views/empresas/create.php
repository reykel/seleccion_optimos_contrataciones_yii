<?php
/* @var $this EmpresasController */
/* @var $model Empresas */

$this->breadcrumbs=array(
	'Empresases'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Empresas'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>