<?php
/* @var $this OrganizacionesController */
/* @var $model Organizaciones */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'organizaciones-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'organizacion', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'organizacion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'organizacion'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->