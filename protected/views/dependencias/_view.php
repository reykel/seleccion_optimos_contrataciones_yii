<?php
/* @var $this DependenciasController */
/* @var $data Dependencias */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('dependencia')); ?>:</b>
	<?php echo CHtml::encode($data->dependencia); ?>
	<br />


</div>