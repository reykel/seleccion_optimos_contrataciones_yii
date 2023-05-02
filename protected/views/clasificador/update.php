<?php
/* @var $this ClasificadorController */
/* @var $model Clasificador */

$this->breadcrumbs=array(
	'Clasificadors'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Modificar valor'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>