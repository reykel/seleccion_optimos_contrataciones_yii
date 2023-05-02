<?php
/* @var $this DesgloseCriteriosController */
/* @var $model DesgloseCriterios */

$this->breadcrumbs=array(
	'Desglose criterioses'=>array('index'),
	'Agregar',
);
?>

<?php $this->headers = ' Agregar Desglose criterios'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>