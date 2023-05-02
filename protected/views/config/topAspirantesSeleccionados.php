<?php
/* @var $this ConfigController */
/* @var $model CrugeSystem */
/* @var $form CActiveForm */

$this->breadcrumbs=array(
	'Top candidatos'=>array('index'),
	'Actualizar',
);
?>


<?php
    $this->headers = ' Modificar cantidad de aspirates a retornar';
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'planes-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="clearfix"> <br>

	<?php echo $form->label($model,'top_aspirantes_seleccionados'); ?>
	<?php echo $form->dropDownList($model,'top_aspirantes_seleccionados', Aspirantes::topList(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
	<?php echo $form->error($model,'top_aspirantes_seleccionados'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aplicar</button>
			</div>
		</p>
		<?php $this->endWidget(); ?>
	</div>
</div>	
