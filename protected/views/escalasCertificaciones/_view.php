<?php
/* @var $this EscalasCertificacionesController */
/* @var $data EscalasCertificaciones */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('escala_certificacion')); ?>:</b>
	<?php echo CHtml::encode($data->escala_certificacion); ?>
	<br />


</div>