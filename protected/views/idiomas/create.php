<?php
/* @var $this IdiomasController */
/* @var $model Idiomas */

$this->breadcrumbs=array(
	'Idiomases'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Idiomas'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>