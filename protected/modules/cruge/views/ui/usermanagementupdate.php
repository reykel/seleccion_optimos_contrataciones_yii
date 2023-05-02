<?php
Yii::app()->clientScript->registerScript('search', "
	$('#CrugeStoredUser_cargo').change(function(){

		var opcionSeleccionada = $(this);
		var idcategoria = opcionSeleccionada.val();

		var action = 'index.php?r=departamento/obtenerStatus&idcategoria='+idcategoria;

		$.getJSON(action, function(listaJson) {
			$('#CrugeStoredUser_area').find('option').each(function(){
				$(this).remove(); 
			});
			
			$.each(listaJson, function(key, instancia) {
				if(idcategoria == 5 || idcategoria == 6)
					$('#CrugeStoredUser_area').append('<option value=' + instancia.CodDepartamento + '>' + instancia.DescDepartamento + '</option>');
				else
					$('#CrugeStoredUser_area').append('<option value=' + instancia.CodFacultad + '>' + instancia.DescFacultad + '</option>');
			});
		})
	});
");
?>

<?php
	$this->headers = ' Editar perfil de usuario';
?>
<div class="form horizontal">
<?php $form = $this->beginWidget('CActiveForm', array(
    'id'=>'crugestoreduser-form',
    'enableAjaxValidation'=>false,
    'enableClientValidation'=>false,
)); ?>
		<?php 
			if ((Yii::app()->user->um->getFieldValue(Yii::app()->user->id,"cargo")) == 7){
				echo $form->textField($model,'username',array('class'=>'form-control', 'style'=>'font-size:12px;', 'placeholder'=>'Nombre de usuario'));
			} 
		?>
		<div class="clearfix"></div><br>
		<?php echo $form->textField($model,'email',array('class'=>'form-control', 'style'=>'font-size:12px;', 'placeholder'=>'Correo electrónico')); ?>
		<div class="clearfix"></div><br>
		<h6>Cambio de contraseña</h6>
		<div class="well">
			<div class="clearfix"></div><br>
			<?php echo $form->passwordField($model,'newPassword',array('class'=>'form-control', 'style'=>'font-size:12px;', 'placeholder'=>'Nueva contraseña')); ?>
			<div class="clearfix"></div><br>
			<?php echo $form->passwordField($model,'newPasswordAgain',array('class'=>'form-control', 'style'=>'font-size:12px;', 'placeholder'=>'Repita su contraseña')); ?>
			<div class="clearfix"></div><br>
		</div>

		<?php if ((Yii::app()->user->um->getFieldValue(Yii::app()->user->id,"cargo")) == 7){ ?>
	
			<div class='field-group'>
				<div class='col textfield-readonly'>
					<?php echo $form->labelEx($model,'regdate'); ?>
					<?php echo $form->textField($model,'regdate'
							,array(
								'readonly'=>'readonly',
								'value'=>Yii::app()->user->ui->formatDate($model->regdate),
							)
					); ?>
				</div>
				<div class='col textfield-readonly'>
					<?php echo $form->labelEx($model,'actdate'); ?>
					<?php echo $form->textField($model,'actdate'
							,array(
								'readonly'=>'readonly',
								'value'=>Yii::app()->user->ui->formatDate($model->actdate),
							)
						); ?>
				</div>
				<div class='col textfield-readonly'>
					<?php echo $form->labelEx($model,'logondate'); ?>
					<?php echo $form->textField($model,'logondate'
							,array(
								'readonly'=>'readonly',
								'value'=>Yii::app()->user->ui->formatDate($model->logondate),
							)
						); ?>
				</div>
			</div>
		<?php } ?>

		<?php 
			if ((Yii::app()->user->um->getFieldValue(Yii::app()->user->id,"cargo")) == 7){

					if(count($model->getFields()) > 0){
						echo "<div class='row form-group'>";
						echo "<h6>".ucfirst(CrugeTranslator::t("perfil"))."</h6>";
						foreach($model->getFields() as $f){
							echo Yii::app()->user->um->getInputField($model,$f,$f->longname);
							echo $form->error($model,$f->fieldname);
							echo "<div class='clearfix'></div><br>";
						}
						echo "</div>";
					}
					if($boolIsUserManagement)
					if(Yii::app()->user->checkAccess('edit-advanced-profile-features'
						,__FILE__." linea ".__LINE__))
						$this->renderPartial('_edit-advanced-profile-features'
							,array('model'=>$model,'form'=>$form),false); 
			} 
		?>

<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Guardar cambios</button>

<?php echo $form->errorSummary($model); ?>
<?php $this->endWidget(); ?>
</div>
