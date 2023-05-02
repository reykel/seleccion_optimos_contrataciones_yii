<?php
/* @var $this ItemsController */
/* @var $data Items */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('instrumento_id')); ?>:</b>
	<?php echo CHtml::encode($data->instrumento_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('item')); ?>:</b>
	<?php echo CHtml::encode($data->item); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo_id')); ?>:</b>
	<?php echo CHtml::encode($data->tipo_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('categoria_id')); ?>:</b>
	<?php echo CHtml::encode($data->categoria_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('valor')); ?>:</b>
	<?php echo CHtml::encode($data->valor); ?>
	<br />


</div>