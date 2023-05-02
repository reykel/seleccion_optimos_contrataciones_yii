<?php
/* @var $this ClasificadorController */
/* @var $data Clasificador */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('item')); ?>:</b>
	<?php echo CHtml::encode($data->item); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('clasificacion')); ?>:</b>
	<?php echo CHtml::encode($data->clasificacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('valor')); ?>:</b>
	<?php echo CHtml::encode($data->valor); ?>
	<br />


</div>