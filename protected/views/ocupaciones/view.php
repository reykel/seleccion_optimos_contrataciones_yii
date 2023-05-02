<?php
/* @var $this OcupacionesController */
/* @var $model Ocupaciones */

$this->breadcrumbs=array(
	'Ocupaciones'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Ocupaciones'; ?>
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
		'ocupacion',
		'centro_laboral',
		'ano',
		'mejor_evaluacion',
		array(
			'name'=>'escala_ocupacion_id',
			'type'=>'raw',
			'value'=>$model->Escala_ocupacions->escala_ocupacion,
		),
			),
)); ?>
<br>
