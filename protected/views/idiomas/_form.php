<?php
/* @var $this IdiomasController */
/* @var $model Idiomas */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'idiomas-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'idioma_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'idioma_id', IdiomasRelevancia::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'idioma_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'nivel', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'nivel', Idiomas::nivelToList(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'nivel'); ?>

		<?php echo $form->hiddenField($model,'aspirante_id'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->