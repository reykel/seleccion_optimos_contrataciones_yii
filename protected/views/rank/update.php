<?php
/* @var $this RankController */
/* @var $model Rank */

$this->breadcrumbs=array(
	'Ranks'=>array('index'),
	'Modificar',
);
?>

<?php $this->headers = ' Agregar Rank'; ?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>