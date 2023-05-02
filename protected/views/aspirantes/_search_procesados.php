<?php
/* @var $this AspirantesController */
/* @var $model Aspirantes */
/* @var $form CActiveForm */

Yii::app()->clientScript->registerScript('Comprobante',"
	$('.document').ready(function(){
		$('#Aspirantes_date_first_fecha').datepicker({
			language: 'es',
            format:'yyyy-mm-dd',
            autoclose:true,
            todayHighlight:true,
            forceParse: true,
        });

		$('#Aspirantes_date_last_fecha').datepicker({
			language: 'es',
            format:'yyyy-mm-dd',
            autoclose:true,
            todayHighlight:true,
            forceParse: true,
        });
	});	
");
?>

<div class="form-horizontal well">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'ci', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'ci', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'nombre_apellidos', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'nombre_apellidos', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'direccion', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'direccion', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'sexo', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'sexo', Aspirantes::sexolist(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'estado_civil', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'estado_civil', Aspirantes::estado_civil_List(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			
		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'color_piel', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'color_piel', Aspirantes::colorlist(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>
			
	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'nivel_escolar', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'nivel_escolar', Aspirantes::nivellist(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'egresado_especialidad', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'egresado_especialidad', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'categoria_academica', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'categoria_academica', Aspirantes::categorialist(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'grado_cientifico', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'grado_cientifico', Aspirantes::gradolist(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'date_first_fecha', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'date_first_fecha', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div><br>
		<?php echo $form->label($model,'date_last_fecha', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'date_last_fecha', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>	

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'fuente_id', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'fuente_id', Fuentes::tolist(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'sancion_laboral', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'sancion_laboral', Aspirantes::booleanlist(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

		<div class="clearfix"></div><br>
		<?php echo $form->label($model,'familiares_ecsm', array('class'=>'control-label')); ?>
			<?php echo $form->dropdownList($model,'familiares_ecsm', Aspirantes::booleanlist(), array('empty'=>'Seleccione...', 'class'=>'form-control', 'style'=>'font-size:11px;')); ?>

		<?php echo $form->label($model,'cargo_en_curso', array('class'=>'control-label')); ?>
			<?php echo $form->textField($model,'cargo_en_curso', array('class'=>'form-control', 'style'=>'font-size:11px;')); ?>

	<div class="clearfix"></div> <br>
		<p>		 
			<div class="col-lg-4 col-md-6 col-sm-7 col-xs-8 center">
				<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aplicar</button>
			</div>
		</p>
<?php $this->endWidget(); ?>

</div><!-- search-form -->