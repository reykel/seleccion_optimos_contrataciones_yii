<?php
/* @var $this CapacitacionesController */
/* @var $data Capacitaciones */
?>

<div class="view well">

	<b><?php echo CHtml::encode($data->getAttributeLabel('titulo')); ?>:</b>
	<?php echo CHtml::encode($data->titulo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tema')); ?>:</b>
	<?php echo CHtml::encode($data->tema); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('forma')); ?>:</b>
	<?php echo CHtml::encode($data->Formas->forma); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ano')); ?>:</b>
	<?php echo CHtml::encode($data->ano); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('centro_capacitador')); ?>:</b>
	<?php echo CHtml::encode($data->Centros->centro); ?>
	<br />

</div>