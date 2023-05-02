<?php
/* @var $this OcupacionesController */
/* @var $model Ocupaciones */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'ocupaciones-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<?php echo $form->hiddenField($model,'aspirante_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'ocupacion', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'ocupacion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'ocupacion'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'centro_laboral', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'centro_laboral', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'centro_laboral'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'ano', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'ano', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'ano'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'mejor_evaluacion', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'mejor_evaluacion', Ocupaciones::evaluacionList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'mejor_evaluacion'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'escala_ocupacion_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'escala_ocupacion_id', EscalasOcupaciones::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'escala_ocupacion_id'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->