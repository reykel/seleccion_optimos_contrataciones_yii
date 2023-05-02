<?php
/* @var $this AspirantePrioridadesController */
/* @var $data AspirantePrioridades */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('aspirante_id')); ?>:</b>
	<?php echo CHtml::encode($data->aspirante_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('prioridad_id')); ?>:</b>
	<?php echo CHtml::encode($data->prioridad_id); ?>
	<br />


</div>