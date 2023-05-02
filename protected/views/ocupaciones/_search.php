<?php
/* @var $this OcupacionesController */
/* @var $model Ocupaciones */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'aspirante_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'aspirante_id', Aspirantes::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'ocupacion', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'ocupacion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'centro_laboral', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'centro_laboral', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'ano', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'ano', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'mejor_evaluacion', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'mejor_evaluacion', Ocupaciones::evaluacionList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aplicar</button>
			</div>
		</p>
<?php $this->endWidget(); ?>

</div><!-- search-form -->