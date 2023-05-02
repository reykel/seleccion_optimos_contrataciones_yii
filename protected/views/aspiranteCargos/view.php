<?php
/* @var $this AspiranteCargosController */
/* @var $model AspiranteCargos */

$this->breadcrumbs=array(
	'Aspirante cargoses'=>array('index'),
	'Detalle',
);
?>

<?php $this->headers = ' Detalle Aspirante cargos'; ?>
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
				array(
			'name'=>'cargo_id',
			'type'=>'raw',
			'value'=>$model->Cargos->cargo,
		),
			),
)); ?>
<br>
