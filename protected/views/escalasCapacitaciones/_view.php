<?php
/* @var $this EscalasCapacitacionesController */
/* @var $data EscalasCapacitaciones */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('escala_capacitacion')); ?>:</b>
	<?php echo CHtml::encode($data->escala_capacitacion); ?>
	<br />


</div>