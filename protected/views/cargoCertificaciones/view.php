<?php
/* @var $this CargoCertificacionesController */
/* @var $model CargoCertificaciones */

$this->breadcrumbs=array(
	'Cargo certificaciones'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Cargo certificaciones'; ?>
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
			'name'=>'escala_certificacion_id',
			'type'=>'raw',
			'value'=>$model->Escala_certificacions->escala_certificacion,
		),
				array(
			'name'=>'cargo_id',
			'type'=>'raw',
			'value'=>$model->Cargos->cargo,
		),
				'valor',
	),
)); ?>
<br>
