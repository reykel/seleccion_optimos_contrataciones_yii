<?php
/* @var $this AplicacionesController */
/* @var $data Aplicaciones */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('instrumento_id')); ?>:</b>
	<?php echo CHtml::encode($data->instrumento_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('area_id')); ?>:</b>
	<?php echo CHtml::encode($data->area_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha')); ?>:</b>
	<?php echo CHtml::encode($data->fecha); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('coordinador')); ?>:</b>
	<?php echo CHtml::encode($data->coordinador); ?>
	<br />


</div>