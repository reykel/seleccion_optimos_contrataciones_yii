<?php
/* @var $this PuntajesController */
/* @var $model Puntajes */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route)."&_status=".$_status,
	'method'=>'get',
)); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'cargo', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'_cargo_id', Cargos::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control selectbox', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div> <br>

<?php $this->endWidget(); ?>

</div><!-- search-form -->