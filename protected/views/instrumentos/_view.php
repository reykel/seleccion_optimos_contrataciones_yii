<?php
/* @var $this InstrumentosController */
/* @var $data Instrumentos */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('instrumento')); ?>:</b>
	<?php echo CHtml::encode($data->instrumento); ?>
	<br />


</div>