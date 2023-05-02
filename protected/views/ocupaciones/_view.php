<?php
/* @var $this OcupacionesController */
/* @var $data Ocupaciones */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('aspirante_id')); ?>:</b>
	<?php echo CHtml::encode($data->aspirante_id); ?>
	<br />

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

	<b><?php echo CHtml::encode($data->getAttributeLabel('escala_ocupacion_id')); ?>:</b>
	<?php echo CHtml::encode($data->escala_ocupacion_id); ?>
	<br />


</div>