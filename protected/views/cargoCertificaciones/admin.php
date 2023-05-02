<?php
/* @var $this CargoCertificacionesController */
/* @var $model CargoCertificaciones */

$this->breadcrumbs=array(
	'Cargo certificaciones'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List CargoCertificaciones', 'url'=>array('index')),
	array('label'=>'Create CargoCertificaciones', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#cargo-certificaciones-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Cargo certificaciones</h1>

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
	'id'=>'cargo-certificaciones-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'escala_certificacion_id',
		'cargo_id',
		'valor',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
