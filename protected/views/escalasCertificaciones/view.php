<?php
/* @var $this EscalasCertificacionesController */
/* @var $model EscalasCertificaciones */

$this->breadcrumbs=array(
	'Escalas certificaciones'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Escalas certificaciones'; ?>
<div  align="left">
    <a id ='btn_return' title='Regresar...' data-toggle='tooltip' href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-default btn-round btn-large alert-info'>
        <span><i class="glyphicon glyphicon-chevron-left red"></i></span>
    </a>
</div>
<br>

<?php $this->widget('ext.bootstrap.widgets.TbDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'escala_certificacion',
	),
)); ?>
<br>
