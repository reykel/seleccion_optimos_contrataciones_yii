<?php
/* @var $this CrugeFieldvalueController */
/* @var $model CrugeFieldvalue */
/* @var $form CActiveForm */

$this->breadcrumbs=array(
	'Formato'=>array('index'),
	'Actualizar',
);
?>


<?php
    $this->headers = ' Modificar formato de reportes';
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'planes-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

	<?php echo $form->label($model, 'Formato'); ?>
	<?php echo $form->dropDownList($model,'value', Cruge_Fieldvalue::reportesToList(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
	<?php echo $form->error($model,'value'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aplicar</button>
			</div>
		</p>
		<?php $this->endWidget(); ?>
	</div>
</div>	
