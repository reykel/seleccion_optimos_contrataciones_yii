<?php
/* @var $this AplicacionesController */
/* @var $model Aplicaciones */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'aplicaciones-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'instrumento_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'instrumento_id', Instrumentos::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'instrumento_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'area_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'area_id', Areas::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'area_id'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'fecha', array('class'=>'control-label')); ?>
			<?php $this->widget('zii.widgets.jui.CJuiDatePicker',
				 array(
				 'model'=>$model,
				 'attribute'=>'fecha',
				 'value'=>$model->fecha,
				 'language' => 'es',
				 'options'=>array(
					 'autoSize'=>true,
					 'defaultDate'=>$model->fecha,
					 'dateFormat'=>'yy-mm-dd',
					 'buttonImage'=>Yii::app()->baseUrl.'/images/calendar.png',
					 'buttonImageOnly'=>true,
					 'buttonText'=>'Fecha',
					 'selectOtherMonths'=>true,
					 'showAnim'=>'slide',
					 'showButtonPanel'=>true,
					 'showOn'=>'button',
					 'showOtherMonths'=>true,
					 'changeMonth' => 'true',
					 'changeYear' => 'true',
					 ),
				 )
			); ?>
			<?php echo $form->error($model,'fecha'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'coordinador', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'coordinador', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'coordinador'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->