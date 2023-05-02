<?php
	$this->headers = ' Nuevo usuario';
?>
<div class="form horizontal">
<?php $form = $this->beginWidget('CActiveForm', array(
    'id'=>'crugestoreduser-form',
    'enableAjaxValidation'=>false,
    'enableClientValidation'=>false,
)); ?>
		<?php echo $form->textField($model,'username',array('class'=>'form-control', 'style'=>'font-size:12px;', 'placeholder'=>'Nombre de usuario')); ?>
		<div class="clearfix"></div><br>
		<?php echo $form->textField($model,'email',array('class'=>'form-control', 'style'=>'font-size:12px;', 'placeholder'=>'Correo electrónico')); ?>

		<div class="well">
			<div class="clearfix"></div><br>
			<?php echo $form->passwordField($model,'newPassword',array('class'=>'form-control', 'style'=>'font-size:12px;', 'placeholder'=>'Nueva contraseña')); ?>
			<div class="clearfix"></div><br>
			<?php echo $form->passwordField($model,'newPasswordAgain',array('class'=>'form-control', 'style'=>'font-size:12px;', 'placeholder'=>'Repita su contraseña')); ?>
			<div class="clearfix"></div><br>
		</div>		
<!--		
		<script>
			function fnSuccess(data){
				$('#CrugeStoredUser_newPassword').val(data);
			}
			function fnError(e){
				alert("error: "+e.responseText);
			}
		</script>
		<?php echo CHtml::ajaxbutton(
			CrugeTranslator::t("Generar una nueva clave")
			,Yii::app()->user->ui->ajaxGenerateNewPasswordUrl
			,array('success'=>'js:fnSuccess','error'=>'js:fnError')
		); ?>
-->		
<button type="submit" class="btn btn-info btn-large"><i class="glyphicon glyphicon-ok icon-white"></i> Aceptar operación</button>
<?php echo $form->errorSummary($model); ?>
<?php $this->endWidget(); ?>
</div>