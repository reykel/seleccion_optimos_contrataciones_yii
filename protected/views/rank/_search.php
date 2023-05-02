<?php
/* @var $this RankController */
/* @var $model Rank */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'cargo_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'cargo_id', Cargos::toList("SI"), array('empty'=>'Seleccione...', 'class'=>'form-control selectbox', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div> <br>

<?php $this->endWidget(); ?>

</div><!-- search-form -->