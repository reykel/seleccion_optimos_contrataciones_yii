<?php
/* @var $this AreasController */
/* @var $model Areas */

$this->breadcrumbs=array(
	'Areases'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Areas'; ?>
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
			'name'=>'dependencia_id',
			'type'=>'raw',
			'value'=>$model->Dependencias->dependencia,
		),
				array(
			'name'=>'servicio_id',
			'type'=>'raw',
			'value'=>$model->Servicios->servicio,
		),
			),
)); ?>
<br>
