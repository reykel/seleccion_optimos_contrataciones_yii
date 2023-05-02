<?php
/* @var $this ConfigController */
/* @var $model CrugeSystem */
/* @var $form CActiveForm */

$this->breadcrumbs=array(
	'Año'=>array('index'),
	'Actualizar',
);

Yii::app()->clientScript->registerScript('generate', "
	$('#operacion').click(function() {
	    alertify.confirm('Procederá a modificar la fecha actual del sistema, desea continuar?', function(confirm) {
			if (confirm) {
				$('#planes-form').submit();
				noty({'text':'Operación concluida exitosamente','layout':'topCenter','type':'success','animateOpen': {'opacity': 'show'}});
			}else{
				noty({'text':'Operación cancelada','layout':'topCenter','type':'warning','animateOpen': {'opacity': 'show'}});
			}
		});
	});
");
?>


<?php
    $this->headers = ' Modificar fecha del sistema';
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'planes-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="clearfix"> <br>

	<?php echo $form->label($model,'current_system_date'); ?>
	<?php echo $form->textField($model,'current_system_date', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
	<?php echo $form->error($model,'current_system_date'); ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a id="operacion" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aplicar</a>
			</div>
		</p>
		<?php $this->endWidget(); ?>
	</div>
</div>	
