<?php
/* @var $this IdiomasController */
/* @var $model Idiomas */

$this->breadcrumbs=array(
	'Idiomases'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Idiomas'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>