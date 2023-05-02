<?php
/* @var $this DesgloseAplicacionController */
/* @var $model DesgloseAplicacion */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'desglose-aplicacion-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'aplicacion_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'aplicacion_id', Aplicacions::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'aplicacion_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'item_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'item_id', Items::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'item_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'respuesta', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'respuesta', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'respuesta'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'observaciones', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'observaciones', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'observaciones'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->