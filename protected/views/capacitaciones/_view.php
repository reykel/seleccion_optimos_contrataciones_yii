<?php
/* @var $this CapacitacionesController */
/* @var $data Capacitaciones */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('aspirante_id')); ?>:</b>
	<?php echo CHtml::encode($data->aspirante_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('titulo')); ?>:</b>
	<?php echo CHtml::encode($data->titulo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tema')); ?>:</b>
	<?php echo CHtml::encode($data->tema); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('forma_id')); ?>:</b>
	<?php echo CHtml::encode($data->forma_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ano')); ?>:</b>
	<?php echo CHtml::encode($data->ano); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('centro_id')); ?>:</b>
	<?php echo CHtml::encode($data->centro_id); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('escala_capacitacion_id')); ?>:</b>
	<?php echo CHtml::encode($data->escala_capacitacion_id); ?>
	<br />

	*/ ?>

</div>