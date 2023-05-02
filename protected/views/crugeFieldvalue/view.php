<?php
/* @var $this CrugeFieldvalueController */
/* @var $model CrugeFieldvalue */

$this->breadcrumbs=array(
	'Cruge Fieldvalues'=>array('index'),
	$model->idfieldvalue,
);

$this->menu=array(
	array('label'=>'List CrugeFieldvalue', 'url'=>array('index')),
	array('label'=>'Create CrugeFieldvalue', 'url'=>array('create')),
	array('label'=>'Update CrugeFieldvalue', 'url'=>array('update', 'id'=>$model->idfieldvalue)),
	array('label'=>'Delete CrugeFieldvalue', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idfieldvalue),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage CrugeFieldvalue', 'url'=>array('admin')),
);
?>

<h1>View CrugeFieldvalue #<?php echo $model->idfieldvalue; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idfieldvalue',
		'iduser',
		'idfield',
		'value',
	),
)); ?>
