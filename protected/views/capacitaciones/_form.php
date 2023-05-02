<?php
/* @var $this CapacitacionesController */
/* @var $model Capacitaciones */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'capacitaciones-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<?php echo $form->hiddenField($model,'aspirante_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'titulo', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'titulo', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'titulo'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'tema', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'tema', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'tema'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'forma_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'forma_id', Formas::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'forma_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'ano', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'ano', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'ano'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'centro_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'centro_id', Centros::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'centro_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'escala_capacitacion_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'escala_capacitacion_id', EscalasCapacitaciones::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'escala_capacitacion_id'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->