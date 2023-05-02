<?php
/* @var $this CapacitacionesController */
/* @var $model Capacitaciones */
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
		<?php echo $form->label($model,'titulo', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'titulo', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'tema', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'tema', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'forma_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'forma_id', Formas::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'ano', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'ano', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'centro_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropDownList($model,'centro_id', Centros::toList(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aplicar</button>
			</div>
		</p>
<?php $this->endWidget(); ?>

</div><!-- search-form -->