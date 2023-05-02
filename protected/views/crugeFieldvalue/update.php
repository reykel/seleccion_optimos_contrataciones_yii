<?php
/* @var $this CrugeFieldvalueController */
/* @var $model CrugeFieldvalue */

$this->breadcrumbs=array(
	'Cruge Fieldvalues'=>array('index'),
	$model->idfieldvalue=>array('view','id'=>$model->idfieldvalue),
	'Update',
);

$this->menu=array(
	array('label'=>'List CrugeFieldvalue', 'url'=>array('index')),
	array('label'=>'Create CrugeFieldvalue', 'url'=>array('create')),
	array('label'=>'View CrugeFieldvalue', 'url'=>array('view', 'id'=>$model->idfieldvalue)),
	array('label'=>'Manage CrugeFieldvalue', 'url'=>array('admin')),
);
?>

<h1>Update CrugeFieldvalue <?php echo $model->idfieldvalue; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>