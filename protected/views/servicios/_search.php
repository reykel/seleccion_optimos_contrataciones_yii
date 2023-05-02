<?php
/* @var $this ServiciosController */
/* @var $model Servicios */
/* @var $form CActiveForm */
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'servicio', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'servicio', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aplicar</button>
			</div>
		</p>
<?php $this->endWidget(); ?>

</div><!-- search-form -->