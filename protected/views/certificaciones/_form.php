<?php
/* @var $this CertificacionesController */
/* @var $model Certificaciones */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'certificaciones-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<?php echo $form->hiddenField($model,'aspirante_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'certificacion', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'certificacion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'certificacion'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'emitido_por', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'emitido_por', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'emitido_por'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'ano', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'ano', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'ano'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'escala_certificacion_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'escala_certificacion_id', EscalasCertificaciones::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'escala_certificacion_id'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->