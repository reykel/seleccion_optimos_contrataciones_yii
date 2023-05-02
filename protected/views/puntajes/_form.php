<?php
/* @var $this PuntajesController */
/* @var $model Puntajes */
/* @var $form CActiveForm */
?>

<script>
	$('.document').ready(function(){
		$('#Puntajes_fecha_preseleccion').datepicker({
			language: 'es',
            format:'yyyy-mm-dd',
            autoclose:true,
            todayHighlight:true,
            forceParse: true,
        });

		$('#Puntajes_fecha_seleccion').datepicker({
			language: 'es',
            format:'yyyy-mm-dd',
            autoclose:true,
            todayHighlight:true,
            forceParse: true,
        });

		$('#Puntajes_fecha_admision').datepicker({
			language: 'es',
            format:'yyyy-mm-dd',
            autoclose:true,
            todayHighlight:true,
            forceParse: true,
        });
	});	
</script>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'puntajes-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

	<?php if($model->status == "SIN SELECCIONAR"){ ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'memo_preseleccion', array('class'=>'control-label')); ?>
			<?php echo $form->textArea($model,'memo_preseleccion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'memo_preseleccion'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'firma_preseleccion', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'firma_preseleccion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'firma_preseleccion'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'fecha_preseleccion', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'fecha_preseleccion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'fecha_preseleccion'); ?>

	<?php } ?>

	<?php if($model->status == "SELECCIONADO"){ ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'memo_seleccion', array('class'=>'control-label')); ?>
			<?php echo $form->textArea($model,'memo_seleccion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'memo_seleccion'); ?>
			
		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'firma_seleccion', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'firma_seleccion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'firma_seleccion'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'fecha_seleccion', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'fecha_seleccion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'fecha_seleccion'); ?>
	<?php } ?>

	<?php if($model->status == "ADMITIDO"){ ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'memo_admision', array('class'=>'control-label')); ?>
			<?php echo $form->textArea($model,'memo_admision', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'memo_admision'); ?>
			
		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'firma_admision', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'firma_admision', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'firma_admision'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'fecha_admision', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'fecha_admision', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'fecha_admision'); ?>
	<?php } ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div>