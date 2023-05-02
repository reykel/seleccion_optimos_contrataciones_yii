<?php
/* @var $this IdiomasController */
/* @var $model Idiomas */

$this->breadcrumbs=array(
	'Idiomases'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Idiomas'; ?>
<div  align="left">
    <a id ='btn_return' title='Regresar...' data-toggle='tooltip' href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-default btn-round btn-large alert-info'>
        <span><i class="glyphicon glyphicon-chevron-left red"></i></span>
    </a>
</div>
<br>

<?php $this->widget('ext.bootstrap.widgets.TbDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		array(
			'name'=>'idioma_id',
			'type'=>'raw',
			'value'=>$model->IdiomasRelevancia->idioma,
		),
		array(
			'name'=>'nivel',
			'type'=>'raw',
			'value'=>$model->get_nivel($model->nivel),
		),
	),
)); ?>
<br>
