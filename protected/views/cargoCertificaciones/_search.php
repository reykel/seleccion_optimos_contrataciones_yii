<?php
/* @var $this CargoCertificacionesController */
/* @var $model CargoCertificaciones */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'escala_certificacion_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'escala_certificacion_id', EscalasCertificaciones::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'cargo_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'cargo_id', Cargos::toListFree(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'valor', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'valor', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'requerido', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'requerido', Aspirantes::relevancia_list(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aplicar</button>
			</div>
		</p>
<?php $this->endWidget(); ?>

</div><!-- search-form -->