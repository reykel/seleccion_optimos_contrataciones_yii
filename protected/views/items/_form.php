<?php
/* @var $this ItemsController */
/* @var $model Items */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'items-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<?php echo $form->hiddenField($model,'instrumento_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'item', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'item', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'item'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'tipo_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'tipo_id', Tipos::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'tipo_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'categoria_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'categoria_id', Categorias::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'categoria_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'valor', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'valor', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'valor'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->