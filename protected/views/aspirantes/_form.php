<?php
/* @var $this AspirantesController */
/* @var $model Aspirantes */
/* @var $form CActiveForm */
?>
<script>
	$('.document').ready(function(){
		$('#Aspirantes_fecha_solicitud').datepicker({
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
	'id'=>'aspirantes-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'ci', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'ci', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'ci'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'nombre_apellidos', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'nombre_apellidos', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'nombre_apellidos'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'direccion', array('class'=>'control-label')); ?>
			<?php echo $form->textArea($model,'direccion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'direccion'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'mail', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'mail', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'mail'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'phone', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'phone', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'phone'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'sexo', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'sexo', Aspirantes::sexolist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'sexo'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'color_piel', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'color_piel', Aspirantes::colorlist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'color_piel'); ?>			

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'estado_civil', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'estado_civil', Aspirantes::estado_civil_List(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'estado_civil'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'integracion' ); ?>
			<?php echo $form->textField($model,'integracion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
<!--
	<?php echo $form->dropDownList($model,'integracion', Organizaciones::toList(), array('class'=>'selectpicker form-control', 'data-style'=>'btn-info', 'multiple data-max-options'=>'', 'data-actions-box'=>'true', 'data-live-search'=>'true', 'title'=>'Todos los registros...')); ?>
-->			
		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'nivel_escolar', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'nivel_escolar', Aspirantes::nivellist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'nivel_escolar'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'egresado_especialidad', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'egresado_especialidad', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'egresado_especialidad'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'categoria_academica', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'categoria_academica', Aspirantes::categorialist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'categoria_academica'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'grado_cientifico', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'grado_cientifico', Aspirantes::gradolist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'grado_cientifico'); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'fuente_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'fuente_id', Fuentes::tolist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			<?php echo $form->error($model,'fuente_id'); ?>

			<div class="clearfix"></div><br>
			<?php echo $form->label($model,'documentos_requeridos', array('class'=>'control-label')); ?>
				<?php echo $form->dropdownList($model,'documentos_requeridos', Aspirantes::documentsToPrintList(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
				<?php echo $form->error($model,'documentos_requeridos'); ?>			

		<?php if(Yii::app()->user->um->getFieldValue(Yii::app()->user->id,"nombre") == 'Rey' || Yii::app()->user->um->getFieldValue(Yii::app()->user->id,"nombre") == 'Daniel Nápoles' ){ ?>
			<div class="clearfix"></div><br>
			<?php echo $form->label($model,'sancion_laboral', array('class'=>'control-label')); ?>
				<?php echo $form->dropdownList($model,'sancion_laboral', Aspirantes::booleanlist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
				<?php echo $form->error($model,'sancion_laboral'); ?>

			<div class="clearfix"></div><br>
			<?php echo $form->label($model,'familiares_ecsm', array('class'=>'control-label')); ?>
				<?php echo $form->dropdownList($model,'familiares_ecsm', Aspirantes::booleanlist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
				<?php echo $form->error($model,'familiares_ecsm'); ?>

			<?php  if($model->en_solicitud_activa != "NO"){ ?>
				<div class="clearfix"></div><br>
				<?php echo $form->label($model,'procesado', array('class'=>'control-label')); ?>
					<?php echo $form->dropdownList($model,'procesado', Aspirantes::booleanlist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
					<?php echo $form->error($model,'procesado'); ?>
			<?php }else{ ?>
				<div class="clearfix"></div><br>
				<?php echo $form->label($model,'estado', array('class'=>'control-label')); ?>
					<?php echo $form->dropdownList($model,'estado', Aspirantes::estadolist(), array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>
					<?php echo $form->error($model,'estado'); ?>
			<?php } ?>			

		<?php } ?>

	<div class="clearfix"> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<a href= <?php echo Yii::app()->user->returnUrl; ?> class='btn btn-danger btn-large'><i class='glyphicon glyphicon-remove icon-white'></i> Cancelar</a>
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar</button>
			</div>
		</p>


<?php $this->endWidget(); ?>

</div><!-- form -->