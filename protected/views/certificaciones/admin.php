<?php
/* @var $this CertificacionesController */
/* @var $model Certificaciones */

$this->breadcrumbs=array(
	'Certificaciones'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Certificaciones', 'url'=>array('index')),
	array('label'=>'Create Certificaciones', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#certificaciones-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Certificaciones</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'certificaciones-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'aspirante_id',
		'certificacion',
		'emitido_por',
		'ano',
		'escala_certificacion_id',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
