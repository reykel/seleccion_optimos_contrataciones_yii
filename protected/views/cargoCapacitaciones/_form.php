<?php
/* @var $this CargoCapacitacionesController */
/* @var $model CargoCapacitaciones */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'cargo-capacitaciones-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'escala_capacitacion_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'escala_capacitacion_id', EscalasCapacitaciones::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'escala_capacitacion_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'cargo_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'cargo_id', Cargos::toListFree(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'cargo_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'valor', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'valor', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'valor'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'requerido', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'requerido', Aspirantes::relevancia_list(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'requerido'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->