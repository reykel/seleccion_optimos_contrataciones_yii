<?php
/* @var $this FormasController */
/* @var $model Formas */

$this->breadcrumbs=array(
	'Formases'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Formas'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>