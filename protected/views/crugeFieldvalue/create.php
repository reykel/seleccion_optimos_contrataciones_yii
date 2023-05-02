<?php
/* @var $this CrugeFieldvalueController */
/* @var $model CrugeFieldvalue */

$this->breadcrumbs=array(
	'Cruge Fieldvalues'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List CrugeFieldvalue', 'url'=>array('index')),
	array('label'=>'Manage CrugeFieldvalue', 'url'=>array('admin')),
);
?>

<h1>Create CrugeFieldvalue</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>