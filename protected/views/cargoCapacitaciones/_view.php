<?php
/* @var $this CargoCapacitacionesController */
/* @var $data CargoCapacitaciones */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('escala_capacitacion_id')); ?>:</b>
	<?php echo CHtml::encode($data->escala_capacitacion_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cargo_id')); ?>:</b>
	<?php echo CHtml::encode($data->cargo_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('valor')); ?>:</b>
	<?php echo CHtml::encode($data->valor); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('requerido')); ?>:</b>
	<?php echo CHtml::encode($data->requerido == -1 ? "SI" : "NO"); ?>
	<br />


</div>