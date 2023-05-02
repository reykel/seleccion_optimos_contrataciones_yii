<?php
/* @var $this CertificacionesController */
/* @var $data Certificaciones */
?>

<div class="view well">
	<b><?php echo CHtml::encode($data->getAttributeLabel('certificacion')); ?>:</b>
	<?php echo CHtml::encode($data->certificacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('emitido_por')); ?>:</b>
	<?php echo CHtml::encode($data->emitido_por); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ano')); ?>:</b>
	<?php echo CHtml::encode($data->ano); ?>
	<br />
</div>