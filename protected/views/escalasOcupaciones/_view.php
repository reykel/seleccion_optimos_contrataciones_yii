<?php
/* @var $this EscalasOcupacionesController */
/* @var $data EscalasOcupaciones */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('escala_ocupacion')); ?>:</b>
	<?php echo CHtml::encode($data->escala_ocupacion); ?>
	<br />


</div>