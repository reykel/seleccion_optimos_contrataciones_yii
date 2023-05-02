<?php
// llamada cuando el actionRegistration ha insertado a un usuario
?>
<div class='form'>
    <h1><?php echo CrugeTranslator::t("Bienvenido");?></h1>

	<?php if(Yii::app()->user->isGuest)        
		echo Yii::app()->user->ui->loginLink; ?>
    </p>
</div>