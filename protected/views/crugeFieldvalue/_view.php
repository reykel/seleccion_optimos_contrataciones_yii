<?php
/* @var $this CrugeFieldvalueController */
/* @var $data CrugeFieldvalue */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idfieldvalue')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idfieldvalue), array('view', 'id'=>$data->idfieldvalue)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('iduser')); ?>:</b>
	<?php echo CHtml::encode($data->iduser); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('idfield')); ?>:</b>
	<?php echo CHtml::encode($data->idfield); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('value')); ?>:</b>
	<?php echo CHtml::encode($data->value); ?>
	<br />


</div>