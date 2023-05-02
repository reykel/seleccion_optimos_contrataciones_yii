<?php
/* @var $this DesgloseCriteriosController */
/* @var $data DesgloseCriterios */
?>

<div class="view well">
	<b><?php echo CHtml::encode($data->getAttributeLabel('criterio')); ?>:</b>
	<?php echo CHtml::encode($data->criterio); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('autor')); ?>:</b>
	<?php echo CHtml::encode($data->autor); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha')); ?>:</b>
	<?php echo CHtml::encode($data->fecha); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('estado')); ?>:</b>
	<?php echo CHtml::encode(DesgloseCriterios::get_estado_criterio($data->estado)); ?>
	<br />	
</div>