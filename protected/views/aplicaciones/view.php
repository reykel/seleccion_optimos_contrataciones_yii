<?php
/* @var $this AplicacionesController */
/* @var $model Aplicaciones */

$this->breadcrumbs=array(
	'Aplicaciones'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Aplicaciones'; ?>
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
			'name'=>'instrumento_id',
			'type'=>'raw',
			'value'=>$model->Instrumentos->instrumento,
		),
				array(
			'name'=>'area_id',
			'type'=>'raw',
			'value'=>$model->Areas->area,
		),
				'fecha',
		'coordinador',
	),
)); ?>
<br>
