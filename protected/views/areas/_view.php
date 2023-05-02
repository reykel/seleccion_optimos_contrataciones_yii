<?php
/* @var $this AreasController */
/* @var $data Areas */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('dependencia_id')); ?>:</b>
	<?php echo CHtml::encode($data->dependencia_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('servicio_id')); ?>:</b>
	<?php echo CHtml::encode($data->servicio_id); ?>
	<br />


</div>