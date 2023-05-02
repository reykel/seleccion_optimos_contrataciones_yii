<?php
/* @var $this InstrumentosController */
/* @var $model Instrumentos */

$this->breadcrumbs=array(
	'Instrumentoses'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Instrumentos'; ?>
<div  align="left">
    <a id ='btn_return' title='Regresar...' data-toggle='tooltip' href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-default btn-round btn-large alert-info'>
        <span><i class="glyphicon glyphicon-chevron-left red"></i></span>
    </a>
</div>
<br>

<?php $this->widget('ext.bootstrap.widgets.TbDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'instrumento',
	),
)); ?>
<br>
