<?php
/* @var $this CrugeFieldvalueController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Cruge Fieldvalues',
);

$this->menu=array(
	array('label'=>'Create CrugeFieldvalue', 'url'=>array('create')),
	array('label'=>'Manage CrugeFieldvalue', 'url'=>array('admin')),
);
?>

<h1>Cruge Fieldvalues</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
