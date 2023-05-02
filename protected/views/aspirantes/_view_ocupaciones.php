<?php
/* @var $this OcupacionesController */
/* @var $data Ocupaciones */
?>

<div class="view well">

	<b><?php echo CHtml::encode($data->getAttributeLabel('ocupacion')); ?>:</b>
	<?php echo CHtml::encode($data->ocupacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('centro_laboral')); ?>:</b>
	<?php echo CHtml::encode($data->centro_laboral); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ano')); ?>:</b>
	<?php echo CHtml::encode($data->ano); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('mejor_evaluacion')); ?>:</b>
	<?php echo CHtml::encode($data->mejor_evaluacion); ?>
	<br />
</div>