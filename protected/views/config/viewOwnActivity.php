<?php
/* @var $this CrugePersonalSessionController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Actividad'=>array('index'),
	'Index',
);
?>

<?php
	$this->headers = ' Actividad de mi cuenta';
?>

<div class="clearfix"></div><br>

<?php $this->widget('ext.bootstrap.widgets.TbGridView', array(
	'id'=>'cruge-session-grid',
	'dataProvider'=>$model->search(),
	'columns'=>array(
		//'idsession',
		array(
			'name'=>'created',
			'type'=>'datetime',
		),
		array(
			'name'=>'expire',
			'type'=>'datetime',
		),
		'ipaddress',
		array(
			'name'=>'lastusage',
			'type'=>'datetime',
		),
		array(
			'name'=>'logoutdate',
			'type'=>'datetime',
		),		
	),
)); ?>