<?php
/* @var $this CertificacionesController */
/* @var $model Certificaciones */

$this->breadcrumbs=array(
	'Certificaciones'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Certificaciones'; ?>
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
			'name'=>'aspirante_id',
			'type'=>'raw',
			'value'=>$model->Aspirantes->aspirante,
		),
				'certificacion',
		'emitido_por',
		'ano',
		array(
			'name'=>'escala_certificacion_id',
			'type'=>'raw',
			'value'=>$model->Escala_certificacions->escala_certificacion,
		),
			),
)); ?>
<br>
