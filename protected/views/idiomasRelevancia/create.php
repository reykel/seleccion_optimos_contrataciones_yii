<?php
/* @var $this IdiomasRelevanciaController */
/* @var $model IdiomasRelevancia */

$this->breadcrumbs=array(
	'Idiomas relevancias'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Idiomas relevancia'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>