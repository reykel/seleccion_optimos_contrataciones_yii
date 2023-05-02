<?php
/* @var $this CertificacionesController */
/* @var $data Certificaciones */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('aspirante_id')); ?>:</b>
	<?php echo CHtml::encode($data->aspirante_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('certificacion')); ?>:</b>
	<?php echo CHtml::encode($data->certificacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('emitido_por')); ?>:</b>
	<?php echo CHtml::encode($data->emitido_por); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ano')); ?>:</b>
	<?php echo CHtml::encode($data->ano); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('escala_certificacion_id')); ?>:</b>
	<?php echo CHtml::encode($data->escala_certificacion_id); ?>
	<br />


</div>